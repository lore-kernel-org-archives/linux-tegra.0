From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v5 07/13] gpio: Move irq_chained_parent to struct gpio_irq_chip
Date: Fri, 13 Oct 2017 17:49:07 +0200
Message-ID: <20171013154913.29448-8-thierry.reding@gmail.com>
References: <20171013154913.29448-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013154913.29448-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 18 +++++++++++++-----
 include/linux/gpio/driver.h | 19 +++++++++++++++----
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 70b33cfebf4f..1ee52070d19d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1564,7 +1564,8 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
 						 gpiochip);
 
-		gpiochip->irq_chained_parent = parent_irq;
+		gpiochip->irq.parents = &parent_irq;
+		gpiochip->irq.num_parents = 1;
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
@@ -1713,17 +1714,24 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
  */
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 {
-	unsigned int offset, irq;
+	unsigned int offset;
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
-	if (gpiochip->irq_chained_parent) {
-		irq_set_chained_handler(gpiochip->irq_chained_parent, NULL);
-		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
+	if (gpiochip->irq.num_parents > 0) {
+		struct gpio_irq_chip *irq = &gpiochip->irq;
+		unsigned int i;
+
+		for (i = 0; i < irq->num_parents; i++) {
+			irq_set_chained_handler(irq->parents[i], NULL);
+			irq_set_handler_data(irq->parents[i], NULL);
+		}
 	}
 
 	/* Remove all IRQ mappings and delete the domain */
 	if (gpiochip->irq.domain) {
+		unsigned int irq;
+
 		for (offset = 0; offset < gpiochip->ngpio; offset++) {
 			if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
 				continue;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index be856f003895..31785734462a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -85,6 +85,21 @@ struct gpio_irq_chip {
 	 * interrupt.
 	 */
 	void *parent_handler_data;
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
 };
 
 static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
@@ -154,9 +169,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
- *	provided by GPIO driver for chained interrupt (not for nested
- *	interrupts).
  * @irq_nested: True if set the interrupt handling is nested.
  * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
  *	bits set to one
@@ -229,7 +241,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	unsigned int		irq_chained_parent;
 	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
-- 
2.14.1
