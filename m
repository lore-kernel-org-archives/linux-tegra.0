From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 1/4] reset: Add APIs to manage array of resets
Date: Mon, 19 Jun 2017 16:34:05 +0200
Message-ID: <20170619143408.15668-2-p.zabel@pengutronix.de>
References: <20170619143408.15668-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170619143408.15668-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Many devices may want to request a bunch of resets and control them. So
it's better to manage them as an array. Add APIs to _get() an array of
reset_control, reusing the _assert(), _deassert(), and _reset() APIs for
single reset controls. Since reset controls already may control multiple
reset lines with a single hardware bit, from the user perspective, reset
control arrays are not at all different from single reset controls.
Note that these APIs don't guarantee that the reset lines managed in the
array are handled in any particular order.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
[p.zabel@pengutronix.de: changed API to hide reset control arrays behind
 struct reset_control]
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v5:
 - Merged "reset: hide reset control arrays behind struct reset_control" patch
   into this one, fixed devm/of_reset_control_array_get stub return values in
   the new patch.
---
 drivers/reset/core.c  | 211 +++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/reset.h |  73 +++++++++++++++++
 2 files changed, 283 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 0090784ff4105..c8fb4426b218a 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -43,11 +43,24 @@ struct reset_control {
 	unsigned int id;
 	struct kref refcnt;
 	bool shared;
+	bool array;
 	atomic_t deassert_count;
 	atomic_t triggered_count;
 };
 
 /**
+ * struct reset_control_array - an array of reset controls
+ * @base: reset control for compatibility with reset control API functions
+ * @num_rstcs: number of reset controls
+ * @rstc: array of reset controls
+ */
+struct reset_control_array {
+	struct reset_control base;
+	unsigned int num_rstcs;
+	struct reset_control *rstc[];
+};
+
+/**
  * of_reset_simple_xlate - translate reset_spec to the reset line number
  * @rcdev: a pointer to the reset controller device
  * @reset_spec: reset line specifier as found in the device tree
@@ -135,6 +148,65 @@ int devm_reset_controller_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_reset_controller_register);
 
+static inline struct reset_control_array *
+rstc_to_array(struct reset_control *rstc) {
+	return container_of(rstc, struct reset_control_array, base);
+}
+
+static int reset_control_array_reset(struct reset_control_array *resets)
+{
+	int ret, i;
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		ret = reset_control_reset(resets->rstc[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int reset_control_array_assert(struct reset_control_array *resets)
+{
+	int ret, i;
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
+
+static int reset_control_array_deassert(struct reset_control_array *resets)
+{
+	int ret, i;
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
+
+static inline bool reset_control_is_array(struct reset_control *rstc)
+{
+	return rstc->array;
+}
+
 /**
  * reset_control_reset - reset the controlled device
  * @rstc: reset controller
@@ -158,6 +230,9 @@ int reset_control_reset(struct reset_control *rstc)
 	if (WARN_ON(IS_ERR(rstc)))
 		return -EINVAL;
 
+	if (reset_control_is_array(rstc))
+		return reset_control_array_reset(rstc_to_array(rstc));
+
 	if (!rstc->rcdev->ops->reset)
 		return -ENOTSUPP;
 
@@ -202,6 +277,9 @@ int reset_control_assert(struct reset_control *rstc)
 	if (WARN_ON(IS_ERR(rstc)))
 		return -EINVAL;
 
+	if (reset_control_is_array(rstc))
+		return reset_control_array_assert(rstc_to_array(rstc));
+
 	if (!rstc->rcdev->ops->assert)
 		return -ENOTSUPP;
 
@@ -240,6 +318,9 @@ int reset_control_deassert(struct reset_control *rstc)
 	if (WARN_ON(IS_ERR(rstc)))
 		return -EINVAL;
 
+	if (reset_control_is_array(rstc))
+		return reset_control_array_deassert(rstc_to_array(rstc));
+
 	if (!rstc->rcdev->ops->deassert)
 		return -ENOTSUPP;
 
@@ -266,7 +347,7 @@ int reset_control_status(struct reset_control *rstc)
 	if (!rstc)
 		return 0;
 
-	if (WARN_ON(IS_ERR(rstc)))
+	if (WARN_ON(IS_ERR(rstc)) || reset_control_is_array(rstc))
 		return -EINVAL;
 
 	if (rstc->rcdev->ops->status)
@@ -404,6 +485,16 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
 }
 EXPORT_SYMBOL_GPL(__reset_control_get);
 
+static void reset_control_array_put(struct reset_control_array *resets)
+{
+	int i;
+
+	mutex_lock(&reset_list_mutex);
+	for (i = 0; i < resets->num_rstcs; i++)
+		__reset_control_put_internal(resets->rstc[i]);
+	mutex_unlock(&reset_list_mutex);
+}
+
 /**
  * reset_control_put - free the reset controller
  * @rstc: reset controller
@@ -413,6 +504,11 @@ void reset_control_put(struct reset_control *rstc)
 	if (IS_ERR_OR_NULL(rstc))
 		return;
 
+	if (reset_control_is_array(rstc)) {
+		reset_control_array_put(rstc_to_array(rstc));
+		return;
+	}
+
 	mutex_lock(&reset_list_mutex);
 	__reset_control_put_internal(rstc);
 	mutex_unlock(&reset_list_mutex);
@@ -472,3 +568,116 @@ int device_reset(struct device *dev)
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
+struct reset_control *
+of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
+{
+	struct reset_control_array *resets;
+	struct reset_control *rstc;
+	int num, i;
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
+		if (IS_ERR(rstc))
+			goto err_rst;
+		resets->rstc[i] = rstc;
+	}
+	resets->num_rstcs = num;
+	resets->base.array = true;
+
+	return &resets->base;
+
+err_rst:
+	mutex_lock(&reset_list_mutex);
+	while (--i >= 0)
+		__reset_control_put_internal(resets->rstc[i]);
+	mutex_unlock(&reset_list_mutex);
+
+	kfree(resets);
+
+	return rstc;
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
+struct reset_control *
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+{
+	struct reset_control **devres;
+	struct reset_control *rstc;
+
+	devres = devres_alloc(devm_reset_control_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return ERR_PTR(-ENOMEM);
+
+	rstc = of_reset_control_array_get(dev->of_node, shared, optional);
+	if (IS_ERR(rstc)) {
+		devres_free(devres);
+		return rstc;
+	}
+
+	*devres = rstc;
+	devres_add(dev, devres);
+
+	return rstc;
+}
+EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 13d8681210d54..6368029aa54fe 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -25,6 +25,11 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 
 int __must_check device_reset(struct device *dev);
 
+struct reset_control *devm_reset_control_array_get(struct device *dev,
+						   bool shared, bool optional);
+struct reset_control *of_reset_control_array_get(struct device_node *np,
+						 bool shared, bool optional);
+
 static inline int device_reset_optional(struct device *dev)
 {
 	return device_reset(dev);
@@ -89,6 +94,23 @@ static inline struct reset_control *__devm_reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline struct reset_control *
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+{
+	return optional ? NULL : ERR_PTR(-ENOTSUPP);
+}
+
+static inline struct reset_control *
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
@@ -374,4 +396,55 @@ static inline struct reset_control *devm_reset_control_get_by_index(
 {
 	return devm_reset_control_get_exclusive_by_index(dev, index);
 }
+
+/*
+ * APIs to manage a list of reset controllers
+ */
+static inline struct reset_control *
+devm_reset_control_array_get_exclusive(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, false, false);
+}
+
+static inline struct reset_control *
+devm_reset_control_array_get_shared(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, true, false);
+}
+
+static inline struct reset_control *
+devm_reset_control_array_get_optional_exclusive(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, false, true);
+}
+
+static inline struct reset_control *
+devm_reset_control_array_get_optional_shared(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, true, true);
+}
+
+static inline struct reset_control *
+of_reset_control_array_get_exclusive(struct device_node *node)
+{
+	return of_reset_control_array_get(node, false, false);
+}
+
+static inline struct reset_control *
+of_reset_control_array_get_shared(struct device_node *node)
+{
+	return of_reset_control_array_get(node, true, false);
+}
+
+static inline struct reset_control *
+of_reset_control_array_get_optional_exclusive(struct device_node *node)
+{
+	return of_reset_control_array_get(node, false, true);
+}
+
+static inline struct reset_control *
+of_reset_control_array_get_optional_shared(struct device_node *node)
+{
+	return of_reset_control_array_get(node, true, true);
+}
 #endif
-- 
2.11.0
