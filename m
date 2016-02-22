From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 08/61] gpio: amdpt: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:37:57 +0530
Message-ID: <1456150130-2668-9-git-send-email-ldewangan@nvidia.com>
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
 drivers/gpio/gpio-amdpt.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index c248404..857eec5 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -212,7 +212,7 @@ static int pt_gpio_probe(struct platform_device *pdev)
 #if defined(CONFIG_OF_GPIO)
 	pt_gpio->gc.of_node          = pdev->dev.of_node;
 #endif
-	ret = gpiochip_add_data(&pt_gpio->gc, pt_gpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &pt_gpio->gc, pt_gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register GPIO lib\n");
 		return ret;
@@ -228,15 +228,6 @@ static int pt_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pt_gpio_remove(struct platform_device *pdev)
-{
-	struct pt_gpio_chip *pt_gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&pt_gpio->gc);
-
-	return 0;
-}
-
 static const struct acpi_device_id pt_gpio_acpi_match[] = {
 	{ "AMDF030", 0 },
 	{ },
@@ -249,7 +240,6 @@ static struct platform_driver pt_gpio_driver = {
 		.acpi_match_table = ACPI_PTR(pt_gpio_acpi_match),
 	},
 	.probe = pt_gpio_probe,
-	.remove = pt_gpio_remove,
 };
 
 module_platform_driver(pt_gpio_driver);
-- 
2.1.4
