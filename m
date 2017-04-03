From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/12] gpio: Move irqchip into struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:25 +0200
Message-ID: <20170403160532.20282-6-thierry.reding@gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170403160532.20282-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-mockup.c  |  4 ++--
 drivers/gpio/gpiolib.c      | 20 +++++++-------------
 include/linux/gpio/driver.h |  2 --
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c6dadac70593..04008fadabef 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -174,10 +174,10 @@ static int gpio_mockup_irqchip_setup(struct device *dev,
 		return irq_base;
 
 	gc->irq_base = irq_base;
-	gc->irqchip = &gpio_mockup_irqchip;
+	gc->irq.chip = &gpio_mockup_irqchip;
 
 	for (i = 0; i < gc->ngpio; i++) {
-		irq_set_chip(irq_base + i, gc->irqchip);
+		irq_set_chip(irq_base + i, gc->irq.chip);
 		irq_set_handler(irq_base + i, &handle_simple_irq);
 		irq_modify_status(irq_base + i,
 				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 67f8b9c52159..94a428928145 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1611,12 +1611,6 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hwirq)
 {
 	struct gpio_chip *chip = d->host_data;
-	struct irq_chip *irqchip;
-
-	if (chip->irq.chip)
-		irqchip = chip->irq.chip;
-	else
-		irqchip = chip->irqchip;
 
 	irq_set_chip_data(irq, chip);
 	/*
@@ -1624,7 +1618,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * category than their parents, so it won't report false recursion.
 	 */
 	irq_set_lockdep_class(irq, chip->lock_key);
-	irq_set_chip_and_handler(irq, irqchip, chip->irq_handler);
+	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq_handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 1);
@@ -1850,10 +1844,10 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 		irq_domain_remove(gpiochip->irq.domain);
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
@@ -1931,7 +1925,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->irqchip = irqchip;
+	gpiochip->irq.chip = irqchip;
 	gpiochip->irq_handler = handler;
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
@@ -1940,7 +1934,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
 	if (!gpiochip->irq.domain) {
-		gpiochip->irqchip = NULL;
+		gpiochip->irq.chip = NULL;
 		return -EINVAL;
 	}
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 361b34bd970c..f69f7dccbcf6 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -118,7 +118,6 @@ struct gpio_irq_chip {
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irqchip: GPIO IRQ chip impl, provided by GPIO driver
  * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
  * @irq_handler: the irq handler to use (often a predefined irq core function)
  *	for GPIO IRQs, provided by GPIO driver
@@ -198,7 +197,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	struct irq_chip		*irqchip;
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
-- 
2.12.0

