From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 08/16] gpio: Move irq_nested into struct gpio_irq_chip
Date: Thu, 28 Sep 2017 11:56:20 +0200
Message-ID: <20170928095628.21966-9-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 12 ++++++------
 include/linux/gpio/driver.h |  9 +++++++--
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7a62f4a63635..eaca1ccd2431 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1613,7 +1613,7 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 				 struct irq_chip *irqchip,
 				 unsigned int parent_irq)
 {
-	if (!gpiochip->irq_nested) {
+	if (!gpiochip->irq.nested) {
 		chip_err(gpiochip, "tried to nest a chained gpiochip\n");
 		return;
 	}
@@ -1648,7 +1648,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	irq_set_lockdep_class(irq, chip->lock_key);
 	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
-	if (chip->irq_nested)
+	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
@@ -1667,7 +1667,7 @@ void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
-	if (chip->irq_nested)
+	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 0);
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
@@ -1800,9 +1800,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 							 data);
 		}
 
-		gpiochip->irq_nested = false;
+		gpiochip->irq.nested = false;
 	} else {
-		gpiochip->irq_nested = true;
+		gpiochip->irq.nested = true;
 	}
 
 	/*
@@ -1919,7 +1919,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		pr_err("missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
-	gpiochip->irq_nested = nested;
+	gpiochip->irq.nested = nested;
 	of_node = gpiochip->parent->of_node;
 #ifdef CONFIG_OF_GPIO
 	/*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c3eafd874884..7d632a8932be 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -107,6 +107,13 @@ struct gpio_irq_chip {
 	 * A list of interrupt parents for each line of a GPIO chip.
 	 */
 	unsigned int *map;
+
+	/**
+	 * @nested:
+	 *
+	 * True if set the interrupt handling is nested.
+	 */
+	bool nested;
 };
 
 static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
@@ -176,7 +183,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_nested: True if set the interrupt handling is nested.
  * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
  *	bits set to one
  * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
@@ -248,7 +254,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
-- 
2.14.1
