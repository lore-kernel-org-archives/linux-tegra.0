From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 38/61] gpio: sch: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:27 +0530
Message-ID: <1456150130-2668-39-git-send-email-ldewangan@nvidia.com>
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
need of driver callback .remove.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-sch.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index 5314ee4..e85e753 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -215,15 +215,7 @@ static int sch_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sch);
 
-	return gpiochip_add_data(&sch->chip, sch);
-}
-
-static int sch_gpio_remove(struct platform_device *pdev)
-{
-	struct sch_gpio *sch = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&sch->chip);
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &sch->chip, sch);
 }
 
 static struct platform_driver sch_gpio_driver = {
@@ -231,7 +223,6 @@ static struct platform_driver sch_gpio_driver = {
 		.name = "sch_gpio",
 	},
 	.probe		= sch_gpio_probe,
-	.remove		= sch_gpio_remove,
 };
 
 module_platform_driver(sch_gpio_driver);
-- 
2.1.4

