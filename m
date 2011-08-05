From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND PATCH] i2c: Tegra: Add of_match_table
Date: Fri,  5 Aug 2011 16:53:48 -0600
Message-ID: <1312584828-23474-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

This patch was intended to be part of 7ca2d1a105a239e300b937e9c41a10a4bd08f569
"i2c: Tegra: Add DeviceTree support". However, an early version of that patch,
which was missing a chunk, was applied to next-i2c. This change is that
missing chunk.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0c6e840..dd1f21b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -720,6 +720,17 @@ static int tegra_i2c_resume(struct platform_device *pdev)
 }
 #endif
 
+#if defined(CONFIG_OF)
+/* Match table for of_platform binding */
+static const struct of_device_id tegra_i2c_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra20-i2c", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
+#else
+#define tegra_i2c_of_match NULL
+#endif
+
 static struct platform_driver tegra_i2c_driver = {
 	.probe   = tegra_i2c_probe,
 	.remove  = tegra_i2c_remove,
@@ -730,6 +741,7 @@ static struct platform_driver tegra_i2c_driver = {
 	.driver  = {
 		.name  = "tegra-i2c",
 		.owner = THIS_MODULE,
+		.of_match_table = tegra_i2c_of_match,
 	},
 };
 
-- 
1.7.0.4
