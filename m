From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 10/12] gpio: Move irq_handler to struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:30 +0200
Message-ID: <20170403160532.20282-11-thierry.reding@gmail.com>
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
 drivers/gpio/gpiolib.c      | 6 ++----
 include/linux/gpio/driver.h | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cb4b35157aca..3b251d5c0e1a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1619,7 +1619,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * category than their parents, so it won't report false recursion.
 	 */
 	irq_set_lockdep_class(irq, chip->irq.lock_key);
-	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq_handler);
+	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq.nested)
 		irq_set_nested_thread(irq, 1);
@@ -1733,8 +1733,6 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->irq_handler = gpiochip->irq.handler;
-
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->irq.default_type = type;
 
@@ -1921,7 +1919,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	}
 
 	gpiochip->irq.chip = irqchip;
-	gpiochip->irq_handler = handler;
+	gpiochip->irq.handler = handler;
 	gpiochip->irq.default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->irq.lock_key = lock_key;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4bc5b4b9cf0b..91aa808052f1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -28,7 +28,8 @@ struct module;
  * @domain: interrupt translation domain; responsible for mapping
  *          between GPIO hwirq number and linux irq number
  * @domain_ops: table of interrupt domain operations for this IRQ chip
- * @handler: the interrupt handler for the GPIO chip's parent interrupts
+ * @handler: the IRQ handler to use (often a predefined IRQ core function) for
+ *           GPIO IRQs, provided by GPIO driver
  * @lock_key: per GPIO IRQ chip lockdep class
  * @default_type: default IRQ triggering type applied during GPIO driver
  *                initialization, provided by GPIO driver
@@ -125,8 +126,6 @@ struct gpio_irq_chip {
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
  * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
- * @irq_handler: the irq handler to use (often a predefined irq core function)
- *	for GPIO IRQs, provided by GPIO driver
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -194,7 +193,6 @@ struct gpio_chip {
 	 * to handle IRQs for most practical cases.
 	 */
 	unsigned int		irq_base;
-	irq_flow_handler_t	irq_handler;
 
 	struct gpio_irq_chip	irq;
 #endif
-- 
2.12.0

