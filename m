From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/3] rtc: tegra: set range
Date: Sun,  7 Apr 2019 23:16:44 +0200
Message-ID: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rtc@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra 20 RTC is a 32bit seconds counter (with an unused millisecond
counter).

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-tegra.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index c6b0a99aa3a9..3f93a1f7abb5 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -306,6 +306,13 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 
 	info->tegra_rtc_irq = ret;
 
+	info->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(info->rtc_dev))
+		return PTR_ERR(info->rtc_dev);
+
+	info->rtc_dev->ops = &tegra_rtc_ops;
+	info->rtc_dev->range_max = U32_MAX;
+
 	info->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->clk))
 		return PTR_ERR(info->clk);
@@ -327,16 +334,6 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	info->rtc_dev = devm_rtc_device_register(&pdev->dev,
-				dev_name(&pdev->dev), &tegra_rtc_ops,
-				THIS_MODULE);
-	if (IS_ERR(info->rtc_dev)) {
-		ret = PTR_ERR(info->rtc_dev);
-		dev_err(&pdev->dev, "Unable to register device (err=%d).\n",
-			ret);
-		goto disable_clk;
-	}
-
 	ret = devm_request_irq(&pdev->dev, info->tegra_rtc_irq,
 			tegra_rtc_irq_handler, IRQF_TRIGGER_HIGH,
 			dev_name(&pdev->dev), &pdev->dev);
@@ -347,6 +344,13 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
+	ret = rtc_register_device(info->rtc_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to register device (err=%d).\n",
+			ret);
+		goto disable_clk;
+	}
+
 	dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
 
 	return 0;
-- 
2.20.1
