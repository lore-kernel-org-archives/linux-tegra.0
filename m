From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v9] mfd: tps6586x: add RTC driver for TI TPS6586x
Date: Wed, 6 Apr 2011 17:16:47 +0800
Message-ID: <6B4D417B830BC44B8026029FD256F7F1C2CB3DD4A5@HKMAIL01.nvidia.com>
References: <1301308615-6507-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1301308615-6507-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Could anyone review this issue?

Thanks
Wei.

-----Original Message-----
From: Wei Ni 
Sent: Monday, March 28, 2011 6:37 PM
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Wei Ni
Subject: [PATCH v9] mfd: tps6586x: add RTC driver for TI TPS6586x

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
