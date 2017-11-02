From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 08/12] gpio: Move irq_valid_mask into struct gpio_irq_chip
Date: Thu,  2 Nov 2017 18:49:37 +0100
Message-ID: <20171102174941.3461-9-thierry.reding@gmail.com>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102174941.3461-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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
 drivers/platform/x86/intel_int0002_vgpio.c |  4 ++--
 include/linux/gpio/driver.h                | 21 +++++++++++++++------
 8 files changed, 35 insertions(+), 26 deletions(-)

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
index 2bfce0ab7326..8781817d9003 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -501,7 +501,7 @@ static void set_irq_valid_mask(struct aspeed_gpio *gpio)
 			if (i >= gpio->config->nr_gpios)
 				break;
 
-			clear_bit(i, gpio->chip.irq_valid_mask);
+			clear_bit(i, gpio->chip.irq.valid_mask);
 		}
 
 		props++;
@@ -856,7 +856,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.set_config = aspeed_gpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
-	gpio->chip.irq_need_valid_mask = true;
+	gpio->chip.irq.need_valid_mask = true;
 
 	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (rc < 0)
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 18d8bef76d85..e6e5cca624a7 100644
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
index 236a9f55a265..0bf844470693 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1504,33 +1504,33 @@ static struct gpio_chip *find_chip_by_name(const char *name)
 
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 {
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
-	bitmap_fill(gpiochip->irq_valid_mask, gpiochip->ngpio);
+	bitmap_fill(gpiochip->irq.valid_mask, gpiochip->ngpio);
 
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
index 5897981e5ed3..9c1ca29c60b7 100644
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
index 1cd7043edbc1..e23def322de2 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1584,7 +1584,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	chip->label = dev_name(pctrl->dev);
 	chip->parent = pctrl->dev;
 	chip->base = -1;
-	chip->irq_need_valid_mask = need_valid_mask;
+	chip->irq.need_valid_mask = need_valid_mask;
 
 	ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
 	if (ret) {
@@ -1616,7 +1616,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
 		if (need_valid_mask && intsel >= pctrl->community->nirqs)
-			clear_bit(i, chip->irq_valid_mask);
+			clear_bit(i, chip->irq.valid_mask);
 	}
 
 	/* Clear all interrupts */
diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index f6b3af73dea5..f7b67e898abc 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -165,7 +165,7 @@ static int int0002_probe(struct platform_device *pdev)
 	chip->direction_output = int0002_gpio_direction_output;
 	chip->base = -1;
 	chip->ngpio = GPE0A_PME_B0_VIRT_GPIO_PIN + 1;
-	chip->irq_need_valid_mask = true;
+	chip->irq.need_valid_mask = true;
 
 	ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 	if (ret) {
@@ -173,7 +173,7 @@ static int int0002_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	bitmap_clear(chip->irq_valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
+	bitmap_clear(chip->irq.valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
 
 	/*
 	 * We manually request the irq here instead of passing a flow-handler
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 1c3d06fe54b1..067efcd4f46d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -99,6 +99,21 @@ struct gpio_irq_chip {
 	 * True if set the interrupt handling is nested.
 	 */
 	bool nested;
+
+	/**
+	 * @need_valid_mask:
+	 *
+	 * If set core allocates @valid_mask with all bits set to one.
+	 */
+	bool need_valid_mask;
+
+	/**
+	 * @valid_mask:
+	 *
+	 * If not %NULL holds bitmask of GPIOs which are valid to be included
+	 * in IRQ domain of the chip.
+	 */
+	unsigned long *valid_mask;
 };
 
 static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
@@ -170,10 +185,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
- *	bits set to one
- * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
- *	be included in IRQ domain of the chip
  * @lock_key: per GPIO IRQ chip lockdep class
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
@@ -244,8 +255,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	bool			irq_need_valid_mask;
-	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
 
 	/**
-- 
2.14.1
