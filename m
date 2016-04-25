From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V5 3/4] gpio: tegra: Get rid of all file scoped global variables
Date: Mon, 25 Apr 2016 16:08:33 +0530
Message-ID: <1461580714-22479-4-git-send-email-ldewangan@nvidia.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Move the file scoped multiple global variable from Tegra GPIO
driver to the structure and make this as gpiochip data which
can be referred from GPIO chip callbacks.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
This patch is reworked on top of earlier patch
gpio: tegra: Remove the need of keeping device handle for gpio driver

There was review comment that we should get for all variable and hence
this is outcome of the discussion.

Changes from V3:
- Remove DBC/EN registers.
- Remove non-required new lines.
- Collected RB from Stephen.

Changes from V4:
- Make gpio_chip gc as instance instead of pointer in tegra_gpio_info and
 get rid of tegra_gpio_info.
- Add irq_chip instance in tegra_gpio_info and get rid of tegra_irq_chip.
- get rid of gpio_class_lock.
- Collected RB from Alexandre
---
 drivers/gpio/gpio-tegra.c | 350 ++++++++++++++++++++++++++--------------------
 1 file changed, 198 insertions(+), 152 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index cd69422..653825d 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -35,24 +35,24 @@
 #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
 #define GPIO_BIT(x)		((x) & 0x7)
 
-#define GPIO_REG(x)		(GPIO_BANK(x) * tegra_gpio_bank_stride + \
+#define GPIO_REG(tgi, x)	(GPIO_BANK(x) * tgi->soc->bank_stride + \
 					GPIO_PORT(x) * 4)
 
-#define GPIO_CNF(x)		(GPIO_REG(x) + 0x00)
-#define GPIO_OE(x)		(GPIO_REG(x) + 0x10)
-#define GPIO_OUT(x)		(GPIO_REG(x) + 0X20)
-#define GPIO_IN(x)		(GPIO_REG(x) + 0x30)
-#define GPIO_INT_STA(x)		(GPIO_REG(x) + 0x40)
-#define GPIO_INT_ENB(x)		(GPIO_REG(x) + 0x50)
-#define GPIO_INT_LVL(x)		(GPIO_REG(x) + 0x60)
-#define GPIO_INT_CLR(x)		(GPIO_REG(x) + 0x70)
-
-#define GPIO_MSK_CNF(x)		(GPIO_REG(x) + tegra_gpio_upper_offset + 0x00)
-#define GPIO_MSK_OE(x)		(GPIO_REG(x) + tegra_gpio_upper_offset + 0x10)
-#define GPIO_MSK_OUT(x)		(GPIO_REG(x) + tegra_gpio_upper_offset + 0X20)
-#define GPIO_MSK_INT_STA(x)	(GPIO_REG(x) + tegra_gpio_upper_offset + 0x40)
-#define GPIO_MSK_INT_ENB(x)	(GPIO_REG(x) + tegra_gpio_upper_offset + 0x50)
-#define GPIO_MSK_INT_LVL(x)	(GPIO_REG(x) + tegra_gpio_upper_offset + 0x60)
+#define GPIO_CNF(t, x)		(GPIO_REG(t, x) + 0x00)
+#define GPIO_OE(t, x)		(GPIO_REG(t, x) + 0x10)
+#define GPIO_OUT(t, x)		(GPIO_REG(t, x) + 0X20)
+#define GPIO_IN(t, x)		(GPIO_REG(t, x) + 0x30)
+#define GPIO_INT_STA(t, x)	(GPIO_REG(t, x) + 0x40)
+#define GPIO_INT_ENB(t, x)	(GPIO_REG(t, x) + 0x50)
+#define GPIO_INT_LVL(t, x)	(GPIO_REG(t, x) + 0x60)
+#define GPIO_INT_CLR(t, x)	(GPIO_REG(t, x) + 0x70)
+
+#define GPIO_MSK_CNF(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x00)
+#define GPIO_MSK_OE(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x10)
+#define GPIO_MSK_OUT(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0X20)
+#define GPIO_MSK_INT_STA(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x40)
+#define GPIO_MSK_INT_ENB(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x50)
+#define GPIO_MSK_INT_LVL(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x60)
 
 #define GPIO_INT_LVL_MASK		0x010101
 #define GPIO_INT_LVL_EDGE_RISING	0x000101
@@ -61,6 +61,8 @@
 #define GPIO_INT_LVL_LEVEL_HIGH		0x000001
 #define GPIO_INT_LVL_LEVEL_LOW		0x000000
 
+struct tegra_gpio_info;
+
 struct tegra_gpio_bank {
 	int bank;
 	int irq;
@@ -73,6 +75,7 @@ struct tegra_gpio_bank {
 	u32 int_lvl[4];
 	u32 wake_enb[4];
 #endif
+	struct tegra_gpio_info *tgi;
 };
 
 struct tegra_gpio_soc_config {
@@ -80,22 +83,27 @@ struct tegra_gpio_soc_config {
 	u32 upper_offset;
 };
 
-static struct device *dev;
-static struct irq_domain *irq_domain;
-static void __iomem *regs;
-static u32 tegra_gpio_bank_count;
-static u32 tegra_gpio_bank_stride;
-static u32 tegra_gpio_upper_offset;
-static struct tegra_gpio_bank *tegra_gpio_banks;
+struct tegra_gpio_info {
+	struct device				*dev;
+	void __iomem				*regs;
+	struct irq_domain			*irq_domain;
+	struct tegra_gpio_bank			*bank_info;
+	const struct tegra_gpio_soc_config	*soc;
+	struct gpio_chip			gc;
+	struct irq_chip				ic;
+	struct lock_class_key			lock_class;
+	u32					bank_count;
+};
 
-static inline void tegra_gpio_writel(u32 val, u32 reg)
+static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
+				     u32 val, u32 reg)
 {
-	__raw_writel(val, regs + reg);
+	__raw_writel(val, tgi->regs + reg);
 }
 
-static inline u32 tegra_gpio_readl(u32 reg)
+static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
 {
-	return __raw_readl(regs + reg);
+	return __raw_readl(tgi->regs + reg);
 }
 
 static int tegra_gpio_compose(int bank, int port, int bit)
@@ -103,24 +111,25 @@ static int tegra_gpio_compose(int bank, int port, int bit)
 	return (bank << 5) | ((port & 0x3) << 3) | (bit & 0x7);
 }
 
-static void tegra_gpio_mask_write(u32 reg, int gpio, int value)
+static void tegra_gpio_mask_write(struct tegra_gpio_info *tgi, u32 reg,
+				  int gpio, int value)
 {
 	u32 val;
 
 	val = 0x100 << GPIO_BIT(gpio);
 	if (value)
 		val |= 1 << GPIO_BIT(gpio);
-	tegra_gpio_writel(val, reg);
+	tegra_gpio_writel(tgi, val, reg);
 }
 
-static void tegra_gpio_enable(int gpio)
+static void tegra_gpio_enable(struct tegra_gpio_info *tgi, int gpio)
 {
-	tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 1);
+	tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 1);
 }
 
-static void tegra_gpio_disable(int gpio)
+static void tegra_gpio_disable(struct tegra_gpio_info *tgi, int gpio)
 {
-	tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 0);
+	tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 0);
 }
 
 static int tegra_gpio_request(struct gpio_chip *chip, unsigned offset)
@@ -130,83 +139,90 @@ static int tegra_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void tegra_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+
 	pinctrl_free_gpio(offset);
-	tegra_gpio_disable(offset);
+	tegra_gpio_disable(tgi, offset);
 }
 
 static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	tegra_gpio_mask_write(GPIO_MSK_OUT(offset), offset, value);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+
+	tegra_gpio_mask_write(tgi, GPIO_MSK_OUT(tgi, offset), offset, value);
 }
 
 static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+	int bval = BIT(GPIO_BIT(offset));
+
 	/* If gpio is in output mode then read from the out value */
-	if ((tegra_gpio_readl(GPIO_OE(offset)) >> GPIO_BIT(offset)) & 1)
-		return (tegra_gpio_readl(GPIO_OUT(offset)) >>
-				GPIO_BIT(offset)) & 0x1;
+	if (tegra_gpio_readl(tgi, GPIO_OE(tgi, offset)) & bval)
+		return !!(tegra_gpio_readl(tgi, GPIO_OUT(tgi, offset)) & bval);
 
-	return (tegra_gpio_readl(GPIO_IN(offset)) >> GPIO_BIT(offset)) & 0x1;
+	return !!(tegra_gpio_readl(tgi, GPIO_IN(tgi, offset)) & bval);
 }
 
 static int tegra_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	tegra_gpio_mask_write(GPIO_MSK_OE(offset), offset, 0);
-	tegra_gpio_enable(offset);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+
+	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 0);
+	tegra_gpio_enable(tgi, offset);
 	return 0;
 }
 
 static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 					int value)
 {
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+
 	tegra_gpio_set(chip, offset, value);
-	tegra_gpio_mask_write(GPIO_MSK_OE(offset), offset, 1);
-	tegra_gpio_enable(offset);
+	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 1);
+	tegra_gpio_enable(tgi, offset);
 	return 0;
 }
 
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return irq_find_mapping(irq_domain, offset);
-}
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
-static struct gpio_chip tegra_gpio_chip = {
-	.label			= "tegra-gpio",
-	.request		= tegra_gpio_request,
-	.free			= tegra_gpio_free,
-	.direction_input	= tegra_gpio_direction_input,
-	.get			= tegra_gpio_get,
-	.direction_output	= tegra_gpio_direction_output,
-	.set			= tegra_gpio_set,
-	.to_irq			= tegra_gpio_to_irq,
-	.base			= 0,
-};
+	return irq_find_mapping(tgi->irq_domain, offset);
+}
 
 static void tegra_gpio_irq_ack(struct irq_data *d)
 {
+	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = bank->tgi;
 	int gpio = d->hwirq;
 
-	tegra_gpio_writel(1 << GPIO_BIT(gpio), GPIO_INT_CLR(gpio));
+	tegra_gpio_writel(tgi, 1 << GPIO_BIT(gpio), GPIO_INT_CLR(tgi, gpio));
 }
 
 static void tegra_gpio_irq_mask(struct irq_data *d)
 {
+	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = bank->tgi;
 	int gpio = d->hwirq;
 
-	tegra_gpio_mask_write(GPIO_MSK_INT_ENB(gpio), gpio, 0);
+	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 0);
 }
 
 static void tegra_gpio_irq_unmask(struct irq_data *d)
 {
+	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = bank->tgi;
 	int gpio = d->hwirq;
 
-	tegra_gpio_mask_write(GPIO_MSK_INT_ENB(gpio), gpio, 1);
+	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 1);
 }
 
 static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	int gpio = d->hwirq;
 	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = bank->tgi;
 	int port = GPIO_PORT(gpio);
 	int lvl_type;
 	int val;
@@ -238,23 +254,24 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	ret = gpiochip_lock_as_irq(&tegra_gpio_chip, gpio);
+	ret = gpiochip_lock_as_irq(&tgi->gc, gpio);
 	if (ret) {
-		dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);
+		dev_err(tgi->dev,
+			"unable to lock Tegra GPIO %d as IRQ\n", gpio);
 		return ret;
 	}
 
 	spin_lock_irqsave(&bank->lvl_lock[port], flags);
 
-	val = tegra_gpio_readl(GPIO_INT_LVL(gpio));
+	val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
 	val &= ~(GPIO_INT_LVL_MASK << GPIO_BIT(gpio));
 	val |= lvl_type << GPIO_BIT(gpio);
-	tegra_gpio_writel(val, GPIO_INT_LVL(gpio));
+	tegra_gpio_writel(tgi, val, GPIO_INT_LVL(tgi, gpio));
 
 	spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
 
-	tegra_gpio_mask_write(GPIO_MSK_OE(gpio), gpio, 0);
-	tegra_gpio_enable(gpio);
+	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
+	tegra_gpio_enable(tgi, gpio);
 
 	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
 		irq_set_handler_locked(d, handle_level_irq);
@@ -266,9 +283,11 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 static void tegra_gpio_irq_shutdown(struct irq_data *d)
 {
+	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = bank->tgi;
 	int gpio = d->hwirq;
 
-	gpiochip_unlock_as_irq(&tegra_gpio_chip, gpio);
+	gpiochip_unlock_as_irq(&tgi->gc, gpio);
 }
 
 static void tegra_gpio_irq_handler(struct irq_desc *desc)
@@ -276,19 +295,24 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 	int port;
 	int pin;
 	int unmasked = 0;
+	int gpio;
+	u32 lvl;
+	unsigned long sta;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct tegra_gpio_bank *bank = irq_desc_get_handler_data(desc);
+	struct tegra_gpio_info *tgi = bank->tgi;
 
 	chained_irq_enter(chip, desc);
 
 	for (port = 0; port < 4; port++) {
-		int gpio = tegra_gpio_compose(bank->bank, port, 0);
-		unsigned long sta = tegra_gpio_readl(GPIO_INT_STA(gpio)) &
-			tegra_gpio_readl(GPIO_INT_ENB(gpio));
-		u32 lvl = tegra_gpio_readl(GPIO_INT_LVL(gpio));
+		gpio = tegra_gpio_compose(bank->bank, port, 0);
+		sta = tegra_gpio_readl(tgi, GPIO_INT_STA(tgi, gpio)) &
+			tegra_gpio_readl(tgi, GPIO_INT_ENB(tgi, gpio));
+		lvl = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
 
 		for_each_set_bit(pin, &sta, 8) {
-			tegra_gpio_writel(1 << pin, GPIO_INT_CLR(gpio));
+			tegra_gpio_writel(tgi, 1 << pin,
+					  GPIO_INT_CLR(tgi, gpio));
 
 			/* if gpio is edge triggered, clear condition
 			 * before executing the handler so that we don't
@@ -311,22 +335,29 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 #ifdef CONFIG_PM_SLEEP
 static int tegra_gpio_resume(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
+	struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
 	unsigned long flags;
 	int b;
 	int p;
 
 	local_irq_save(flags);
 
-	for (b = 0; b < tegra_gpio_bank_count; b++) {
-		struct tegra_gpio_bank *bank = &tegra_gpio_banks[b];
+	for (b = 0; b < tgi->bank_count; b++) {
+		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
 		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
 			unsigned int gpio = (b<<5) | (p<<3);
-			tegra_gpio_writel(bank->cnf[p], GPIO_CNF(gpio));
-			tegra_gpio_writel(bank->out[p], GPIO_OUT(gpio));
-			tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
-			tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
-			tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
+			tegra_gpio_writel(tgi, bank->cnf[p],
+					  GPIO_CNF(tgi, gpio));
+			tegra_gpio_writel(tgi, bank->out[p],
+					  GPIO_OUT(tgi, gpio));
+			tegra_gpio_writel(tgi, bank->oe[p],
+					  GPIO_OE(tgi, gpio));
+			tegra_gpio_writel(tgi, bank->int_lvl[p],
+					  GPIO_INT_LVL(tgi, gpio));
+			tegra_gpio_writel(tgi, bank->int_enb[p],
+					  GPIO_INT_ENB(tgi, gpio));
 		}
 	}
 
@@ -336,25 +367,32 @@ static int tegra_gpio_resume(struct device *dev)
 
 static int tegra_gpio_suspend(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
+	struct tegra_gpio_info *tgi = platform_get_drvdata(pdev);
 	unsigned long flags;
 	int b;
 	int p;
 
 	local_irq_save(flags);
-	for (b = 0; b < tegra_gpio_bank_count; b++) {
-		struct tegra_gpio_bank *bank = &tegra_gpio_banks[b];
+	for (b = 0; b < tgi->bank_count; b++) {
+		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
 		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
 			unsigned int gpio = (b<<5) | (p<<3);
-			bank->cnf[p] = tegra_gpio_readl(GPIO_CNF(gpio));
-			bank->out[p] = tegra_gpio_readl(GPIO_OUT(gpio));
-			bank->oe[p] = tegra_gpio_readl(GPIO_OE(gpio));
-			bank->int_enb[p] = tegra_gpio_readl(GPIO_INT_ENB(gpio));
-			bank->int_lvl[p] = tegra_gpio_readl(GPIO_INT_LVL(gpio));
+			bank->cnf[p] = tegra_gpio_readl(tgi,
+							GPIO_CNF(tgi, gpio));
+			bank->out[p] = tegra_gpio_readl(tgi,
+							GPIO_OUT(tgi, gpio));
+			bank->oe[p] = tegra_gpio_readl(tgi,
+						       GPIO_OE(tgi, gpio));
+			bank->int_enb[p] = tegra_gpio_readl(tgi,
+						GPIO_INT_ENB(tgi, gpio));
+			bank->int_lvl[p] = tegra_gpio_readl(tgi,
+						GPIO_INT_LVL(tgi, gpio));
 
 			/* Enable gpio irq for wake up source */
-			tegra_gpio_writel(bank->wake_enb[p],
-					  GPIO_INT_ENB(gpio));
+			tegra_gpio_writel(tgi, bank->wake_enb[p],
+					  GPIO_INT_ENB(tgi, gpio));
 		}
 	}
 	local_irq_restore(flags);
@@ -387,22 +425,23 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 static int dbg_gpio_show(struct seq_file *s, void *unused)
 {
+	struct tegra_gpio_info *tgi = s->private;
 	int i;
 	int j;
 
-	for (i = 0; i < tegra_gpio_bank_count; i++) {
+	for (i = 0; i < tgi->bank_count; i++) {
 		for (j = 0; j < 4; j++) {
 			int gpio = tegra_gpio_compose(i, j, 0);
 			seq_printf(s,
 				"%d:%d %02x %02x %02x %02x %02x %02x %06x\n",
 				i, j,
-				tegra_gpio_readl(GPIO_CNF(gpio)),
-				tegra_gpio_readl(GPIO_OE(gpio)),
-				tegra_gpio_readl(GPIO_OUT(gpio)),
-				tegra_gpio_readl(GPIO_IN(gpio)),
-				tegra_gpio_readl(GPIO_INT_STA(gpio)),
-				tegra_gpio_readl(GPIO_INT_ENB(gpio)),
-				tegra_gpio_readl(GPIO_INT_LVL(gpio)));
+				tegra_gpio_readl(tgi, GPIO_CNF(tgi, gpio)),
+				tegra_gpio_readl(tgi, GPIO_OE(tgi, gpio)),
+				tegra_gpio_readl(tgi, GPIO_OUT(tgi, gpio)),
+				tegra_gpio_readl(tgi, GPIO_IN(tgi, gpio)),
+				tegra_gpio_readl(tgi, GPIO_INT_STA(tgi, gpio)),
+				tegra_gpio_readl(tgi, GPIO_INT_ENB(tgi, gpio)),
+				tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio)));
 		}
 	}
 	return 0;
@@ -410,7 +449,7 @@ static int dbg_gpio_show(struct seq_file *s, void *unused)
 
 static int dbg_gpio_open(struct inode *inode, struct file *file)
 {
-	return single_open(file, dbg_gpio_show, &inode->i_private);
+	return single_open(file, dbg_gpio_show, inode->i_private);
 }
 
 static const struct file_operations debug_fops = {
@@ -420,44 +459,28 @@ static const struct file_operations debug_fops = {
 	.release	= single_release,
 };
 
-static void tegra_gpio_debuginit(void)
+static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 {
 	(void) debugfs_create_file("tegra_gpio", S_IRUGO,
-					NULL, NULL, &debug_fops);
+					NULL, tgi, &debug_fops);
 }
 
 #else
 
-static inline void tegra_gpio_debuginit(void)
+static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 {
 }
 
 #endif
 
-static struct irq_chip tegra_gpio_irq_chip = {
-	.name		= "GPIO",
-	.irq_ack	= tegra_gpio_irq_ack,
-	.irq_mask	= tegra_gpio_irq_mask,
-	.irq_unmask	= tegra_gpio_irq_unmask,
-	.irq_set_type	= tegra_gpio_irq_set_type,
-	.irq_shutdown	= tegra_gpio_irq_shutdown,
-#ifdef CONFIG_PM_SLEEP
-	.irq_set_wake	= tegra_gpio_irq_set_wake,
-#endif
-};
-
 static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
-/* This lock class tells lockdep that GPIO irqs are in a different
- * category than their parents, so it won't report false recursion.
- */
-static struct lock_class_key gpio_lock_class;
-
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	const struct tegra_gpio_soc_config *config;
+	struct tegra_gpio_info *tgi;
 	struct resource *res;
 	struct tegra_gpio_bank *bank;
 	int ret;
@@ -465,88 +488,111 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	int i;
 	int j;
 
-	dev = &pdev->dev;
-
 	config = of_device_get_match_data(&pdev->dev);
 	if (!config) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		return -ENODEV;
 	}
 
-	tegra_gpio_bank_stride = config->bank_stride;
-	tegra_gpio_upper_offset = config->upper_offset;
+	tgi = devm_kzalloc(&pdev->dev, sizeof(*tgi), GFP_KERNEL);
+	if (!tgi)
+		return -ENODEV;
+
+	tgi->soc = config;
+	tgi->dev = &pdev->dev;
 
 	for (;;) {
-		res = platform_get_resource(pdev, IORESOURCE_IRQ, tegra_gpio_bank_count);
+		res = platform_get_resource(pdev, IORESOURCE_IRQ,
+					    tgi->bank_count);
 		if (!res)
 			break;
-		tegra_gpio_bank_count++;
+		tgi->bank_count++;
 	}
-	if (!tegra_gpio_bank_count) {
+	if (!tgi->bank_count) {
 		dev_err(&pdev->dev, "Missing IRQ resource\n");
 		return -ENODEV;
 	}
 
-	tegra_gpio_chip.ngpio = tegra_gpio_bank_count * 32;
+	tgi->gc.label			= "tegra-gpio";
+	tgi->gc.request			= tegra_gpio_request;
+	tgi->gc.free			= tegra_gpio_free;
+	tgi->gc.direction_input		= tegra_gpio_direction_input;
+	tgi->gc.get			= tegra_gpio_get;
+	tgi->gc.direction_output	= tegra_gpio_direction_output;
+	tgi->gc.set			= tegra_gpio_set;
+	tgi->gc.to_irq			= tegra_gpio_to_irq;
+	tgi->gc.base			= 0;
+	tgi->gc.ngpio			= tgi->bank_count * 32;
+	tgi->gc.parent			= &pdev->dev;
+	tgi->gc.of_node			= pdev->dev.of_node;
+
+	tgi->ic.name			= "GPIO";
+	tgi->ic.irq_ack			= tegra_gpio_irq_ack;
+	tgi->ic.irq_mask		= tegra_gpio_irq_mask;
+	tgi->ic.irq_unmask		= tegra_gpio_irq_unmask;
+	tgi->ic.irq_set_type		= tegra_gpio_irq_set_type;
+	tgi->ic.irq_shutdown		= tegra_gpio_irq_shutdown;
+#ifdef CONFIG_PM_SLEEP
+	tgi->ic.irq_set_wake		= tegra_gpio_irq_set_wake;
+#endif
+
+	platform_set_drvdata(pdev, tgi);
 
-	tegra_gpio_banks = devm_kzalloc(&pdev->dev,
-			tegra_gpio_bank_count * sizeof(*tegra_gpio_banks),
-			GFP_KERNEL);
-	if (!tegra_gpio_banks)
+	tgi->bank_info = devm_kzalloc(&pdev->dev, tgi->bank_count *
+				      sizeof(*tgi->bank_info), GFP_KERNEL);
+	if (!tgi->bank_info)
 		return -ENODEV;
 
-	irq_domain = irq_domain_add_linear(pdev->dev.of_node,
-					   tegra_gpio_chip.ngpio,
-					   &irq_domain_simple_ops, NULL);
-	if (!irq_domain)
+	tgi->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
+						tgi->gc.ngpio,
+						&irq_domain_simple_ops, NULL);
+	if (!tgi->irq_domain)
 		return -ENODEV;
 
-	for (i = 0; i < tegra_gpio_bank_count; i++) {
+	for (i = 0; i < tgi->bank_count; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
 		if (!res) {
 			dev_err(&pdev->dev, "Missing IRQ resource\n");
 			return -ENODEV;
 		}
 
-		bank = &tegra_gpio_banks[i];
+		bank = &tgi->bank_info[i];
 		bank->bank = i;
 		bank->irq = res->start;
+		bank->tgi = tgi;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(regs))
-		return PTR_ERR(regs);
+	tgi->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tgi->regs))
+		return PTR_ERR(tgi->regs);
 
-	for (i = 0; i < tegra_gpio_bank_count; i++) {
+	for (i = 0; i < tgi->bank_count; i++) {
 		for (j = 0; j < 4; j++) {
 			int gpio = tegra_gpio_compose(i, j, 0);
-			tegra_gpio_writel(0x00, GPIO_INT_ENB(gpio));
+			tegra_gpio_writel(tgi, 0x00, GPIO_INT_ENB(tgi, gpio));
 		}
 	}
 
-	tegra_gpio_chip.of_node = pdev->dev.of_node;
-
-	ret = devm_gpiochip_add_data(&pdev->dev, &tegra_gpio_chip, NULL);
+	ret = devm_gpiochip_add_data(&pdev->dev, &tgi->gc, tgi);
 	if (ret < 0) {
-		irq_domain_remove(irq_domain);
+		irq_domain_remove(tgi->irq_domain);
 		return ret;
 	}
 
-	for (gpio = 0; gpio < tegra_gpio_chip.ngpio; gpio++) {
-		int irq = irq_create_mapping(irq_domain, gpio);
+	for (gpio = 0; gpio < tgi->gc.ngpio; gpio++) {
+		int irq = irq_create_mapping(tgi->irq_domain, gpio);
 		/* No validity check; all Tegra GPIOs are valid IRQs */
 
-		bank = &tegra_gpio_banks[GPIO_BANK(gpio)];
+		bank = &tgi->bank_info[GPIO_BANK(gpio)];
 
-		irq_set_lockdep_class(irq, &gpio_lock_class);
+		irq_set_lockdep_class(irq, &tgi->lock_class);
 		irq_set_chip_data(irq, bank);
-		irq_set_chip_and_handler(irq, &tegra_gpio_irq_chip,
-					 handle_simple_irq);
+		irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
 	}
 
-	for (i = 0; i < tegra_gpio_bank_count; i++) {
-		bank = &tegra_gpio_banks[i];
+	for (i = 0; i < tgi->bank_count; i++) {
+		bank = &tgi->bank_info[i];
 
 		irq_set_chained_handler_and_data(bank->irq,
 						 tegra_gpio_irq_handler, bank);
@@ -555,7 +601,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 			spin_lock_init(&bank->lvl_lock[j]);
 	}
 
-	tegra_gpio_debuginit();
+	tegra_gpio_debuginit(tgi);
 
 	return 0;
 }
-- 
2.1.4
