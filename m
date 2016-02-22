From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 06/61] gpio: adp5520: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:37:55 +0530
Message-ID: <1456150130-2668-7-git-send-email-ldewangan@nvidia.com>
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
call for gpiochip_remove() from error path.

Also remove the need of driver callback .remove.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
---
 drivers/gpio/gpio-adp5520.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index 4fa7ff1..abf1996 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -153,7 +153,7 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = gpiochip_add_data(&dev->gpio_chip, dev);
+	ret = devm_gpiochip_add_data(&pdev->dev, &dev->gpio_chip, dev);
 	if (ret)
 		goto err;
 
@@ -164,22 +164,11 @@ err:
 	return ret;
 }
 
-static int adp5520_gpio_remove(struct platform_device *pdev)
-{
-	struct adp5520_gpio *dev;
-
-	dev = platform_get_drvdata(pdev);
-	gpiochip_remove(&dev->gpio_chip);
-
-	return 0;
-}
-
 static struct platform_driver adp5520_gpio_driver = {
 	.driver	= {
 		.name	= "adp5520-gpio",
 	},
 	.probe		= adp5520_gpio_probe,
-	.remove		= adp5520_gpio_remove,
 };
 
 module_platform_driver(adp5520_gpio_driver);
-- 
2.1.4
