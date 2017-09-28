From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 07/16] gpio: Move irq_chained_parent to struct gpio_irq_chip
Date: Thu, 28 Sep 2017 11:56:19 +0200
Message-ID: <20170928095628.21966-8-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpiolib.c      | 8 ++------
 include/linux/gpio/driver.h | 4 ----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bbad2eae30e2..7a62f4a63635 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1569,7 +1569,8 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
 						 gpiochip);
 
-		gpiochip->irq_chained_parent = parent_irq;
+		gpiochip->irq.parents = &parent_irq;
+		gpiochip->irq.num_parents = 1;
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
@@ -1842,11 +1843,6 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
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
2.14.1
