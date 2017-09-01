From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/16] gpio: Move irq_chained_parent to struct gpio_irq_chip
Date: Fri,  1 Sep 2017 20:57:27 +0200
Message-ID: <20170901185736.28051-8-thierry.reding@gmail.com>
References: <20170901185736.28051-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901185736.28051-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c      | 8 ++------
 include/linux/gpio/driver.h | 4 ----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 774d6047116a..f09cc89929f0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1580,7 +1580,8 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
 						 gpiochip);
 
-		gpiochip->irq_chained_parent = parent_irq;
+		gpiochip->irq.parents = &parent_irq;
+		gpiochip->irq.num_parents = 1;
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
@@ -1853,11 +1854,6 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
-	if (gpiochip->irq_chained_parent) {
-		irq_set_chained_handler(gpiochip->irq_chained_parent, NULL);
-		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
-	}
-
 	if (gpiochip->irq.chip) {
 		struct gpio_irq_chip *irq = &gpiochip->irq;
 		unsigned int i;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index bcf93afddfa6..c3eafd874884 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -176,9 +176,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
- *	provided by GPIO driver for chained interrupt (not for nested
- *	interrupts).
  * @irq_nested: True if set the interrupt handling is nested.
  * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
  *	bits set to one
@@ -251,7 +248,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	unsigned int		irq_chained_parent;
 	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
-- 
2.13.3
