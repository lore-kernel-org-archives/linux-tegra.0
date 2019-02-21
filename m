From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/5] reset: Add acquired flag to of_reset_control_array_get()
Date: Thu, 21 Feb 2019 16:25:54 +0100
Message-ID: <20190221152557.8534-2-thierry.reding@gmail.com>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221152557.8534-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to be able to request an array of reset controls in acquired or
released mode, add the acquired flag to of_reset_control_array_get() and
pass the flag to subsequent calls of __of_reset_control_get().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/reset/core.c              |  9 ++++++---
 drivers/usb/dwc3/dwc3-of-simple.c |  3 ++-
 include/linux/reset.h             | 14 ++++++++------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 1e8a42b16f23..f94da91c22af 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -830,12 +830,15 @@ static int of_reset_control_get_count(struct device_node *node)
  * @np: device node for the device that requests the reset controls array
  * @shared: whether reset controls are shared or not
  * @optional: whether it is optional to get the reset controls
+ * @acquired: only one reset control may be acquired for a given controller
+ *            and ID
  *
  * Returns pointer to allocated reset_control_array on success or
  * error on failure
  */
 struct reset_control *
-of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
+of_reset_control_array_get(struct device_node *np, bool shared, bool optional,
+			   bool acquired)
 {
 	struct reset_control_array *resets;
 	struct reset_control *rstc;
@@ -851,7 +854,7 @@ of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
 
 	for (i = 0; i < num; i++) {
 		rstc = __of_reset_control_get(np, NULL, i, shared, optional,
-					      true);
+					      acquired);
 		if (IS_ERR(rstc))
 			goto err_rst;
 		resets->rstc[i] = rstc;
@@ -898,7 +901,7 @@ devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
 	if (!devres)
 		return ERR_PTR(-ENOMEM);
 
-	rstc = of_reset_control_array_get(dev->of_node, shared, optional);
+	rstc = of_reset_control_array_get(dev->of_node, shared, optional, true);
 	if (IS_ERR(rstc)) {
 		devres_free(devres);
 		return rstc;
diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 4c2771c5e727..67ce2037472d 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -107,7 +107,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 		simple->pulse_resets = true;
 	}
 
-	simple->resets = of_reset_control_array_get(np, shared_resets, true);
+	simple->resets = of_reset_control_array_get(np, shared_resets, true,
+						    true);
 	if (IS_ERR(simple->resets)) {
 		ret = PTR_ERR(simple->resets);
 		dev_err(dev, "failed to get device resets, err=%d\n", ret);
diff --git a/include/linux/reset.h b/include/linux/reset.h
index ea9a8a1ce4b1..a01b32bf51d4 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -32,7 +32,8 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 struct reset_control *devm_reset_control_array_get(struct device *dev,
 						   bool shared, bool optional);
 struct reset_control *of_reset_control_array_get(struct device_node *np,
-						 bool shared, bool optional);
+						 bool shared, bool optional,
+						 bool acquired);
 
 int reset_control_get_count(struct device *dev);
 
@@ -107,7 +108,8 @@ devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
 }
 
 static inline struct reset_control *
-of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
+of_reset_control_array_get(struct device_node *np, bool shared, bool optional,
+			   bool acquired)
 {
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
@@ -465,24 +467,24 @@ devm_reset_control_array_get_optional_shared(struct device *dev)
 static inline struct reset_control *
 of_reset_control_array_get_exclusive(struct device_node *node)
 {
-	return of_reset_control_array_get(node, false, false);
+	return of_reset_control_array_get(node, false, false, true);
 }
 
 static inline struct reset_control *
 of_reset_control_array_get_shared(struct device_node *node)
 {
-	return of_reset_control_array_get(node, true, false);
+	return of_reset_control_array_get(node, true, false, true);
 }
 
 static inline struct reset_control *
 of_reset_control_array_get_optional_exclusive(struct device_node *node)
 {
-	return of_reset_control_array_get(node, false, true);
+	return of_reset_control_array_get(node, false, true, true);
 }
 
 static inline struct reset_control *
 of_reset_control_array_get_optional_shared(struct device_node *node)
 {
-	return of_reset_control_array_get(node, true, true);
+	return of_reset_control_array_get(node, true, true, true);
 }
 #endif
-- 
2.20.1
