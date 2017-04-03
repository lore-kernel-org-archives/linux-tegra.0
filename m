From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/12] gpio: Move irq_default_type to struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:29 +0200
Message-ID: <20170403160532.20282-10-thierry.reding@gmail.com>
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
 drivers/gpio/gpiolib.c      | 8 ++++----
 include/linux/gpio/driver.h | 3 ---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ff327512703a..cb4b35157aca 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1629,8 +1629,8 @@ int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
 	 * is passed as default type.
 	 */
-	if (chip->irq_default_type != IRQ_TYPE_NONE)
-		irq_set_irq_type(irq, chip->irq_default_type);
+	if (chip->irq.default_type != IRQ_TYPE_NONE)
+		irq_set_irq_type(irq, chip->irq.default_type);
 
 	return 0;
 }
@@ -1736,7 +1736,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 	gpiochip->irq_handler = gpiochip->irq.handler;
 
 	gpiochip->to_irq = gpiochip_to_irq;
-	gpiochip->irq_default_type = type;
+	gpiochip->irq.default_type = type;
 
 	if (gpiochip->irq.domain_ops)
 		ops = gpiochip->irq.domain_ops;
@@ -1922,7 +1922,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 
 	gpiochip->irq.chip = irqchip;
 	gpiochip->irq_handler = handler;
-	gpiochip->irq_default_type = type;
+	gpiochip->irq.default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->irq.lock_key = lock_key;
 	gpiochip->irq.domain = irq_domain_add_simple(of_node,
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 631c66d6df58..4bc5b4b9cf0b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -127,8 +127,6 @@ struct gpio_irq_chip {
  * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
  * @irq_handler: the irq handler to use (often a predefined irq core function)
  *	for GPIO IRQs, provided by GPIO driver
- * @irq_default_type: default IRQ triggering type applied during GPIO driver
- *	initialization, provided by GPIO driver
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -197,7 +195,6 @@ struct gpio_chip {
 	 */
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
-	unsigned int		irq_default_type;
 
 	struct gpio_irq_chip	irq;
 #endif
-- 
2.12.0
