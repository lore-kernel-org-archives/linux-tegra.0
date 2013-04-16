From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] gpio: palmas: add dt support
Date: Tue, 16 Apr 2013 20:01:45 +0530
Message-ID: <1366122705-3579-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add of_device_id table for Palma GPIO to be enable the
driver from DT file.

The driver can be registered from DT file as:
	palmas: tps65913@58 {
		:::::::::::
		palmas_gpio: palmas_gpio {
			compatible = "ti,palmas-gpio";
			gpio-controller;
			#gpio-cells = <2>;
		};
	};

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from V1:
Remove the ifdefs of CONFIG_OF around of_device_id structure for
defining compatible values.

 drivers/gpio/gpio-palmas.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e3a4e56..5802662 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -134,7 +134,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.get	= palmas_gpio_get;
 	palmas_gpio->gpio_chip.dev = &pdev->dev;
 #ifdef CONFIG_OF_GPIO
-	palmas_gpio->gpio_chip.of_node = palmas->dev->of_node;
+	palmas_gpio->gpio_chip.of_node = pdev->dev.of_node;
 #endif
 	palmas_pdata = dev_get_platdata(palmas->dev);
 	if (palmas_pdata && palmas_pdata->gpio_base)
@@ -159,9 +159,16 @@ static int palmas_gpio_remove(struct platform_device *pdev)
 	return gpiochip_remove(&palmas_gpio->gpio_chip);
 }
 
+static struct of_device_id of_palmas_gpio_match[] = {
+	{ .compatible = "ti,palmas-gpio"},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
+
 static struct platform_driver palmas_gpio_driver = {
 	.driver.name	= "palmas-gpio",
 	.driver.owner	= THIS_MODULE,
+	.driver.of_match_table = of_palmas_gpio_match,
 	.probe		= palmas_gpio_probe,
 	.remove		= palmas_gpio_remove,
 };
-- 
1.7.1.1
