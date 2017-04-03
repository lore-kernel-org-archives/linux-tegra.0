From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/12] gpio: Implement tighter IRQ chip integration
Date: Mon,  3 Apr 2017 18:05:22 +0200
Message-ID: <20170403160532.20282-3-thierry.reding@gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170403160532.20282-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Currently GPIO drivers are required to a GPIO chip and the corresponding
IRQ chip separately, which can result in a lot of boilerplate. Introduce
a new struct gpio_irq_chip, embedded in a struct gpio_chip, that drivers
can fill in if they want the GPIO core to automatically register the IRQ
chip associated with a GPIO chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 157 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/gpio/driver.h |  39 +++++++++++
 2 files changed, 192 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7a0df48e09da..d403a0572d4b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -72,6 +72,7 @@ static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_devices);
 
 static void gpiochip_free_hogs(struct gpio_chip *chip);
+static int gpiochip_add_irqchip(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
@@ -1240,6 +1241,10 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (status)
 		goto err_remove_from_list;
 
+	status = gpiochip_add_irqchip(chip);
+	if (status)
+		goto err_remove_chip;
+
 	status = of_gpiochip_add(chip);
 	if (status)
 		goto err_remove_chip;
@@ -1602,10 +1607,16 @@ EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
  * gpiochip by assigning the gpiochip as chip data, and using the irqchip
  * stored inside the gpiochip.
  */
-static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
-			    irq_hw_number_t hwirq)
+int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
+		     irq_hw_number_t hwirq)
 {
 	struct gpio_chip *chip = d->host_data;
+	struct irq_chip *irqchip;
+
+	if (chip->irq.chip)
+		irqchip = chip->irq.chip;
+	else
+		irqchip = chip->irqchip;
 
 	irq_set_chip_data(irq, chip);
 	/*
@@ -1613,7 +1624,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * category than their parents, so it won't report false recursion.
 	 */
 	irq_set_lockdep_class(irq, chip->lock_key);
-	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
+	irq_set_chip_and_handler(irq, irqchip, chip->irq_handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq_nested)
 		irq_set_nested_thread(irq, 1);
@@ -1628,8 +1639,9 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_map);
 
-static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
+void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
@@ -1638,6 +1650,7 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_unmap);
 
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
@@ -1677,6 +1690,127 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 }
 
 /**
+ * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
+ * @gpiochip: the GPIO chip to add the IRQ chip to
+ */
+static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
+{
+	struct irq_chip *irqchip = gpiochip->irq.chip;
+	const struct irq_domain_ops *ops;
+	struct device_node *np;
+	unsigned int type;
+	unsigned int i;
+
+	if (!irqchip)
+		return 0;
+
+	if (gpiochip->irq.parent_handler && gpiochip->can_sleep) {
+		chip_err(gpiochip, "you cannot have chained interrupts on a "
+			 "chip that may sleep\n");
+		return -EINVAL;
+	}
+
+	type = gpiochip->irq.default_type;
+	np = gpiochip->parent->of_node;
+
+#ifdef CONFIG_OF_GPIO
+	/*
+	 * If the gpiochip has an assigned OF node this takes precedence
+	 * FIXME: get rid of this and use gpiochip->parent->of_node
+	 * everywhere
+	 */
+	if (gpiochip->of_node)
+		np = gpiochip->of_node;
+#endif
+
+	/*
+	 * Specifying a default trigger is a terrible idea if DT or ACPI is
+	 * used to configure the interrupts, as you may end up with
+	 * conflicting triggers. Tell the user, and reset to NONE.
+	 */
+	if (WARN(np && type != IRQ_TYPE_NONE,
+		 "%s: Ignoring %u default trigger\n", np->full_name, type))
+		type = IRQ_TYPE_NONE;
+
+	if (has_acpi_companion(gpiochip->parent) && type != IRQ_TYPE_NONE) {
+		acpi_handle_warn(ACPI_HANDLE(gpiochip->parent),
+				 "Ignoring %u default trigger\n", type);
+		type = IRQ_TYPE_NONE;
+	}
+
+	gpiochip->irq_handler = gpiochip->irq.handler;
+	gpiochip->lock_key = gpiochip->irq.lock_key;
+
+	gpiochip->to_irq = gpiochip_to_irq;
+	gpiochip->irq_default_type = type;
+
+	if (gpiochip->irq.domain_ops)
+		ops = gpiochip->irq.domain_ops;
+	else
+		ops = &gpiochip_domain_ops;
+
+	gpiochip->irqdomain = irq_domain_add_simple(np, gpiochip->ngpio,
+						    gpiochip->irq.first,
+						    ops, gpiochip);
+	if (!gpiochip->irqdomain)
+		return -EINVAL;
+
+	/*
+	 * It is possible for a driver to override this, but only if the
+	 * alternative functions are both implemented.
+	 */
+	if (!irqchip->irq_request_resources &&
+	    !irqchip->irq_release_resources) {
+		irqchip->irq_request_resources = gpiochip_irq_reqres;
+		irqchip->irq_release_resources = gpiochip_irq_relres;
+	}
+
+	if (gpiochip->irq.parent_handler) {
+		void *data = gpiochip->irq.parent_handler_data ?: gpiochip;
+
+		for (i = 0; i < gpiochip->irq.num_parents; i++) {
+			/*
+			 * The parent IRQ chip is already using the chip_data
+			 * for this IRQ chip, so our callbacks simply use the
+			 * handler_data.
+			 */
+			irq_set_chained_handler_and_data(gpiochip->irq.parents[i],
+							 gpiochip->irq.parent_handler,
+							 data);
+		}
+
+		gpiochip->irq_nested = false;
+	} else {
+		gpiochip->irq_nested = true;
+	}
+
+	/*
+	 * Prepare the mapping since the IRQ chip shall be orthogonal to any
+	 * GPIO chip calls.
+	 */
+	for (i = 0; i < gpiochip->ngpio; i++) {
+		unsigned int irq;
+
+		if (!gpiochip_irqchip_irq_valid(gpiochip, i))
+			continue;
+
+		irq = irq_create_mapping(gpiochip->irqdomain, i);
+		if (!irq) {
+			chip_err(gpiochip,
+				 "failed to create IRQ mapping for GPIO#%u\n",
+				 i);
+			continue;
+		}
+
+		irq_set_parent(irq, gpiochip->irq.map[i]);
+	}
+
+	acpi_gpiochip_request_interrupts(gpiochip);
+
+	return 0;
+}
+
+/**
  * gpiochip_irqchip_remove() - removes an irqchip added to a gpiochip
  * @gpiochip: the gpiochip to remove the irqchip from
  *
@@ -1693,6 +1827,16 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
 	}
 
+	if (gpiochip->irq.chip) {
+		struct gpio_irq_chip *irq = &gpiochip->irq;
+		unsigned int i;
+
+		for (i = 0; i < irq->num_parents; i++) {
+			irq_set_chained_handler(irq->parents[i], NULL);
+			irq_set_handler_data(irq->parents[i], NULL);
+		}
+	}
+
 	/* Remove all IRQ mappings and delete the domain */
 	if (gpiochip->irqdomain) {
 		for (offset = 0; offset < gpiochip->ngpio; offset++) {
@@ -1835,6 +1979,11 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
+static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
+{
+	return 0;
+}
+
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
 static inline int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 393582867afd..223645a1d80f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -19,6 +19,39 @@ struct module;
 
 #ifdef CONFIG_GPIOLIB
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+/**
+ * struct gpio_irq_chip - GPIO interrupt controller
+ * @chip: GPIO IRQ chip implementation, provided by GPIO driver
+ * @first: if not dynamically assigned, the base (first) IRQ to allocate GPIO
+ *         chip IRQs from
+ * @domain_ops: table of interrupt domain operations for this IRQ chip
+ * @handler: the interrupt handler for the GPIO chip's parent interrupts
+ * @lock_key: per GPIO IRQ chip lockdep class
+ * @default_type: default IRQ triggering type applied during GPIO driver
+ *                initialization, provided by GPIO driver
+ * @parent_handler: the interrupt handler for the GPIO chip's parent
+ *                  interrupts, may be NULL if the parent interrupts are
+ *                  nested rather than cascaded
+ * @num_parents: the number of interrupt parents of a GPIO chip
+ * @parents: a list of interrupt parents of a GPIO chip
+ * @map: a list of interrupt parents for each line of a GPIO chip
+ */
+struct gpio_irq_chip {
+	struct irq_chip *chip;
+	unsigned int first;
+	const struct irq_domain_ops *domain_ops;
+	irq_flow_handler_t handler;
+	struct lock_class_key *lock_key;
+	unsigned int default_type;
+	irq_flow_handler_t parent_handler;
+	void *parent_handler_data;
+	unsigned int num_parents;
+	unsigned int *parents;
+	unsigned int *map;
+};
+#endif
+
 /**
  * struct gpio_chip - abstract a GPIO controller
  * @label: a functional name for the GPIO device, such as a part
@@ -173,6 +206,8 @@ struct gpio_chip {
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
+
+	struct gpio_irq_chip	irq;
 #endif
 
 #if defined(CONFIG_OF_GPIO)
@@ -242,6 +277,10 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
+int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
+		     irq_hw_number_t hwirq);
+void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
+
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		unsigned int parent_irq,
-- 
2.12.0

