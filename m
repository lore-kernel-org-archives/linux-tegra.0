From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/12] gpio: Move lock_key into struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:27 +0200
Message-ID: <20170403160532.20282-8-thierry.reding@gmail.com>
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
 drivers/gpio/gpiolib.c      | 5 ++---
 include/linux/gpio/driver.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 318978a79859..f951eeb3c243 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1617,7 +1617,7 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * This lock class tells lockdep that GPIO irqs are in a different
 	 * category than their parents, so it won't report false recursion.
 	 */
-	irq_set_lockdep_class(irq, chip->lock_key);
+	irq_set_lockdep_class(irq, chip->irq.lock_key);
 	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq_handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq.nested)
@@ -1733,7 +1733,6 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 	}
 
 	gpiochip->irq_handler = gpiochip->irq.handler;
-	gpiochip->lock_key = gpiochip->irq.lock_key;
 
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->irq_default_type = type;
@@ -1929,7 +1928,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	gpiochip->irq_handler = handler;
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
-	gpiochip->lock_key = lock_key;
+	gpiochip->irq.lock_key = lock_key;
 	gpiochip->irq.domain = irq_domain_add_simple(of_node,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6da14df56047..e0b08e208b23 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -132,7 +132,6 @@ struct gpio_irq_chip {
  * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
  *	provided by GPIO driver for chained interrupt (not for nested
  *	interrupts).
- * @lock_key: per GPIO IRQ chip lockdep class
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -203,7 +202,6 @@ struct gpio_chip {
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
-	struct lock_class_key	*lock_key;
 
 	struct gpio_irq_chip	irq;
 #endif
-- 
2.12.0
