From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v7 10/15] gpio: Implement tighter IRQ chip integration
Date: Tue,  7 Nov 2017 19:15:54 +0100
Message-ID: <20171107181559.6318-11-thierry.reding@gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Currently GPIO drivers are required to add the GPIO chip and its
corresponding IRQ chip separately, which can result in a lot of
boilerplate. Use the newly introduced struct gpio_irq_chip, embedded in
struct gpio_chip, that drivers can fill in if they want the GPIO core
to automatically register the IRQ chip associated with a GPIO chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v7:
- set IRQ parent in gpiochip_irq_map() instead of gpiochip_to_irq()
- remove chained handler only for chained IRQ chips
- remove duplicate OF node setting code

 drivers/gpio/gpiolib.c      | 108 +++++++++++++++++++++++++++++++++++++++++++-
 include/linux/gpio/driver.h |   7 +++
 2 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9d98ff2f4e0e..d809d9e7df0f 100644
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
@@ -1637,6 +1642,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 			    irq_hw_number_t hwirq)
 {
 	struct gpio_chip *chip = d->host_data;
+	int err = 0;
 
 	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
 		return -ENXIO;
@@ -1653,6 +1659,14 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
+	if (chip->irq.num_parents == 1)
+		err = irq_set_parent(irq, chip->irq.parents[0]);
+	else if (chip->irq.map)
+		err = irq_set_parent(irq, chip->irq.map[hwirq]);
+
+	if (err < 0)
+		return err;
+
 	/*
 	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
 	 * is passed as default type.
@@ -1709,9 +1723,96 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
+
 	return irq_create_mapping(chip->irq.domain, offset);
 }
 
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
+	np = gpiochip->gpiodev->dev.of_node;
+	type = gpiochip->irq.default_type;
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
+}
+
 /**
  * gpiochip_irqchip_remove() - removes an irqchip added to a gpiochip
  * @gpiochip: the gpiochip to remove the irqchip from
@@ -1724,7 +1825,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
-	if (gpiochip->irq.num_parents > 0) {
+	if (gpiochip->irq.chip && gpiochip->irq.parent_handler) {
 		struct gpio_irq_chip *irq = &gpiochip->irq;
 		unsigned int i;
 
@@ -1857,6 +1958,11 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
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
index c390c8165583..fbfcff676b05 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -101,6 +101,13 @@ struct gpio_irq_chip {
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
