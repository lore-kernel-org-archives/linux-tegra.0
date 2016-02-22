From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 29/61] gpio: moxart: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:18 +0530
Message-ID: <1456150130-2668-30-git-send-email-ldewangan@nvidia.com>
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
 drivers/gpio/gpio-moxart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index ca60453..869002b 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -63,7 +63,7 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
-	ret = gpiochip_add_data(gc, NULL);
+	ret = devm_gpiochip_add_data(dev, gc, NULL);
 	if (ret) {
 		dev_err(dev, "%s: gpiochip_add failed\n",
 			dev->of_node->full_name);
-- 
2.1.4
