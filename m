From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH V3 1/4] reset: Add API to count number of reset available with device
Date: Tue, 18 Apr 2017 16:51:25 +0530
Message-ID: <1492514488-27385-2-git-send-email-vivek.gautam@codeaurora.org>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, swarren@wwwdotorg.org, balbi@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, thierry.reding@gmail.com, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Count number of reset phandles available with the device node
to know the resets a given device has.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/reset/core.c  | 23 +++++++++++++++++++++++
 include/linux/reset.h |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index cd739d2fa160..f0a06a7aca93 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -465,3 +465,26 @@ int device_reset(struct device *dev)
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
+	if (!node)
+		return -EINVAL;
+
+	count = of_count_phandle_with_args(node, "resets", "#reset-cells");
+	if (count == 0)
+		count = -ENOENT;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_reset_control_get_count);
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 13d8681210d5..1b5a6aafd3e6 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -24,6 +24,7 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 				     bool optional);
 
 int __must_check device_reset(struct device *dev);
+int of_reset_control_get_count(struct device_node *node);
 
 static inline int device_reset_optional(struct device *dev)
 {
@@ -89,6 +90,11 @@ static inline struct reset_control *__devm_reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline int of_reset_control_get_count(struct device_node *node)
+{
+	return -ENOTSUPP;
+}
+
 #endif /* CONFIG_RESET_CONTROLLER */
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
