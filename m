From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] gpio: tegra: assume CONFIG_OF
Date: Fri, 15 Feb 2013 14:54:48 -0700
Message-ID: <1360965288-14899-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra only supports, and always enables, device tree. Remove all ifdefs
and runtime checks for DT support from the driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 414ad91..a78a81f 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -398,10 +398,11 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	int j;
 
 	match = of_match_device(tegra_gpio_of_match, &pdev->dev);
-	if (match)
-		config = (struct tegra_gpio_soc_config *)match->data;
-	else
-		config = &tegra20_gpio_config;
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+	config = (struct tegra_gpio_soc_config *)match->data;
 
 	tegra_gpio_bank_stride = config->bank_stride;
 	tegra_gpio_upper_offset = config->upper_offset;
@@ -462,9 +463,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
-#ifdef CONFIG_OF_GPIO
 	tegra_gpio_chip.of_node = pdev->dev.of_node;
-#endif
 
 	gpiochip_add(&tegra_gpio_chip);
 
-- 
1.7.10.4
