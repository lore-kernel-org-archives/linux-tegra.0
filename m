From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 12/16] gpio: omap: Fix checkpatch warnings
Date: Thu, 28 Sep 2017 11:56:24 +0200
Message-ID: <20170928095628.21966-13-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use unsigned int rather than unsigned, wrap lines longer than 80
characters and other minor coding style cleanups.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-omap.c | 113 ++++++++++++++++++++++++++---------------------
 1 file changed, 63 insertions(+), 50 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 9779eaf35504..81a70a1edaf5 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -76,7 +76,8 @@ struct gpio_bank {
 	int power_mode;
 	bool workaround_enabled;
 
-	void (*set_dataout)(struct gpio_bank *bank, unsigned gpio, int enable);
+	void (*set_dataout)(struct gpio_bank *bank, unsigned int gpio,
+			    int enable);
 	int (*get_context_loss_count)(struct device *dev);
 
 	struct omap_gpio_reg_offs *regs;
@@ -92,6 +93,7 @@ static void omap_gpio_unmask_irq(struct irq_data *d);
 static inline struct gpio_bank *omap_irq_data_get_bank(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
 	return gpiochip_get_data(chip);
 }
 
@@ -113,8 +115,8 @@ static void omap_set_gpio_direction(struct gpio_bank *bank, int gpio,
 
 
 /* set data out value using dedicate set/clear register */
-static void omap_set_gpio_dataout_reg(struct gpio_bank *bank, unsigned offset,
-				      int enable)
+static void omap_set_gpio_dataout_reg(struct gpio_bank *bank,
+				      unsigned int offset, int enable)
 {
 	void __iomem *reg = bank->base;
 	u32 l = BIT(offset);
@@ -131,8 +133,8 @@ static void omap_set_gpio_dataout_reg(struct gpio_bank *bank, unsigned offset,
 }
 
 /* set data out value using mask register */
-static void omap_set_gpio_dataout_mask(struct gpio_bank *bank, unsigned offset,
-				       int enable)
+static void omap_set_gpio_dataout_mask(struct gpio_bank *bank,
+				       unsigned int offset, int enable)
 {
 	void __iomem *reg = bank->base + bank->regs->dataout;
 	u32 gpio_bit = BIT(offset);
@@ -161,7 +163,8 @@ static int omap_get_gpio_dataout(struct gpio_bank *bank, int offset)
 	return (readl_relaxed(reg) & (BIT(offset))) != 0;
 }
 
-static inline void omap_gpio_rmw(void __iomem *base, u32 reg, u32 mask, bool set)
+static inline void omap_gpio_rmw(void __iomem *base, u32 reg, u32 mask,
+				 bool set)
 {
 	int l = readl_relaxed(base + reg);
 
@@ -211,8 +214,8 @@ static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
  *
  * Return: 0 on success, negative error otherwise.
  */
-static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
-				   unsigned debounce)
+static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned int offset,
+				   unsigned int debounce)
 {
 	void __iomem		*reg;
 	u32			val;
@@ -272,7 +275,8 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
  * time too. The debounce clock will also be disabled when calling this function
  * if this is the only gpio in the bank using debounce.
  */
-static void omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned offset)
+static void omap_clear_gpio_debounce(struct gpio_bank *bank,
+				     unsigned int offset)
 {
 	u32 gpio_bit = BIT(offset);
 
@@ -284,8 +288,8 @@ static void omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned offset)
 
 	bank->dbck_enable_mask &= ~gpio_bit;
 	bank->context.debounce_en &= ~gpio_bit;
-        writel_relaxed(bank->context.debounce_en,
-		     bank->base + bank->regs->debounce_en);
+	writel_relaxed(bank->context.debounce_en,
+		       bank->base + bank->regs->debounce_en);
 
 	if (!bank->dbck_enable_mask) {
 		bank->context.debounce = 0;
@@ -297,7 +301,7 @@ static void omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned offset)
 }
 
 static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
-						unsigned trigger)
+					 unsigned int trigger)
 {
 	void __iomem *base = bank->base;
 	u32 gpio_bit = BIT(gpio);
@@ -321,7 +325,8 @@ static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
 			readl_relaxed(bank->base + bank->regs->fallingdetect);
 
 	if (likely(!(bank->non_wakeup_gpios & gpio_bit))) {
-		omap_gpio_rmw(base, bank->regs->wkup_en, gpio_bit, trigger != 0);
+		omap_gpio_rmw(base, bank->regs->wkup_en, gpio_bit,
+			      trigger != 0);
 		bank->context.wake_en =
 			readl_relaxed(bank->base + bank->regs->wkup_en);
 	}
@@ -376,11 +381,13 @@ static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
 	writel_relaxed(l, reg);
 }
 #else
-static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio) {}
+static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
+{
+}
 #endif
 
 static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
-				    unsigned trigger)
+				    unsigned int trigger)
 {
 	void __iomem *reg = bank->base;
 	void __iomem *base = bank->base;
@@ -425,7 +432,7 @@ static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
 	return 0;
 }
 
-static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned offset)
+static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned int offset)
 {
 	if (bank->regs->pinctrl) {
 		void __iomem *reg = bank->base + bank->regs->pinctrl;
@@ -446,7 +453,8 @@ static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned offset)
 	}
 }
 
-static void omap_disable_gpio_module(struct gpio_bank *bank, unsigned offset)
+static void omap_disable_gpio_module(struct gpio_bank *bank,
+				     unsigned int offset)
 {
 	void __iomem *base = bank->base;
 
@@ -471,14 +479,14 @@ static void omap_disable_gpio_module(struct gpio_bank *bank, unsigned offset)
 	}
 }
 
-static int omap_gpio_is_input(struct gpio_bank *bank, unsigned offset)
+static int omap_gpio_is_input(struct gpio_bank *bank, unsigned int offset)
 {
 	void __iomem *reg = bank->base + bank->regs->direction;
 
 	return readl_relaxed(reg) & BIT(offset);
 }
 
-static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned offset)
+static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned int offset)
 {
 	if (!LINE_USED(bank->mod_usage, offset)) {
 		omap_enable_gpio_module(bank, offset);
@@ -487,12 +495,12 @@ static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned offset)
 	bank->irq_usage |= BIT(offset);
 }
 
-static int omap_gpio_irq_type(struct irq_data *d, unsigned type)
+static int omap_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 	int retval;
 	unsigned long flags;
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 
 	if (type & ~IRQ_TYPE_SENSE_MASK)
 		return -EINVAL;
@@ -544,7 +552,7 @@ static void omap_clear_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
 }
 
 static inline void omap_clear_gpio_irqstatus(struct gpio_bank *bank,
-					     unsigned offset)
+					     unsigned int offset)
 {
 	omap_clear_gpio_irqbank(bank, BIT(offset));
 }
@@ -608,7 +616,7 @@ static void omap_disable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
 }
 
 static inline void omap_set_gpio_irqenable(struct gpio_bank *bank,
-					   unsigned offset, int enable)
+					   unsigned int offset, int enable)
 {
 	if (enable)
 		omap_enable_gpio_irqbank(bank, BIT(offset));
@@ -624,7 +632,7 @@ static int omap_gpio_wake_enable(struct irq_data *d, unsigned int enable)
 	return irq_set_irq_wake(bank->irq, enable);
 }
 
-static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -644,7 +652,7 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void omap_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -702,9 +710,11 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 		if (bank->level_mask)
 			level_mask = bank->level_mask & enabled;
 
-		/* clear edge sensitive interrupts before handler(s) are
-		called so that we don't miss any interrupt occurred while
-		executing them */
+		/*
+		 * clear edge sensitive interrupts before handler(s) are
+		 * called so that we don't miss any interrupt occurred while
+		 * executing them
+		 */
 		omap_disable_gpio_irqbank(bank, isr_saved & ~level_mask);
 		omap_clear_gpio_irqbank(bank, isr_saved & ~level_mask);
 		omap_enable_gpio_irqbank(bank, isr_saved & ~level_mask);
@@ -715,6 +725,8 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 			break;
 
 		while (isr) {
+			unsigned int irq;
+
 			bit = __ffs(isr);
 			isr &= ~(BIT(bit));
 
@@ -733,8 +745,8 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 
 			raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
 
-			generic_handle_irq(irq_find_mapping(bank->chip.irq.domain,
-							    bit));
+			irq = irq_find_mapping(bank->chip.irq.domain, bit);
+			generic_handle_irq(irq);
 
 			raw_spin_unlock_irqrestore(&bank->wa_lock,
 						   wa_lock_flags);
@@ -749,7 +761,7 @@ static unsigned int omap_gpio_irq_startup(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned long flags;
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 
@@ -773,7 +785,7 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned long flags;
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->irq_usage &= ~(BIT(offset));
@@ -809,7 +821,7 @@ static void gpio_irq_bus_sync_unlock(struct irq_data *data)
 static void omap_gpio_ack_irq(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 
 	omap_clear_gpio_irqstatus(bank, offset);
 }
@@ -817,7 +829,7 @@ static void omap_gpio_ack_irq(struct irq_data *d)
 static void omap_gpio_mask_irq(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
@@ -829,7 +841,7 @@ static void omap_gpio_mask_irq(struct irq_data *d)
 static void omap_gpio_unmask_irq(struct irq_data *d)
 {
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
-	unsigned offset = d->hwirq;
+	unsigned int offset = d->hwirq;
 	u32 trigger = irqd_get_trigger_type(d);
 	unsigned long flags;
 
@@ -837,8 +849,10 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	if (trigger)
 		omap_set_gpio_triggering(bank, offset, trigger);
 
-	/* For level-triggered GPIOs, the clearing must be done after
-	 * the HW source is cleared, thus after the handler has run */
+	/*
+	 * For level-triggered GPIOs, the clearing must be done after
+	 * the HW source is cleared, thus after the handler has run
+	 */
 	if (bank->level_mask & BIT(offset)) {
 		omap_set_gpio_irqenable(bank, offset, 0);
 		omap_clear_gpio_irqstatus(bank, offset);
@@ -912,7 +926,7 @@ static inline void omap_mpuio_init(struct gpio_bank *bank)
 
 /*---------------------------------------------------------------------*/
 
-static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -927,7 +941,7 @@ static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	return dir;
 }
 
-static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -939,7 +953,7 @@ static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int omap_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int omap_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_bank *bank;
 
@@ -951,7 +965,8 @@ static int omap_gpio_get(struct gpio_chip *chip, unsigned offset)
 		return omap_get_gpio_dataout(bank, offset);
 }
 
-static int omap_gpio_output(struct gpio_chip *chip, unsigned offset, int value)
+static int omap_gpio_output(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -964,8 +979,8 @@ static int omap_gpio_output(struct gpio_chip *chip, unsigned offset, int value)
 	return 0;
 }
 
-static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
-			      unsigned debounce)
+static int omap_gpio_debounce(struct gpio_chip *chip, unsigned int offset,
+			      unsigned int debounce)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -985,7 +1000,7 @@ static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 	return ret;
 }
 
-static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+static int omap_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				unsigned long config)
 {
 	u32 debounce;
@@ -997,7 +1012,8 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	return omap_gpio_debounce(chip, offset, debounce);
 }
 
-static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void omap_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -1153,10 +1169,8 @@ static int omap_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	bank = devm_kzalloc(dev, sizeof(struct gpio_bank), GFP_KERNEL);
-	if (!bank) {
-		dev_err(dev, "Memory alloc failed\n");
+	if (!bank)
 		return -ENOMEM;
-	}
 
 	irqc = devm_kzalloc(dev, sizeof(*irqc), GFP_KERNEL);
 	if (!irqc)
@@ -1217,9 +1231,8 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	/* Static mapping, never released */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	bank->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(bank->base)) {
+	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
-	}
 
 	if (bank->dbck_flag) {
 		bank->dbck = devm_clk_get(dev, "dbclk");
-- 
2.14.1
