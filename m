From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/12] gpio: Move irq_base to struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:31 +0200
Message-ID: <20170403160532.20282-12-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-mockup.c  | 6 +++---
 drivers/gpio/gpiolib.c      | 2 +-
 include/linux/gpio/driver.h | 5 +----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 04008fadabef..f4179f7420a3 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -139,7 +139,7 @@ static int gpio_mockup_name_lines(struct device *dev,
 
 static int gpio_mockup_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
-	return chip->irq_base + offset;
+	return chip->irq.first + offset;
 }
 
 /*
@@ -173,7 +173,7 @@ static int gpio_mockup_irqchip_setup(struct device *dev,
 	if (irq_base < 0)
 		return irq_base;
 
-	gc->irq_base = irq_base;
+	gc->irq.first = irq_base;
 	gc->irq.chip = &gpio_mockup_irqchip;
 
 	for (i = 0; i < gc->ngpio; i++) {
@@ -217,7 +217,7 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 		return -EINVAL;
 
 	gpiod_set_value_cansleep(desc, val);
-	priv->chip->irq_ctx.irq = gc->irq_base + priv->offset;
+	priv->chip->irq_ctx.irq = gc->irq.first + priv->offset;
 	irq_work_queue(&priv->chip->irq_ctx.work);
 
 	return size;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3b251d5c0e1a..55e59d79bfd3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1955,7 +1955,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			 * Store the base into the gpiochip to be used when
 			 * unmapping the irqs.
 			 */
-			gpiochip->irq_base = irq_base;
+			gpiochip->irq.first = irq_base;
 			irq_base_set = true;
 		}
 	}
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 91aa808052f1..96e7aca74ed1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -24,7 +24,7 @@ struct module;
  * struct gpio_irq_chip - GPIO interrupt controller
  * @chip: GPIO IRQ chip implementation, provided by GPIO driver
  * @first: if not dynamically assigned, the base (first) IRQ to allocate GPIO
- *         chip IRQs from
+ *         chip IRQs from (deprecated)
  * @domain: interrupt translation domain; responsible for mapping
  *          between GPIO hwirq number and linux irq number
  * @domain_ops: table of interrupt domain operations for this IRQ chip
@@ -125,7 +125,6 @@ struct gpio_irq_chip {
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -192,8 +191,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	unsigned int		irq_base;
-
 	struct gpio_irq_chip	irq;
 #endif
 
-- 
2.12.0
