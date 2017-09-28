From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 02/16] gpio: Move irqchip into struct gpio_irq_chip
Date: Thu, 28 Sep 2017 11:56:14 +0200
Message-ID: <20170928095628.21966-3-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpiolib.c      | 18 +++++++++---------
 include/linux/gpio/driver.h | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b34d9cbd5809..450007ac1fc0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1645,7 +1645,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * category than their parents, so it won't report false recursion.
 	 */
 	irq_set_lockdep_class(irq, chip->lock_key);
-	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
+	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq_handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq_nested)
 		irq_set_nested_thread(irq, 1);
@@ -1718,7 +1718,7 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
  */
 static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 {
-	struct irq_chip *irqchip = gpiochip->irqchip;
+	struct irq_chip *irqchip = gpiochip->irq.chip;
 	const struct irq_domain_ops *ops;
 	struct device_node *np;
 	unsigned int type;
@@ -1847,7 +1847,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
 	}
 
-	if (gpiochip->irqchip) {
+	if (gpiochip->irq.chip) {
 		struct gpio_irq_chip *irq = &gpiochip->irq;
 		unsigned int i;
 
@@ -1868,10 +1868,10 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
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
@@ -1946,7 +1946,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->irqchip = irqchip;
+	gpiochip->irq.chip = irqchip;
 	gpiochip->irq_handler = handler;
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
@@ -1955,7 +1955,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
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
@@ -24,6 +24,13 @@ struct module;
  * struct gpio_irq_chip - GPIO interrupt controller
  */
 struct gpio_irq_chip {
+	/**
+	 * @chip:
+	 *
+	 * GPIO IRQ chip implementation, provided by GPIO driver.
+	 */
+	struct irq_chip *chip;
+
 	/**
 	 * @domain_ops:
 	 *
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
2.14.1
