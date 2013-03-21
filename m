From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] rtc: palmas: add dt support
Date: Thu, 21 Mar 2013 20:02:10 +0530
Message-ID: <1363876330-26003-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add of_device_id table for Palma RTC to be enable the
driver from DT file.

The driver can be registered from DT file as:
	palmas: tps65913@58 {
		:::::::::::
		palmas_rtc {
			compatible = "ti,palmas-rtc";
			interrupt-parent = <&palmas>;
			interrupts = <8 0>;
		};
	};

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/rtc/rtc-palmas.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
index bbc3b9e..50204d4 100644
--- a/drivers/rtc/rtc-palmas.c
+++ b/drivers/rtc/rtc-palmas.c
@@ -30,6 +30,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/palmas.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/rtc.h>
 #include <linux/types.h>
 #include <linux/platform_device.h>
@@ -316,6 +317,14 @@ static const struct dev_pm_ops palmas_rtc_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(palmas_rtc_suspend, palmas_rtc_resume)
 };
 
+#ifdef CONFIG_OF
+static struct of_device_id of_palmas_rtc_match[] = {
+	{ .compatible = "ti,palmas-rtc"},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_palmas_rtc_match);
+#endif
+
 static struct platform_driver palmas_rtc_driver = {
 	.probe		= palmas_rtc_probe,
 	.remove		= palmas_rtc_remove,
@@ -323,6 +332,7 @@ static struct platform_driver palmas_rtc_driver = {
 		.owner	= THIS_MODULE,
 		.name	= "palmas-rtc",
 		.pm	= &palmas_rtc_pm_ops,
+		.of_match_table = of_match_ptr(of_palmas_rtc_match),
 	},
 };
 
-- 
1.7.1.1
