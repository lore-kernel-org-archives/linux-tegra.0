From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 03/16] gpio: Move irqdomain into struct gpio_irq_chip
Date: Thu, 28 Sep 2017 11:56:15 +0200
Message-ID: <20170928095628.21966-4-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to consolidate the multiple ways to associate an IRQ chip with
a GPIO chip, move more fields into the new struct gpio_irq_chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/gpio/driver.txt               |  2 +-
 drivers/bcma/driver_gpio.c                  |  2 +-
 drivers/gpio/gpio-104-dio-48e.c             |  2 +-
 drivers/gpio/gpio-104-idi-48.c              |  2 +-
 drivers/gpio/gpio-104-idio-16.c             |  2 +-
 drivers/gpio/gpio-adnp.c                    |  2 +-
 drivers/gpio/gpio-altera.c                  |  4 ++--
 drivers/gpio/gpio-aspeed.c                  |  2 +-
 drivers/gpio/gpio-ath79.c                   |  2 +-
 drivers/gpio/gpio-brcmstb.c                 |  2 +-
 drivers/gpio/gpio-crystalcove.c             |  2 +-
 drivers/gpio/gpio-dln2.c                    |  2 +-
 drivers/gpio/gpio-ftgpio010.c               |  2 +-
 drivers/gpio/gpio-ingenic.c                 |  2 +-
 drivers/gpio/gpio-intel-mid.c               |  2 +-
 drivers/gpio/gpio-lynxpoint.c               |  2 +-
 drivers/gpio/gpio-max732x.c                 |  2 +-
 drivers/gpio/gpio-merrifield.c              |  2 +-
 drivers/gpio/gpio-omap.c                    |  2 +-
 drivers/gpio/gpio-pca953x.c                 |  2 +-
 drivers/gpio/gpio-pcf857x.c                 |  2 +-
 drivers/gpio/gpio-pci-idio-16.c             |  2 +-
 drivers/gpio/gpio-pl061.c                   |  2 +-
 drivers/gpio/gpio-rcar.c                    |  2 +-
 drivers/gpio/gpio-reg.c                     |  4 ++--
 drivers/gpio/gpio-stmpe.c                   |  2 +-
 drivers/gpio/gpio-tc3589x.c                 |  2 +-
 drivers/gpio/gpio-vf610.c                   |  2 +-
 drivers/gpio/gpio-wcove.c                   |  2 +-
 drivers/gpio/gpio-ws16c48.c                 |  2 +-
 drivers/gpio/gpio-xgene-sb.c                |  2 +-
 drivers/gpio/gpio-xlp.c                     |  2 +-
 drivers/gpio/gpio-zx.c                      |  2 +-
 drivers/gpio/gpio-zynq.c                    |  2 +-
 drivers/gpio/gpiolib.c                      | 32 +++++++++++++++--------------
 drivers/pinctrl/bcm/pinctrl-bcm2835.c       |  5 +++--
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    |  2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c    |  2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c  |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c       |  2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  2 +-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c   |  4 ++--
 drivers/pinctrl/pinctrl-amd.c               |  2 +-
 drivers/pinctrl/pinctrl-at91.c              |  2 +-
 drivers/pinctrl/pinctrl-coh901.c            |  2 +-
 drivers/pinctrl/pinctrl-mcp23s08.c          |  2 +-
 drivers/pinctrl/pinctrl-oxnas.c             |  2 +-
 drivers/pinctrl/pinctrl-pic32.c             |  2 +-
 drivers/pinctrl/pinctrl-pistachio.c         |  2 +-
 drivers/pinctrl/pinctrl-st.c                |  2 +-
 drivers/pinctrl/pinctrl-sx150x.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c          |  2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c       |  2 +-
 drivers/pinctrl/sirf/pinctrl-sirf.c         |  2 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c      |  2 +-
 drivers/platform/x86/intel_int0002_vgpio.c  |  2 +-
 include/linux/gpio/driver.h                 | 11 +++++++---
 57 files changed, 85 insertions(+), 77 deletions(-)

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
index 982d5781d3ce..2c0ffb77d738 100644
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
index 598e209efa2d..bab3b94c5cbc 100644
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
index 51f046e29ff7..add859d59766 100644
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
index ec2ce34ff473..2f16638a0589 100644
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
index ccc02ed65b3c..8e76d390e653 100644
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
index bfc53995064a..a9342b471359 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -466,7 +466,7 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
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
index 27e92e57adae..db5c37a628f7 100644
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
index e60156ec0c18..b6f0f729656c 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -295,7 +295,7 @@ static irqreturn_t crystalcove_gpio_irq_handler(int irq, void *data)
 
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
diff --git a/drivers/gpio/gpio-ingenic.c b/drivers/gpio/gpio-ingenic.c
index 254780730b95..15fb2bc796a8 100644
--- a/drivers/gpio/gpio-ingenic.c
+++ b/drivers/gpio/gpio-ingenic.c
@@ -242,7 +242,7 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 		flag = gpio_ingenic_read_reg(jzgc, JZ4740_GPIO_FLAG);
 
 	for_each_set_bit(i, &flag, 32)
-		generic_handle_irq(irq_linear_revmap(gc->irqdomain, i));
+		generic_handle_irq(irq_linear_revmap(gc->irq.domain, i));
 	chained_irq_exit(irq_chip, desc);
 }
 
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
index 7f4d26ce5f23..c04fae1ba32a 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -486,7 +486,7 @@ static irqreturn_t max732x_irq_handler(int irq, void *devid)
 
 	do {
 		level = __ffs(pending);
-		handle_nested_irq(irq_find_mapping(chip->gpio_chip.irqdomain,
+		handle_nested_irq(irq_find_mapping(chip->gpio_chip.irq.domain,
 						   level));
 
 		pending &= ~(1 << level);
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index ec8560298805..dd67a31ac337 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -357,7 +357,7 @@ static void mrfld_irq_handler(struct irq_desc *desc)
 		for_each_set_bit(gpio, &pending, 32) {
 			unsigned int irq;
 
-			irq = irq_find_mapping(gc->irqdomain, base + gpio);
+			irq = irq_find_mapping(gc->irq.domain, base + gpio);
 			generic_handle_irq(irq);
 		}
 	}
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 22d7d4838265..9779eaf35504 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -733,7 +733,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 
 			raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
 
-			generic_handle_irq(irq_find_mapping(bank->chip.irqdomain,
+			generic_handle_irq(irq_find_mapping(bank->chip.irq.domain,
 							    bit));
 
 			raw_spin_unlock_irqrestore(&bank->wa_lock,
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1b9dbf691ae7..babb7bd2ba59 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -608,7 +608,7 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	for (i = 0; i < NBANK(chip); i++) {
 		while (pending[i]) {
 			level = __ffs(pending[i]);
-			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irqdomain,
+			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irq.domain,
 							level + (BANK_SZ * i)));
 			pending[i] &= ~(1 << level);
 			nhandled++;
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index a4fd78b9c0e4..38fbb420c6cd 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -196,7 +196,7 @@ static irqreturn_t pcf857x_irq(int irq, void *data)
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
index 6aaaab79c205..b70974cb9ef1 100644
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
index 1f0871553fd2..5bd1339d5a48 100644
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
index cbe9e06861de..4610cc2938ad 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -160,7 +160,7 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
 		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
 
-		generic_handle_irq(irq_find_mapping(port->gc.irqdomain, pin));
+		generic_handle_irq(irq_find_mapping(port->gc.irq.domain, pin));
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 85341eab795d..dde7c6aecbb5 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -350,7 +350,7 @@ static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
 			offset = (gpio > GROUP0_NR_IRQS) ? 1 : 0;
 			mask = (offset == 1) ? BIT(gpio - GROUP0_NR_IRQS) :
 								BIT(gpio);
-			virq = irq_find_mapping(wg->chip.irqdomain, gpio);
+			virq = irq_find_mapping(wg->chip.irq.domain, gpio);
 			handle_nested_irq(virq);
 			regmap_update_bits(wg->regmap, IRQ_STATUS_BASE + offset,
 								mask, mask);
diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 5037974ac063..746648244bf3 100644
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
index ad8cb9c27eee..2313af82fad3 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -289,7 +289,7 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
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
index b3cc948a2d8b..75ee877e5cd5 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -562,7 +562,7 @@ static void zynq_gpio_handle_bank_irq(struct zynq_gpio *gpio,
 				      unsigned long pending)
 {
 	unsigned int bank_offset = gpio->p_data->bank_min[bank_num];
-	struct irq_domain *irqdomain = gpio->chip.irqdomain;
+	struct irq_domain *irqdomain = gpio->chip.irq.domain;
 	int offset;
 
 	if (!pending)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 450007ac1fc0..f4e18e0ffb56 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1549,7 +1549,7 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 {
 	unsigned int offset;
 
-	if (!gpiochip->irqdomain) {
+	if (!gpiochip->irq.domain) {
 		chip_err(gpiochip, "called %s before setting up irqchip\n",
 			 __func__);
 		return;
@@ -1576,7 +1576,7 @@ static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
 	for (offset = 0; offset < gpiochip->ngpio; offset++) {
 		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
 			continue;
-		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
+		irq_set_parent(irq_find_mapping(gpiochip->irq.domain, offset),
 			       parent_irq);
 	}
 }
@@ -1709,7 +1709,7 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
-	return irq_create_mapping(chip->irqdomain, offset);
+	return irq_create_mapping(chip->irq.domain, offset);
 }
 
 /**
@@ -1769,10 +1769,10 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 	else
 		ops = &gpiochip_domain_ops;
 
-	gpiochip->irqdomain = irq_domain_add_simple(np, gpiochip->ngpio,
-						    gpiochip->irq_base,
-						    ops, gpiochip);
-	if (!gpiochip->irqdomain)
+	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
+						     gpiochip->irq_base,
+						     ops, gpiochip);
+	if (!gpiochip->irq.domain)
 		return -EINVAL;
 
 	/*
@@ -1814,7 +1814,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
 		if (!gpiochip_irqchip_irq_valid(gpiochip, i))
 			continue;
 
-		irq = irq_create_mapping(gpiochip->irqdomain, i);
+		irq = irq_create_mapping(gpiochip->irq.domain, i);
 		if (!irq) {
 			chip_err(gpiochip,
 				 "failed to create IRQ mapping for GPIO#%u\n",
@@ -1838,7 +1838,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
  */
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 {
-	unsigned int offset;
+	unsigned int offset, irq;
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
@@ -1858,14 +1858,16 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
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
 
 	if (gpiochip->irq.chip) {
@@ -1951,10 +1953,10 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 	gpiochip->irq_default_type = type;
 	gpiochip->to_irq = gpiochip_to_irq;
 	gpiochip->lock_key = lock_key;
-	gpiochip->irqdomain = irq_domain_add_simple(of_node,
+	gpiochip->irq.domain = irq_domain_add_simple(of_node,
 					gpiochip->ngpio, first_irq,
 					&gpiochip_domain_ops, gpiochip);
-	if (!gpiochip->irqdomain) {
+	if (!gpiochip->irq.domain) {
 		gpiochip->irq.chip = NULL;
 		return -EINVAL;
 	}
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index ff782445dfb7..aec71d1a7478 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -379,7 +379,8 @@ static void bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
 	events &= pc->enabled_irq_map[bank];
 	for_each_set_bit(offset, &events, 32) {
 		gpio = (32 * bank) + offset;
-		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irqdomain,
+
+		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
 						     gpio));
 	}
 }
@@ -661,7 +662,7 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
 	const char *fname = bcm2835_functions[fsel];
 	int value = bcm2835_gpio_get_bit(pc, GPLEV0, offset);
-	int irq = irq_find_mapping(chip->irqdomain, offset);
+	int irq = irq_find_mapping(chip->irq.domain, offset);
 
 	seq_printf(s, "function %s in %s; irq %d (%s)",
 		fname, value ? "hi" : "lo",
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 85a8c97d9dfe..b93f62dc8733 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -172,7 +172,7 @@ static void iproc_gpio_irq_handler(struct irq_desc *desc)
 
 		for_each_set_bit(bit, &val, NGPIOS_PER_BANK) {
 			unsigned pin = NGPIOS_PER_BANK * i + bit;
-			int child_irq = irq_find_mapping(gc->irqdomain, pin);
+			int child_irq = irq_find_mapping(gc->irq.domain, pin);
 
 			/*
 			 * Clear the interrupt before invoking the
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 0f3a02495aeb..5897981e5ed3 100644
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
index 8d50eaec9577..15166799528f 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1523,7 +1523,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 		unsigned irq, offset;
 
 		offset = pctrl->intr_lines[intr_line];
-		irq = irq_find_mapping(gc->irqdomain, offset);
+		irq = irq_find_mapping(gc->irq.domain, offset);
 		generic_handle_irq(irq);
 	}
 
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 71df0f70b61f..ffda27bfd133 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1005,7 +1005,7 @@ static irqreturn_t intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 			if (padno >= community->npins)
 				break;
 
-			irq = irq_find_mapping(gc->irqdomain,
+			irq = irq_find_mapping(gc->irq.domain,
 					       community->pin_base + padno);
 			generic_handle_irq(irq);
 
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 71b944748304..c9851bd120b4 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -592,7 +592,7 @@ static void armada_37xx_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(gc);
-	struct irq_domain *d = gc->irqdomain;
+	struct irq_domain *d = gc->irq.domain;
 	int i;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index a53f1a9b1ed2..f0e7a8c114b2 100644
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
index d10d280ab1c9..b9c0dd75319e 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -532,7 +532,7 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 			regval = readl(regs + i);
 			if (!(regval & PIN_IRQ_PENDING))
 				continue;
-			irq = irq_find_mapping(gc->irqdomain, irqnr + i);
+			irq = irq_find_mapping(gc->irq.domain, irqnr + i);
 			generic_handle_irq(irq);
 			/* Clear interrupt */
 			writel(regval, regs + i);
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
index ac155e7d3412..7939b178c6ae 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -517,7 +517,7 @@ static void u300_gpio_irq_handler(struct irq_desc *desc)
 
 		for_each_set_bit(irqoffset, &val, U300_GPIO_PINS_PER_PORT) {
 			int offset = pinoffset + irqoffset;
-			int pin_irq = irq_find_mapping(chip->irqdomain, offset);
+			int pin_irq = irq_find_mapping(chip->irq.domain, offset);
 
 			dev_dbg(gpio->dev, "GPIO IRQ %d on pin %d\n",
 				pin_irq, offset);
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3e40d4245512..db19a2f2f575 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -537,7 +537,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		    ((gpio_bit_changed || intcap_changed) &&
 			(BIT(i) & mcp->irq_fall) && !gpio_set) ||
 		    defval_changed) {
-			child_irq = irq_find_mapping(mcp->chip.irqdomain, i);
+			child_irq = irq_find_mapping(mcp->chip.irq.domain, i);
 			handle_nested_irq(child_irq);
 		}
 	}
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
index a5205b94b2e6..2081c67667a8 100644
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
index ff491da64dab..7a960590ecaa 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -795,7 +795,7 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 		g = &pctrl->soc->groups[i];
 		val = readl(pctrl->regs + g->intr_status_reg);
 		if (val & BIT(g->intr_status_bit)) {
-			irq_pin = irq_find_mapping(gc->irqdomain, i);
+			irq_pin = irq_find_mapping(gc->irq.domain, i);
 			generic_handle_irq(irq_pin);
 			handled++;
 		}
diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 4db9323251e3..f5cef6e5fa3e 100644
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
index d3ef05973901..8b14a1f1e671 100644
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
diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index 92dc230ef5b2..f6b3af73dea5 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -119,7 +119,7 @@ static irqreturn_t int0002_irq(int irq, void *data)
 	if (!(gpe_sts_reg & GPE0A_PME_B0_STS_BIT))
 		return IRQ_NONE;
 
-	generic_handle_irq(irq_find_mapping(chip->irqdomain,
+	generic_handle_irq(irq_find_mapping(chip->irq.domain,
 					    GPE0A_PME_B0_VIRT_GPIO_PIN));
 
 	pm_system_wakeup();
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 974247646886..031037bb8670 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -31,6 +31,14 @@ struct gpio_irq_chip {
 	 */
 	struct irq_chip *chip;
 
+	/**
+	 * @domain:
+	 *
+	 * Interrupt translation domain; responsible for mapping between GPIO
+	 * hwirq number and Linux IRQ number.
+	 */
+	struct irq_domain *domain;
+
 	/**
 	 * @domain_ops:
 	 *
@@ -144,8 +152,6 @@ static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
  *	safely.
  * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
  *	direction safely.
- * @irqdomain: Interrupt translation domain; responsible for mapping
- *	between GPIO hwirq number and linux irq number
  * @irq_base: first linux IRQ number assigned to GPIO IRQ chip (deprecated)
  * @irq_handler: the irq handler to use (often a predefined irq core function)
  *	for GPIO IRQs, provided by GPIO driver
@@ -226,7 +232,6 @@ struct gpio_chip {
 	 * With CONFIG_GPIOLIB_IRQCHIP we get an irqchip inside the gpiolib
 	 * to handle IRQs for most practical cases.
 	 */
-	struct irq_domain	*irqdomain;
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
-- 
2.14.1
