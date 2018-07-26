From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/2] pinctrl: tegra: define GPIO compatible node per SoC
Date: Thu, 26 Jul 2018 17:40:24 +0200
Message-ID: <20180726154025.13173-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, linus.walleij@linaro.org
Cc: pdeschrijver@nvidia.co, digetx@gmail.com, keescook@chromium.org, marcel.ziswiler@toradex.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

Tegra 2 uses a different GPIO controller which uses "tegra20-gpio" as
compatible string.

Make the compatible string the GPIO node is using a SoC specific
property. This prevents the kernel from registering the GPIO range
twice in case the GPIO range is specified in the device tree.

Fixes: 9462510ce31e ("pinctrl: tegra: Only set the gpio range if needed")
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 6 +++---
 drivers/pinctrl/tegra/pinctrl-tegra.h    | 1 +
 drivers/pinctrl/tegra/pinctrl-tegra114.c | 1 +
 drivers/pinctrl/tegra/pinctrl-tegra124.c | 1 +
 drivers/pinctrl/tegra/pinctrl-tegra20.c  | 1 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c | 1 +
 drivers/pinctrl/tegra/pinctrl-tegra30.c  | 1 +
 7 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index f974eee29a19..1aba75897d14 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -629,12 +629,12 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 	}
 }
 
-static bool gpio_node_has_range(void)
+static bool gpio_node_has_range(const char *compatible)
 {
 	struct device_node *np;
 	bool has_prop = false;
 
-	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra30-gpio");
+	np = of_find_compatible_node(NULL, NULL, compatible);
 	if (!np)
 		return has_prop;
 
@@ -728,7 +728,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	tegra_pinctrl_clear_parked_bits(pmx);
 
-	if (!gpio_node_has_range())
+	if (!gpio_node_has_range(pmx->soc->gpio_compatible))
 		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
 
 	platform_set_drvdata(pdev, pmx);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index aa33c20766c4..44c71941b5f8 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -189,6 +189,7 @@ struct tegra_pingroup {
  */
 struct tegra_pinctrl_soc_data {
 	unsigned ngpios;
+	const char *gpio_compatible;
 	const struct pinctrl_pin_desc *pins;
 	unsigned npins;
 	struct tegra_function *functions;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index 56b33fca1bfc..511a8774fd8d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1839,6 +1839,7 @@ static const struct tegra_pingroup tegra114_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra114_pinctrl = {
 	.ngpios = NUM_GPIOS,
+	.gpio_compatible = "nvidia,tegra30-gpio",
 	.pins = tegra114_pins,
 	.npins = ARRAY_SIZE(tegra114_pins),
 	.functions = tegra114_functions,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 7bc998ace0d5..57e3cdcf4503 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -2051,6 +2051,7 @@ static const struct tegra_pingroup tegra124_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
 	.ngpios = NUM_GPIOS,
+	.gpio_compatible = "nvidia,tegra30-gpio",
 	.pins = tegra124_pins,
 	.npins = ARRAY_SIZE(tegra124_pins),
 	.functions = tegra124_functions,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index b6dd939d32cc..624889ed3a9d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2221,6 +2221,7 @@ static const struct tegra_pingroup tegra20_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.ngpios = NUM_GPIOS,
+	.gpio_compatible = "nvidia,tegra20-gpio",
 	.pins = tegra20_pins,
 	.npins = ARRAY_SIZE(tegra20_pins),
 	.functions = tegra20_functions,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index c244e5b17bd6..0956a1c73391 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1553,6 +1553,7 @@ static const struct tegra_pingroup tegra210_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra210_pinctrl = {
 	.ngpios = NUM_GPIOS,
+	.gpio_compatible = "nvidia,tegra30-gpio",
 	.pins = tegra210_pins,
 	.npins = ARRAY_SIZE(tegra210_pins),
 	.functions = tegra210_functions,
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index 1f180a20f2ab..c923ad58af84 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2474,6 +2474,7 @@ static const struct tegra_pingroup tegra30_groups[] = {
 
 static const struct tegra_pinctrl_soc_data tegra30_pinctrl = {
 	.ngpios = NUM_GPIOS,
+	.gpio_compatible = "nvidia,tegra30-gpio",
 	.pins = tegra30_pins,
 	.npins = ARRAY_SIZE(tegra30_pins),
 	.functions = tegra30_functions,
-- 
2.18.0
