From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 01/16] gpio: Implement tighter IRQ chip integration
Date: Thu, 28 Sep 2017 11:56:13 +0200
Message-ID: <20170928095628.21966-2-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Currently GPIO drivers are required to a GPIO chip and the corresponding
IRQ chip separately, which can result in a lot of boilerplate. Introduce
a new struct gpio_irq_chip, embedded in a struct gpio_chip, that drivers
can fill in if they want the GPIO core to automatically register the IRQ
chip associated with a GPIO chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 146 +++++++++++++++++++++++++++++++++++++++++++-
 include/linux/gpio/driver.h |  64 +++++++++++++++++++
 2 files changed, 207 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eb80dac4e26a..b34d9cbd5809 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -72,6 +72,7 @@ static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_devices);
 
 static void gpiochip_free_hogs(struct gpio_chip *chip);
+static int gpiochip_add_irqchip(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
@@ -1260,6 +1261,10 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (status)
 		goto err_remove_from_list;
 
+	status = gpiochip_add_irqchip(chip);
+	if (status)
+		goto err_remove_chip;
+
 	status = of_gpiochip_add(chip);
 	if (status)
 		goto err_remove_chip;
@@ -1626,8 +1631,8 @@ EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
  * gpiochip by assigning the gpiochip as chip data, and using the irqchip
  * stored inside the gpiochip.
  */
-static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
-			    irq_hw_number_t hwirq)
+int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
+		     irq_hw_number_t hwirq)
 {
 	struct gpio_chip *chip = d->host_data;
 
@@ -1655,8 +1660,9 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_map);
 
-static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
+void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
@@ -1665,6 +1671,7 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
 }
+EXPORT_SYMBOL_GPL(gpiochip_irq_unmap);
 
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
@@ -1705,6 +1712,124 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 	return irq_create_mapping(chip->irqdomain, offset);
 }
 
+/**
+ * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
+ * @gpiochip: the GPIO chip to add the IRQ chip to
+ */
+static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
+{
+	struct irq_chip *irqchip = gpiochip->irqchip;
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
+	type = gpiochip->irq_default_type;
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
+	gpiochip->to_irq = gpiochip_to_irq;
+	gpiochip->irq_default_type = type;
+
+	if (gpiochip->irq.domain_ops)
+		ops = gpiochip->irq.domain_ops;
+	else
+		ops = &gpiochip_domain_ops;
+
+	gpiochip->irqdomain = irq_domain_add_simple(np, gpiochip->ngpio,
+						    gpiochip->irq_base,
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
 /**
  * gpiochip_irqchip_remove() - removes an irqchip added to a gpiochip
  * @gpiochip: the gpiochip to remove the irqchip from
@@ -1722,6 +1847,16 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
 	}
 
+	if (gpiochip->irqchip) {
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
@@ -1842,6 +1977,11 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
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
index c97f8325e8bf..6100b171817e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -19,6 +19,58 @@ struct module;
 
 #ifdef CONFIG_GPIOLIB
 
+#ifdef CONFIG_GPIOLIB_IRQCHIP
+/**
+ * struct gpio_irq_chip - GPIO interrupt controller
+ */
+struct gpio_irq_chip {
+	/**
+	 * @domain_ops:
+	 *
+	 * Table of interrupt domain operations for this IRQ chip.
+	 */
+	const struct irq_domain_ops *domain_ops;
+
+	/**
+	 * @parent_handler:
+	 *
+	 * The interrupt handler for the GPIO chip's parent interrupts, may be
+	 * NULL if the parent interrupts are nested rather than cascaded.
+	 */
+	irq_flow_handler_t parent_handler;
+
+	/**
+	 * @parent_handler_data:
+	 *
+	 * Data associated, and passed to, the handler for the parent
+	 * interrupt.
+	 */
+	void *parent_handler_data;
+
+	/**
+	 * @num_parents:
+	 *
+	 * The number of interrupt parents of a GPIO chip.
+	 */
+	unsigned int num_parents;
+
+	/**
+	 * @parents:
+	 *
+	 * A list of interrupt parents of a GPIO chip. This is owned by the
+	 * driver, so the core will only reference this list, not modify it.
+	 */
+	unsigned int *parents;
+
+	/**
+	 * @map:
+	 *
+	 * A list of interrupt parents for each line of a GPIO chip.
+	 */
+	unsigned int *map;
+};
+#endif
+
 /**
  * struct gpio_chip - abstract a GPIO controller
  * @label: a functional name for the GPIO device, such as a part
@@ -173,6 +225,14 @@ struct gpio_chip {
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
+
+	/**
+	 * @irq:
+	 *
+	 * Integrates interrupt chip functionality with the GPIO chip. Can be
+	 * used to handle IRQs for most practical cases.
+	 */
+	struct gpio_irq_chip irq;
 #endif
 
 #if defined(CONFIG_OF_GPIO)
@@ -264,6 +324,10 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
+int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
+		     irq_hw_number_t hwirq);
+void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
+
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		unsigned int parent_irq,
-- 
2.14.1
