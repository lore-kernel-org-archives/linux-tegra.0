From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/16] gpio: Move irq_handler to struct gpio_irq_chip
Date: Fri,  1 Sep 2017 20:57:25 +0200
Message-ID: <20170901185736.28051-6-thierry.reding@gmail.com>
References: <20170901185736.28051-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901185736.28051-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      |  4 ++--
 include/linux/gpio/driver.h | 11 ++++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5ad28978d5c..75fa734cfa98 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1656,7 +1656,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * category than their parents, so it won't report false recursion.
 	 */
 	irq_set_lockdep_class(irq, chip->lock_key);
-	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq_handler);
+	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq_nested)
 		irq_set_nested_thread(irq, 1);
@@ -1960,7 +1960,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	}
 
 	gpiochip->irq.chip = irqchip;
-	gpiochip->irq_handler = handler;
+	gpiochip->irq.handler = handler;
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->lock_key = lock_key;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9389406df0b1..b1398ea0c32a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -55,6 +55,14 @@ struct gpio_irq_chip {
 	unsigned int first;
 
 	/**
+	 * @handler:
+	 *
+	 * The IRQ handler to use (often a predefined IRQ core function) for
+	 * GPIO IRQs, provided by GPIO driver.
+	 */
+	irq_flow_handler_t handler;
+
+	/**
 	 * @parent_handler:
 	 *
 	 * The interrupt handler for the GPIO chip's parent interrupts, may be
@@ -160,8 +168,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_handler: the irq handler to use (often a predefined irq core function)
- *	for GPIO IRQs, provided by GPIO driver
  * @irq_default_type: default IRQ triggering type applied during GPIO driver
  *	initialization, provided by GPIO driver
  * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
@@ -239,7 +245,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
 	bool			irq_nested;
-- 
2.13.3
