From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 4/4] gpio: tegra: Add support for gpio debounce
Date: Wed, 20 Apr 2016 19:00:58 +0530
Message-ID: <1461159058-1439-5-git-send-email-ldewangan@nvidia.com>
References: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461159058-1439-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

NVIDIA's Tegra210 support the HW debounce in the GPIO
controller for all its GPIO pins.

Add support for setting debounce timing by implementing the
set_debounce callback of gpiochip.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes from V1:
- Write debounce count before enable.
- Make sure the debounce count do not have any boot residuals.

Changes from V2:
- Only access register fo debounce when SoC support debounce.
---
 drivers/gpio/gpio-tegra.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 36e865f..1f8ec24 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -76,11 +76,14 @@ struct tegra_gpio_bank {
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
@@ -184,6 +187,35 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
+static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+				   unsigned int debounce)
+{
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+	unsigned int debounce_ms = DIV_ROUND_UP(debounce, 1000);
+	int port = GPIO_PORT(offset);
+	int bank = GPIO_BANK(offset);
+
+	if (!debounce_ms) {
+		tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset),
+				      offset, 0);
+		return 0;
+	}
+
+	debounce_ms = min(debounce_ms, 255U);
+
+	/* There is only one debounce count register per port and hence
+	 * set the maximum of current and requested debounce time.
+	 */
+	if (tgi->bank_info[bank].dbc_cnt[port] < debounce_ms) {
+		tegra_gpio_writel(tgi, debounce_ms, GPIO_DBC_CNT(tgi, offset));
+		tgi->bank_info[bank].dbc_cnt[port] = debounce_ms;
+	}
+
+	tegra_gpio_mask_write(tgi, GPIO_MSK_DBC_EN(tgi, offset), offset, 1);
+
+	return 0;
+}
+
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
@@ -199,6 +231,7 @@ static struct gpio_chip tegra_gpio_chip = {
 	.get			= tegra_gpio_get,
 	.direction_output	= tegra_gpio_direction_output,
 	.set			= tegra_gpio_set,
+	.set_debounce		= tegra_gpio_set_debounce,
 	.to_irq			= tegra_gpio_to_irq,
 	.base			= 0,
 };
@@ -363,6 +396,14 @@ static int tegra_gpio_resume(struct device *dev)
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
@@ -398,6 +439,13 @@ static int tegra_gpio_suspend(struct device *dev)
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
@@ -550,6 +598,9 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tgi);
 
+	if (!config->debounce_supported)
+		tgi->gc->set_debounce = NULL;
+
 	tgi->bank_info = devm_kzalloc(&pdev->dev, tgi->bank_count *
 				      sizeof(*tgi->bank_info), GFP_KERNEL);
 	if (!tgi->bank_info)
@@ -629,7 +680,14 @@ static const struct tegra_gpio_soc_config tegra30_gpio_config = {
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
