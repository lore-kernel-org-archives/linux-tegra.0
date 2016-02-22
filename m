From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 32/61] gpio: octeon: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:21 +0530
Message-ID: <1456150130-2668-33-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: ldewangan@nvidia.com, bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use devm_gpiochip_add_data() for GPIO registration and remove the
need of driver callback .remove.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-octeon.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 7665ebc..47aead1 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -117,7 +117,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->get = octeon_gpio_get;
 	chip->direction_output = octeon_gpio_dir_out;
 	chip->set = octeon_gpio_set;
-	err = gpiochip_add_data(chip, gpio);
+	err = devm_gpiochip_add_data(&pdev->dev, chip, gpio);
 	if (err)
 		goto out;
 
@@ -126,13 +126,6 @@ out:
 	return err;
 }
 
-static int octeon_gpio_remove(struct platform_device *pdev)
-{
-	struct gpio_chip *chip = dev_get_platdata(&pdev->dev);
-	gpiochip_remove(chip);
-	return 0;
-}
-
 static struct of_device_id octeon_gpio_match[] = {
 	{
 		.compatible = "cavium,octeon-3860-gpio",
@@ -147,7 +140,6 @@ static struct platform_driver octeon_gpio_driver = {
 		.of_match_table = octeon_gpio_match,
 	},
 	.probe		= octeon_gpio_probe,
-	.remove		= octeon_gpio_remove,
 };
 
 module_platform_driver(octeon_gpio_driver);
-- 
2.1.4
