From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 14/16] gpio: Add support for banked GPIO controllers
Date: Thu, 28 Sep 2017 11:56:26 +0200
Message-ID: <20170928095628.21966-15-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some GPIO controllers are subdivided into multiple logical blocks called
banks (or ports). This is often caused by the design assigning separate
resources, such as register regions or interrupts, to each bank, or some
set of banks.

This commit adds support for describing controllers that have such a
banked design and provides common code for dealing with them.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpiolib-of.c   | 101 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c      |  98 ++++++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h | 108 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_gpio.h     |  10 ++++
 4 files changed, 317 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index bfcd20699ec8..9baabe00966d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -309,6 +309,107 @@ int of_gpio_simple_xlate(struct gpio_chip *gc,
 }
 EXPORT_SYMBOL(of_gpio_simple_xlate);
 
+/**
+ * gpio_banked_irq_domain_xlate - decode an IRQ specifier for banked chips
+ * @domain: IRQ domain
+ * @np: device tree node
+ * @spec: IRQ specifier
+ * @size: number of cells in IRQ specifier
+ * @hwirq: return location for the hardware IRQ number
+ * @type: return location for the IRQ type
+ *
+ * Translates the IRQ specifier found in device tree into a hardware IRQ
+ * number and an interrupt type.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int gpio_banked_irq_domain_xlate(struct irq_domain *domain,
+				 struct device_node *np,
+				 const u32 *spec, unsigned int size,
+				 unsigned long *hwirq,
+				 unsigned int *type)
+{
+	struct gpio_chip *gc = domain->host_data;
+	unsigned int bank, line, i, offset = 0;
+
+	if (size < 2)
+		return -EINVAL;
+
+	bank = (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
+	line = (spec[0] >> gc->of_gpio_line_mask) & gc->of_gpio_line_shift;
+
+	if (bank >= gc->num_banks) {
+		dev_err(gc->parent, "invalid bank number: %u\n", bank);
+		return -EINVAL;
+	}
+
+	if (line >= gc->banks[bank]->num_lines) {
+		dev_err(gc->parent, "invalid line number: %u\n", line);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < bank; i++)
+		offset += gc->banks[i]->num_lines;
+
+	*type = spec[1] & IRQ_TYPE_SENSE_MASK;
+	*hwirq = offset + line;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gpio_banked_irq_domain_xlate);
+
+/**
+ * of_gpio_banked_xlate - translate GPIO specifier to a GPIO number and flags
+ * @gc: GPIO chip
+ * @gpiospec: GPIO specifier
+ * @flags: return location for flags parsed from the GPIO specifier
+ *
+ * This translation function takes into account multiple banks that can make
+ * up a single controller. Each bank can contain one or more pins. A single
+ * cell in the specifier is used to represent a (bank, pin) pair, with each
+ * encoded in different fields. The &gpio_chip.of_gpio_bank_shift and
+ * &gpio_chip.of_gpio_bank_mask fields, and &gpio_chip.of_gpio_line_shift and
+ * &gpio_chip.of_gpio_line_mask are used to specify the encoding.
+ *
+ * Returns:
+ * The chip-relative index of the pin given by the GPIO specifier.
+ */
+int of_gpio_banked_xlate(struct gpio_chip *gc,
+			 const struct of_phandle_args *gpiospec, u32 *flags)
+{
+	unsigned int offset = 0, bank, line, i;
+	const u32 *spec = gpiospec->args;
+
+	if (WARN_ON(gc->of_gpio_n_cells < 2))
+		return -EINVAL;
+
+	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
+		return -EINVAL;
+
+	bank = (spec[0] >> gc->of_gpio_bank_shift) & gc->of_gpio_bank_mask;
+	line = (spec[0] >> gc->of_gpio_line_shift) & gc->of_gpio_line_mask;
+
+	if (bank >= gc->num_banks) {
+		dev_err(gc->parent, "invalid bank number: %u\n", bank);
+		return -EINVAL;
+	}
+
+	if (line >= gc->banks[bank]->num_lines) {
+		dev_err(gc->parent, "invalid line number: %u\n", line);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < bank; i++)
+		offset += gc->banks[i]->num_lines;
+
+	if (flags)
+		*flags = spec[1];
+
+	return offset + line;
+}
+EXPORT_SYMBOL(of_gpio_banked_xlate);
+
 /**
  * of_mm_gpiochip_add_data - Add memory mapped GPIO chip (bank)
  * @np:		device node of the GPIO chip
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c15fb858848a..b3bd19b793d3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1765,6 +1765,57 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->irq.default_type = type;
 
+	if (gpiochip->num_banks > 0 && !gpiochip->irq.map) {
+		struct gpio_irq_chip *irq = &gpiochip->irq;
+		unsigned int i, j, offset = 0;
+
+		if (!irq->parents) {
+			chip_err(gpiochip, "no parent interrupts defined\n");
+			return -EINVAL;
+		}
+
+		irq->map = devm_kcalloc(gpiochip->parent, gpiochip->ngpio,
+					sizeof(*irq->map), GFP_KERNEL);
+		if (!irq->map)
+			return -ENOMEM;
+
+		for (i = 0; i < gpiochip->num_banks; i++) {
+			struct gpio_bank *bank = gpiochip->banks[i];
+			unsigned int parent = bank->parent_irq;
+
+			for (j = 0; j < bank->num_lines; j++) {
+				if (parent >= irq->num_parents) {
+					chip_err(gpiochip,
+						 "invalid parent interrupt: %u\n",
+						 parent);
+					return -EINVAL;
+				}
+
+				irq->map[offset + j] = irq->parents[parent];
+			}
+
+			offset += bank->num_lines;
+		}
+	}
+
+	if (gpiochip->num_banks > 0) {
+		unsigned int i;
+
+		for (i = 0; i < gpiochip->num_banks; i++) {
+			struct gpio_bank *bank = gpiochip->banks[i];
+			unsigned int num_lines = bank->num_lines;
+
+			bank->pending = devm_kcalloc(gpiochip->parent,
+						     BITS_TO_LONGS(num_lines),
+						     sizeof(unsigned long),
+						     GFP_KERNEL);
+			if (!bank->pending)
+				return -ENOMEM;
+
+			bank->chip = gpiochip;
+		}
+	}
+
 	if (gpiochip->irq.domain_ops)
 		ops = gpiochip->irq.domain_ops;
 	else
@@ -1973,6 +2024,53 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 }
 EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
+/**
+ * gpio_irq_chip_banked_chained_handler - interrupt handler for banked IRQ chips
+ * @desc: IRQ descriptor
+ *
+ * Drivers can use this interrupt handler for banked GPIO controllers. This
+ * implementation iterates over all banks and handles pending interrupts of
+ * the pins associated with the bank.
+ *
+ * This function uses driver specific parts, split out into the
+ * &gpio_chip.update_bank() callback, to retrieves the interrupt pending
+ * state for each of the GPIOs exposed by the given bank.
+ */
+void gpio_irq_chip_banked_chained_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gpio = irq_desc_get_handler_data(desc);
+	struct irq_chip *irq = irq_desc_get_chip(desc);
+	unsigned int parent = irq_desc_get_irq(desc);
+	struct gpio_irq_chip *chip = &gpio->irq;
+	unsigned int i, offset = 0;
+
+	chained_irq_enter(irq, desc);
+
+	for (i = 0; i < gpio->num_banks; i++) {
+		struct gpio_bank *bank = gpio->banks[i];
+		unsigned int line, virq;
+
+		if (parent != chip->parents[bank->parent_irq])
+			goto skip;
+
+		chip->update_bank(bank);
+
+		for_each_set_bit(line, bank->pending, bank->num_lines) {
+			virq = irq_find_mapping(chip->domain, offset + line);
+			if (WARN_ON(virq == 0))
+				continue;
+
+			generic_handle_irq(virq);
+		}
+
+skip:
+		offset += bank->num_lines;
+	}
+
+	chained_irq_exit(irq, desc);
+}
+EXPORT_SYMBOL_GPL(gpio_irq_chip_banked_chained_handler);
+
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
 static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c453e0716228..3caa08b3d2b6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -19,6 +19,47 @@ struct module;
 
 #ifdef CONFIG_GPIOLIB
 
+/**
+ * struct gpio_bank - GPIO bank
+ *
+ * A GPIO bank, sometimes also referred to as port, represents a subset of the
+ * lines of a GPIO controller. The separation into banks is often caused by the
+ * sharing of one or more resource (register region, interrupt, ...) for each
+ * of the lines in the bank.
+ *
+ * In many cases the banking is transparent, but when it is not, GPIO drivers
+ * can use this code, along with some supporting fields in &struct gpio_chip.
+ */
+struct gpio_bank {
+	/**
+	 * @chip:
+	 *
+	 * A pointer to the &struct gpio_chip that this bank belongs to.
+	 */
+	struct gpio_chip *chip;
+
+	/**
+	 * @parent_irq:
+	 *
+	 * The interrupt parent for this bank.
+	 */
+	unsigned int parent_irq;
+
+	/**
+	 * @num_lines:
+	 *
+	 * The number of lines provided by this bank.
+	 */
+	unsigned int num_lines;
+
+	/**
+	 * @pending:
+	 *
+	 * Current interrupt state of each pin in the bank.
+	 */
+	unsigned long *pending;
+};
+
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
@@ -136,6 +177,15 @@ struct gpio_irq_chip {
 	 * in IRQ domain of the chip.
 	 */
 	unsigned long *valid_mask;
+
+	/**
+	 * @update_bank:
+	 *
+	 * Callback used by banked interrupt controllers. The driver updates
+	 * the &gpio_bank.pending field of the given @bank with the current
+	 * status for each of the GPIOs that it provides.
+	 */
+	void (*update_bank)(struct gpio_bank *bank);
 };
 
 static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
@@ -281,6 +331,24 @@ struct gpio_chip {
 	struct gpio_irq_chip irq;
 #endif
 
+	/**
+	 * @banks:
+	 *
+	 * If a GPIO controller is subdivided into multiple banks, the driver
+	 * can use this field to store information about these banks.
+	 *
+	 * Note that the driver owns this field and the core will not modify
+	 * it, only reference it.
+	 */
+	struct gpio_bank **banks;
+
+	/**
+	 * @num_banks:
+	 *
+	 * The number of banks described in @banks.
+	 */
+	unsigned int num_banks;
+
 #if defined(CONFIG_OF_GPIO)
 	/*
 	 * If CONFIG_OF is enabled, then all GPIO controllers described in the
@@ -301,6 +369,38 @@ struct gpio_chip {
 	 */
 	unsigned int of_gpio_n_cells;
 
+	/**
+	 * @of_gpio_bank_shift:
+	 *
+	 * The offset of the field in the cell denoting the bank number of a
+	 * specified GPIO.
+	 */
+	unsigned int of_gpio_bank_shift;
+
+	/**
+	 * @of_gpio_bank_mask:
+	 *
+	 * The mask of the field in the cell denoting the bank number of a
+	 * specified GPIO.
+	 */
+	unsigned int of_gpio_bank_mask;
+
+	/**
+	 * @of_gpio_line_shift:
+	 *
+	 * The offset of the field in the cell denoting the line number of a
+	 * specified GPIO within its bank.
+	 */
+	unsigned int of_gpio_line_shift;
+
+	/**
+	 * @of_gpio_line_mask:
+	 *
+	 * The mask of the field in the cell denoting the line number of a
+	 * specified GPIO within its bank.
+	 */
+	unsigned int of_gpio_line_mask;
+
 	/**
 	 * @of_xlate:
 	 *
@@ -374,6 +474,12 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq);
 void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq);
 
+int gpio_banked_irq_domain_xlate(struct irq_domain *domain,
+				 struct device_node *np,
+				 const u32 *spec, unsigned int size,
+				 unsigned long *hwirq,
+				 unsigned int *type);
+
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
 		unsigned int parent_irq,
@@ -391,6 +497,8 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     bool nested,
 			     struct lock_class_key *lock_key);
 
+void gpio_irq_chip_banked_chained_handler(struct irq_desc *desc);
+
 #ifdef CONFIG_LOCKDEP
 
 /*
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index ca10f43564de..f85414dc31f4 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -66,6 +66,9 @@ extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 extern int of_gpio_simple_xlate(struct gpio_chip *gc,
 				const struct of_phandle_args *gpiospec,
 				u32 *flags);
+extern int of_gpio_banked_xlate(struct gpio_chip *gc,
+				const struct of_phandle_args *gpiospec,
+				u32 *flags);
 
 #else /* CONFIG_OF_GPIO */
 
@@ -86,6 +89,13 @@ static inline int of_gpio_simple_xlate(struct gpio_chip *gc,
 	return -ENOSYS;
 }
 
+static inline int of_gpio_banked_xlate(struct gpio_chip *gc,
+				       const struct of_phandle_args *gpiospec,
+				       u32 *flags)
+{
+	return -ENOSYS;
+}
+
 #endif /* CONFIG_OF_GPIO */
 
 /**
-- 
2.14.1
