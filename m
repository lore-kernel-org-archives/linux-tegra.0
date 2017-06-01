From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v5 3/6] reset: hide reset control arrays behind struct reset_control
Date: Thu,  1 Jun 2017 18:52:00 +0200
Message-ID: <20170601165203.15315-4-p.zabel@pengutronix.de>
References: <20170601165203.15315-1-p.zabel@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170601165203.15315-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reset controls already may control multiple reset lines with a single
hardware bit. So from the user perspective, reset control arrays are not
at all different from single reset controls.
Therefore, hide reset control arrays behind struct reset_control to
avoid having to introduce new API functions for array (de)assert/reset.

Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/reset/core.c  | 225 ++++++++++++++++++++++++++------------------------
 include/linux/reset.h |  44 +++-------
 2 files changed, 128 insertions(+), 141 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 1747000757211..c8fb4426b218a 100644
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
@@ -499,81 +595,6 @@ static int of_reset_control_get_count(struct device_node *node)
 }
 
 /**
- * reset_control_array_assert: assert a list of resets
- *
- * @resets: reset control array holding info about the list of resets
- *
- * This API doesn't guarantee that the reset lines controlled by
- * the reset array are asserted in any particular order.
- *
- * Returns 0 on success or error number on failure.
- */
-int reset_control_array_assert(struct reset_control_array *resets)
-{
-	int ret, i;
-
-	if (!resets)
-		return 0;
-
-	if (IS_ERR(resets))
-		return -EINVAL;
-
-	for (i = 0; i < resets->num_rstcs; i++) {
-		ret = reset_control_assert(resets->rstc[i]);
-		if (ret)
-			goto err;
-	}
-
-	return 0;
-
-err:
-	while (i--)
-		reset_control_deassert(resets->rstc[i]);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(reset_control_array_assert);
-
-/**
- * reset_control_array_deassert: deassert a list of resets
- *
- * @resets: reset control array holding info about the list of resets
- *
- * This API doesn't guarantee that the reset lines controlled by
- * the reset array are deasserted in any particular order.
- *
- * Returns 0 on success or error number on failure.
- */
-int reset_control_array_deassert(struct reset_control_array *resets)
-{
-	int ret, i;
-
-	if (!resets)
-		return 0;
-
-	if (IS_ERR(resets))
-		return -EINVAL;
-
-	for (i = 0; i < resets->num_rstcs; i++) {
-		ret = reset_control_deassert(resets->rstc[i]);
-		if (ret)
-			goto err;
-	}
-
-	return 0;
-
-err:
-	while (i--)
-		reset_control_assert(resets->rstc[i]);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(reset_control_array_deassert);
-
-static void devm_reset_control_array_release(struct device *dev, void *res)
-{
-	reset_control_array_put(*(struct reset_control_array **)res);
-}
-
-/**
  * of_reset_control_array_get - Get a list of reset controls using
  *				device node.
  *
@@ -584,13 +605,12 @@ static void devm_reset_control_array_release(struct device *dev, void *res)
  * Returns pointer to allocated reset_control_array on success or
  * error on failure
  */
-struct reset_control_array *
+struct reset_control *
 of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
 {
 	struct reset_control_array *resets;
 	struct reset_control *rstc;
 	int num, i;
-	void *err;
 
 	num = of_reset_control_get_count(np);
 	if (num < 0)
@@ -603,23 +623,24 @@ of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
 
 	for (i = 0; i < num; i++) {
 		rstc = __of_reset_control_get(np, NULL, i, shared, optional);
-		if (IS_ERR(rstc)) {
-			err = ERR_CAST(rstc);
+		if (IS_ERR(rstc))
 			goto err_rst;
-		}
 		resets->rstc[i] = rstc;
 	}
 	resets->num_rstcs = num;
+	resets->base.array = true;
 
-	return resets;
+	return &resets->base;
 
 err_rst:
+	mutex_lock(&reset_list_mutex);
 	while (--i >= 0)
-		reset_control_put(resets->rstc[i]);
+		__reset_control_put_internal(resets->rstc[i]);
+	mutex_unlock(&reset_list_mutex);
 
 	kfree(resets);
 
-	return err;
+	return rstc;
 }
 EXPORT_SYMBOL_GPL(of_reset_control_array_get);
 
@@ -637,40 +658,26 @@ EXPORT_SYMBOL_GPL(of_reset_control_array_get);
  * Returns pointer to allocated reset_control_array on success or
  * error on failure
  */
-struct reset_control_array *
+struct reset_control *
 devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
 {
-	struct reset_control_array **devres;
-	struct reset_control_array *resets;
+	struct reset_control **devres;
+	struct reset_control *rstc;
 
-	devres = devres_alloc(devm_reset_control_array_release,
-			      sizeof(*devres), GFP_KERNEL);
+	devres = devres_alloc(devm_reset_control_release, sizeof(*devres),
+			      GFP_KERNEL);
 	if (!devres)
 		return ERR_PTR(-ENOMEM);
 
-	resets = of_reset_control_array_get(dev->of_node, shared, optional);
-	if (IS_ERR(resets)) {
-		devres_free(resets);
-		return resets;
+	rstc = of_reset_control_array_get(dev->of_node, shared, optional);
+	if (IS_ERR(rstc)) {
+		devres_free(devres);
+		return rstc;
 	}
 
-	*devres = resets;
+	*devres = rstc;
 	devres_add(dev, devres);
 
-	return resets;
+	return rstc;
 }
 EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
-
-void reset_control_array_put(struct reset_control_array *resets)
-{
-	int i;
-
-	if (IS_ERR_OR_NULL(resets))
-		return;
-
-	for (i = 0; i < resets->num_rstcs; i++)
-		reset_control_put(resets->rstc[i]);
-
-	kfree(resets);
-}
-EXPORT_SYMBOL_GPL(reset_control_array_put);
diff --git a/include/linux/reset.h b/include/linux/reset.h
index df75fe50f765d..0f1be13e66e46 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -5,11 +5,6 @@
 
 struct reset_control;
 
-struct reset_control_array {
-	unsigned int num_rstcs;
-	struct reset_control *rstc[];
-};
-
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
@@ -30,13 +25,10 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 
 int __must_check device_reset(struct device *dev);
 
-int reset_control_array_assert(struct reset_control_array *resets);
-int reset_control_array_deassert(struct reset_control_array *resets);
-struct reset_control_array *devm_reset_control_array_get(struct device *dev,
-						bool shared, bool optional);
-struct reset_control_array *of_reset_control_array_get(struct device_node *np,
-						bool shared, bool optional);
-void reset_control_array_put(struct reset_control_array *resets);
+struct reset_control *devm_reset_control_array_get(struct device *dev,
+						   bool shared, bool optional);
+struct reset_control *of_reset_control_array_get(struct device_node *np,
+						 bool shared, bool optional);
 
 static inline int device_reset_optional(struct device *dev)
 {
@@ -102,18 +94,6 @@ static inline struct reset_control *__devm_reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
-static inline
-int reset_control_array_assert(struct reset_control_array *resets)
-{
-	return 0;
-}
-
-static inline
-int reset_control_array_deassert(struct reset_control_array *resets)
-{
-	return 0;
-}
-
 static inline struct reset_control_array *
 devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
 {
@@ -420,49 +400,49 @@ static inline struct reset_control *devm_reset_control_get_by_index(
 /*
  * APIs to manage a list of reset controllers
  */
-static inline struct reset_control_array *
+static inline struct reset_control *
 devm_reset_control_array_get_exclusive(struct device *dev)
 {
 	return devm_reset_control_array_get(dev, false, false);
 }
 
-static inline struct reset_control_array *
+static inline struct reset_control *
 devm_reset_control_array_get_shared(struct device *dev)
 {
 	return devm_reset_control_array_get(dev, true, false);
 }
 
-static inline struct reset_control_array *
+static inline struct reset_control *
 devm_reset_control_array_get_optional_exclusive(struct device *dev)
 {
 	return devm_reset_control_array_get(dev, false, true);
 }
 
-static inline struct reset_control_array *
+static inline struct reset_control *
 devm_reset_control_array_get_optional_shared(struct device *dev)
 {
 	return devm_reset_control_array_get(dev, true, true);
 }
 
-static inline struct reset_control_array *
+static inline struct reset_control *
 of_reset_control_array_get_exclusive(struct device_node *node)
 {
 	return of_reset_control_array_get(node, false, false);
 }
 
-static inline struct reset_control_array *
+static inline struct reset_control *
 of_reset_control_array_get_shared(struct device_node *node)
 {
 	return of_reset_control_array_get(node, true, false);
 }
 
-static inline struct reset_control_array *
+static inline struct reset_control *
 of_reset_control_array_get_optional_exclusive(struct device_node *node)
 {
 	return of_reset_control_array_get(node, false, true);
 }
 
-static inline struct reset_control_array *
+static inline struct reset_control *
 of_reset_control_array_get_optional_shared(struct device_node *node)
 {
 	return of_reset_control_array_get(node, true, true);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
