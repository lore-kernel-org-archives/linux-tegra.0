From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] rtc: tegra: convert to DT driver
Date: Wed, 19 Dec 2012 10:47:17 +0800
Message-ID: <1355885237-4448-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

After Kernel 3.7, the Tegra device will only support booting with DT. The
legacy Tegra RTC platform driver will not work anymore. This patch convert
the driver to support DT.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/rtc/rtc-tegra.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index c006025..fb62808 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -303,6 +303,12 @@ static struct rtc_class_ops tegra_rtc_ops = {
 	.alarm_irq_enable = tegra_rtc_alarm_irq_enable,
 };
 
+static const struct of_device_id tegra_rtc_dt_match[] = {
+	{ .compatible = "nvidia,tegra20-rtc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tegra_rtc_dt_match);
+
 static int __devinit tegra_rtc_probe(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info;
@@ -440,6 +446,7 @@ static struct platform_driver tegra_rtc_driver = {
 	.driver		= {
 		.name	= "tegra_rtc",
 		.owner	= THIS_MODULE,
+		.of_match_table = tegra_rtc_dt_match,
 	},
 #ifdef CONFIG_PM
 	.suspend	= tegra_rtc_suspend,
-- 
1.7.0.4
