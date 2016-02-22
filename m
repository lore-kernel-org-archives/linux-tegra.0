From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 50/61] gpio: tps65912: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:39 +0530
Message-ID: <1456150130-2668-51-git-send-email-ldewangan@nvidia.com>
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
 drivers/gpio/gpio-tps65912.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 4f2029c..e72302d 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -106,7 +106,8 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
 	if (pdata && pdata->gpio_base)
 		tps65912_gpio->gpio_chip.base = pdata->gpio_base;
 
-	ret = gpiochip_add_data(&tps65912_gpio->gpio_chip, tps65912_gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &tps65912_gpio->gpio_chip,
+				     tps65912_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register gpiochip, %d\n", ret);
 		return ret;
@@ -117,20 +118,11 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tps65912_gpio_remove(struct platform_device *pdev)
-{
-	struct tps65912_gpio_data  *tps65912_gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&tps65912_gpio->gpio_chip);
-	return 0;
-}
-
 static struct platform_driver tps65912_gpio_driver = {
 	.driver = {
 		.name = "tps65912-gpio",
 	},
 	.probe = tps65912_gpio_probe,
-	.remove = tps65912_gpio_remove,
 };
 
 static int __init tps65912_gpio_init(void)
-- 
2.1.4
