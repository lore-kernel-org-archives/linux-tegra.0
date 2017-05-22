From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 2/4] reset: Add APIs to manage array of resets
Date: Mon, 22 May 2017 16:53:25 +0530
Message-ID: <1495452207-6129-3-git-send-email-vivek.gautam@codeaurora.org>
References: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495452207-6129-1-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Many devices may want to request a bunch of resets
and control them. So it's better to manage them as an
array. Add APIs to _get(), _assert(), and _deassert()
an array of reset_control.
Note that, these APIs don't guarantee that the reset lines
managed in the array are handled in any particular order.

Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/reset/core.c  | 204 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/reset.h |  93 +++++++++++++++++++++++
 2 files changed, 297 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index cd739d2fa160..dfb782f862e0 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -465,3 +465,207 @@ int device_reset(struct device *dev)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(device_reset);
+
+/**
+ * APIs to manage an array of reset controls.
+ */
+/**
+ * of_reset_control_get_count - Count number of resets available with a device
+ *
+ * @node: device node that contains 'resets'.
+ *
+ * Returns positive reset count on success, or error number on failure and
+ * on count being zero.
+ */
+static int of_reset_control_get_count(struct device_node *node)
+{
+	int count;
+
+	if (!node)
+		return -EINVAL;
+
+	count = of_count_phandle_with_args(node, "resets", "#reset-cells");
+	if (count == 0)
+		count = -ENOENT;
+
+	return count;
+}
+
+/**
+ * reset_control_array_assert: assert a list of resets
+ *
+ * @resets: reset control array holding info about the list of resets
+ *
+ * This API doesn't guarantee that the reset lines controlled by
+ * the reset array are asserted in any particular order.
+ *
+ * Returns 0 on success or error number on failure.
+ */
+int reset_control_array_assert(struct reset_control_array *resets)
+{
+	int ret, i;
+
+	if (!resets)
+		return 0;
+
+	if (IS_ERR(resets))
+		return -EINVAL;
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		ret = reset_control_assert(resets->rstc[i]);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		reset_control_deassert(resets->rstc[i]);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reset_control_array_assert);
+
+/**
+ * reset_control_array_deassert: deassert a list of resets
+ *
+ * @resets: reset control array holding info about the list of resets
+ *
+ * This API doesn't guarantee that the reset lines controlled by
+ * the reset array are deasserted in any particular order.
+ *
+ * Returns 0 on success or error number on failure.
+ */
+int reset_control_array_deassert(struct reset_control_array *resets)
+{
+	int ret, i;
+
+	if (!resets)
+		return 0;
+
+	if (IS_ERR(resets))
+		return -EINVAL;
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		ret = reset_control_deassert(resets->rstc[i]);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	while (i--)
+		reset_control_assert(resets->rstc[i]);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reset_control_array_deassert);
+
+static void devm_reset_control_array_release(struct device *dev, void *res)
+{
+	struct reset_control_array *resets = res;
+
+	reset_control_array_put(resets);
+}
+
+/**
+ * of_reset_control_array_get - Get a list of reset controls using
+ *				device node.
+ *
+ * @np: device node for the device that requests the reset controls array
+ * @shared: whether reset controls are shared or not
+ * @optional: whether it is optional to get the reset controls
+ *
+ * Returns pointer to allocated reset_control_array on success or
+ * error on failure
+ */
+struct reset_control_array *
+of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
+{
+	struct reset_control_array *resets;
+	struct reset_control *rstc;
+	int num, i;
+	void *err;
+
+	num = of_reset_control_get_count(np);
+	if (num < 0)
+		return optional ? NULL : ERR_PTR(num);
+
+	resets = kzalloc(sizeof(*resets) + sizeof(resets->rstc[0]) * num,
+			 GFP_KERNEL);
+	if (!resets)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < num; i++) {
+		rstc = __of_reset_control_get(np, NULL, i, shared, optional);
+		if (IS_ERR(rstc)) {
+			err = ERR_CAST(rstc);
+			goto err_rst;
+		}
+		resets->rstc[i] = rstc;
+	}
+	resets->num_rstcs = num;
+
+	return resets;
+
+err_rst:
+	while (--i >= 0)
+		reset_control_put(resets->rstc[i]);
+
+	kfree(resets);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(of_reset_control_array_get);
+
+/**
+ * devm_reset_control_array_get - Resource managed reset control array get
+ *
+ * @dev: device that requests the list of reset controls
+ * @shared: whether reset controls are shared or not
+ * @optional: whether it is optional to get the reset controls
+ *
+ * The reset control array APIs are intended for a list of resets
+ * that just have to be asserted or deasserted, without any
+ * requirements on the order.
+ *
+ * Returns pointer to allocated reset_control_array on success or
+ * error on failure
+ */
+struct reset_control_array *
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+{
+	struct reset_control_array **devres;
+	struct reset_control_array *resets;
+
+	devres = devres_alloc(devm_reset_control_array_release,
+			      sizeof(*devres), GFP_KERNEL);
+	if (!devres)
+		return ERR_PTR(-ENOMEM);
+
+	resets = of_reset_control_array_get(dev->of_node, shared, optional);
+	if (IS_ERR(resets)) {
+		devres_free(resets);
+		return resets;
+	}
+
+	*devres = resets;
+	devres_add(dev, devres);
+
+	return resets;
+}
+EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
+
+void reset_control_array_put(struct reset_control_array *resets)
+{
+	int i;
+
+	if (IS_ERR_OR_NULL(resets))
+		return;
+
+	for (i = 0; i < resets->num_rstcs; i++)
+		reset_control_put(resets->rstc[i]);
+
+	kfree(resets);
+}
+EXPORT_SYMBOL_GPL(reset_control_array_put);
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 13d8681210d5..df75fe50f765 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -5,6 +5,11 @@
 
 struct reset_control;
 
+struct reset_control_array {
+	unsigned int num_rstcs;
+	struct reset_control *rstc[];
+};
+
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
@@ -25,6 +30,14 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 
 int __must_check device_reset(struct device *dev);
 
+int reset_control_array_assert(struct reset_control_array *resets);
+int reset_control_array_deassert(struct reset_control_array *resets);
+struct reset_control_array *devm_reset_control_array_get(struct device *dev,
+						bool shared, bool optional);
+struct reset_control_array *of_reset_control_array_get(struct device_node *np,
+						bool shared, bool optional);
+void reset_control_array_put(struct reset_control_array *resets);
+
 static inline int device_reset_optional(struct device *dev)
 {
 	return device_reset(dev);
@@ -89,6 +102,35 @@ static inline struct reset_control *__devm_reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline
+int reset_control_array_assert(struct reset_control_array *resets)
+{
+	return 0;
+}
+
+static inline
+int reset_control_array_deassert(struct reset_control_array *resets)
+{
+	return 0;
+}
+
+static inline struct reset_control_array *
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+{
+	return optional ? NULL : ERR_PTR(-ENOTSUPP);
+}
+
+static inline struct reset_control_array *
+of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
+{
+	return optional ? NULL : ERR_PTR(-ENOTSUPP);
+}
+
+static inline
+void reset_control_array_put(struct reset_control_array *resets)
+{
+}
+
 #endif /* CONFIG_RESET_CONTROLLER */
 
 /**
@@ -374,4 +416,55 @@ static inline struct reset_control *devm_reset_control_get_by_index(
 {
 	return devm_reset_control_get_exclusive_by_index(dev, index);
 }
+
+/*
+ * APIs to manage a list of reset controllers
+ */
+static inline struct reset_control_array *
+devm_reset_control_array_get_exclusive(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, false, false);
+}
+
+static inline struct reset_control_array *
+devm_reset_control_array_get_shared(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, true, false);
+}
+
+static inline struct reset_control_array *
+devm_reset_control_array_get_optional_exclusive(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, false, true);
+}
+
+static inline struct reset_control_array *
+devm_reset_control_array_get_optional_shared(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, true, true);
+}
+
+static inline struct reset_control_array *
+of_reset_control_array_get_exclusive(struct device_node *node)
+{
+	return of_reset_control_array_get(node, false, false);
+}
+
+static inline struct reset_control_array *
+of_reset_control_array_get_shared(struct device_node *node)
+{
+	return of_reset_control_array_get(node, true, false);
+}
+
+static inline struct reset_control_array *
+of_reset_control_array_get_optional_exclusive(struct device_node *node)
+{
+	return of_reset_control_array_get(node, false, true);
+}
+
+static inline struct reset_control_array *
+of_reset_control_array_get_optional_shared(struct device_node *node)
+{
+	return of_reset_control_array_get(node, true, true);
+}
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
