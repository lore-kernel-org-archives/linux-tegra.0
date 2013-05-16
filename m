From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 05/33] drivers/gpio: don't check resource with devm_ioremap_resource
Date: Thu, 16 May 2013 13:15:33 +0200
Message-ID: <1368702961-4325-6-git-send-email-wsa@the-dreams.de>
References: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/gpio/gpio-mvebu.c |    5 -----
 drivers/gpio/gpio-tegra.c |    5 -----
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index bf69a7e..3a4816a 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -619,11 +619,6 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	 * per-CPU registers */
 	if (soc_variant == MVEBU_GPIO_SOC_VARIANT_ARMADAXP) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		if (!res) {
-			dev_err(&pdev->dev, "Cannot get memory resource\n");
-			return -ENODEV;
-		}
-
 		mvchip->percpu_membase = devm_ioremap_resource(&pdev->dev,
 							       res);
 		if (IS_ERR(mvchip->percpu_membase))
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index da4cb5b..9a62672 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -463,11 +463,6 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Missing MEM resource\n");
-		return -ENODEV;
-	}
-
 	regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-- 
1.7.10.4
