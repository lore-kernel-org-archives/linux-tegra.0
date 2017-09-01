From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/16] gpio: Move irqchip into struct gpio_irq_chip
Date: Fri,  1 Sep 2017 20:57:22 +0200
Message-ID: <20170901185736.28051-3-thierry.reding@gmail.com>
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
 drivers/gpio/gpiolib.c      | 18 +++++++++---------
 include/linux/gpio/driver.h | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abc0f72e9950..4058adde7dc6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1656,7 +1656,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * category than their parents, so it won't report false recursion.
 	 */
 	irq_set_lockdep_class(irq, chip->lock_key);
-	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
+	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq_handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq_nested)
 		irq_set_nested_thread(irq, 1);
@@ -1729,7 +1729,7 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
  */
 static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 {
-	struct irq_chip *irqchip = gpiochip->irqchip;
+	struct irq_chip *irqchip = gpiochip->irq.chip;
 	const struct irq_domain_ops *ops;
 	struct device_node *np;
 	unsigned int type;
@@ -1858,7 +1858,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
 	}
 
-	if (gpiochip->irqchip) {
+	if (gpiochip->irq.chip) {
 		struct gpio_irq_chip *irq = &gpiochip->irq;
 		unsigned int i;
 
@@ -1879,10 +1879,10 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		irq_domain_remove(gpiochip->irqdomain);
 	}
 
-	if (gpiochip->irqchip) {
-		gpiochip->irqchip->irq_request_resources = NULL;
-		gpiochip->irqchip->irq_release_resources = NULL;
-		gpiochip->irqchip = NULL;
+	if (gpiochip->irq.chip) {
+		gpiochip->irq.chip->irq_request_resources = NULL;
+		gpiochip->irq.chip->irq_release_resources = NULL;
+		gpiochip->irq.chip = NULL;
 	}
 
 	gpiochip_irqchip_free_valid_mask(gpiochip);
@@ -1957,7 +1957,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->irqchip = irqchip;
+	gpiochip->irq.chip = irqchip;
 	gpiochip->irq_handler = handler;
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
@@ -1966,7 +1966,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
 	if (!gpiochip->irqdomain) {
-		gpiochip->irqchip = NULL;
+		gpiochip->irq.chip = NULL;
 		return -EINVAL;
 	}
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6100b171817e..974247646886 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -25,6 +25,13 @@ struct module;
  */
 struct gpio_irq_chip {
 	/**
+	 * @chip:
+	 *
+	 * GPIO IRQ chip implementation, provided by GPIO driver.
+	 */
+	struct irq_chip *chip;
+
+	/**
 	 * @domain_ops:
 	 *
 	 * Table of interrupt domain operations for this IRQ chip.
@@ -69,6 +76,11 @@ struct gpio_irq_chip {
 	 */
 	unsigned int *map;
 };
+
+static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
+{
+	return container_of(chip, struct gpio_irq_chip, chip);
+}
 #endif
 
 /**
@@ -132,7 +144,6 @@ struct gpio_irq_chip {
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irqchip: GPIO IRQ chip impl, provided by GPIO driver
  * @irqdomain: Interrupt translation domain; responsible for mapping
  *	between GPIO hwirq number and linux irq number
  * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
@@ -215,7 +226,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	struct irq_chip		*irqchip;
 	struct irq_domain	*irqdomain;
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
-- 
2.13.3
