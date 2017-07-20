From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] gpio: tegra: Use platform_irq_count()
Date: Thu, 20 Jul 2017 18:00:56 +0200
Message-ID: <20170720160057.13483-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Use platform_irq_count() instead of open-coding the same code sequence.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 88529d3c06c9..cdbff018a0f4 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -588,13 +588,12 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	tgi->soc = config;
 	tgi->dev = &pdev->dev;
 
-	for (;;) {
-		res = platform_get_resource(pdev, IORESOURCE_IRQ,
-					    tgi->bank_count);
-		if (!res)
-			break;
-		tgi->bank_count++;
-	}
+	ret = platform_irq_count(pdev);
+	if (ret < 0)
+		return ret;
+
+	tgi->bank_count = ret;
+
 	if (!tgi->bank_count) {
 		dev_err(&pdev->dev, "Missing IRQ resource\n");
 		return -ENODEV;
-- 
2.13.3
