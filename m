From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/2] gpio: max77620: Initialize interrupts state
Date: Wed,  8 Jul 2020 18:58:33 +0300
Message-ID: <20200708155834.19762-2-digetx@gmail.com>
References: <20200708155834.19762-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200708155834.19762-1-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I noticed on Nexus 7 that after rebooting from downstream kernel to
upstream, the GPIO interrupt is triggering non-stop despite of interrupts
being disabled for all of GPIOs. This happens because Nexus 7 uses a
soft-reboot, meaning that bootloader should take care of resetting
hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
may be left ON at a boot time. Let's mask all GPIO interrupts at the
driver's initialization time in order to resolve the issue.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 313bd02dd893..970ad6397a56 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -260,6 +260,30 @@ static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return -ENOTSUPP;
 }
 
+static int max77620_gpio_irq_init_hw(struct gpio_chip *gc)
+{
+	struct max77620_gpio *gpio = gpiochip_get_data(gc);
+	unsigned int i;
+	int err;
+
+	/*
+	 * GPIO interrupts may be left ON after bootloader, hence let's
+	 * pre-initialize hardware to the expected state by disabling all
+	 * the interrupts.
+	 */
+	for (i = 0; i < MAX77620_GPIO_NR; i++) {
+		err = regmap_update_bits(gpio->rmap, GPIO_REG_ADDR(i),
+					 MAX77620_CNFG_GPIO_INT_MASK, 0);
+		if (err < 0) {
+			dev_err(gpio->dev,
+				"failed to disable interrupt: %d\n", err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
@@ -288,6 +312,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
+	mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
 #ifdef CONFIG_OF_GPIO
 	mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
 #endif
-- 
2.26.0
