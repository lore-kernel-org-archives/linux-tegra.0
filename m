From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 13/61] gpio: crystalcove: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:02 +0530
Message-ID: <1456150130-2668-14-git-send-email-ldewangan@nvidia.com>
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
call of gpiochip_remove() from error path.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-crystalcove.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 7865ef0..7c446d1 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -345,7 +345,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 	cg->chip.dbg_show = crystalcove_gpio_dbg_show;
 	cg->regmap = pmic->regmap;
 
-	retval = gpiochip_add_data(&cg->chip, cg);
+	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
 	if (retval) {
 		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
 		return retval;
@@ -359,14 +359,10 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 
 	if (retval) {
 		dev_warn(&pdev->dev, "request irq failed: %d\n", retval);
-		goto out_remove_gpio;
+		return retval;
 	}
 
 	return 0;
-
-out_remove_gpio:
-	gpiochip_remove(&cg->chip);
-	return retval;
 }
 
 static int crystalcove_gpio_remove(struct platform_device *pdev)
@@ -374,7 +370,6 @@ static int crystalcove_gpio_remove(struct platform_device *pdev)
 	struct crystalcove_gpio *cg = platform_get_drvdata(pdev);
 	int irq = platform_get_irq(pdev, 0);
 
-	gpiochip_remove(&cg->chip);
 	if (irq >= 0)
 		free_irq(irq, cg);
 	return 0;
-- 
2.1.4
