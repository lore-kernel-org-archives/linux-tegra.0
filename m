From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 10/12] gpio: Implement tighter IRQ chip integration
Date: Thu,  2 Nov 2017 18:49:39 +0100
Message-ID: <20171102174941.3461-11-thierry.reding@gmail.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171102174941.3461-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Currently GPIO drivers are required to add the GPIO chip and its
corresponding IRQ chip separately, which can result in a lot of
boilerplate. Use the newly introduced struct gpio_irq_chip, embedded in
struct gpio_chip, that drivers can fill in if they want the GPIO core
to automatically register the IRQ chip associated with a GPIO chip.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpiolib.c      | 124 +++++++++++++++++++++++++++++++++++++++++++-
 include/linux/gpio/driver.h |   7 +++
 2 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 685a05caf1ba..5bc99d08d538 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -72,6 +72,7 @@ static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_devices);
 
 static void gpiochip_free_hogs(struct gpio_chip *chip);
+static int gpiochip_add_irqchip(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
@@ -1266,6 +1267,10 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (status)
 		goto err_remove_from_list;
 
+	status = gpiochip_add_irqchip(chip);
+	if (status)
+		goto err_remove_chip;
+
 	status = of_gpiochip_add(chip);
 	if (status)
 		goto err_remove_chip;
@@ -1707,9 +1712,119 @@ static void gpiochip_irq_relres(struct irq_data *d)
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
+	unsigned int irq;
+	int err;
+
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
-	return irq_create_mapping(chip->irq.domain, offset);
+
+	irq = irq_create_mapping(chip->irq.domain, offset);
+	if (!irq)
+		return 0;
+
+	if (chip->irq.map) {
+		err = irq_set_parent(irq, chip->irq.map[offset]);
+		if (err < 0)
+			return err;
+	}
+
+	return irq;
+}
+
+/**
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
+	gpiochip->to_irq = gpiochip_to_irq;
+	gpiochip->irq.default_type = type;
+
+	if (gpiochip->irq.domain_ops)
+		ops = gpiochip->irq.domain_ops;
+	else
+		ops = &gpiochip_domain_ops;
+
+	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
+						     0, ops, gpiochip);
+	if (!gpiochip->irq.domain)
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
+		gpiochip->irq.nested = false;
+	} else {
+		gpiochip->irq.nested = true;
+	}
+
+	acpi_gpiochip_request_interrupts(gpiochip);
+
+	return 0;
 }
 
 /**
@@ -1724,7 +1839,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
-	if (gpiochip->irq.num_parents > 0) {
+	if (gpiochip->irq.chip) {
 		struct gpio_irq_chip *irq = &gpiochip->irq;
 		unsigned int i;
 
@@ -1857,6 +1972,11 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
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
index c363ee198ff9..51fc7b023364 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -100,6 +100,13 @@ struct gpio_irq_chip {
 	 */
 	unsigned int *parents;
 
+	/**
+	 * @map:
+	 *
+	 * A list of interrupt parents for each line of a GPIO chip.
+	 */
+	unsigned int *map;
+
 	/**
 	 * @nested:
 	 *
-- 
2.14.1
