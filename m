From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/12] gpio: Move irq_nested into struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:23 +0200
Message-ID: <20170403160532.20282-4-thierry.reding@gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403160532.20282-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpiolib.c      | 12 ++++++------
 include/linux/gpio/driver.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d403a0572d4b..5aa920cb4653 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1588,7 +1588,7 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 				 struct irq_chip *irqchip,
 				 unsigned int parent_irq)
 {
-	if (!gpiochip->irq_nested) {
+	if (!gpiochip->irq.nested) {
 		chip_err(gpiochip, "tried to nest a chained gpiochip\n");
 		return;
 	}
@@ -1626,7 +1626,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	irq_set_lockdep_class(irq, chip->lock_key);
 	irq_set_chip_and_handler(irq, irqchip, chip->irq_handler);
 	/* Chips that use nested thread handlers have them marked */
-	if (chip->irq_nested)
+	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
@@ -1645,7 +1645,7 @@ void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
-	if (chip->irq_nested)
+	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 0);
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
@@ -1779,9 +1779,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 							 data);
 		}
 
-		gpiochip->irq_nested = false;
+		gpiochip->irq.nested = false;
 	} else {
-		gpiochip->irq_nested = true;
+		gpiochip->irq.nested = true;
 	}
 
 	/*
@@ -1904,7 +1904,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		pr_err("missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
-	gpiochip->irq_nested = nested;
+	gpiochip->irq.nested = nested;
 	of_node = gpiochip->parent->of_node;
 #ifdef CONFIG_OF_GPIO
 	/*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 223645a1d80f..07d93ffb49af 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -36,6 +36,7 @@ struct module;
  * @num_parents: the number of interrupt parents of a GPIO chip
  * @parents: a list of interrupt parents of a GPIO chip
  * @map: a list of interrupt parents for each line of a GPIO chip
+ * @nested: True if set the interrupt handling is nested.
  */
 struct gpio_irq_chip {
 	struct irq_chip *chip;
@@ -49,6 +50,7 @@ struct gpio_irq_chip {
 	unsigned int num_parents;
 	unsigned int *parents;
 	unsigned int *map;
+	bool nested;
 };
 #endif
 
@@ -124,7 +126,6 @@ struct gpio_irq_chip {
  * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
  *	provided by GPIO driver for chained interrupt (not for nested
  *	interrupts).
- * @irq_nested: True if set the interrupt handling is nested.
  * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
  *	bits set to one
  * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
@@ -202,7 +203,6 @@ struct gpio_chip {
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
-	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
-- 
2.12.0
