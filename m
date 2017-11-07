From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v7 13/15] gpio: Disambiguate struct gpio_irq_chip.nested
Date: Tue,  7 Nov 2017 19:15:57 +0100
Message-ID: <20171107181559.6318-14-thierry.reding@gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The nested field in struct gpio_irq_chip currently has two meanings. On
one hand it marks an IRQ chip as being nested (as opposed to chained),
while on the other hand it also means that an IRQ chip uses nested
thread handlers.

However, nested IRQ chips can already be identified by the fact that
they don't pass a parent handler (the driver would instead already have
installed a nested handler using request_irq()).

Therefore, the only use for the nested attribute is to inform gpiolib
that an IRQ chip uses nested thread handlers (as opposed to regular,
non-threaded handlers). To clarify its purpose, rename the field to
"threaded".

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 24 ++++++++++--------------
 include/linux/gpio/driver.h |  8 ++++----
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f4b30883eefc..17f4b843f058 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1603,6 +1603,11 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 				  unsigned int parent_irq,
 				  irq_flow_handler_t parent_handler)
 {
+	if (gpiochip->irq.threaded) {
+		chip_err(gpiochip, "tried to chain a threaded gpiochip\n");
+		return;
+	}
+
 	gpiochip_set_cascaded_irqchip(gpiochip, irqchip, parent_irq,
 				      parent_handler);
 }
@@ -1619,10 +1624,6 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 				 struct irq_chip *irqchip,
 				 unsigned int parent_irq)
 {
-	if (!gpiochip->irq.nested) {
-		chip_err(gpiochip, "tried to nest a chained gpiochip\n");
-		return;
-	}
 	gpiochip_set_cascaded_irqchip(gpiochip, irqchip, parent_irq,
 				      NULL);
 }
@@ -1655,7 +1656,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	irq_set_lockdep_class(irq, chip->irq.lock_key);
 	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
-	if (chip->irq.nested)
+	if (chip->irq.threaded)
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
@@ -1682,7 +1683,7 @@ void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
-	if (chip->irq.nested)
+	if (chip->irq.threaded)
 		irq_set_nested_thread(irq, 0);
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
@@ -1804,10 +1805,6 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 							 gpiochip->irq.parent_handler,
 							 data);
 		}
-
-		gpiochip->irq.nested = false;
-	} else {
-		gpiochip->irq.nested = true;
 	}
 
 	acpi_gpiochip_request_interrupts(gpiochip);
@@ -1869,8 +1866,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
  * @handler: the irq handler to use (often a predefined irq core function)
  * @type: the default type for IRQs on this irqchip, pass IRQ_TYPE_NONE
  * to have the core avoid setting up any default type in the hardware.
- * @nested: whether this is a nested irqchip calling handle_nested_irq()
- * in its IRQ handler
+ * @threaded: whether this irqchip uses a nested thread handler
  * @lock_key: lockdep class
  *
  * This function closely associates a certain irqchip with a certain
@@ -1892,7 +1888,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     unsigned int first_irq,
 			     irq_flow_handler_t handler,
 			     unsigned int type,
-			     bool nested,
+			     bool threaded,
 			     struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
@@ -1904,7 +1900,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		pr_err("missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
-	gpiochip->irq.nested = nested;
+	gpiochip->irq.threaded = threaded;
 	of_node = gpiochip->parent->of_node;
 #ifdef CONFIG_OF_GPIO
 	/*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index ebc1a02c989a..3fd7438f3596 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -109,11 +109,11 @@ struct gpio_irq_chip {
 	unsigned int *map;
 
 	/**
-	 * @nested:
+	 * @threaded:
 	 *
-	 * True if set the interrupt handling is nested.
+	 * True if set the interrupt handling uses nested threads.
 	 */
-	bool nested;
+	bool threaded;
 
 	/**
 	 * @need_valid_mask:
@@ -386,7 +386,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     unsigned int first_irq,
 			     irq_flow_handler_t handler,
 			     unsigned int type,
-			     bool nested,
+			     bool threaded,
 			     struct lock_class_key *lock_key);
 
 #ifdef CONFIG_LOCKDEP
-- 
2.14.1
