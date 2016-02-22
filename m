From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 57/61] gpio: wm8350: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:46 +0530
Message-ID: <1456150130-2668-58-git-send-email-ldewangan@nvidia.com>
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
Cc: patches@opensource.wolfsonmicro.com
---
 drivers/gpio/gpio-wm831x.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 9839007..18cb0f5 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -259,7 +259,8 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 	else
 		wm831x_gpio->gpio_chip.base = -1;
 
-	ret = gpiochip_add_data(&wm831x_gpio->gpio_chip, wm831x_gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &wm831x_gpio->gpio_chip,
+				     wm831x_gpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		return ret;
@@ -270,19 +271,10 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wm831x_gpio_remove(struct platform_device *pdev)
-{
-	struct wm831x_gpio *wm831x_gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&wm831x_gpio->gpio_chip);
-	return 0;
-}
-
 static struct platform_driver wm831x_gpio_driver = {
 	.driver.name	= "wm831x-gpio",
 	.driver.owner	= THIS_MODULE,
 	.probe		= wm831x_gpio_probe,
-	.remove		= wm831x_gpio_remove,
 };
 
 static int __init wm831x_gpio_init(void)
-- 
2.1.4
