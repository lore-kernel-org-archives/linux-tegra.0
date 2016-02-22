From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 16/61] gpio: da9055: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:05 +0530
Message-ID: <1456150130-2668-17-git-send-email-ldewangan@nvidia.com>
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
Cc: Support Opensource <support.opensource@diasemi.com>
---
 drivers/gpio/gpio-da9055.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 18210fb..2c2c18d 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -151,31 +151,19 @@ static int da9055_gpio_probe(struct platform_device *pdev)
 	if (pdata && pdata->gpio_base)
 		gpio->gp.base = pdata->gpio_base;
 
-	ret = gpiochip_add_data(&gpio->gp, gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		goto err_mem;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, gpio);
 
 	return 0;
-
-err_mem:
-	return ret;
-}
-
-static int da9055_gpio_remove(struct platform_device *pdev)
-{
-	struct da9055_gpio *gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&gpio->gp);
-	return 0;
 }
 
 static struct platform_driver da9055_gpio_driver = {
 	.probe = da9055_gpio_probe,
-	.remove = da9055_gpio_remove,
 	.driver = {
 		.name	= "da9055-gpio",
 	},
-- 
2.1.4
