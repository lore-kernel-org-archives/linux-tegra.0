From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v2 2/4] reset: Add APIs to manage array of resets
Date: Mon,  3 Apr 2017 19:12:00 +0530
Message-ID: <1491226922-20307-3-git-send-email-vivek.gautam@codeaurora.org>
References: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: p.zabel@pengutronix.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, balbi@kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Many devices may want to request a bunch of resets
and control them. So it's better to manage them as an
array. Add APIs to _get(), _assert(), and _deassert()
an array of reset_control.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---

Changes since v1:
 - New patch added to the series.

 drivers/reset/core.c  | 169 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/reset.h | 108 ++++++++++++++++++++++++++++++++
 2 files changed, 277 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 66db061165cb..fb908aa4f69e 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -477,3 +477,172 @@ int of_reset_control_get_count(struct device_node *node)
 	return count;
 }
 EXPORT_SYMBOL_GPL(of_reset_control_get_count);
+
+/*
+ * APIs to manage an array of reset controllers
+ */
+/**
+ * reset_control_array_assert: assert a list of resets
+ *
+ * @resets: reset control array holding info about a list of resets
+ * @num_rsts: number of resets to be asserted.
+ *
+ * Returns 0 on success or error number on failure.
+ */
+int reset_control_array_assert(int num_rsts,
+				struct reset_control_array *resets)
+{
+	int ret, i;
+
+	if (WARN_ON(IS_ERR_OR_NULL(resets)))
+		return -EINVAL;
+
+	for (i = 0; i < num_rsts; i++) {
+		ret = reset_control_assert(resets[i].rst);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_control_array_assert);
+
+/**
+ * reset_control_array_deassert: deassert a list of resets
+ *
+ * @resets: reset control array holding info about a list of resets
+ * @num_rsts: number of resets to be deasserted.
+ *
+ * Returns 0 on success or error number on failure.
+ */
+int reset_control_array_deassert(int num_rsts,
+				struct reset_control_array *resets)
+{
+	int ret, i;
+
+	if (WARN_ON(IS_ERR_OR_NULL(resets)))
+		return -EINVAL;
+
+	for (i = 0; i < num_rsts; i++)
+		ret = reset_control_deassert(resets[i].rst);
+		if (ret)
+			goto err;
+
+	return 0;
+
+err:
+	while (--i >= 0)
+		reset_control_assert(resets[i].rst);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reset_control_array_deassert);
+
+/**
+ * reset_control_array_get - Get a list of reset controllers
+ *
+ * @dev: device that requests the list of reset controllers
+ * @num_rsts: number of reset controllers requested
+ * @resets: reset control array holding info about a list of resets
+ * @shared: whether reset controllers are shared or not
+ * @optional: whether it is optional to get the reset controllers
+ *
+ * Returns 0 on success or error number on failure
+ */
+static int reset_control_array_get(struct device *dev, int num_rsts,
+				struct reset_control_array *resets,
+				bool shared, bool optional)
+{
+	int ret, i;
+	struct reset_control *rstc;
+
+	for (i = 0; i < num_rsts; i++) {
+		rstc = __of_reset_control_get(dev ? dev->of_node : NULL,
+					resets[i].name, i, shared, optional);
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto err_rst;
+		}
+		resets[i].rst = rstc;
+	}
+
+	return 0;
+
+err_rst:
+	while (--i >= 0)
+		reset_control_put(resets[i].rst);
+	return ret;
+}
+
+static void devm_reset_control_array_release(struct device *dev, void *res)
+{
+	struct reset_control_devres *ptr = res;
+	int i;
+
+	for (i = 0; i < ptr->num_resets; i++)
+		reset_control_put(ptr->resets[i].rst);
+}
+
+/**
+ * devm_reset_control_array_get - Resource managed reset_control_array_get
+ *				  See reset_control_array_get() for more
+ *				  details
+ *
+ * Returns 0 on success or error number on failure
+ */
+int devm_reset_control_array_get(struct device *dev, int num_rsts,
+				struct reset_control_array *resets,
+				bool shared, bool optional)
+{
+	struct reset_control_devres *ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_reset_control_array_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = reset_control_array_get(dev, num_rsts, resets,
+					shared, optional);
+	if (ret) {
+		ptr->resets = resets;
+		ptr->num_resets = num_rsts;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
+
+int of_reset_control_array_get(struct device_node *node, int num_rsts,
+				struct reset_control_array *resets,
+				bool shared, bool optional)
+{
+	int ret, i;
+	struct reset_control *rstc;
+
+	for (i = 0; i < num_rsts; i++) {
+		rstc = __of_reset_control_get(node, NULL, i, shared, optional);
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto err_rst;
+		}
+		resets[i].rst = rstc;
+	}
+
+	return 0;
+
+err_rst:
+	while (--i >= 0)
+		reset_control_put(resets[i].rst);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_reset_control_array_get);
+
+void reset_control_array_put(int num, struct reset_control_array *resets)
+{
+	while (num--)
+		reset_control_put(resets[num].rst);
+}
+EXPORT_SYMBOL_GPL(reset_control_array_put);
diff --git a/include/linux/reset.h b/include/linux/reset.h
index d89556412ccc..d6ca70b9d634 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -5,6 +5,16 @@
 
 struct reset_control;
 
+struct reset_control_array {
+	struct reset_control *rst;
+	const char *name;
+};
+
+struct reset_control_devres {
+	struct reset_control_array *resets;
+	int num_resets;
+};
+
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
@@ -23,6 +33,18 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 int __must_check device_reset(struct device *dev);
 int of_reset_control_get_count(struct device_node *node);
 
+int reset_control_array_assert(int num_rsts,
+				struct reset_control_array *resets);
+int reset_control_array_deassert(int num_rsts,
+				struct reset_control_array *resets);
+int devm_reset_control_array_get(struct device *dev, int num_rsts,
+				struct reset_control_array *resets,
+				bool shared, bool optional);
+int of_reset_control_array_get(struct device_node *node, int num_rsts,
+				struct reset_control_array *resets,
+				bool shared, bool optional);
+void reset_control_array_put(int num, struct reset_control_array *resets);
+
 static inline int device_reset_optional(struct device *dev)
 {
 	return device_reset(dev);
@@ -85,6 +107,39 @@ static inline struct reset_control *__devm_reset_control_get(
 	return -ENOTSUPP;
 }
 
+static inline int reset_control_array_assert(int num_rsts,
+				struct reset_control_array *resets)
+{
+	return 0;
+}
+
+static inline int reset_control_array_deassert(int num_rsts,
+				struct reset_control_array *resets)
+{
+	return 0;
+}
+
+static inline
+int devm_reset_control_array_get(struct device *dev, int num_rsts,
+				struct reset_control_array *resets,
+				bool shared, bool optional)
+{
+	return optional ? NULL : ERR_PTR(-ENOTSUPP);
+}
+
+static inline
+int of_reset_control_array_get(struct device_node *node, int num_rsts,
+				struct reset_control_array *resets,
+				bool shared, bool optional)
+{
+	return optional ? NULL : ERR_PTR(-ENOTSUPP);
+}
+
+static inline
+void reset_control_array_put(int num, struct reset_control_array *resets)
+{
+}
+
 #endif /* CONFIG_RESET_CONTROLLER */
 
 /**
@@ -374,4 +429,57 @@ static inline struct reset_control *devm_reset_control_get_by_index(
 {
 	return devm_reset_control_get_exclusive_by_index(dev, index);
 }
+
+/*
+ * APIs to manage a list of reset controllers
+ */
+static inline
+int devm_reset_control_array_get_exclusive(struct device *dev, int num_rsts,
+					struct reset_control_array *resets)
+{
+	return devm_reset_control_array_get(dev, num_rsts,
+						resets, false, false);
+}
+
+static inline
+int devm_reset_control_array_get_shared(struct device *dev, int num_rsts,
+					struct reset_control_array *resets)
+{
+	return devm_reset_control_array_get(dev, num_rsts,
+						resets, true, false);
+}
+
+static inline
+int devm_reset_control_array_get_optional_exclusive(struct device *dev,
+					int num_rsts,
+					struct reset_control_array *resets)
+{
+	return devm_reset_control_array_get(dev, num_rsts,
+						resets, false, true);
+}
+
+static inline
+int devm_reset_control_array_get_optional_shared(struct device *dev,
+					int num_rsts,
+					struct reset_control_array *resets)
+{
+	return devm_reset_control_array_get(dev, num_rsts,
+						resets, true, true);
+}
+
+static inline
+int of_reset_control_array_get_exclusive(struct device_node *node,
+					int num_rsts,
+					struct reset_control_array *resets)
+{
+	return of_reset_control_array_get(node, num_rsts, resets, false, false);
+}
+
+static inline
+int of_reset_control_array_get_shared(struct device_node *node,
+					int num_rsts,
+					struct reset_control_array *resets)
+{
+	return of_reset_control_array_get(node, num_rsts, resets, true, false);
+}
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
