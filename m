From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 05/12] gpio: Move irq_default_type to struct gpio_irq_chip
Date: Thu,  2 Nov 2017 18:49:34 +0100
Message-ID: <20171102174941.3461-6-thierry.reding@gmail.com>
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
 drivers/gpio/gpiolib.c      |  6 +++---
 include/linux/gpio/driver.h | 11 ++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index dafbca12c4ca..d3608cf511de 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1656,8 +1656,8 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
 	 * is passed as default type.
 	 */
-	if (chip->irq_default_type != IRQ_TYPE_NONE)
-		irq_set_irq_type(irq, chip->irq_default_type);
+	if (chip->irq.default_type != IRQ_TYPE_NONE)
+		irq_set_irq_type(irq, chip->irq.default_type);
 
 	return 0;
 }
@@ -1821,7 +1821,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 
 	gpiochip->irq.chip = irqchip;
 	gpiochip->irq.handler = handler;
-	gpiochip->irq_default_type = type;
+	gpiochip->irq.default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->lock_key = lock_key;
 	gpiochip->irq.domain = irq_domain_add_simple(of_node,
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 864f507e859b..1367fa94105f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -54,6 +54,14 @@ struct gpio_irq_chip {
 	 */
 	irq_flow_handler_t handler;
 
+	/**
+	 * @default_type:
+	 *
+	 * Default IRQ triggering type applied during GPIO driver
+	 * initialization, provided by GPIO driver.
+	 */
+	unsigned int default_type;
+
 	/**
 	 * @parent_handler:
 	 *
@@ -140,8 +148,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_default_type: default IRQ triggering type applied during GPIO driver
- *	initialization, provided by GPIO driver
  * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
  *	provided by GPIO driver for chained interrupt (not for nested
  *	interrupts).
@@ -220,7 +226,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
 	bool			irq_nested;
 	bool			irq_need_valid_mask;
-- 
2.14.1
