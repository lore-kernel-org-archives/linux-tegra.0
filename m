From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 1/9] reset: add of_reset_control_get_by_index()
Date: Wed, 14 Jan 2015 14:19:24 +0800
Message-ID: <1421216372-8025-2-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add of_reset_control_get_by_index() to allow the dirvers to get reset device
without knowing its name.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/reset/core.c  | 47 ++++++++++++++++++++++++++++++++---------------
 include/linux/reset.h |  9 +++++++++
 2 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 7955e00d04d4..25a0da1654f8 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -140,28 +140,15 @@ int reset_control_status(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_status);
 
-/**
- * of_reset_control_get - Lookup and obtain a reference to a reset controller.
- * @node: device to be reset by the controller
- * @id: reset line name
- *
- * Returns a struct reset_control or IS_ERR() condition containing errno.
- *
- * Use of id names is optional.
- */
-struct reset_control *of_reset_control_get(struct device_node *node,
-					   const char *id)
+struct reset_control *__of_reset_control_get(struct device_node *node,
+						int index)
 {
 	struct reset_control *rstc = ERR_PTR(-EPROBE_DEFER);
 	struct reset_controller_dev *r, *rcdev;
 	struct of_phandle_args args;
-	int index = 0;
 	int rstc_id;
 	int ret;
 
-	if (id)
-		index = of_property_match_string(node,
-						 "reset-names", id);
 	ret = of_parse_phandle_with_args(node, "resets", "#reset-cells",
 					 index, &args);
 	if (ret)
@@ -202,6 +189,36 @@ struct reset_control *of_reset_control_get(struct device_node *node,
 
 	return rstc;
 }
+
+struct reset_control *of_reset_control_get_by_index(struct device_node *node,
+					   int index)
+{
+	if (!node)
+		return ERR_PTR(-EINVAL);
+
+	return __of_reset_control_get(node, index);
+}
+EXPORT_SYMBOL_GPL(of_reset_control_get_by_index);
+
+/**
+ * of_reset_control_get - Lookup and obtain a reference to a reset controller.
+ * @node: device to be reset by the controller
+ * @id: reset line name
+ *
+ * Returns a struct reset_control or IS_ERR() condition containing errno.
+ *
+ * Use of id names is optional.
+ */
+struct reset_control *of_reset_control_get(struct device_node *node,
+					   const char *id)
+{
+	int index = 0;
+
+	if (id)
+		index = of_property_match_string(node,
+						 "reset-names", id);
+	return __of_reset_control_get(node, index);
+}
 EXPORT_SYMBOL_GPL(of_reset_control_get);
 
 /**
diff --git a/include/linux/reset.h b/include/linux/reset.h
index da5602bd77d7..f29fc88c4868 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -38,6 +38,9 @@ static inline struct reset_control *devm_reset_control_get_optional(
 struct reset_control *of_reset_control_get(struct device_node *node,
 					   const char *id);
 
+struct reset_control *of_reset_control_get_by_index(
+					struct device_node *node, int index);
+
 #else
 
 static inline int reset_control_reset(struct reset_control *rstc)
@@ -92,6 +95,12 @@ static inline struct reset_control *of_reset_control_get(
 	return ERR_PTR(-ENOSYS);
 }
 
+struct reset_control *of_reset_control_get_by_index(
+				struct device_node *node, int index)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 #endif /* CONFIG_RESET_CONTROLLER */
 
 #endif
-- 
1.9.1
