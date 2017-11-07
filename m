From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v7 07/15] gpio: Move irq_nested into struct gpio_irq_chip
Date: Tue,  7 Nov 2017 19:15:51 +0100
Message-ID: <20171107181559.6318-8-thierry.reding@gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 8 ++++----
 include/linux/gpio/driver.h | 9 +++++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3edb02b54bb2..62d6e146dde1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1614,7 +1614,7 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 				 struct irq_chip *irqchip,
 				 unsigned int parent_irq)
 {
-	if (!gpiochip->irq_nested) {
+	if (!gpiochip->irq.nested) {
 		chip_err(gpiochip, "tried to nest a chained gpiochip\n");
 		return;
 	}
@@ -1649,7 +1649,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	irq_set_lockdep_class(irq, chip->lock_key);
 	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
-	if (chip->irq_nested)
+	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
@@ -1667,7 +1667,7 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
-	if (chip->irq_nested)
+	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 0);
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
@@ -1801,7 +1801,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		pr_err("missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
-	gpiochip->irq_nested = nested;
+	gpiochip->irq.nested = nested;
 	of_node = gpiochip->parent->of_node;
 #ifdef CONFIG_OF_GPIO
 	/*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4210aa4c11d1..23f9feb266cf 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -93,6 +93,13 @@ struct gpio_irq_chip {
 	 * driver, so the core will only reference this list, not modify it.
 	 */
 	unsigned int *parents;
+
+	/**
+	 * @nested:
+	 *
+	 * True if set the interrupt handling is nested.
+	 */
+	bool nested;
 };
 
 static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
@@ -164,7 +171,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_nested: True if set the interrupt handling is nested.
  * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
  *	bits set to one
  * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
@@ -239,7 +245,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
-- 
2.14.1
