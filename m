From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/12] gpio: Use unsigned int for interrupt numbers
Date: Mon,  3 Apr 2017 18:05:21 +0200
Message-ID: <20170403160532.20282-2-thierry.reding@gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403160532.20282-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Interrupt numbers are never negative, zero serves as the special invalid
value.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpiolib.c      | 6 +++---
 include/linux/gpio/driver.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4aa1e78f0f0b..7a0df48e09da 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1515,7 +1515,7 @@ static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
  */
 static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 					  struct irq_chip *irqchip,
-					  int parent_irq,
+					  unsigned int parent_irq,
 					  irq_flow_handler_t parent_handler)
 {
 	unsigned int offset;
@@ -1564,7 +1564,7 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
  */
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 				  struct irq_chip *irqchip,
-				  int parent_irq,
+				  unsigned int parent_irq,
 				  irq_flow_handler_t parent_handler)
 {
 	gpiochip_set_cascaded_irqchip(gpiochip, irqchip, parent_irq,
@@ -1581,7 +1581,7 @@ EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
  */
 void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 				 struct irq_chip *irqchip,
-				 int parent_irq)
+				 unsigned int parent_irq)
 {
 	if (!gpiochip->irq_nested) {
 		chip_err(gpiochip, "tried to nest a chained gpiochip\n");
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 846f3b989480..393582867afd 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -168,7 +168,7 @@ struct gpio_chip {
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
-	int			irq_chained_parent;
+	unsigned int		irq_chained_parent;
 	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
@@ -244,12 +244,12 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
-		int parent_irq,
+		unsigned int parent_irq,
 		irq_flow_handler_t parent_handler);
 
 void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
 		struct irq_chip *irqchip,
-		int parent_irq);
+		unsigned int parent_irq);
 
 int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 			     struct irq_chip *irqchip,
-- 
2.12.0
