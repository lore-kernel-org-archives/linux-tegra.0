From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 02/12] gpio: Move irqchip into struct gpio_irq_chip
Date: Thu,  2 Nov 2017 18:49:31 +0100
Message-ID: <20171102174941.3461-3-thierry.reding@gmail.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102174941.3461-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 14 +++++++-------
 include/linux/gpio/driver.h | 14 ++++++++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3827f0767101..d3d0b3134ba3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1646,7 +1646,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * category than their parents, so it won't report false recursion.
 	 */
 	irq_set_lockdep_class(irq, chip->lock_key);
-	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
+	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq_handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq_nested)
 		irq_set_nested_thread(irq, 1);
@@ -1739,10 +1739,10 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
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
@@ -1817,7 +1817,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->irqchip = irqchip;
+	gpiochip->irq.chip = irqchip;
 	gpiochip->irq_handler = handler;
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
@@ -1826,7 +1826,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
 	if (!gpiochip->irqdomain) {
-		gpiochip->irqchip = NULL;
+		gpiochip->irq.chip = NULL;
 		return -EINVAL;
 	}
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 36a065521fa0..a79b3b18fadd 100644
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
@@ -47,6 +54,11 @@ struct gpio_irq_chip {
 	 */
 	void *parent_handler_data;
 };
+
+static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
+{
+	return container_of(chip, struct gpio_irq_chip, chip);
+}
 #endif
 
 /**
@@ -112,7 +124,6 @@ struct gpio_irq_chip {
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irqchip: GPIO IRQ chip impl, provided by GPIO driver
  * @irqdomain: Interrupt translation domain; responsible for mapping
  *	between GPIO hwirq number and linux irq number
  * @irq_handler: the irq handler to use (often a predefined irq core function)
@@ -197,7 +208,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	struct irq_chip		*irqchip;
 	struct irq_domain	*irqdomain;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
-- 
2.14.1
