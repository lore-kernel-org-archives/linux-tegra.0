From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Fri, 3 Nov 2017 17:30:30 -0500
Message-ID: <ca8c7138-2e87-0481-ac8c-7077bed749f6@ti.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171102174941.3461-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi 

On 11/02/2017 12:49 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi Linus,
> 
> here's the latest series of patches that implement the tighter IRQ chip
> integration. I've dropped the banked infrastructure for now as per the
> discussion with Grygorii.
> 
> The first couple of patches are mostly preparatory work in order to
> consolidate all IRQ chip related fields in a new structure and create
> the base functionality for adding IRQ chips.
> 
> After that, I've added the Tegra186 GPIO support patch that makes use of
> the new tight integration.
> 
> Changes in v6:
> - rebased on latest linux-gpio devel branch
> - one patch dropped due to rebase
> 
> Changes in v5:
> - dropped the banked infrastructure patches for now (Grygorii)
> - allocate interrupts on demand, rather than upfront (Grygorii)
> - split up the first patch further as requested by Grygorii
> 
> Not sure what happened in between here. Notes in commit logs indicate
> that this is actually version 5, but I can't find the cover letter for
> v3 and v4.
> 
> Changes in v2:
> - rename pins to lines for consistent terminology
> - rename gpio_irq_chip_banked_handler() to
>    gpio_irq_chip_banked_chained_handler()
> 

Sry, for delayed reply, very sorry.

Patches 1 - 9, 11 : looks good, so
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch 10 - unfortunately not all my comment were incorporated [1], 
so below diff on top of patch 10
which illustrates what i want and also converts gpio-omap to use new infra as
test for this new infra.

Pls, take a look

[1] https://www.spinics.net/lists/linux-tegra/msg31145.html

-- regards,
-grygorii

-----------><-------------
From 210fe3ad7a642691a1b7603e441f6980b10ff2b4 Mon Sep 17 00:00:00 2001
From: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Fri, 3 Nov 2017 17:24:51 -0500
Subject: [PATCH] [not for merge] gpiolib: update and test new gpioirq chip
 infra

changes in gpiolib:
 - move set_parent to gpiochip_irq_map() and use parents instead of map for only
   one parent
 - add gpio_irq_chip->first_irq for static IRQ allocation
 - fix nested = true if parent_handler not set
 - fix gpiochip_irqchip_remove() if parent_handler not set
 - get of_node from gpiodev
 - fix lock_key: drivers do not need to set it, but looks a bit overcomplicated
   as lock_class_key will be created for each gpiochip_add_data() call.
   Honestly, do not seem better way :(

GPIO OMAP driver updated to use new gpioirq chip infra and tested on am335x-evm.
seems it's working - can see irqs from keys.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c    | 36 ++++++++++++++--------------
 drivers/gpio/gpiolib.c      | 58 +++++++++++++++++++--------------------------
 include/linux/gpio/driver.h | 32 ++++++++++++++++++++++++-
 3 files changed, 73 insertions(+), 53 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index ce27d6a..4048f18 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1054,6 +1054,7 @@ static void omap_gpio_mod_init(struct gpio_bank *bank)
 
 static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 {
+	struct gpio_irq_chip *irq;
 	static int gpio;
 	int irq_base = 0;
 	int ret;
@@ -1081,16 +1082,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 	}
 	bank->chip.ngpio = bank->width;
 
-	ret = gpiochip_add_data(&bank->chip, bank);
-	if (ret) {
-		dev_err(bank->chip.parent,
-			"Could not register gpio chip %d\n", ret);
-		return ret;
-	}
-
-	if (!bank->is_mpuio)
-		gpio += bank->width;
-
 #ifdef CONFIG_ARCH_OMAP1
 	/*
 	 * REVISIT: Once we have OMAP1 supporting SPARSE_IRQ, we can drop
@@ -1111,25 +1102,34 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 			irqc->irq_set_wake = NULL;
 	}
 
-	ret = gpiochip_irqchip_add(&bank->chip, irqc,
-				   irq_base, handle_bad_irq,
-				   IRQ_TYPE_NONE);
+	irq = &bank->chip.irq;
+	irq->chip = irqc;
+//	irq->domain_ops = not required;
+	irq->handler = handle_bad_irq;
+//	irq->lock_key = not required;
+	irq->default_type = IRQ_TYPE_NONE;
+//	irq->parent_handler = not used by this driver;
+//	irq->parent_handler_data = not used by this driver;
+	irq->num_parents = 1;
+	irq->parents = &bank->irq;
+	irq->first_irq = irq_base;
 
+	ret = gpiochip_add_data(&bank->chip, bank);
 	if (ret) {
 		dev_err(bank->chip.parent,
-			"Couldn't add irqchip to gpiochip %d\n", ret);
-		gpiochip_remove(&bank->chip);
-		return -ENODEV;
+			"Could not register gpio chip %d\n", ret);
+		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(&bank->chip, irqc, bank->irq, NULL);
-
 	ret = devm_request_irq(bank->chip.parent, bank->irq,
 			       omap_gpio_irq_handler,
 			       0, dev_name(bank->chip.parent), bank);
 	if (ret)
 		gpiochip_remove(&bank->chip);
 
+	if (!bank->is_mpuio)
+		gpio += bank->width;
+
 	return ret;
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5bc99d0..d11b4df 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -72,7 +72,8 @@ static LIST_HEAD(gpio_lookup_list);
 LIST_HEAD(gpio_devices);
 
 static void gpiochip_free_hogs(struct gpio_chip *chip);
-static int gpiochip_add_irqchip(struct gpio_chip *gpiochip);
+static int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
+				    struct lock_class_key *lock_key);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
@@ -1121,7 +1122,8 @@ static void gpiochip_setup_devs(void)
  * chip->base is invalid or already associated with a different chip.
  * Otherwise it returns zero as a success code.
  */
-int gpiochip_add_data(struct gpio_chip *chip, void *data)
+int gpiochip_add_data_key(struct gpio_chip *chip, void *data,
+			  struct lock_class_key *irq_lock_key)
 {
 	unsigned long	flags;
 	int		status = 0;
@@ -1267,7 +1269,7 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (status)
 		goto err_remove_from_list;
 
-	status = gpiochip_add_irqchip(chip);
+	status = gpiochip_add_irqchip_key(chip, irq_lock_key);
 	if (status)
 		goto err_remove_chip;
 
@@ -1642,6 +1644,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 			    irq_hw_number_t hwirq)
 {
 	struct gpio_chip *chip = d->host_data;
+	int err = 0;
 
 	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
 		return -ENXIO;
@@ -1658,6 +1661,12 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
+	if (chip->irq.num_parents == 1)
+		err = irq_set_parent(irq, chip->irq.parents[0]);
+	else if (chip->irq.map)
+		err = irq_set_parent(irq, chip->irq.map[hwirq]);
+	if (err < 0)
+		return err;
 	/*
 	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
 	 * is passed as default type.
@@ -1712,30 +1721,18 @@ static void gpiochip_irq_relres(struct irq_data *d)
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	unsigned int irq;
-	int err;
-
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
 
-	irq = irq_create_mapping(chip->irq.domain, offset);
-	if (!irq)
-		return 0;
-
-	if (chip->irq.map) {
-		err = irq_set_parent(irq, chip->irq.map[offset]);
-		if (err < 0)
-			return err;
-	}
-
-	return irq;
+	return irq_create_mapping(chip->irq.domain, offset);
 }
 
 /**
  * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
  * @gpiochip: the GPIO chip to add the IRQ chip to
  */
-static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
+static int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
+				    struct lock_class_key *lock_key)
 {
 	struct irq_chip *irqchip = gpiochip->irq.chip;
 	const struct irq_domain_ops *ops;
@@ -1753,17 +1750,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 	}
 
 	type = gpiochip->irq.default_type;
-	np = gpiochip->parent->of_node;
-
-#ifdef CONFIG_OF_GPIO
-	/*
-	 * If the gpiochip has an assigned OF node this takes precedence
-	 * FIXME: get rid of this and use gpiochip->parent->of_node
-	 * everywhere
-	 */
-	if (gpiochip->of_node)
-		np = gpiochip->of_node;
-#endif
+	/* called from gpiochip_add_data() and is set properly */
+	np = gpiochip->gpiodev->dev.of_node;
 
 	/*
 	 * Specifying a default trigger is a terrible idea if DT or ACPI is
@@ -1789,7 +1777,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 		ops = &gpiochip_domain_ops;
 
 	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
-						     0, ops, gpiochip);
+						     gpiochip->irq.first_irq,
+						     ops, gpiochip);
 	if (!gpiochip->irq.domain)
 		return -EINVAL;
 
@@ -1818,9 +1807,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 		}
 
 		gpiochip->irq.nested = false;
-	} else {
-		gpiochip->irq.nested = true;
 	}
+	/* GPIO driver might not specify parent_handler, but it doesn't mean
+	 * it's irq_nested, as driver may use request_irq() */
 
 	acpi_gpiochip_request_interrupts(gpiochip);
 
@@ -1839,7 +1828,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
-	if (gpiochip->irq.chip) {
+	if (gpiochip->irq.chip && gpiochip->irq.parent_handler) {
 		struct gpio_irq_chip *irq = &gpiochip->irq;
 		unsigned int i;
 
@@ -1972,7 +1961,8 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 
 #else /* CONFIG_GPIOLIB_IRQCHIP */
 
-static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
+static inline int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
+					   struct lock_class_key *lock_key)
 {
 	return 0;
 }
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 51fc7b0..3254996 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -128,6 +128,15 @@ struct gpio_irq_chip {
 	 * in IRQ domain of the chip.
 	 */
 	unsigned long *valid_mask;
+
+	/**
+	 * @first_irq:
+	 *
+	 * Required for static irq allocation.
+	 * if set irq_domain_add_simple() will allocate and map all IRQs
+	 * during initialization.
+	 */
+	unsigned int first_irq;
 };
 
 static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
@@ -312,8 +321,29 @@ struct gpio_chip {
 extern const char *gpiochip_is_requested(struct gpio_chip *chip,
 			unsigned offset);
 
+extern int gpiochip_add_data_key(struct gpio_chip *chip, void *data,
+				 struct lock_class_key *irq_lock_key);
+#ifdef CONFIG_LOCKDEP
+/*
+ * Lockdep requires that each irqchip instance be created with a
+ * unique key so as to avoid unnecessary warnings. This upfront
+ * boilerplate static inlines provides such a key for each
+ * unique instance which is created now from inside gpiochip_add_data_key().
+ */
+static inline int gpiochip_add_data(struct gpio_chip *chip, void *data)
+{
+	static struct lock_class_key key;
+
+	return gpiochip_add_data_key(chip, data, key);
+}
+
+#else
+static inline int gpiochip_add_data(struct gpio_chip *chip, void *data)
+{
+	return gpiochip_add_data_key(chip, data, NULL);
+}
+#endif /* CONFIG_LOCKDEP */
 /* add/remove chips */
-extern int gpiochip_add_data(struct gpio_chip *chip, void *data);
 static inline int gpiochip_add(struct gpio_chip *chip)
 {
 	return gpiochip_add_data(chip, NULL);
-- 
2.10.5



