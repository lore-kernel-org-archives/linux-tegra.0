From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/12] gpio: Move irqdomain into struct gpio_irq_chip
Date: Mon,  3 Apr 2017 18:05:24 +0200
Message-ID: <20170403160532.20282-5-thierry.reding@gmail.com>
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
 Documentation/gpio/driver.txt              |  2 +-
 drivers/bcma/driver_gpio.c                 |  2 +-
 drivers/gpio/gpio-104-dio-48e.c            |  2 +-
 drivers/gpio/gpio-104-idi-48.c             |  2 +-
 drivers/gpio/gpio-104-idio-16.c            |  2 +-
 drivers/gpio/gpio-adnp.c                   |  2 +-
 drivers/gpio/gpio-altera.c                 |  4 ++--
 drivers/gpio/gpio-aspeed.c                 |  2 +-
 drivers/gpio/gpio-ath79.c                  |  2 +-
 drivers/gpio/gpio-brcmstb.c                |  2 +-
 drivers/gpio/gpio-crystalcove.c            |  2 +-
 drivers/gpio/gpio-dln2.c                   |  2 +-
 drivers/gpio/gpio-ftgpio010.c              |  2 +-
 drivers/gpio/gpio-intel-mid.c              |  2 +-
 drivers/gpio/gpio-lynxpoint.c              |  2 +-
 drivers/gpio/gpio-max732x.c                |  2 +-
 drivers/gpio/gpio-mcp23s08.c               |  2 +-
 drivers/gpio/gpio-merrifield.c             |  2 +-
 drivers/gpio/gpio-omap.c                   |  2 +-
 drivers/gpio/gpio-pca953x.c                |  2 +-
 drivers/gpio/gpio-pcf857x.c                |  2 +-
 drivers/gpio/gpio-pci-idio-16.c            |  2 +-
 drivers/gpio/gpio-pl061.c                  |  2 +-
 drivers/gpio/gpio-rcar.c                   |  2 +-
 drivers/gpio/gpio-reg.c                    |  4 ++--
 drivers/gpio/gpio-stmpe.c                  |  2 +-
 drivers/gpio/gpio-tc3589x.c                |  2 +-
 drivers/gpio/gpio-vf610.c                  |  2 +-
 drivers/gpio/gpio-wcove.c                  |  2 +-
 drivers/gpio/gpio-ws16c48.c                |  2 +-
 drivers/gpio/gpio-xgene-sb.c               |  2 +-
 drivers/gpio/gpio-xlp.c                    |  2 +-
 drivers/gpio/gpio-zx.c                     |  2 +-
 drivers/gpio/gpio-zynq.c                   |  2 +-
 drivers/gpio/gpiolib.c                     | 34 ++++++++++++++++--------------
 drivers/pinctrl/bcm/pinctrl-bcm2835.c      |  4 ++--
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c   |  2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c   |  2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c      |  2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c  |  4 ++--
 drivers/pinctrl/pinctrl-amd.c              |  2 +-
 drivers/pinctrl/pinctrl-at91.c             |  2 +-
 drivers/pinctrl/pinctrl-coh901.c           |  2 +-
 drivers/pinctrl/pinctrl-oxnas.c            |  2 +-
 drivers/pinctrl/pinctrl-pic32.c            |  2 +-
 drivers/pinctrl/pinctrl-pistachio.c        |  2 +-
 drivers/pinctrl/pinctrl-st.c               |  2 +-
 drivers/pinctrl/pinctrl-sx150x.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c         |  2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c      |  2 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c        |  2 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c     |  2 +-
 include/linux/gpio/driver.h                |  6 +++---
 54 files changed, 77 insertions(+), 75 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index fc1d2f83564d..dcf6af1d9e56 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -254,7 +254,7 @@ GPIO irqchips usually fall in one of two categories:
 	static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 		unsigned long wa_lock_flags;
 		raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
-		generic_handle_irq(irq_find_mapping(bank->chip.irqdomain, bit));
+		generic_handle_irq(irq_find_mapping(bank->chip.irq.domain, bit));
 		raw_spin_unlock_irqrestore(&bank->wa_lock, wa_lock_flags);
 
 * GENERIC CHAINED GPIO irqchips: these are the same as "CHAINED GPIO irqchips",
diff --git a/drivers/bcma/driver_gpio.c b/drivers/bcma/driver_gpio.c
index 7bde8d7a2816..3ad8a7309c00 100644
--- a/drivers/bcma/driver_gpio.c
+++ b/drivers/bcma/driver_gpio.c
@@ -113,7 +113,7 @@ static irqreturn_t bcma_gpio_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	for_each_set_bit(gpio, &irqs, gc->ngpio)
-		generic_handle_irq(irq_find_mapping(gc->irqdomain, gpio));
+		generic_handle_irq(irq_find_mapping(gc->irq.domain, gpio));
 	bcma_chipco_gpio_polarity(cc, irqs, val & irqs);
 
 	return IRQ_HANDLED;
diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 61b50c40b87b..fbff7026e9e9 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -326,7 +326,7 @@ static irqreturn_t dio48e_irq_handler(int irq, void *dev_id)
 	unsigned long gpio;
 
 	for_each_set_bit(gpio, &irq_mask, 2)
-		generic_handle_irq(irq_find_mapping(chip->irqdomain,
+		generic_handle_irq(irq_find_mapping(chip->irq.domain,
 			19 + gpio*24));
 
 	raw_spin_lock(&dio48egpio->lock);
diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 337c048168d8..e2e234e99dfa 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -209,7 +209,7 @@ static irqreturn_t idi_48_irq_handler(int irq, void *dev_id)
 		for_each_set_bit(bit_num, &irq_mask, 8) {
 			gpio = bit_num + boundary * 8;
 
-			generic_handle_irq(irq_find_mapping(chip->irqdomain,
+			generic_handle_irq(irq_find_mapping(chip->irq.domain,
 				gpio));
 		}
 	}
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 5281e1cedb01..1e82d462581e 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -199,7 +199,7 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 	int gpio;
 
 	for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
-		generic_handle_irq(irq_find_mapping(chip->irqdomain, gpio));
+		generic_handle_irq(irq_find_mapping(chip->irq.domain, gpio));
 
 	raw_spin_lock(&idio16gpio->lock);
 
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 89863ea25de1..9d143ae4219f 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -323,7 +323,7 @@ static irqreturn_t adnp_irq(int irq, void *data)
 
 		for_each_set_bit(bit, &pending, 8) {
 			unsigned int child_irq;
-			child_irq = irq_find_mapping(adnp->gpio.irqdomain,
+			child_irq = irq_find_mapping(adnp->gpio.irq.domain,
 						     base + bit);
 			handle_nested_irq(child_irq);
 		}
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 17485dc20384..16a8814d56e9 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -211,7 +211,7 @@ static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
-	irqdomain = altera_gc->mmchip.gc.irqdomain;
+	irqdomain = altera_gc->mmchip.gc.irq.domain;
 
 	chained_irq_enter(chip, desc);
 
@@ -239,7 +239,7 @@ static void altera_gpio_irq_leveL_high_handler(struct irq_desc *desc)
 	altera_gc = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	chip = irq_desc_get_chip(desc);
 	mm_gc = &altera_gc->mmchip;
-	irqdomain = altera_gc->mmchip.gc.irqdomain;
+	irqdomain = altera_gc->mmchip.gc.irq.domain;
 
 	chained_irq_enter(chip, desc);
 
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index fb16cc771c0d..b1f029154d5e 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -428,7 +428,7 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 		reg = ioread32(bank_irq_reg(data, bank, GPIO_IRQ_STATUS));
 
 		for_each_set_bit(p, &reg, 32) {
-			girq = irq_find_mapping(gc->irqdomain, i * 32 + p);
+			girq = irq_find_mapping(gc->irq.domain, i * 32 + p);
 			generic_handle_irq(girq);
 		}
 
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index f33d4a5fe671..299e9f7b6b9d 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -208,7 +208,7 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 	if (pending) {
 		for_each_set_bit(irq, &pending, gc->ngpio)
 			generic_handle_irq(
-				irq_linear_revmap(gc->irqdomain, irq));
+				irq_linear_revmap(gc->irq.domain, irq));
 	}
 
 	chained_irq_exit(irqchip, desc);
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e6489143721a..ddb6275d8f07 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -202,7 +202,7 @@ static irqreturn_t brcmstb_gpio_wake_irq_handler(int irq, void *data)
 static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	struct irq_domain *irq_domain = bank->gc.irqdomain;
+	struct irq_domain *irq_domain = bank->gc.irq.domain;
 	void __iomem *reg_base = priv->reg_base;
 	unsigned long status;
 	unsigned long flags;
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 2197368cc899..75fea69f853e 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -277,7 +277,7 @@ static irqreturn_t crystalcove_gpio_irq_handler(int irq, void *data)
 
 	for (gpio = 0; gpio < CRYSTALCOVE_GPIO_NUM; gpio++) {
 		if (pending & BIT(gpio)) {
-			virq = irq_find_mapping(cg->chip.irqdomain, gpio);
+			virq = irq_find_mapping(cg->chip.irq.domain, gpio);
 			handle_nested_irq(virq);
 		}
 	}
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index aecb847166f5..1dada68b9a27 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -420,7 +420,7 @@ static void dln2_gpio_event(struct platform_device *pdev, u16 echo,
 		return;
 	}
 
-	irq = irq_find_mapping(dln2->gpio.irqdomain, pin);
+	irq = irq_find_mapping(dln2->gpio.irq.domain, pin);
 	if (!irq) {
 		dev_err(dln2->gpio.parent, "pin %d not mapped to IRQ\n", pin);
 		return;
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index e9386f8b67f5..b7896bae83ca 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -149,7 +149,7 @@ static void ftgpio_gpio_irq_handler(struct irq_desc *desc)
 	stat = readl(g->base + GPIO_INT_STAT);
 	if (stat)
 		for_each_set_bit(offset, &stat, gc->ngpio)
-			generic_handle_irq(irq_find_mapping(gc->irqdomain,
+			generic_handle_irq(irq_find_mapping(gc->irq.domain,
 							    offset));
 
 	chained_irq_exit(irqchip, desc);
diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index b76ecee82c3f..629575ea46a0 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -295,7 +295,7 @@ static void intel_mid_irq_handler(struct irq_desc *desc)
 			mask = BIT(gpio);
 			/* Clear before handling so we can't lose an edge */
 			writel(mask, gedr);
-			generic_handle_irq(irq_find_mapping(gc->irqdomain,
+			generic_handle_irq(irq_find_mapping(gc->irq.domain,
 							    base + gpio));
 		}
 	}
diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index fbd393b46ce0..1e557b10d73e 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -255,7 +255,7 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 			mask = BIT(pin);
 			/* Clear before handling so we don't lose an edge */
 			outl(mask, reg);
-			irq = irq_find_mapping(lg->chip.irqdomain, base + pin);
+			irq = irq_find_mapping(lg->chip.irq.domain, base + pin);
 			generic_handle_irq(irq);
 		}
 	}
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 4ea4c6a1313b..c1a1260b1e14 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -486,7 +486,7 @@ static irqreturn_t max732x_irq_handler(int irq, void *devid)
 
 	do {
 		level = __ffs(pending);
-		handle_nested_irq(irq_find_mapping(chip->gpio_chip.irqdomain,
+		handle_nested_irq(irq_find_mapping(chip->gpio_chip.irq.domain,
 						   level));
 
 		pending &= ~(1 << level);
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 2a57d024481d..2218a351f88d 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -350,7 +350,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		    ((gpio_bit_changed || intcap_changed) &&
 			(BIT(i) & mcp->irq_fall) && !gpio_set) ||
 		    defval_changed) {
-			child_irq = irq_find_mapping(mcp->chip.irqdomain, i);
+			child_irq = irq_find_mapping(mcp->chip.irq.domain, i);
 			handle_nested_irq(child_irq);
 		}
 	}
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 9dbdc3672f5e..72096b6dfd91 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -358,7 +358,7 @@ static void mrfld_irq_handler(struct irq_desc *desc)
 		for_each_set_bit(gpio, &pending, 32) {
 			unsigned int irq;
 
-			irq = irq_find_mapping(gc->irqdomain, base + gpio);
+			irq = irq_find_mapping(gc->irq.domain, base + gpio);
 			generic_handle_irq(irq);
 		}
 	}
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 5d6a5744352f..80a361df1d5b 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -728,7 +728,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 
 			raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
 
-			generic_handle_irq(irq_find_mapping(bank->chip.irqdomain,
+			generic_handle_irq(irq_find_mapping(bank->chip.irq.domain,
 							    bit));
 
 			raw_spin_unlock_irqrestore(&bank->wa_lock,
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b9373785ccf5..97f55203b0d3 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -609,7 +609,7 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	for (i = 0; i < NBANK(chip); i++) {
 		while (pending[i]) {
 			level = __ffs(pending[i]);
-			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irqdomain,
+			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irq.domain,
 							level + (BANK_SZ * i)));
 			pending[i] &= ~(1 << level);
 			nhandled++;
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 895af42a4513..f3f9b83b04c1 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -198,7 +198,7 @@ static irqreturn_t pcf857x_irq(int irq, void *data)
 	mutex_unlock(&gpio->lock);
 
 	for_each_set_bit(i, &change, gpio->chip.ngpio)
-		handle_nested_irq(irq_find_mapping(gpio->chip.irqdomain, i));
+		handle_nested_irq(irq_find_mapping(gpio->chip.irq.domain, i));
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 7de4f6a2cb49..57d1b7fbf07b 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -240,7 +240,7 @@ static irqreturn_t idio_16_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	for_each_set_bit(gpio, &idio16gpio->irq_mask, chip->ngpio)
-		generic_handle_irq(irq_find_mapping(chip->irqdomain, gpio));
+		generic_handle_irq(irq_find_mapping(chip->irq.domain, gpio));
 
 	raw_spin_lock(&idio16gpio->lock);
 
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 3d3d6b6645a7..646a5a12dd7b 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -221,7 +221,7 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	pending = readb(pl061->base + GPIOMIS);
 	if (pending) {
 		for_each_set_bit(offset, &pending, PL061_GPIO_NR)
-			generic_handle_irq(irq_find_mapping(gc->irqdomain,
+			generic_handle_irq(irq_find_mapping(gc->irq.domain,
 							    offset));
 	}
 
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 31ad288846af..aaafc730f86b 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -206,7 +206,7 @@ static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
 			  gpio_rcar_read(p, INTMSK))) {
 		offset = __ffs(pending);
 		gpio_rcar_write(p, INTCLR, BIT(offset));
-		generic_handle_irq(irq_find_mapping(p->gpio_chip.irqdomain,
+		generic_handle_irq(irq_find_mapping(p->gpio_chip.irq.domain,
 						    offset));
 		irqs_handled++;
 	}
diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index e85903eddc68..23e771dba4c1 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -103,8 +103,8 @@ static int gpio_reg_to_irq(struct gpio_chip *gc, unsigned offset)
 	struct gpio_reg *r = to_gpio_reg(gc);
 	int irq = r->irqs[offset];
 
-	if (irq >= 0 && r->irqdomain)
-		irq = irq_find_mapping(r->irqdomain, irq);
+	if (irq >= 0 && r->irq.domain)
+		irq = irq_find_mapping(r->irq.domain, irq);
 
 	return irq;
 }
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 16cbc5702865..5aee24fe0254 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -397,7 +397,7 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
 		while (stat) {
 			int bit = __ffs(stat);
 			int line = bank * 8 + bit;
-			int child_irq = irq_find_mapping(stmpe_gpio->chip.irqdomain,
+			int child_irq = irq_find_mapping(stmpe_gpio->chip.irq.domain,
 							 line);
 
 			handle_nested_irq(child_irq);
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 433b45ef332e..91a8ef8e7f3f 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -268,7 +268,7 @@ static irqreturn_t tc3589x_gpio_irq(int irq, void *dev)
 		while (stat) {
 			int bit = __ffs(stat);
 			int line = i * 8 + bit;
-			int irq = irq_find_mapping(tc3589x_gpio->chip.irqdomain,
+			int irq = irq_find_mapping(tc3589x_gpio->chip.irq.domain,
 						   line);
 
 			handle_nested_irq(irq);
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 521fbe338589..e83a3d26aaaf 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -122,7 +122,7 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
 		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
 
-		generic_handle_irq(irq_find_mapping(port->gc.irqdomain, pin));
+		generic_handle_irq(irq_find_mapping(port->gc.irq.domain, pin));
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 97613de5304e..4627d8ed11fc 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -321,7 +321,7 @@ static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
 			offset = (gpio > GROUP0_NR_IRQS) ? 1 : 0;
 			mask = (offset == 1) ? BIT(gpio - GROUP0_NR_IRQS) :
 								BIT(gpio);
-			virq = irq_find_mapping(wg->chip.irqdomain, gpio);
+			virq = irq_find_mapping(wg->chip.irq.domain, gpio);
 			handle_nested_irq(virq);
 			regmap_update_bits(wg->regmap, IRQ_STATUS_BASE + offset,
 								mask, mask);
diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 87d63695dfcf..631889de1b11 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -332,7 +332,7 @@ static irqreturn_t ws16c48_irq_handler(int irq, void *dev_id)
 			int_id = inb(ws16c48gpio->base + 8 + port);
 			for_each_set_bit(gpio, &int_id, 8)
 				generic_handle_irq(irq_find_mapping(
-					chip->irqdomain, gpio + 8*port));
+					chip->irq.domain, gpio + 8*port));
 		}
 
 		int_pending = inb(ws16c48gpio->base + 6) & 0x7;
diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 033258634b8c..e761fd7c5728 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -296,7 +296,7 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 	if (!priv->irq_domain)
 		return -ENODEV;
 
-	priv->gc.irqdomain = priv->irq_domain;
+	priv->gc.irq.domain = priv->irq_domain;
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
 	if (ret) {
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index d857e1d8e731..e74bd43a6974 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -225,7 +225,7 @@ static void xlp_gpio_generic_handler(struct irq_desc *desc)
 
 		if (gpio_stat & BIT(gpio % XLP_GPIO_REGSZ))
 			generic_handle_irq(irq_find_mapping(
-						priv->chip.irqdomain, gpio));
+						priv->chip.irq.domain, gpio));
 	}
 	chained_irq_exit(irqchip, desc);
 }
diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index be3a87da8438..5eacad9b2692 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -170,7 +170,7 @@ static void zx_irq_handler(struct irq_desc *desc)
 	writew_relaxed(pending, chip->base + ZX_GPIO_IC);
 	if (pending) {
 		for_each_set_bit(offset, &pending, ZX_GPIO_NR)
-			generic_handle_irq(irq_find_mapping(gc->irqdomain,
+			generic_handle_irq(irq_find_mapping(gc->irq.domain,
 							    offset));
 	}
 
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 6b4d10d6e10f..ba5e437fbfe8 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -505,7 +505,7 @@ static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
 				      unsigned long pending)
 {
 	unsigned int bank_offset = gpio->p_data->bank_min[bank_num];
-	struct irq_domain *irqdomain = gpio->chip.irqdomain;
+	struct irq_domain *irqdomain = gpio->chip.irq.domain;
 	int offset;
 
 	if (!pending)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5aa920cb4653..67f8b9c52159 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1525,7 +1525,7 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 {
 	unsigned int offset;
 
-	if (!gpiochip->irqdomain) {
+	if (!gpiochip->irq.domain) {
 		chip_err(gpiochip, "called %s before setting up irqchip\n",
 			 __func__);
 		return;
@@ -1552,7 +1552,7 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 	for (offset = 0; offset < gpiochip->ngpio; offset++) {
 		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
 			continue;
-		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
+		irq_set_parent(irq_find_mapping(gpiochip->irq.domain, offset),
 			       parent_irq);
 	}
 }
@@ -1686,7 +1686,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return irq_find_mapping(chip->irqdomain, offset);
+	return irq_find_mapping(chip->irq.domain, offset);
 }
 
 /**
@@ -1749,10 +1749,10 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 	else
 		ops = &gpiochip_domain_ops;
 
-	gpiochip->irqdomain = irq_domain_add_simple(np, gpiochip->ngpio,
-						    gpiochip->irq.first,
-						    ops, gpiochip);
-	if (!gpiochip->irqdomain)
+	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
+						     gpiochip->irq.first,
+						     ops, gpiochip);
+	if (!gpiochip->irq.domain)
 		return -EINVAL;
 
 	/*
@@ -1794,7 +1794,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 		if (!gpiochip_irqchip_irq_valid(gpiochip, i))
 			continue;
 
-		irq = irq_create_mapping(gpiochip->irqdomain, i);
+		irq = irq_create_mapping(gpiochip->irq.domain, i);
 		if (!irq) {
 			chip_err(gpiochip,
 				 "failed to create IRQ mapping for GPIO#%u\n",
@@ -1818,7 +1818,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
  */
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 {
-	unsigned int offset;
+	unsigned int offset, irq;
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
@@ -1838,14 +1838,16 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 	}
 
 	/* Remove all IRQ mappings and delete the domain */
-	if (gpiochip->irqdomain) {
+	if (gpiochip->irq.domain) {
 		for (offset = 0; offset < gpiochip->ngpio; offset++) {
 			if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
 				continue;
-			irq_dispose_mapping(
-				irq_find_mapping(gpiochip->irqdomain, offset));
+
+			irq = irq_find_mapping(gpiochip->irq.domain, offset);
+			irq_dispose_mapping(irq);
 		}
-		irq_domain_remove(gpiochip->irqdomain);
+
+		irq_domain_remove(gpiochip->irq.domain);
 	}
 
 	if (gpiochip->irqchip) {
@@ -1934,10 +1936,10 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->lock_key = lock_key;
-	gpiochip->irqdomain = irq_domain_add_simple(of_node,
+	gpiochip->irq.domain = irq_domain_add_simple(of_node,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
-	if (!gpiochip->irqdomain) {
+	if (!gpiochip->irq.domain) {
 		gpiochip->irqchip = NULL;
 		return -EINVAL;
 	}
@@ -1960,7 +1962,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	for (offset = 0; offset < gpiochip->ngpio; offset++) {
 		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
 			continue;
-		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
+		irq_base = irq_create_mapping(gpiochip->irq.domain, offset);
 		if (!irq_base_set) {
 			/*
 			 * Store the base into the gpiochip to be used when
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 85d009112864..d2085252e9a7 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -384,7 +384,7 @@ static void bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
 		/* FIXME: no clue why the code looks up the type here */
 		type = pc->irq_type[gpio];
 
-		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irqdomain,
+		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
 						     gpio));
 	}
 }
@@ -666,7 +666,7 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
 	const char *fname = bcm2835_functions[fsel];
 	int value = bcm2835_gpio_get_bit(pc, GPLEV0, offset);
-	int irq = irq_find_mapping(chip->irqdomain, offset);
+	int irq = irq_find_mapping(chip->irq.domain, offset);
 
 	seq_printf(s, "function %s in %s; irq %d (%s)",
 		fname, value ? "hi" : "lo",
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index af5e904d4a1e..4eaf8baf2ba1 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -170,7 +170,7 @@ static void iproc_gpio_irq_handler(struct irq_desc *desc)
 
 		for_each_set_bit(bit, &val, NGPIOS_PER_BANK) {
 			unsigned pin = NGPIOS_PER_BANK * i + bit;
-			int child_irq = irq_find_mapping(gc->irqdomain, pin);
+			int child_irq = irq_find_mapping(gc->irq.domain, pin);
 
 			/*
 			 * Clear the interrupt before invoking the
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index fa3c5758ac67..f49cc7ce68fc 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1627,7 +1627,7 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 		pending = readl(reg);
 		raw_spin_unlock(&vg->lock);
 		for_each_set_bit(pin, &pending, 32) {
-			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
+			virq = irq_find_mapping(vg->chip.irq.domain, base + pin);
 			generic_handle_irq(virq);
 		}
 	}
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 83640afd825c..13bd1ced5104 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1522,7 +1522,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 		unsigned irq, offset;
 
 		offset = pctrl->intr_lines[intr_line];
-		irq = irq_find_mapping(gc->irqdomain, offset);
+		irq = irq_find_mapping(gc->irq.domain, offset);
 		generic_handle_irq(irq);
 	}
 
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 592b465e981e..45dabfd57b9c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -958,7 +958,7 @@ static irqreturn_t intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 			if (padno >= community->npins)
 				break;
 
-			irq = irq_find_mapping(gc->irqdomain,
+			irq = irq_find_mapping(gc->irq.domain,
 					       community->pin_base + padno);
 			generic_handle_irq(irq);
 
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index d318ca055489..487841499ba9 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -413,7 +413,7 @@ nmk_gpio_disable_lazy_irq(struct nmk_gpio_chip *nmk_chip, unsigned offset)
 	u32 falling = nmk_chip->fimsc & BIT(offset);
 	u32 rising = nmk_chip->rimsc & BIT(offset);
 	int gpio = nmk_chip->chip.base + offset;
-	int irq = irq_find_mapping(nmk_chip->chip.irqdomain, offset);
+	int irq = irq_find_mapping(nmk_chip->chip.irq.domain, offset);
 	struct irq_data *d = irq_get_irq_data(irq);
 
 	if (!rising && !falling)
@@ -815,7 +815,7 @@ static void __nmk_gpio_irq_handler(struct irq_desc *desc, u32 status)
 	while (status) {
 		int bit = __ffs(status);
 
-		generic_handle_irq(irq_find_mapping(chip->irqdomain, bit));
+		generic_handle_irq(irq_find_mapping(chip->irq.domain, bit));
 		status &= ~BIT(bit);
 	}
 
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1482d132fbb8..7c8f6bc127f3 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -531,7 +531,7 @@ static void amd_gpio_irq_handler(struct irq_desc *desc)
 						(off * 4 + i) * 4);
 				if ((pin_reg & BIT(INTERRUPT_STS_OFF)) ||
 					(pin_reg & BIT(WAKE_STS_OFF))) {
-					irq = irq_find_mapping(gc->irqdomain,
+					irq = irq_find_mapping(gc->irq.domain,
 								off * 4 + i);
 					generic_handle_irq(irq);
 					writel(pin_reg,
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 569bc28cb909..03492e3c09fa 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1603,7 +1603,7 @@ static void gpio_irq_handler(struct irq_desc *desc)
 
 		for_each_set_bit(n, &isr, BITS_PER_LONG) {
 			generic_handle_irq(irq_find_mapping(
-					   gpio_chip->irqdomain, n));
+					   gpio_chip->irq.domain, n));
 		}
 	}
 	chained_irq_exit(chip, desc);
diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index 741b39eaeb8b..5b3af065d734 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -517,7 +517,7 @@ static void u300_gpio_irq_handler(struct irq_desc *desc)
 
 		for_each_set_bit(irqoffset, &val, U300_GPIO_PINS_PER_PORT) {
 			int offset = pinoffset + irqoffset;
-			int pin_irq = irq_find_mapping(chip->irqdomain, offset);
+			int pin_irq = irq_find_mapping(chip->irq.domain, offset);
 
 			dev_dbg(gpio->dev, "GPIO IRQ %d on pin %d\n",
 				pin_irq, offset);
diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index 494ec9a7573a..53ec22a51f5c 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -1064,7 +1064,7 @@ static void oxnas_gpio_irq_handler(struct irq_desc *desc)
 	stat = readl(bank->reg_base + IRQ_PENDING);
 
 	for_each_set_bit(pin, &stat, BITS_PER_LONG)
-		generic_handle_irq(irq_linear_revmap(gc->irqdomain, pin));
+		generic_handle_irq(irq_linear_revmap(gc->irq.domain, pin));
 
 	chained_irq_exit(chip, desc);
 }
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 31ceb958b3fe..96390228d388 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2106,7 +2106,7 @@ static void pic32_gpio_irq_handler(struct irq_desc *desc)
 	pending = pic32_gpio_get_pending(gc, stat);
 
 	for_each_set_bit(pin, &pending, BITS_PER_LONG)
-		generic_handle_irq(irq_linear_revmap(gc->irqdomain, pin));
+		generic_handle_irq(irq_linear_revmap(gc->irq.domain, pin));
 
 	chained_irq_exit(chip, desc);
 }
diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 55375b1b3cc8..302190d1558d 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1307,7 +1307,7 @@ static void pistachio_gpio_irq_handler(struct irq_desc *desc)
 	pending = gpio_readl(bank, GPIO_INTERRUPT_STATUS) &
 		gpio_readl(bank, GPIO_INTERRUPT_EN);
 	for_each_set_bit(pin, &pending, 16)
-		generic_handle_irq(irq_linear_revmap(gc->irqdomain, pin));
+		generic_handle_irq(irq_linear_revmap(gc->irq.domain, pin));
 	chained_irq_exit(chip, desc);
 }
 
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 3ae8066bc127..c85449ea1ecb 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1408,7 +1408,7 @@ static void __gpio_irq_handler(struct st_gpio_bank *bank)
 					continue;
 			}
 
-			generic_handle_irq(irq_find_mapping(bank->gpio_chip.irqdomain, n));
+			generic_handle_irq(irq_find_mapping(bank->gpio_chip.irq.domain, n));
 		}
 	}
 }
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 7450f5118445..7db4f6a6eb17 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -561,7 +561,7 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 
 	status = val;
 	for_each_set_bit(n, &status, pctl->data->ngpios)
-		handle_nested_irq(irq_find_mapping(pctl->gpio.irqdomain, n));
+		handle_nested_irq(irq_find_mapping(pctl->gpio.irq.domain, n));
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 273badd92561..eab6936bf0bf 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -782,7 +782,7 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 		g = &pctrl->soc->groups[i];
 		val = readl(pctrl->regs + g->intr_status_reg);
 		if (val & BIT(g->intr_status_bit)) {
-			irq_pin = irq_find_mapping(gc->irqdomain, i);
+			irq_pin = irq_find_mapping(gc->irq.domain, i);
 			generic_handle_irq(irq_pin);
 			handled++;
 		}
diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 1efa315a7dbe..36b5c8d5471e 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5820,7 +5820,7 @@ static void atlas7_gpio_handle_irq(struct irq_desc *desc)
 				__func__, gc->label,
 				bank->gpio_offset + pin_in_bank);
 			generic_handle_irq(
-				irq_find_mapping(gc->irqdomain,
+				irq_find_mapping(gc->irq.domain,
 					bank->gpio_offset + pin_in_bank));
 		}
 
diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 0df72be60704..1eca39f2cdac 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -587,7 +587,7 @@ static void sirfsoc_gpio_handle_irq(struct irq_desc *desc)
 		if ((status & 0x1) && (ctrl & SIRFSOC_GPIO_CTL_INTR_EN_MASK)) {
 			pr_debug("%s: gpio id %d idx %d happens\n",
 				__func__, bank->id, idx);
-			generic_handle_irq(irq_find_mapping(gc->irqdomain, idx +
+			generic_handle_irq(irq_find_mapping(gc->irq.domain, idx +
 					bank->id * SIRFSOC_GPIO_BANK_SIZE));
 		}
 
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index cf6d68c7345b..72ae6bccee55 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -401,7 +401,7 @@ static void plgpio_irq_handler(struct irq_desc *desc)
 			/* get correct irq line number */
 			pin = i * MAX_GPIO_PER_REG + pin;
 			generic_handle_irq(
-				irq_find_mapping(gc->irqdomain, pin));
+				irq_find_mapping(gc->irq.domain, pin));
 		}
 	}
 	chained_irq_exit(irqchip, desc);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 07d93ffb49af..361b34bd970c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -25,6 +25,8 @@ struct module;
  * @chip: GPIO IRQ chip implementation, provided by GPIO driver
  * @first: if not dynamically assigned, the base (first) IRQ to allocate GPIO
  *         chip IRQs from
+ * @domain: interrupt translation domain; responsible for mapping
+ *          between GPIO hwirq number and linux irq number
  * @domain_ops: table of interrupt domain operations for this IRQ chip
  * @handler: the interrupt handler for the GPIO chip's parent interrupts
  * @lock_key: per GPIO IRQ chip lockdep class
@@ -41,6 +43,7 @@ struct module;
 struct gpio_irq_chip {
 	struct irq_chip *chip;
 	unsigned int first;
+	struct irq_domain *domain;
 	const struct irq_domain_ops *domain_ops;
 	irq_flow_handler_t handler;
 	struct lock_class_key *lock_key;
@@ -116,8 +119,6 @@ struct gpio_irq_chip {
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
  * @irqchip: GPIO IRQ chip impl, provided by GPIO driver
- * @irqdomain: Interrupt translation domain; responsible for mapping
- *	between GPIO hwirq number and linux irq number
  * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
  * @irq_handler: the irq handler to use (often a predefined irq core function)
  *	for GPIO IRQs, provided by GPIO driver
@@ -198,7 +199,6 @@ struct gpio_chip {
 	 * to handle IRQs for most practical cases.
 	 */
 	struct irq_chip		*irqchip;
-	struct irq_domain	*irqdomain;
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
-- 
2.12.0
