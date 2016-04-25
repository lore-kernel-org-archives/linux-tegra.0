From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V5 4/4] gpio: tegra: Add support for gpio debounce
Date: Mon, 25 Apr 2016 16:08:34 +0530
Message-ID: <1461580714-22479-5-git-send-email-ldewangan@nvidia.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

NVIDIA's Tegra210 support the HW debounce in the GPIO controller
for all its GPIO pins.

Add support for setting debounce timing by implementing the
set_debounce callback of gpiochip.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>

---
Changes from V1:
- Write debounce count before enable.
- Make sure the debounce count do not have any boot residuals.

Changes from V2:
- Only access register for debounce when SoC support debounce.

Changes from V3:
- Add locking mechanism in debounce count register update.
- Move DBC register from prev patch to here.

Changes from V3:
- Rewrite the set_debounce to have bank_info as local pointer for easy to read.
- Collected RB from Stephen.
---
 drivers/gpio/gpio-tegra.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 653825d..b3ddd92 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -46,10 +46,13 @@
 #define GPIO_INT_ENB(t, x)	(GPIO_REG(t, x) + 0x50)
 #define GPIO_INT_LVL(t, x)	(GPIO_REG(t, x) + 0x60)
 #define GPIO_INT_CLR(t, x)	(GPIO_REG(t, x) + 0x70)
+#define GPIO_DBC_CNT(t, x)	(GPIO_REG(t, x) + 0xF0)
+
 
 #define GPIO_MSK_CNF(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x00)
 #define GPIO_MSK_OE(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x10)
 #define GPIO_MSK_OUT(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0X20)
+#define GPIO_MSK_DBC_EN(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x30)
 #define GPIO_MSK_INT_STA(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x40)
 #define GPIO_MSK_INT_ENB(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x50)
 #define GPIO_MSK_INT_LVL(t, x)	(GPIO_REG(t, x) + t->soc->upper_offset + 0x60)
@@ -67,6 +70,7 @@ struct tegra_gpio_bank {
 	int bank;
 	int irq;
 	spinlock_t lvl_lock[4];
+	spinlock_t dbc_lock[4];	/* Lock for updating debounce count register */
 #ifdef CONFIG_PM_SLEEP
 	u32 cnf[4];
 	u32 out[4];
@@ -74,11 +78,14 @@ struct tegra_gpio_bank {
 	u32 int_enb[4];
 	u32 int_lvl[4];
 	u32 wake_enb[4];
+	u32 dbc_enb[4];
 #endif
+	u32 dbc_cnt[4];
 	struct tegra_gpio_info *tgi;
 };
 
 struct tegra_gpio_soc_config {
+	bool debounce_supported;
 	u32 bank_stride;
 	u32 upper_offset;
 };
@@ -184,6 +191,39 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
+static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+				   unsigned int debounce)
+{
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+	struct tegra_gpio_bank *bank = &tgi->bank_info[GPIO_BANK(offset)];
+	unsigned int debounce_ms = DIV_ROUND_UP(debounce, 1000);
+	unsigned long flags;
+	int port;
+
+	if (!debounce_ms) {
+		tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset),
+				      offset, 0);
+		return 0;
+	}
+
+	debounce_ms = min(debounce_ms, 255U);
+	port = GPIO_PORT(offset);
+
+	/* There is only one debounce count register per port and hence
+	 * set the maximum of current and requested debounce time.
+	 */
+	spin_lock_irqsave(&bank->dbc_lock[port], flags);
+	if (bank->dbc_cnt[port] < debounce_ms) {
+		tegra_gpio_writel(tgi, debounce_ms, GPIO_DBC_CNT(tgi, offset));
+		bank->dbc_cnt[port] = debounce_ms;
+	}
+	spin_unlock_irqrestore(&bank->dbc_lock[port], flags);
+
+	tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset), offset, 1);
+
+	return 0;
+}
+
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
@@ -350,6 +390,14 @@ static int tegra_gpio_resume(struct device *dev)
 			unsigned int gpio = (b<<5) | (p<<3);
 			tegra_gpio_writel(tgi, bank->cnf[p],
 					  GPIO_CNF(tgi, gpio));
+
+			if (tgi->soc->debounce_supported) {
+				tegra_gpio_writel(tgi, bank->dbc_cnt[p],
+						  GPIO_DBC_CNT(tgi, gpio));
+				tegra_gpio_writel(tgi, bank->dbc_enb[p],
+						  GPIO_MSK_DBC_EN(tgi, gpio));
+			}
+
 			tegra_gpio_writel(tgi, bank->out[p],
 					  GPIO_OUT(tgi, gpio));
 			tegra_gpio_writel(tgi, bank->oe[p],
@@ -385,6 +433,13 @@ static int tegra_gpio_suspend(struct device *dev)
 							GPIO_OUT(tgi, gpio));
 			bank->oe[p] = tegra_gpio_readl(tgi,
 						       GPIO_OE(tgi, gpio));
+			if (tgi->soc->debounce_supported) {
+				bank->dbc_enb[p] = tegra_gpio_readl(tgi,
+						GPIO_MSK_DBC_EN(tgi, gpio));
+				bank->dbc_enb[p] = (bank->dbc_enb[p] << 8) |
+							bank->dbc_enb[p];
+			}
+
 			bank->int_enb[p] = tegra_gpio_readl(tgi,
 						GPIO_INT_ENB(tgi, gpio));
 			bank->int_lvl[p] = tegra_gpio_readl(tgi,
@@ -538,6 +593,9 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tgi);
 
+	if (config->debounce_supported)
+		tgi->gc.set_debounce = tegra_gpio_set_debounce;
+
 	tgi->bank_info = devm_kzalloc(&pdev->dev, tgi->bank_count *
 				      sizeof(*tgi->bank_info), GFP_KERNEL);
 	if (!tgi->bank_info)
@@ -597,8 +655,10 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 		irq_set_chained_handler_and_data(bank->irq,
 						 tegra_gpio_irq_handler, bank);
 
-		for (j = 0; j < 4; j++)
+		for (j = 0; j < 4; j++) {
 			spin_lock_init(&bank->lvl_lock[j]);
+			spin_lock_init(&bank->dbc_lock[j]);
+		}
 	}
 
 	tegra_gpio_debuginit(tgi);
@@ -616,7 +676,14 @@ static const struct tegra_gpio_soc_config tegra30_gpio_config = {
 	.upper_offset = 0x80,
 };
 
+static const struct tegra_gpio_soc_config tegra210_gpio_config = {
+	.debounce_supported = true,
+	.bank_stride = 0x100,
+	.upper_offset = 0x80,
+};
+
 static const struct of_device_id tegra_gpio_of_match[] = {
+	{ .compatible = "nvidia,tegra210-gpio", .data = &tegra210_gpio_config },
 	{ .compatible = "nvidia,tegra30-gpio", .data = &tegra30_gpio_config },
 	{ .compatible = "nvidia,tegra20-gpio", .data = &tegra20_gpio_config },
 	{ },
-- 
2.1.4
