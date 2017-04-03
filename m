From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/12] gpio: Move irq_valid_mask into struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:26 +0200
Message-ID: <20170403160532.20282-7-thierry.reding@gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170403160532.20282-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/gpio/driver.txt              |  4 ++--
 drivers/gpio/gpio-aspeed.c                 |  4 ++--
 drivers/gpio/gpio-stmpe.c                  |  4 ++--
 drivers/gpio/gpiolib.c                     | 16 ++++++++--------
 drivers/pinctrl/intel/pinctrl-baytrail.c   |  4 ++--
 drivers/pinctrl/intel/pinctrl-cherryview.c |  4 ++--
 include/linux/gpio/driver.h                | 12 ++++++------
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index dcf6af1d9e56..d8de1c7de85a 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -313,8 +313,8 @@ symbol:
   mark all the child IRQs as having the other IRQ as parent.
 
 If there is a need to exclude certain GPIOs from the IRQ domain, you can
-set .irq_need_valid_mask of the gpiochip before gpiochip_add_data() is
-called. This allocates an .irq_valid_mask with as many bits set as there
+set .irq.need_valid_mask of the gpiochip before gpiochip_add_data() is
+called. This allocates an .irq.valid_mask with as many bits set as there
 are GPIOs in the chip. Drivers can exclude GPIOs by clearing bits from this
 mask. The mask must be filled in before gpiochip_irqchip_add() or
 gpiochip_irqchip_add_nested() is called.
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index b1f029154d5e..0c19b89d56cd 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -460,7 +460,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 			if (i >= gpio->config->nr_gpios)
 				break;
 
-			clear_bit(i, gpio->chip.irq_valid_mask);
+			clear_bit(i, gpio->chip.irq.valid_mask);
 		}
 
 		props++;
@@ -578,7 +578,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.set = aspeed_gpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
-	gpio->chip.irq_need_valid_mask = true;
+	gpio->chip.irq.need_valid_mask = true;
 
 	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (rc < 0)
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 5aee24fe0254..5b99ff7e75ef 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -451,7 +451,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	of_property_read_u32(np, "st,norequest-mask",
 			&stmpe_gpio->norequest_mask);
 	if (stmpe_gpio->norequest_mask)
-		stmpe_gpio->chip.irq_need_valid_mask = true;
+		stmpe_gpio->chip.irq.need_valid_mask = true;
 
 	if (irq < 0)
 		dev_info(&pdev->dev,
@@ -482,7 +482,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 			/* Forbid unused lines to be mapped as IRQs */
 			for (i = 0; i < sizeof(u32); i++)
 				if (stmpe_gpio->norequest_mask & BIT(i))
-					clear_bit(i, stmpe_gpio->chip.irq_valid_mask);
+					clear_bit(i, stmpe_gpio->chip.irq.valid_mask);
 		}
 		ret =  gpiochip_irqchip_add_nested(&stmpe_gpio->chip,
 						   &stmpe_gpio_irq_chip,
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 94a428928145..318978a79859 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1478,34 +1478,34 @@ static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 {
 	int i;
 
-	if (!gpiochip->irq_need_valid_mask)
+	if (!gpiochip->irq.need_valid_mask)
 		return 0;
 
-	gpiochip->irq_valid_mask = kcalloc(BITS_TO_LONGS(gpiochip->ngpio),
+	gpiochip->irq.valid_mask = kcalloc(BITS_TO_LONGS(gpiochip->ngpio),
 					   sizeof(long), GFP_KERNEL);
-	if (!gpiochip->irq_valid_mask)
+	if (!gpiochip->irq.valid_mask)
 		return -ENOMEM;
 
 	/* Assume by default all GPIOs are valid */
 	for (i = 0; i < gpiochip->ngpio; i++)
-		set_bit(i, gpiochip->irq_valid_mask);
+		set_bit(i, gpiochip->irq.valid_mask);
 
 	return 0;
 }
 
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
 {
-	kfree(gpiochip->irq_valid_mask);
-	gpiochip->irq_valid_mask = NULL;
+	kfree(gpiochip->irq.valid_mask);
+	gpiochip->irq.valid_mask = NULL;
 }
 
 static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
 				       unsigned int offset)
 {
 	/* No mask means all valid */
-	if (likely(!gpiochip->irq_valid_mask))
+	if (likely(!gpiochip->irq.valid_mask))
 		return true;
-	return test_bit(offset, gpiochip->irq_valid_mask);
+	return test_bit(offset, gpiochip->irq.valid_mask);
 }
 
 /**
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index f49cc7ce68fc..04430c66f949 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1660,7 +1660,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 
 		value = readl(reg);
 		if (value & BYT_DIRECT_IRQ_EN) {
-			clear_bit(i, gc->irq_valid_mask);
+			clear_bit(i, gc->irq.valid_mask);
 			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
 		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
 			byt_gpio_clear_triggering(vg, i);
@@ -1703,7 +1703,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	gc->can_sleep	= false;
 	gc->parent	= &vg->pdev->dev;
 	gc->ngpio	= vg->soc_data->npins;
-	gc->irq_need_valid_mask	= true;
+	gc->irq.need_valid_mask	= true;
 
 #ifdef CONFIG_PM_SLEEP
 	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 13bd1ced5104..8dfb904661fd 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1541,7 +1541,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	chip->label = dev_name(pctrl->dev);
 	chip->parent = pctrl->dev;
 	chip->base = -1;
-	chip->irq_need_valid_mask = true;
+	chip->irq.need_valid_mask = true;
 
 	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
 	if (ret) {
@@ -1573,7 +1573,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
 		if (intsel >= pctrl->community->nirqs)
-			clear_bit(i, chip->irq_valid_mask);
+			clear_bit(i, chip->irq.valid_mask);
 	}
 
 	/* Clear all interrupts */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f69f7dccbcf6..6da14df56047 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -39,6 +39,10 @@ struct module;
  * @parents: a list of interrupt parents of a GPIO chip
  * @map: a list of interrupt parents for each line of a GPIO chip
  * @nested: True if set the interrupt handling is nested.
+ * @need_valid_mask: If set core allocates @valid_mask with all bits set to
+ *                   one
+ * @valid_mask: If not %NULL holds bitmask of GPIOs which are valid to be
+ *              included in IRQ domain of the chip
  */
 struct gpio_irq_chip {
 	struct irq_chip *chip;
@@ -54,6 +58,8 @@ struct gpio_irq_chip {
 	unsigned int *parents;
 	unsigned int *map;
 	bool nested;
+	bool need_valid_mask;
+	unsigned long *valid_mask;
 };
 #endif
 
@@ -126,10 +132,6 @@ struct gpio_irq_chip {
  * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
  *	provided by GPIO driver for chained interrupt (not for nested
  *	interrupts).
- * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
- *	bits set to one
- * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
- *	be included in IRQ domain of the chip
  * @lock_key: per GPIO IRQ chip lockdep class
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
@@ -201,8 +203,6 @@ struct gpio_chip {
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
 	unsigned int		irq_chained_parent;
-	bool			irq_need_valid_mask;
-	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
 
 	struct gpio_irq_chip	irq;
-- 
2.12.0

