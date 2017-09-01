From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/16] gpio: omap: Rename struct gpio_bank to struct omap_gpio_bank
Date: Fri,  1 Sep 2017 20:57:33 +0200
Message-ID: <20170901185736.28051-14-thierry.reding@gmail.com>
References: <20170901185736.28051-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901185736.28051-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Subsequent patches will want to introduce a struct gpio_bank in core
code, so rename this to something driver-specific in order to avoid the
names from clashing.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-omap.c | 131 ++++++++++++++++++++++++-----------------------
 1 file changed, 68 insertions(+), 63 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 7c600cec3e44..0b80d929d892 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -48,7 +48,7 @@ struct gpio_regs {
 	u32 debounce_en;
 };
 
-struct gpio_bank {
+struct omap_gpio_bank {
 	struct list_head node;
 	void __iomem *base;
 	int irq;
@@ -76,7 +76,7 @@ struct gpio_bank {
 	int power_mode;
 	bool workaround_enabled;
 
-	void (*set_dataout)(struct gpio_bank *bank, unsigned int gpio,
+	void (*set_dataout)(struct omap_gpio_bank *bank, unsigned int gpio,
 			    int enable);
 	int (*get_context_loss_count)(struct device *dev);
 
@@ -90,14 +90,14 @@ struct gpio_bank {
 
 static void omap_gpio_unmask_irq(struct irq_data *d);
 
-static inline struct gpio_bank *omap_irq_data_get_bank(struct irq_data *d)
+static inline struct omap_gpio_bank *omap_irq_data_get_bank(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
 	return gpiochip_get_data(chip);
 }
 
-static void omap_set_gpio_direction(struct gpio_bank *bank, int gpio,
+static void omap_set_gpio_direction(struct omap_gpio_bank *bank, int gpio,
 				    int is_input)
 {
 	void __iomem *reg = bank->base;
@@ -115,7 +115,7 @@ static void omap_set_gpio_direction(struct gpio_bank *bank, int gpio,
 
 
 /* set data out value using dedicate set/clear register */
-static void omap_set_gpio_dataout_reg(struct gpio_bank *bank,
+static void omap_set_gpio_dataout_reg(struct omap_gpio_bank *bank,
 				      unsigned int offset, int enable)
 {
 	void __iomem *reg = bank->base;
@@ -133,7 +133,7 @@ static void omap_set_gpio_dataout_reg(struct gpio_bank *bank,
 }
 
 /* set data out value using mask register */
-static void omap_set_gpio_dataout_mask(struct gpio_bank *bank,
+static void omap_set_gpio_dataout_mask(struct omap_gpio_bank *bank,
 				       unsigned int offset, int enable)
 {
 	void __iomem *reg = bank->base + bank->regs->dataout;
@@ -149,14 +149,14 @@ static void omap_set_gpio_dataout_mask(struct gpio_bank *bank,
 	bank->context.dataout = l;
 }
 
-static int omap_get_gpio_datain(struct gpio_bank *bank, int offset)
+static int omap_get_gpio_datain(struct omap_gpio_bank *bank, int offset)
 {
 	void __iomem *reg = bank->base + bank->regs->datain;
 
 	return (readl_relaxed(reg) & (BIT(offset))) != 0;
 }
 
-static int omap_get_gpio_dataout(struct gpio_bank *bank, int offset)
+static int omap_get_gpio_dataout(struct omap_gpio_bank *bank, int offset)
 {
 	void __iomem *reg = bank->base + bank->regs->dataout;
 
@@ -176,7 +176,7 @@ static inline void omap_gpio_rmw(void __iomem *base, u32 reg, u32 mask,
 	writel_relaxed(l, base + reg);
 }
 
-static inline void omap_gpio_dbck_enable(struct gpio_bank *bank)
+static inline void omap_gpio_dbck_enable(struct omap_gpio_bank *bank)
 {
 	if (bank->dbck_enable_mask && !bank->dbck_enabled) {
 		clk_enable(bank->dbck);
@@ -187,7 +187,7 @@ static inline void omap_gpio_dbck_enable(struct gpio_bank *bank)
 	}
 }
 
-static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
+static inline void omap_gpio_dbck_disable(struct omap_gpio_bank *bank)
 {
 	if (bank->dbck_enable_mask && bank->dbck_enabled) {
 		/*
@@ -214,8 +214,8 @@ static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
  *
  * Return: 0 on success, negative error otherwise.
  */
-static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned int offset,
-				   unsigned int debounce)
+static int omap2_set_gpio_debounce(struct omap_gpio_bank *bank,
+				   unsigned int offset, unsigned int debounce)
 {
 	void __iomem		*reg;
 	u32			val;
@@ -275,7 +275,7 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned int offset,
  * time too. The debounce clock will also be disabled when calling this function
  * if this is the only gpio in the bank using debounce.
  */
-static void omap_clear_gpio_debounce(struct gpio_bank *bank,
+static void omap_clear_gpio_debounce(struct omap_gpio_bank *bank,
 				     unsigned int offset)
 {
 	u32 gpio_bit = BIT(offset);
@@ -300,7 +300,7 @@ static void omap_clear_gpio_debounce(struct gpio_bank *bank,
 	}
 }
 
-static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
+static inline void omap_set_gpio_trigger(struct omap_gpio_bank *bank, int gpio,
 					 unsigned int trigger)
 {
 	void __iomem *base = bank->base;
@@ -362,7 +362,8 @@ static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
  * This only applies to chips that can't do both rising and falling edge
  * detection at once.  For all other chips, this function is a noop.
  */
-static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
+static void omap_toggle_gpio_edge_triggering(struct omap_gpio_bank *bank,
+					     int gpio)
 {
 	void __iomem *reg = bank->base;
 	u32 l = 0;
@@ -381,12 +382,13 @@ static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
 	writel_relaxed(l, reg);
 }
 #else
-static void omap_toggle_gpio_edge_triggering(struct gpio_bank *bank, int gpio)
+static void omap_toggle_gpio_edge_triggering(struct omap_gpio_bank *bank,
+					     int gpio)
 {
 }
 #endif
 
-static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
+static int omap_set_gpio_triggering(struct omap_gpio_bank *bank, int gpio,
 				    unsigned int trigger)
 {
 	void __iomem *reg = bank->base;
@@ -432,7 +434,8 @@ static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
 	return 0;
 }
 
-static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned int offset)
+static void omap_enable_gpio_module(struct omap_gpio_bank *bank,
+				    unsigned int offset)
 {
 	if (bank->regs->pinctrl) {
 		void __iomem *reg = bank->base + bank->regs->pinctrl;
@@ -453,7 +456,7 @@ static void omap_enable_gpio_module(struct gpio_bank *bank, unsigned int offset)
 	}
 }
 
-static void omap_disable_gpio_module(struct gpio_bank *bank,
+static void omap_disable_gpio_module(struct omap_gpio_bank *bank,
 				     unsigned int offset)
 {
 	void __iomem *base = bank->base;
@@ -479,14 +482,14 @@ static void omap_disable_gpio_module(struct gpio_bank *bank,
 	}
 }
 
-static int omap_gpio_is_input(struct gpio_bank *bank, unsigned int offset)
+static int omap_gpio_is_input(struct omap_gpio_bank *bank, unsigned int offset)
 {
 	void __iomem *reg = bank->base + bank->regs->direction;
 
 	return readl_relaxed(reg) & BIT(offset);
 }
 
-static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned int offset)
+static void omap_gpio_init_irq(struct omap_gpio_bank *bank, unsigned int offset)
 {
 	if (!LINE_USED(bank->mod_usage, offset)) {
 		omap_enable_gpio_module(bank, offset);
@@ -497,7 +500,7 @@ static void omap_gpio_init_irq(struct gpio_bank *bank, unsigned int offset)
 
 static int omap_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(d);
 	int retval;
 	unsigned long flags;
 	unsigned int offset = d->hwirq;
@@ -534,7 +537,7 @@ static int omap_gpio_irq_type(struct irq_data *d, unsigned int type)
 	return retval;
 }
 
-static void omap_clear_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
+static void omap_clear_gpio_irqbank(struct omap_gpio_bank *bank, int gpio_mask)
 {
 	void __iomem *reg = bank->base;
 
@@ -551,13 +554,13 @@ static void omap_clear_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
 	readl_relaxed(reg);
 }
 
-static inline void omap_clear_gpio_irqstatus(struct gpio_bank *bank,
+static inline void omap_clear_gpio_irqstatus(struct omap_gpio_bank *bank,
 					     unsigned int offset)
 {
 	omap_clear_gpio_irqbank(bank, BIT(offset));
 }
 
-static u32 omap_get_gpio_irqbank_mask(struct gpio_bank *bank)
+static u32 omap_get_gpio_irqbank_mask(struct omap_gpio_bank *bank)
 {
 	void __iomem *reg = bank->base;
 	u32 l;
@@ -571,7 +574,7 @@ static u32 omap_get_gpio_irqbank_mask(struct gpio_bank *bank)
 	return l;
 }
 
-static void omap_enable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
+static void omap_enable_gpio_irqbank(struct omap_gpio_bank *bank, int gpio_mask)
 {
 	void __iomem *reg = bank->base;
 	u32 l;
@@ -593,7 +596,8 @@ static void omap_enable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
 	writel_relaxed(l, reg);
 }
 
-static void omap_disable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
+static void omap_disable_gpio_irqbank(struct omap_gpio_bank *bank,
+				      int gpio_mask)
 {
 	void __iomem *reg = bank->base;
 	u32 l;
@@ -615,7 +619,7 @@ static void omap_disable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
 	writel_relaxed(l, reg);
 }
 
-static inline void omap_set_gpio_irqenable(struct gpio_bank *bank,
+static inline void omap_set_gpio_irqenable(struct omap_gpio_bank *bank,
 					   unsigned int offset, int enable)
 {
 	if (enable)
@@ -627,14 +631,14 @@ static inline void omap_set_gpio_irqenable(struct gpio_bank *bank,
 /* Use disable_irq_wake() and enable_irq_wake() functions from drivers */
 static int omap_gpio_wake_enable(struct irq_data *d, unsigned int enable)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(d);
 
 	return irq_set_irq_wake(bank->irq, enable);
 }
 
 static int omap_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gpio_bank *bank = gpiochip_get_data(chip);
+	struct omap_gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	/*
@@ -654,7 +658,7 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned int offset)
 
 static void omap_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gpio_bank *bank = gpiochip_get_data(chip);
+	struct omap_gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
@@ -688,7 +692,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 	void __iomem *isr_reg = NULL;
 	u32 isr;
 	unsigned int bit;
-	struct gpio_bank *bank = gpiobank;
+	struct omap_gpio_bank *bank = gpiobank;
 	unsigned long wa_lock_flags;
 	unsigned long lock_flags;
 
@@ -759,7 +763,7 @@ static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
 
 static unsigned int omap_gpio_irq_startup(struct irq_data *d)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned long flags;
 	unsigned int offset = d->hwirq;
 
@@ -783,7 +787,7 @@ static unsigned int omap_gpio_irq_startup(struct irq_data *d)
 
 static void omap_gpio_irq_shutdown(struct irq_data *d)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned long flags;
 	unsigned int offset = d->hwirq;
 
@@ -800,7 +804,7 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 
 static void omap_gpio_irq_bus_lock(struct irq_data *data)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(data);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(data);
 
 	if (!BANK_USED(bank))
 		pm_runtime_get_sync(bank->chip.parent);
@@ -808,7 +812,7 @@ static void omap_gpio_irq_bus_lock(struct irq_data *data)
 
 static void gpio_irq_bus_sync_unlock(struct irq_data *data)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(data);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(data);
 
 	/*
 	 * If this is the last IRQ to be freed in the bank,
@@ -820,7 +824,7 @@ static void gpio_irq_bus_sync_unlock(struct irq_data *data)
 
 static void omap_gpio_ack_irq(struct irq_data *d)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned int offset = d->hwirq;
 
 	omap_clear_gpio_irqstatus(bank, offset);
@@ -828,7 +832,7 @@ static void omap_gpio_ack_irq(struct irq_data *d)
 
 static void omap_gpio_mask_irq(struct irq_data *d)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned int offset = d->hwirq;
 	unsigned long flags;
 
@@ -840,7 +844,7 @@ static void omap_gpio_mask_irq(struct irq_data *d)
 
 static void omap_gpio_unmask_irq(struct irq_data *d)
 {
-	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+	struct omap_gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned int offset = d->hwirq;
 	u32 trigger = irqd_get_trigger_type(d);
 	unsigned long flags;
@@ -867,7 +871,7 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 static int omap_mpuio_suspend_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct gpio_bank	*bank = platform_get_drvdata(pdev);
+	struct omap_gpio_bank	*bank = platform_get_drvdata(pdev);
 	void __iomem		*mask_reg = bank->base +
 					OMAP_MPUIO_GPIO_MASKIT / bank->stride;
 	unsigned long		flags;
@@ -882,7 +886,7 @@ static int omap_mpuio_suspend_noirq(struct device *dev)
 static int omap_mpuio_resume_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct gpio_bank	*bank = platform_get_drvdata(pdev);
+	struct omap_gpio_bank	*bank = platform_get_drvdata(pdev);
 	void __iomem		*mask_reg = bank->base +
 					OMAP_MPUIO_GPIO_MASKIT / bank->stride;
 	unsigned long		flags;
@@ -916,7 +920,7 @@ static struct platform_device omap_mpuio_device = {
 	/* could list the /proc/iomem resources */
 };
 
-static inline void omap_mpuio_init(struct gpio_bank *bank)
+static inline void omap_mpuio_init(struct omap_gpio_bank *bank)
 {
 	platform_set_drvdata(&omap_mpuio_device, bank);
 
@@ -928,7 +932,7 @@ static inline void omap_mpuio_init(struct gpio_bank *bank)
 
 static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 	unsigned long flags;
 	void __iomem *reg;
 	int dir;
@@ -943,7 +947,7 @@ static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 static int omap_gpio_input(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 	unsigned long flags;
 
 	bank = gpiochip_get_data(chip);
@@ -955,7 +959,7 @@ static int omap_gpio_input(struct gpio_chip *chip, unsigned int offset)
 
 static int omap_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 
 	bank = gpiochip_get_data(chip);
 
@@ -968,7 +972,7 @@ static int omap_gpio_get(struct gpio_chip *chip, unsigned int offset)
 static int omap_gpio_output(struct gpio_chip *chip, unsigned int offset,
 			    int value)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 	unsigned long flags;
 
 	bank = gpiochip_get_data(chip);
@@ -982,7 +986,7 @@ static int omap_gpio_output(struct gpio_chip *chip, unsigned int offset,
 static int omap_gpio_debounce(struct gpio_chip *chip, unsigned int offset,
 			      unsigned int debounce)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 	unsigned long flags;
 	int ret;
 
@@ -1015,7 +1019,7 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 static void omap_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 	unsigned long flags;
 
 	bank = gpiochip_get_data(chip);
@@ -1026,7 +1030,7 @@ static void omap_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 /*---------------------------------------------------------------------*/
 
-static void __init omap_gpio_show_rev(struct gpio_bank *bank)
+static void __init omap_gpio_show_rev(struct omap_gpio_bank *bank)
 {
 	static bool called;
 	u32 rev;
@@ -1041,7 +1045,7 @@ static void __init omap_gpio_show_rev(struct gpio_bank *bank)
 	called = true;
 }
 
-static void omap_gpio_mod_init(struct gpio_bank *bank)
+static void omap_gpio_mod_init(struct omap_gpio_bank *bank)
 {
 	void __iomem *base = bank->base;
 	u32 l = 0xffffffff;
@@ -1068,7 +1072,8 @@ static void omap_gpio_mod_init(struct gpio_bank *bank)
 		writel_relaxed(0, base + bank->regs->ctrl);
 }
 
-static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
+static int omap_gpio_chip_init(struct omap_gpio_bank *bank,
+			       struct irq_chip *irqc)
 {
 	static int gpio;
 	int irq_base = 0;
@@ -1158,7 +1163,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	const struct omap_gpio_platform_data *pdata;
 	struct resource *res;
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 	struct irq_chip *irqc;
 	int ret;
 
@@ -1168,7 +1173,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -EINVAL;
 
-	bank = devm_kzalloc(dev, sizeof(struct gpio_bank), GFP_KERNEL);
+	bank = devm_kzalloc(dev, sizeof(struct omap_gpio_bank), GFP_KERNEL);
 	if (!bank)
 		return -ENOMEM;
 
@@ -1276,7 +1281,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 
 static int omap_gpio_remove(struct platform_device *pdev)
 {
-	struct gpio_bank *bank = platform_get_drvdata(pdev);
+	struct omap_gpio_bank *bank = platform_get_drvdata(pdev);
 
 	list_del(&bank->node);
 	gpiochip_remove(&bank->chip);
@@ -1290,12 +1295,12 @@ static int omap_gpio_remove(struct platform_device *pdev)
 #ifdef CONFIG_ARCH_OMAP2PLUS
 
 #if defined(CONFIG_PM)
-static void omap_gpio_restore_context(struct gpio_bank *bank);
+static void omap_gpio_restore_context(struct omap_gpio_bank *bank);
 
 static int omap_gpio_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct gpio_bank *bank = platform_get_drvdata(pdev);
+	struct omap_gpio_bank *bank = platform_get_drvdata(pdev);
 	u32 l1 = 0, l2 = 0;
 	unsigned long flags;
 	u32 wake_low, wake_hi;
@@ -1358,12 +1363,12 @@ static int omap_gpio_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static void omap_gpio_init_context(struct gpio_bank *p);
+static void omap_gpio_init_context(struct omap_gpio_bank *p);
 
 static int omap_gpio_runtime_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct gpio_bank *bank = platform_get_drvdata(pdev);
+	struct omap_gpio_bank *bank = platform_get_drvdata(pdev);
 	u32 l = 0, gen, gen0, gen1;
 	unsigned long flags;
 	int c;
@@ -1475,7 +1480,7 @@ static int omap_gpio_runtime_resume(struct device *dev)
 #if IS_BUILTIN(CONFIG_GPIO_OMAP)
 void omap2_gpio_prepare_for_idle(int pwr_mode)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 
 	list_for_each_entry(bank, &omap_gpio_list, node) {
 		if (!BANK_USED(bank) || !bank->loses_context)
@@ -1489,7 +1494,7 @@ void omap2_gpio_prepare_for_idle(int pwr_mode)
 
 void omap2_gpio_resume_after_idle(void)
 {
-	struct gpio_bank *bank;
+	struct omap_gpio_bank *bank;
 
 	list_for_each_entry(bank, &omap_gpio_list, node) {
 		if (!BANK_USED(bank) || !bank->loses_context)
@@ -1501,7 +1506,7 @@ void omap2_gpio_resume_after_idle(void)
 #endif
 
 #if defined(CONFIG_PM)
-static void omap_gpio_init_context(struct gpio_bank *p)
+static void omap_gpio_init_context(struct omap_gpio_bank *p)
 {
 	struct omap_gpio_reg_offs *regs = p->regs;
 	void __iomem *base = p->base;
@@ -1524,7 +1529,7 @@ static void omap_gpio_init_context(struct gpio_bank *p)
 	p->context_valid = true;
 }
 
-static void omap_gpio_restore_context(struct gpio_bank *bank)
+static void omap_gpio_restore_context(struct omap_gpio_bank *bank)
 {
 	writel_relaxed(bank->context.wake_en,
 				bank->base + bank->regs->wkup_en);
@@ -1561,7 +1566,7 @@ static void omap_gpio_restore_context(struct gpio_bank *bank)
 #else
 #define omap_gpio_runtime_suspend NULL
 #define omap_gpio_runtime_resume NULL
-static inline void omap_gpio_init_context(struct gpio_bank *p) {}
+static inline void omap_gpio_init_context(struct omap_gpio_bank *p) {}
 #endif
 
 static const struct dev_pm_ops gpio_pm_ops = {
-- 
2.13.3
