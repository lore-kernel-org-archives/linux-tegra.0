From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 11/61] gpio: bcm-kona: Use devm_gpiochip_add_data() for gpio registration
Date: Mon, 22 Feb 2016 19:38:00 +0530
Message-ID: <1456150130-2668-12-git-send-email-ldewangan@nvidia.com>
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
Cc: Ray Jui <rjui@broadcom.com>
---
 drivers/gpio/gpio-bcm-kona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b6c5abe..2fd38d5 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -630,7 +630,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 
 	bcm_kona_gpio_reset(kona_gpio);
 
-	ret = gpiochip_add_data(chip, kona_gpio);
+	ret = devm_gpiochip_add_data(dev, chip, kona_gpio);
 	if (ret < 0) {
 		dev_err(dev, "Couldn't add GPIO chip -- %d\n", ret);
 		goto err_irq_domain;
-- 
2.1.4
