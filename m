From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v7 06/15] gpio: Move irq_chained_parent to struct gpio_irq_chip
Date: Tue,  7 Nov 2017 19:15:50 +0100
Message-ID: <20171107181559.6318-7-thierry.reding@gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 17 ++++++++++++-----
 include/linux/gpio/driver.h | 19 +++++++++++++++----
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6b0eef375b58..3edb02b54bb2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1570,7 +1570,8 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
 						 gpiochip);
 
-		gpiochip->irq_chained_parent = parent_irq;
+		gpiochip->irq.parents = &parent_irq;
+		gpiochip->irq.num_parents = 1;
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
@@ -1719,17 +1720,23 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
  */
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 {
-	unsigned int offset, irq;
+	unsigned int offset;
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
-	if (gpiochip->irq_chained_parent) {
-		irq_set_chained_handler_and_data(
-			gpiochip->irq_chained_parent, NULL, NULL);
+	if (gpiochip->irq.num_parents > 0) {
+		struct gpio_irq_chip *irq = &gpiochip->irq;
+		unsigned int i;
+
+		for (i = 0; i < irq->num_parents; i++)
+			irq_set_chained_handler_and_data(irq->parents[i],
+							 NULL, NULL);
 	}
 
 	/* Remove all IRQ mappings and delete the domain */
 	if (gpiochip->irq.domain) {
+		unsigned int irq;
+
 		for (offset = 0; offset < gpiochip->ngpio; offset++) {
 			if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
 				continue;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 7bafae934112..4210aa4c11d1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -78,6 +78,21 @@ struct gpio_irq_chip {
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
@@ -149,9 +164,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
- *	provided by GPIO driver for chained interrupt (not for nested
- *	interrupts).
  * @irq_nested: True if set the interrupt handling is nested.
  * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
  *	bits set to one
@@ -227,7 +239,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	unsigned int		irq_chained_parent;
 	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
-- 
2.14.1
