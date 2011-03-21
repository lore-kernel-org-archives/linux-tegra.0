From: wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v8] mfd: tps6586x: add RTC driver for TI TPS6586x
Date: Mon, 21 Mar 2011 13:42:41 +0800
Message-ID: <1300686161-24712-1-git-send-email-wni@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

this driver supports setting of alarms, and
reading/setting of time

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v8: use OSC_SRC_SEL to select external crystal clock.
set alrm->enabled and init the rtc->irq_en. 
Add suspend/resume callback.

 drivers/rtc/rtc-tps6586x.c |   34 ++++++++++++++++++++++++++++++----
 1 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index a42b4bb..b891899 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -30,6 +30,7 @@
 #include <linux/slab.h>
 
 #define RTC_CTRL	0xc0
+#define OSC_SRC_SEL	BIT(6)	/* select internal or external clock */
 #define RTC_ENABLE	BIT(5)	/* enables alarm */
 #define RTC_HIRES	BIT(4)	/* 1Khz or 32Khz updates */
 #define RTC_ALARM1_HI	0xc1
@@ -180,6 +181,7 @@ static int tps6586x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	seconds += rtc->epoch_start;
 
 	rtc_time_to_tm(seconds, &alrm->time);
+	alrm->enabled = rtc->irq_en;
 
 	return 0;
 }
@@ -286,7 +288,9 @@ static int __devinit tps6586x_rtc_probe(struct platform_device *pdev)
 
 	/* disable high-res mode, enable tick counting */
 	err = tps6586x_update(tps_dev, RTC_CTRL,
-			      (RTC_ENABLE | RTC_HIRES), RTC_ENABLE);
+			      (RTC_ENABLE | OSC_SRC_SEL),
+			      (RTC_ENABLE | OSC_SRC_SEL));
+
 	if (err < 0) {
 		dev_err(&pdev->dev, "unable to start counter\n");
 		goto fail;
@@ -299,11 +303,12 @@ static int __devinit tps6586x_rtc_probe(struct platform_device *pdev)
 					   IRQF_ONESHOT, "tps6586x-rtc",
 					   &pdev->dev);
 		if (err) {
-			dev_warn(&pdev->dev, "unable to request IRQ(%d)\n", rtc->irq);
+			dev_warn(&pdev->dev, "unable to request IRQ(%d)\n",
+				 rtc->irq);
 			rtc->irq = -1;
 		} else {
 			disable_irq(rtc->irq);
-			enable_irq_wake(rtc->irq);
+			rtc->irq_en = false;
 		}
 	}
 
@@ -327,6 +332,25 @@ static int __devexit tps6586x_rtc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int tps6586x_rtc_suspend(struct platform_device *pdev,
+				pm_message_t state)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(&pdev->dev);
+
+	if (device_may_wakeup(pdev))
+		enable_irq_wake(rtc->irq);
+	return 0;
+}
+
+static int tps6586x_rtc_resume(struct platform_device *pdev)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(&pdev->dev);
+
+	if (device_may_wakeup(pdev))
+		disable_irq_wake(rtc->irq);
+	return 0;
+}
+
 static struct platform_driver tps6586x_rtc_driver = {
 	.driver	= {
 		.name	= "tps6586x-rtc",
@@ -334,6 +358,8 @@ static struct platform_driver tps6586x_rtc_driver = {
 	},
 	.probe	= tps6586x_rtc_probe,
 	.remove	= __devexit_p(tps6586x_rtc_remove),
+	.suspend = tps6586x_rtc_suspend,
+	.resume = tps6586x_rtc_resume,
 };
 
 static int __init tps6586x_rtc_init(void)
@@ -351,4 +377,4 @@ module_exit(tps6586x_rtc_exit);
 MODULE_DESCRIPTION("TI TPS6586x RTC driver");
 MODULE_AUTHOR("NVIDIA Corporation");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:rtc-tps6586x")
+MODULE_ALIAS("platform:rtc-tps6586x");
-- 
1.7.0
