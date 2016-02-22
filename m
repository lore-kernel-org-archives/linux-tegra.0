From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 27/61] gpio: lynxpoint: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:16 +0530
Message-ID: <1456150130-2668-28-git-send-email-ldewangan@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: ldewangan@nvidia.com, bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use devm_gpiochip_add_data() for GPIO registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-lynxpoint.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 1310777..9df015e 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -370,7 +370,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->can_sleep = false;
 	gc->parent = dev;
 
-	ret = gpiochip_add_data(gc, lg);
+	ret = devm_gpiochip_add_data(dev, gc, lg);
 	if (ret) {
 		dev_err(dev, "failed adding lp-gpio chip\n");
 		return ret;
@@ -439,9 +439,7 @@ MODULE_DEVICE_TABLE(acpi, lynxpoint_gpio_acpi_match);
 
 static int lp_gpio_remove(struct platform_device *pdev)
 {
-	struct lp_gpio *lg = platform_get_drvdata(pdev);
 	pm_runtime_disable(&pdev->dev);
-	gpiochip_remove(&lg->chip);
 	return 0;
 }
 
-- 
2.1.4
