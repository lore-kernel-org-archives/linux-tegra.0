From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/12] gpio: Move irq_chained_parent to struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:28 +0200
Message-ID: <20170403160532.20282-9-thierry.reding@gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403160532.20282-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
index f951eeb3c243..ff327512703a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1545,7 +1545,8 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
 						 gpiochip);
 
-		gpiochip->irq_chained_parent = parent_irq;
+		gpiochip->irq.parents = &parent_irq;
+		gpiochip->irq.num_parents = 1;
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
@@ -1815,11 +1816,6 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
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
index e0b08e208b23..631c66d6df58 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -129,9 +129,6 @@ struct gpio_irq_chip {
  *	for GPIO IRQs, provided by GPIO driver
  * @irq_default_type: default IRQ triggering type applied during GPIO driver
  *	initialization, provided by GPIO driver
- * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
- *	provided by GPIO driver for chained interrupt (not for nested
- *	interrupts).
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -201,7 +198,6 @@ struct gpio_chip {
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
-	unsigned int		irq_chained_parent;
 
 	struct gpio_irq_chip	irq;
 #endif
-- 
2.12.0
