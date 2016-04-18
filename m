From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 3/3] gpio: tegra: Add support for gpio debounce
Date: Mon, 18 Apr 2016 14:16:18 +0530
Message-ID: <1460969178-20914-3-git-send-email-ldewangan@nvidia.com>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

NVIDIA's Tegra210 support the HW debounce in the GPIO
controller for all its GPIO pins.

Add support for setting debounce timing by implementing the
set_debounce callback of gpiochip.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index de022a9..9f7d75b 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -46,6 +46,7 @@
 #define GPIO_INT_ENB(x)		(GPIO_REG(x) + 0x50)
 #define GPIO_INT_LVL(x)		(GPIO_REG(x) + 0x60)
 #define GPIO_INT_CLR(x)		(GPIO_REG(x) + 0x70)
+#define GPIO_DBC_CNT(x)		(GPIO_REG(x) + 0xF0)
 
 #define GPIO_MSK_CNF(x)		(GPIO_REG(x) + tegra_gpio_upper_offset + 0x00)
 #define GPIO_MSK_OE(x)		(GPIO_REG(x) + tegra_gpio_upper_offset + 0x10)
@@ -53,6 +54,7 @@
 #define GPIO_MSK_INT_STA(x)	(GPIO_REG(x) + tegra_gpio_upper_offset + 0x40)
 #define GPIO_MSK_INT_ENB(x)	(GPIO_REG(x) + tegra_gpio_upper_offset + 0x50)
 #define GPIO_MSK_INT_LVL(x)	(GPIO_REG(x) + tegra_gpio_upper_offset + 0x60)
+#define GPIO_MSK_DBC_EN(x)	(GPIO_REG(x) + tegra_gpio_upper_offset + 0x30)
 
 #define GPIO_INT_LVL_MASK		0x010101
 #define GPIO_INT_LVL_EDGE_RISING	0x000101
@@ -72,12 +74,15 @@ struct tegra_gpio_bank {
 	u32 int_enb[4];
 	u32 int_lvl[4];
 	u32 wake_enb[4];
+	u32 dbc_enb[4];
+	u32 dbc_cnt[4];
 #endif
 };
 
 struct tegra_gpio_soc_config {
 	u32 bank_stride;
 	u32 upper_offset;
+	bool debounce_supported;
 };
 
 static struct irq_domain *irq_domain;
@@ -164,6 +169,31 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
+static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+				   unsigned int debounce)
+{
+	unsigned int max_dbc;
+	unsigned int debounce_ms = DIV_ROUND_UP(debounce, 1000);
+
+	if (!debounce_ms) {
+		tegra_gpio_mask_write(GPIO_MSK_DBC_EN(offset), offset, 0);
+		return 0;
+	}
+
+	debounce_ms = min(debounce_ms, 255U);
+
+	/* There is only one debounce count register per port and hence
+	 * set the maximum of current and requested debounce time.
+	 */
+	max_dbc = tegra_gpio_readl(GPIO_DBC_CNT(offset));
+	max_dbc = max(max_dbc, debounce_ms);
+
+	tegra_gpio_mask_write(GPIO_MSK_DBC_EN(offset), offset, 1);
+	tegra_gpio_writel(max_dbc, GPIO_DBC_CNT(offset));
+
+	return 0;
+}
+
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	return irq_find_mapping(irq_domain, offset);
@@ -177,6 +207,7 @@ static struct gpio_chip tegra_gpio_chip = {
 	.get			= tegra_gpio_get,
 	.direction_output	= tegra_gpio_direction_output,
 	.set			= tegra_gpio_set,
+	.set_debounce		= tegra_gpio_set_debounce,
 	.to_irq			= tegra_gpio_to_irq,
 	.base			= 0,
 };
@@ -327,6 +358,9 @@ static int tegra_gpio_resume(struct device *dev)
 			tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
 			tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
 			tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
+			tegra_gpio_writel(bank->dbc_enb[p],
+					  GPIO_MSK_DBC_EN(gpio));
+			tegra_gpio_writel(bank->dbc_cnt[p], GPIO_DBC_CNT(gpio));
 		}
 	}
 
@@ -351,6 +385,11 @@ static int tegra_gpio_suspend(struct device *dev)
 			bank->oe[p] = tegra_gpio_readl(GPIO_OE(gpio));
 			bank->int_enb[p] = tegra_gpio_readl(GPIO_INT_ENB(gpio));
 			bank->int_lvl[p] = tegra_gpio_readl(GPIO_INT_LVL(gpio));
+			bank->dbc_enb[p] = tegra_gpio_readl(
+							GPIO_MSK_DBC_EN(gpio));
+			bank->dbc_enb[p] = (bank->dbc_enb[p] << 8) ||
+						bank->dbc_enb[p];
+			bank->dbc_cnt[p] = tegra_gpio_readl(GPIO_DBC_CNT(gpio));
 
 			/* Enable gpio irq for wake up source */
 			tegra_gpio_writel(bank->wake_enb[p],
@@ -473,6 +512,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	tegra_gpio_bank_stride = config->bank_stride;
 	tegra_gpio_upper_offset = config->upper_offset;
+	if (!config->debounce_supported)
+		tegra_gpio_chip.set_debounce = NULL;
 
 	for (;;) {
 		res = platform_get_resource(pdev, IORESOURCE_IRQ, tegra_gpio_bank_count);
@@ -570,7 +611,14 @@ static struct tegra_gpio_soc_config tegra30_gpio_config = {
 	.upper_offset = 0x80,
 };
 
+static struct tegra_gpio_soc_config tegra210_gpio_config = {
+	.bank_stride = 0x100,
+	.upper_offset = 0x80,
+	.debounce_supported = true,
+};
+
 static const struct of_device_id tegra_gpio_of_match[] = {
+	{ .compatible = "nvidia,tegra210-gpio", .data = &tegra210_gpio_config },
 	{ .compatible = "nvidia,tegra30-gpio", .data = &tegra30_gpio_config },
 	{ .compatible = "nvidia,tegra20-gpio", .data = &tegra20_gpio_config },
 	{ },
-- 
2.1.4
