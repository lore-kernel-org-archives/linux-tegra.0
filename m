From: wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v9] mfd: tps6586x: add RTC driver for TI TPS6586x
Date: Mon, 28 Mar 2011 18:36:54 +0800
Message-ID: <1301308615-6507-1-git-send-email-wni@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

this driver supports setting of alarms, and
reading/setting of time

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v9: check the enable_irq_wake/disable_irq_wake return value.
fix these two function's fisrt paremeter, it should use "&pdev->dev"

 drivers/rtc/rtc-tps6586x.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index b891899..a3944a5 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -335,19 +335,29 @@ static int __devexit tps6586x_rtc_remove(struct platform_device *pdev)
 static int tps6586x_rtc_suspend(struct platform_device *pdev,
 				pm_message_t state)
 {
+	int ret;
 	struct tps6586x_rtc *rtc = dev_get_drvdata(&pdev->dev);
 
-	if (device_may_wakeup(pdev))
-		enable_irq_wake(rtc->irq);
+	if (device_may_wakeup(&pdev->dev))
+		ret = enable_irq_wake(rtc->irq);
+
+	if (ret)
+		dev_warn(&pdev->dev, "enable irq wakeup failed.\n");
+
 	return 0;
 }
 
 static int tps6586x_rtc_resume(struct platform_device *pdev)
 {
+	int ret;
 	struct tps6586x_rtc *rtc = dev_get_drvdata(&pdev->dev);
 
-	if (device_may_wakeup(pdev))
-		disable_irq_wake(rtc->irq);
+	if (device_may_wakeup(&pdev->dev))
+		ret = disable_irq_wake(rtc->irq);
+
+	if (ret)
+		dev_warn(&pdev->dev, "disable irq wakeup failed.\n");
+
 	return 0;
 }
 
-- 
1.7.0
