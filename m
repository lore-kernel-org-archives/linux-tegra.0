From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 52/61] gpio: ts5500: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:41 +0530
Message-ID: <1456150130-2668-53-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: ldewangan@nvidia.com, bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use devm_gpiochip_add_data() for GPIO registration and clean the
error path.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-ts5500.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index 5f94508..6cfeba0 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -409,7 +409,7 @@ static int ts5500_dio_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = gpiochip_add_data(&priv->gpio_chip, priv);
+	ret = devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
 	if (ret) {
 		dev_err(dev, "failed to register the gpio chip\n");
 		return ret;
@@ -418,13 +418,10 @@ static int ts5500_dio_probe(struct platform_device *pdev)
 	ret = ts5500_enable_irq(priv);
 	if (ret) {
 		dev_err(dev, "invalid interrupt %d\n", priv->hwirq);
-		goto cleanup;
+		return ret;
 	}
 
 	return 0;
-cleanup:
-	gpiochip_remove(&priv->gpio_chip);
-	return ret;
 }
 
 static int ts5500_dio_remove(struct platform_device *pdev)
@@ -432,7 +429,7 @@ static int ts5500_dio_remove(struct platform_device *pdev)
 	struct ts5500_priv *priv = platform_get_drvdata(pdev);
 
 	ts5500_disable_irq(priv);
-	gpiochip_remove(&priv->gpio_chip);
+
 	return 0;
 }
 
-- 
2.1.4

