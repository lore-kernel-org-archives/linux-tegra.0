From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 47/61] gpio: timberdale Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:36 +0530
Message-ID: <1456150130-2668-48-git-send-email-ldewangan@nvidia.com>
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
 drivers/gpio/gpio-timberdale.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index a6de10c..f0164ec 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -279,7 +279,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->ngpio = pdata->nr_pins;
 	gc->can_sleep = false;
 
-	err = gpiochip_add_data(gc, tgpio);
+	err = devm_gpiochip_add_data(&pdev->dev, gc, tgpio);
 	if (err)
 		return err;
 
@@ -320,8 +320,6 @@ static int timbgpio_remove(struct platform_device *pdev)
 		irq_set_handler_data(irq, NULL);
 	}
 
-	gpiochip_remove(&tgpio->gpio);
-
 	return 0;
 }
 
-- 
2.1.4
