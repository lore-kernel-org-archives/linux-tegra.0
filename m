From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 04/61] gpio: 74xx-mmio: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:37:53 +0530
Message-ID: <1456150130-2668-5-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: ldewangan@nvidia.com, bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use devm_gpiochip_add_data() for GPIO registration and remove the
call for gpiochip_remove() from error path.

Also remove the need of driver callback .remove.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/gpio-74xx-mmio.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 372b0e0..0475e8e 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -140,15 +140,7 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	return gpiochip_add_data(&priv->gc, priv);
-}
-
-static int mmio_74xx_gpio_remove(struct platform_device *pdev)
-{
-	struct mmio_74xx_gpio_priv *priv = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&priv->gc);
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
 }
 
 static struct platform_driver mmio_74xx_gpio_driver = {
@@ -157,7 +149,6 @@ static struct platform_driver mmio_74xx_gpio_driver = {
 		.of_match_table	= mmio_74xx_gpio_ids,
 	},
 	.probe	= mmio_74xx_gpio_probe,
-	.remove	= mmio_74xx_gpio_remove,
 };
 module_platform_driver(mmio_74xx_gpio_driver);
 
-- 
2.1.4

