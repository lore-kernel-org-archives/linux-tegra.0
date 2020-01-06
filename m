From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] rtc: tps6586x: Use IRQ_NOAUTOEN flag
Date: Mon,  6 Jan 2020 04:56:15 +0300
Message-ID: <20200106015615.12602-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The IRQ_NOAUTOEN flag tells interrupt core that interrupt shall not be
auto-enabled at the time of requesting interrupt. This is a minor clean-up
change that doesn't fix any problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/rtc/rtc-tps6586x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index 859d901fa6cb..e39af2d67051 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -23,6 +23,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/mfd/tps6586x.h>
 #include <linux/module.h>
@@ -267,6 +268,8 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->start_secs = mktime64(2009, 1, 1, 0, 0, 0);
 	rtc->rtc->set_start_time = true;
 
+	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
+
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
 				IRQF_ONESHOT,
@@ -276,7 +279,6 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 				rtc->irq, ret);
 		goto fail_rtc_register;
 	}
-	disable_irq(rtc->irq);
 
 	ret = rtc_register_device(rtc->rtc);
 	if (ret)
-- 
2.24.0
