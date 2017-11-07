From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 09/15] gpio: Move lock_key into struct gpio_irq_chip
Date: Tue,  7 Nov 2017 19:15:53 +0100
Message-ID: <20171107181559.6318-10-thierry.reding@gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpiolib.c      | 4 ++--
 include/linux/gpio/driver.h | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 52cb24b16ae3..9d98ff2f4e0e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1646,7 +1646,7 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * This lock class tells lockdep that GPIO irqs are in a different
 	 * category than their parents, so it won't report false recursion.
 	 */
-	irq_set_lockdep_class(irq, chip->lock_key);
+	irq_set_lockdep_class(irq, chip->irq.lock_key);
 	irq_set_chip_and_handler(irq, chip->irq.chip, chip->irq.handler);
 	/* Chips that use nested thread handlers have them marked */
 	if (chip->irq.nested)
@@ -1830,7 +1830,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	gpiochip->irq.handler = handler;
 	gpiochip->irq.default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
-	gpiochip->lock_key = lock_key;
+	gpiochip->irq.lock_key = lock_key;
 	gpiochip->irq.domain = irq_domain_add_simple(of_node,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 243c8b585160..c390c8165583 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -63,6 +63,13 @@ struct gpio_irq_chip {
 	 */
 	unsigned int default_type;
 
+	/**
+	 * @lock_key:
+	 *
+	 * Per GPIO IRQ chip lockdep class.
+	 */
+	struct lock_class_key *lock_key;
+
 	/**
 	 * @parent_handler:
 	 *
@@ -186,7 +193,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @lock_key: per GPIO IRQ chip lockdep class
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -256,7 +262,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	struct lock_class_key	*lock_key;
 
 	/**
 	 * @irq:
-- 
2.14.1
