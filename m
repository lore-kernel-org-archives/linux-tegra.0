From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v2 1/4] reset: Add API to count number of reset available with device
Date: Mon,  3 Apr 2017 19:11:59 +0530
Message-ID: <1491226922-20307-2-git-send-email-vivek.gautam@codeaurora.org>
References: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: p.zabel@pengutronix.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, balbi@kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Count number of reset phandles available with the device node
to know the resets a given device has.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---

Changes since v1:
 - Handling the error path by returning error code for failures
   and ENODEV for count equal to 0.
 - Moved the function to drivers instead of putting in the includes.

 drivers/reset/core.c  | 22 ++++++++++++++++++++++
 include/linux/reset.h |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index f1e5e65388bb..66db061165cb 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -455,3 +455,25 @@ int device_reset(struct device *dev)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(device_reset);
+
+/**
+ * of_reset_control_get_count - Count number of resets available with a device
+ *
+ * @node: device node that contains 'resets'.
+ *
+ * Returns positive reset count on success, or error number on failure and
+ * on count being zero.
+ */
+int of_reset_control_get_count(struct device_node *node)
+{
+	int count;
+
+	count = of_count_phandle_with_args(node, "resets", "#reset-cells");
+	if (count < 0)
+		return count;
+	if (count == 0)
+		return -ENODEV;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_reset_control_get_count);
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 96fb139bdd08..d89556412ccc 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -21,6 +21,7 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 				     bool optional);
 
 int __must_check device_reset(struct device *dev);
+int of_reset_control_get_count(struct device_node *node);
 
 static inline int device_reset_optional(struct device *dev)
 {
@@ -79,6 +80,11 @@ static inline struct reset_control *__devm_reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline int of_reset_control_get_count(struct device_node *node);
+{
+	return -ENOTSUPP;
+}
+
 #endif /* CONFIG_RESET_CONTROLLER */
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
