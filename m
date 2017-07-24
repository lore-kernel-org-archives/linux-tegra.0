From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] gpio: tegra: Fix checkpatch warnings
Date: Mon, 24 Jul 2017 16:55:07 +0200
Message-ID: <20170724145508.7388-3-thierry.reding@gmail.com>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724145508.7388-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Fix a couple of checkpatch warnings, such as complaints about bare
unsigned being used (instead of unsigned int) and missing blank lines
after declarations.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 1d4df290d7ab..edc1a14557f0 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -138,12 +138,12 @@ static void tegra_gpio_disable(struct tegra_gpio_info *tgi, int gpio)
 	tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 0);
 }
 
-static int tegra_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int tegra_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	return pinctrl_request_gpio(offset);
 }
 
-static void tegra_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void tegra_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
@@ -151,14 +151,15 @@ static void tegra_gpio_free(struct gpio_chip *chip, unsigned offset)
 	tegra_gpio_disable(tgi, offset);
 }
 
-static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static void tegra_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_OUT(tgi, offset), offset, value);
 }
 
-static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int tegra_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 	int bval = BIT(GPIO_BIT(offset));
@@ -170,7 +171,8 @@ static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(tegra_gpio_readl(tgi, GPIO_IN(tgi, offset)) & bval);
 }
 
-static int tegra_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int tegra_gpio_direction_input(struct gpio_chip *chip,
+				      unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
@@ -179,8 +181,9 @@ static int tegra_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
-					int value)
+static int tegra_gpio_direction_output(struct gpio_chip *chip,
+				       unsigned int offset,
+				       int value)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
@@ -190,7 +193,8 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static int tegra_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int tegra_gpio_get_direction(struct gpio_chip *chip,
+				    unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 	u32 pin_mask = BIT(GPIO_BIT(offset));
@@ -250,7 +254,7 @@ static int tegra_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	return tegra_gpio_set_debounce(chip, offset, debounce);
 }
 
-static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
@@ -413,7 +417,8 @@ static int tegra_gpio_resume(struct device *dev)
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
 		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
-			unsigned int gpio = (b<<5) | (p<<3);
+			unsigned int gpio = (b << 5) | (p << 3);
+
 			tegra_gpio_writel(tgi, bank->cnf[p],
 					  GPIO_CNF(tgi, gpio));
 
@@ -452,7 +457,8 @@ static int tegra_gpio_suspend(struct device *dev)
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
 		for (p = 0; p < ARRAY_SIZE(bank->oe); p++) {
-			unsigned int gpio = (b<<5) | (p<<3);
+			unsigned int gpio = (b << 5) | (p << 3);
+
 			bank->cnf[p] = tegra_gpio_readl(tgi,
 							GPIO_CNF(tgi, gpio));
 			bank->out[p] = tegra_gpio_readl(tgi,
@@ -513,6 +519,7 @@ static int dbg_gpio_show(struct seq_file *s, void *unused)
 	for (i = 0; i < tgi->bank_count; i++) {
 		for (j = 0; j < 4; j++) {
 			int gpio = tegra_gpio_compose(i, j, 0);
+
 			seq_printf(s,
 				"%d:%d %02x %02x %02x %02x %02x %02x %06x\n",
 				i, j,
@@ -542,7 +549,7 @@ static const struct file_operations debug_fops = {
 
 static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 {
-	(void) debugfs_create_file("tegra_gpio", S_IRUGO,
+	(void) debugfs_create_file("tegra_gpio", 0444,
 					NULL, tgi, &debug_fops);
 }
 
@@ -653,6 +660,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	for (i = 0; i < tgi->bank_count; i++) {
 		for (j = 0; j < 4; j++) {
 			int gpio = tegra_gpio_compose(i, j, 0);
+
 			tegra_gpio_writel(tgi, 0x00, GPIO_INT_ENB(tgi, gpio));
 		}
 	}
-- 
2.13.3
