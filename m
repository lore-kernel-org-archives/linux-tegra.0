From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/5] gpio: max77620: Replace interrupt-enable array with bitmap
Date: Wed,  8 Jul 2020 11:26:32 +0300
Message-ID: <20200708082634.30191-4-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200708082634.30191-1-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no need to dedicate an array where a bitmap could be used.
Let's replace the interrupt's enable-array with the enable-mask in order
to improve the code a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 6a7ede6b8b74..dd83c16a1ec6 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/max77620.h>
@@ -20,7 +21,7 @@ struct max77620_gpio {
 	struct device		*dev;
 	struct mutex		buslock; /* irq_bus_lock */
 	unsigned int		irq_type[MAX77620_GPIO_NR];
-	bool			irq_enabled[MAX77620_GPIO_NR];
+	unsigned long		irq_enb_mask;
 };
 
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
@@ -53,7 +54,7 @@ static void max77620_gpio_irq_mask(struct irq_data *data)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct max77620_gpio *gpio = gpiochip_get_data(chip);
 
-	gpio->irq_enabled[data->hwirq] = false;
+	clear_bit(data->hwirq, &gpio->irq_enb_mask);
 }
 
 static void max77620_gpio_irq_unmask(struct irq_data *data)
@@ -61,7 +62,7 @@ static void max77620_gpio_irq_unmask(struct irq_data *data)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
 	struct max77620_gpio *gpio = gpiochip_get_data(chip);
 
-	gpio->irq_enabled[data->hwirq] = true;
+	set_bit(data->hwirq, &gpio->irq_enb_mask);
 }
 
 static int max77620_gpio_set_irq_type(struct irq_data *data, unsigned int type)
@@ -108,7 +109,10 @@ static void max77620_gpio_bus_sync_unlock(struct irq_data *data)
 	unsigned int value, offset = data->hwirq;
 	int err;
 
-	value = gpio->irq_enabled[offset] ? gpio->irq_type[offset] : 0;
+	if (test_bit(offset, &gpio->irq_enb_mask))
+		value = gpio->irq_type[offset];
+	else
+		value = 0;
 
 	err = regmap_update_bits(gpio->rmap, GPIO_REG_ADDR(offset),
 				 MAX77620_CNFG_GPIO_INT_MASK, value);
-- 
2.26.0
