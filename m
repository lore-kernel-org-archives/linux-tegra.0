From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH 1/3] reset: Re-export of_reset_control_get
Date: Wed, 2 Jul 2014 00:08:41 +0300
Message-ID: <1404248923-21086-2-git-send-email-ttynkkynen@nvidia.com>
References: <1404248923-21086-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404248923-21086-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Felipe Balbi <balbi@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, tuomas.tynkkynen@iki.fi, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit b424080a9e086e683ad5fdc624a7cf3c024e0c0f (reset: Add optional
resets and stubs) accidentally dropped the declaration of
of_reset_control_get from include/linux/reset.h. Add it back to the
header.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
---
 include/linux/reset.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/reset.h b/include/linux/reset.h
index 349f150..cfc8de8 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -13,6 +13,8 @@ int reset_control_deassert(struct reset_control *rstc);
 
 struct reset_control *reset_control_get(struct device *dev, const char *id);
 void reset_control_put(struct reset_control *rstc);
+struct reset_control *of_reset_control_get(struct device_node *node,
+					   const char *id);
 struct reset_control *devm_reset_control_get(struct device *dev, const char *id);
 
 int __must_check device_reset(struct device *dev);
@@ -73,6 +75,12 @@ static inline struct reset_control *reset_control_get_optional(
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct reset_control *of_reset_control_get(struct device_node *np,
+							 const char *id)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline struct reset_control *devm_reset_control_get_optional(
 					struct device *dev, const char *id)
 {
-- 
1.8.1.5
