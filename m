From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
Date: Wed,  8 Jul 2020 11:26:30 +0300
Message-ID: <20200708082634.30191-2-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200708082634.30191-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I noticed on Nexus 7 that after rebooting from downstream kernel to
upstream, the GPIO interrupt is triggering non-stop despite of interrupts
being disabled for all of GPIOs. This happens because Nexus 7 uses a
soft-reboot, meaning that bootloader should take care of resetting
hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
may be left ON at a boot time. Let's mask all GPIO interrupts at the
driver's probe time in order to resolve the issue.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 313bd02dd893..473b4e900bbb 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -260,6 +260,25 @@ static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return -ENOTSUPP;
 }
 
+static void max77620_gpio_initialize(struct max77620_gpio *mgpio)
+{
+	unsigned int i;
+	int err;
+
+	/*
+	 * GPIO interrupts may be left ON after bootloader, hence let's
+	 * pre-initialize hardware to the expected state by disabling all
+	 * interrupts.
+	 */
+	for (i = 0; i < MAX77620_GPIO_NR; i++) {
+		err = regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(i),
+					 MAX77620_CNFG_GPIO_INT_MASK, 0);
+		if (err < 0)
+			dev_err(mgpio->dev, "failed to disable interrupt: %d\n",
+				err);
+	}
+}
+
 static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
@@ -292,6 +311,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
 #endif
 
+	max77620_gpio_initialize(mgpio);
 	platform_set_drvdata(pdev, mgpio);
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &mgpio->gpio_chip, mgpio);
-- 
2.26.0
