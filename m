From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 21/61] gpio: generic: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:10 +0530
Message-ID: <1456150130-2668-22-git-send-email-ldewangan@nvidia.com>
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
 drivers/gpio/gpio-generic.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 2a4f233..54cddfa 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -628,15 +628,7 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gc);
 
-	return gpiochip_add_data(gc, NULL);
-}
-
-static int bgpio_pdev_remove(struct platform_device *pdev)
-{
-	struct gpio_chip *gc = platform_get_drvdata(pdev);
-
-	gpiochip_remove(gc);
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
 }
 
 static const struct platform_device_id bgpio_id_table[] = {
@@ -657,7 +649,6 @@ static struct platform_driver bgpio_driver = {
 	},
 	.id_table = bgpio_id_table,
 	.probe = bgpio_pdev_probe,
-	.remove = bgpio_pdev_remove,
 };
 
 module_platform_driver(bgpio_driver);
-- 
2.1.4
