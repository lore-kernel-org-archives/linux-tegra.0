From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] gpio: tegra: Use platform_get_irq()
Date: Thu, 20 Jul 2017 18:00:57 +0200
Message-ID: <20170720160057.13483-2-thierry.reding@gmail.com>
References: <20170720160057.13483-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170720160057.13483-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Instead of using platform_get_resource() and getting the interrupts from
the resource, use platform_get_irq() which is slightly easier to use and
covers some special cases that the former doesn't.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index cdbff018a0f4..17725c83821f 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -640,15 +640,15 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	for (i = 0; i < tgi->bank_count; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
-		if (!res) {
-			dev_err(&pdev->dev, "Missing IRQ resource\n");
-			return -ENODEV;
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "Missing IRQ resource: %d\n", ret);
+			return ret;
 		}
 
 		bank = &tgi->bank_info[i];
 		bank->bank = i;
-		bank->irq = res->start;
+		bank->irq = ret;
 		bank->tgi = tgi;
 	}
 
-- 
2.13.3
