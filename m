From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [RFC 05/42] drivers/gpio: don't check resource with devm_ioremap_resource
Date: Fri, 10 May 2013 10:16:50 +0200
Message-ID: <1368173847-5661-6-git-send-email-wsa@the-dreams.de>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368173847-5661-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
---
 drivers/gpio/gpio-mvebu.c       |   12 +-----------
 drivers/gpio/gpio-spear-spics.c |    7 +------
 drivers/gpio/gpio-tegra.c       |    5 -----
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index bf69a7e..60e8c6e 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -566,12 +566,6 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	else
 		soc_variant = MVEBU_GPIO_SOC_VARIANT_ORION;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Cannot get memory resource\n");
-		return -ENODEV;
-	}
-
 	mvchip = devm_kzalloc(&pdev->dev, sizeof(struct mvebu_gpio_chip), GFP_KERNEL);
 	if (!mvchip) {
 		dev_err(&pdev->dev, "Cannot allocate memory\n");
@@ -611,6 +605,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	mvchip->chip.dbg_show = mvebu_gpio_dbg_show;
 
 	spin_lock_init(&mvchip->lock);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mvchip->membase = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mvchip->membase))
 		return PTR_ERR(mvchip->membase);
@@ -619,11 +614,6 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
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
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 7a4bf7c..e9a0415 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -128,18 +128,13 @@ static int spics_gpio_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "invalid IORESOURCE_MEM\n");
-		return -EBUSY;
-	}
-
 	spics = devm_kzalloc(&pdev->dev, sizeof(*spics), GFP_KERNEL);
 	if (!spics) {
 		dev_err(&pdev->dev, "memory allocation fail\n");
 		return -ENOMEM;
 	}
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	spics->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(spics->base))
 		return PTR_ERR(spics->base);
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
