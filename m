From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 15/16] gpio: tegra: Use banked GPIO infrastructure
Date: Thu, 28 Sep 2017 11:56:27 +0200
Message-ID: <20170928095628.21966-16-thierry.reding@gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928095628.21966-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Convert the Tegra GPIO driver to use the banked GPIO infrastructure,
which simplifies some parts of the driver.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-tegra.c | 203 ++++++++++++++++++++++------------------------
 2 files changed, 98 insertions(+), 106 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index db3e446ad9b3..458157d6d491 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -439,6 +439,7 @@ config GPIO_TEGRA
 	default ARCH_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support GPIO pins on NVIDIA Tegra SoCs.
 
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index fbaf974277df..bfa0abec743b 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -67,8 +67,8 @@
 struct tegra_gpio_info;
 
 struct tegra_gpio_bank {
-	unsigned int bank;
-	unsigned int irq;
+	struct gpio_bank bank;
+	unsigned int index;
 	spinlock_t lvl_lock[4];
 	spinlock_t dbc_lock[4];	/* Lock for updating debounce count register */
 #ifdef CONFIG_PM_SLEEP
@@ -84,6 +84,11 @@ struct tegra_gpio_bank {
 	struct tegra_gpio_info *tgi;
 };
 
+static struct tegra_gpio_bank *to_tegra_gpio_bank(struct gpio_bank *bank)
+{
+	return container_of(bank, struct tegra_gpio_bank, bank);
+}
+
 struct tegra_gpio_soc_config {
 	bool debounce_supported;
 	u32 bank_stride;
@@ -98,9 +103,14 @@ struct tegra_gpio_info {
 	const struct tegra_gpio_soc_config	*soc;
 	struct gpio_chip			gc;
 	struct irq_chip				ic;
-	u32					bank_count;
 };
 
+static inline struct tegra_gpio_info *
+to_tegra_gpio_info(struct gpio_chip *chip)
+{
+	return container_of(chip, struct tegra_gpio_info, gc);
+}
+
 static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
 				     u32 val, u32 reg)
 {
@@ -264,8 +274,8 @@ static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 
 static void tegra_gpio_irq_ack(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = to_tegra_gpio_info(chip);
 	unsigned int gpio = d->hwirq;
 
 	tegra_gpio_writel(tgi, 1 << GPIO_BIT(gpio), GPIO_INT_CLR(tgi, gpio));
@@ -273,8 +283,8 @@ static void tegra_gpio_irq_ack(struct irq_data *d)
 
 static void tegra_gpio_irq_mask(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = to_tegra_gpio_info(chip);
 	unsigned int gpio = d->hwirq;
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 0);
@@ -282,8 +292,8 @@ static void tegra_gpio_irq_mask(struct irq_data *d)
 
 static void tegra_gpio_irq_unmask(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = to_tegra_gpio_info(chip);
 	unsigned int gpio = d->hwirq;
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 1);
@@ -292,12 +302,15 @@ static void tegra_gpio_irq_unmask(struct irq_data *d)
 static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	unsigned int gpio = d->hwirq, port = GPIO_PORT(gpio), lvl_type;
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = to_tegra_gpio_info(chip);
+	struct tegra_gpio_bank *bank;
 	unsigned long flags;
 	u32 val;
 	int ret;
 
+	bank = &tgi->bank_info[GPIO_BANK(gpio)];
+
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
 		lvl_type = GPIO_INT_LVL_EDGE_RISING;
@@ -352,52 +365,27 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 static void tegra_gpio_irq_shutdown(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
-	gpiochip_unlock_as_irq(&tgi->gc, gpio);
+	gpiochip_unlock_as_irq(chip, d->hwirq);
 }
 
-static void tegra_gpio_irq_handler(struct irq_desc *desc)
+static void tegra_gpio_update_bank(struct gpio_bank *bank)
 {
-	unsigned int port, pin, gpio;
-	bool unmasked = false;
-	u32 lvl;
-	unsigned long sta;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct tegra_gpio_bank *bank = irq_desc_get_handler_data(desc);
-	struct tegra_gpio_info *tgi = bank->tgi;
-
-	chained_irq_enter(chip, desc);
+	struct tegra_gpio_info *tgi = to_tegra_gpio_info(bank->chip);
+	struct tegra_gpio_bank *b = to_tegra_gpio_bank(bank);
+	unsigned int port;
 
 	for (port = 0; port < 4; port++) {
-		gpio = tegra_gpio_compose(bank->bank, port, 0);
-		sta = tegra_gpio_readl(tgi, GPIO_INT_STA(tgi, gpio)) &
-			tegra_gpio_readl(tgi, GPIO_INT_ENB(tgi, gpio));
-		lvl = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
-
-		for_each_set_bit(pin, &sta, 8) {
-			tegra_gpio_writel(tgi, 1 << pin,
-					  GPIO_INT_CLR(tgi, gpio));
-
-			/* if gpio is edge triggered, clear condition
-			 * before executing the handler so that we don't
-			 * miss edges
-			 */
-			if (!unmasked && lvl & (0x100 << pin)) {
-				unmasked = true;
-				chained_irq_exit(chip, desc);
-			}
+		unsigned int gpio = tegra_gpio_compose(b->index, port, 0);
+		u8 *pending = (u8 *)bank->pending;
+		u32 status, enable;
 
-			generic_handle_irq(irq_find_mapping(tgi->irq_domain,
-							    gpio + pin));
-		}
-	}
-
-	if (!unmasked)
-		chained_irq_exit(chip, desc);
+		status = tegra_gpio_readl(tgi, GPIO_INT_STA(tgi, gpio));
+		enable = tegra_gpio_readl(tgi, GPIO_INT_ENB(tgi, gpio));
 
+		pending[port] = status & enable;
+	}
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -410,7 +398,7 @@ static int tegra_gpio_resume(struct device *dev)
 
 	local_irq_save(flags);
 
-	for (b = 0; b < tgi->bank_count; b++) {
+	for (b = 0; b < tgi->gc.num_banks; b++) {
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
 		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
@@ -449,7 +437,7 @@ static int tegra_gpio_suspend(struct device *dev)
 	unsigned int b, p;
 
 	local_irq_save(flags);
-	for (b = 0; b < tgi->bank_count; b++) {
+	for (b = 0; b < tgi->gc.num_banks; b++) {
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
 		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
@@ -484,20 +472,26 @@ static int tegra_gpio_suspend(struct device *dev)
 
 static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	unsigned int gpio = d->hwirq, parent_irq;
+	struct tegra_gpio_bank *b;
+	struct gpio_bank *bank;
 	u32 port, bit, mask;
 
+	bank = chip->banks[GPIO_BANK(gpio)];
+	b = to_tegra_gpio_bank(bank);
 	port = GPIO_PORT(gpio);
 	bit = GPIO_BIT(gpio);
 	mask = BIT(bit);
 
 	if (enable)
-		bank->wake_enb[port] |= mask;
+		b->wake_enb[port] |= mask;
 	else
-		bank->wake_enb[port] &= ~mask;
+		b->wake_enb[port] &= ~mask;
+
+	parent_irq = chip->irq.parents[bank->parent_irq];
 
-	return irq_set_irq_wake(bank->irq, enable);
+	return irq_set_irq_wake(parent_irq, enable);
 }
 #endif
 
@@ -511,7 +505,7 @@ static int dbg_gpio_show(struct seq_file *s, void *unused)
 	struct tegra_gpio_info *tgi = s->private;
 	unsigned int i, j;
 
-	for (i = 0; i < tgi->bank_count; i++) {
+	for (i = 0; i < tgi->gc.num_banks; i++) {
 		for (j = 0; j < 4; j++) {
 			unsigned int gpio = tegra_gpio_compose(i, j, 0);
 
@@ -561,17 +555,18 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 };
 
 /*
- * This lock class tells lockdep that GPIO irqs are in a different category
+ * This lock class tells lockdep that GPIO IRQs are in a different category
  * than their parents, so it won't report false recursion.
  */
-static struct lock_class_key gpio_lock_class;
+static struct lock_class_key tegra_gpio_lock_class;
 
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_info *tgi;
 	struct resource *res;
 	struct tegra_gpio_bank *bank;
-	unsigned int gpio, i, j;
+	struct gpio_irq_chip *irq;
+	unsigned int i, j;
 	int ret;
 
 	tgi = devm_kzalloc(&pdev->dev, sizeof(*tgi), GFP_KERNEL);
@@ -580,14 +575,20 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	tgi->soc = of_device_get_match_data(&pdev->dev);
 	tgi->dev = &pdev->dev;
+	irq = &tgi->gc.irq;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	tgi->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tgi->regs))
+		return PTR_ERR(tgi->regs);
 
 	ret = platform_irq_count(pdev);
 	if (ret < 0)
 		return ret;
 
-	tgi->bank_count = ret;
+	tgi->gc.num_banks = ret;
 
-	if (!tgi->bank_count) {
+	if (!tgi->gc.num_banks) {
 		dev_err(&pdev->dev, "Missing IRQ resource\n");
 		return -ENODEV;
 	}
@@ -602,7 +603,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	tgi->gc.get_direction		= tegra_gpio_get_direction;
 	tgi->gc.to_irq			= tegra_gpio_to_irq;
 	tgi->gc.base			= 0;
-	tgi->gc.ngpio			= tgi->bank_count * 32;
+	tgi->gc.ngpio			= tgi->gc.num_banks * 32;
 	tgi->gc.parent			= &pdev->dev;
 	tgi->gc.of_node			= pdev->dev.of_node;
 
@@ -616,76 +617,66 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	tgi->ic.irq_set_wake		= tegra_gpio_irq_set_wake;
 #endif
 
+	irq = &tgi->gc.irq;
+	irq->chip = &tgi->ic;
+	irq->handler = handle_simple_irq;
+	irq->lock_key = &tegra_gpio_lock_class;
+	irq->default_type = IRQ_TYPE_NONE;
+	irq->parent_handler = gpio_irq_chip_banked_chained_handler;
+	irq->update_bank = tegra_gpio_update_bank;
+
+	irq->parents = devm_kcalloc(&pdev->dev, tgi->gc.num_banks,
+				    sizeof(unsigned int), GFP_KERNEL);
+	if (!irq->parents)
+		return -ENOMEM;
+
+	irq->num_parents = tgi->gc.num_banks;
+
 	platform_set_drvdata(pdev, tgi);
 
 	if (tgi->soc->debounce_supported)
 		tgi->gc.set_config = tegra_gpio_set_config;
 
-	tgi->bank_info = devm_kcalloc(&pdev->dev, tgi->bank_count,
+	tgi->bank_info = devm_kcalloc(&pdev->dev, tgi->gc.num_banks,
 				      sizeof(*tgi->bank_info), GFP_KERNEL);
 	if (!tgi->bank_info)
 		return -ENOMEM;
 
-	tgi->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
-						tgi->gc.ngpio,
-						&irq_domain_simple_ops, NULL);
-	if (!tgi->irq_domain)
-		return -ENODEV;
+	tgi->gc.banks = devm_kcalloc(&pdev->dev, tgi->gc.num_banks,
+				     sizeof(struct gpio_bank *),
+				     GFP_KERNEL);
+	if (!tgi->gc.banks)
+		return -ENOMEM;
 
-	for (i = 0; i < tgi->bank_count; i++) {
+	for (i = 0; i < tgi->gc.num_banks; i++) {
 		ret = platform_get_irq(pdev, i);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Missing IRQ resource: %d\n", ret);
 			return ret;
 		}
 
+		irq->parents[i] = ret;
+
 		bank = &tgi->bank_info[i];
-		bank->bank = i;
-		bank->irq = ret;
-		bank->tgi = tgi;
-	}
+		bank->bank.chip = &tgi->gc;
+		bank->bank.parent_irq = i;
+		bank->bank.num_lines = 32;
+		bank->index = i;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	tgi->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(tgi->regs))
-		return PTR_ERR(tgi->regs);
+		tgi->gc.banks[i] = &bank->bank;
 
-	for (i = 0; i < tgi->bank_count; i++) {
 		for (j = 0; j < 4; j++) {
-			int gpio = tegra_gpio_compose(i, j, 0);
+			unsigned int gpio = tegra_gpio_compose(i, j, 0);
 
 			tegra_gpio_writel(tgi, 0x00, GPIO_INT_ENB(tgi, gpio));
+			spin_lock_init(&bank->lvl_lock[j]);
+			spin_lock_init(&bank->dbc_lock[j]);
 		}
 	}
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &tgi->gc, tgi);
-	if (ret < 0) {
-		irq_domain_remove(tgi->irq_domain);
+	if (ret < 0)
 		return ret;
-	}
-
-	for (gpio = 0; gpio < tgi->gc.ngpio; gpio++) {
-		int irq = irq_create_mapping(tgi->irq_domain, gpio);
-		/* No validity check; all Tegra GPIOs are valid IRQs */
-
-		bank = &tgi->bank_info[GPIO_BANK(gpio)];
-
-		irq_set_lockdep_class(irq, &gpio_lock_class);
-		irq_set_chip_data(irq, bank);
-		irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
-	}
-
-	for (i = 0; i < tgi->bank_count; i++) {
-		bank = &tgi->bank_info[i];
-
-		irq_set_chained_handler_and_data(bank->irq,
-						 tegra_gpio_irq_handler, bank);
-
-		for (j = 0; j < 4; j++) {
-			spin_lock_init(&bank->lvl_lock[j]);
-			spin_lock_init(&bank->dbc_lock[j]);
-		}
-	}
 
 	tegra_gpio_debuginit(tgi);
 
-- 
2.14.1
