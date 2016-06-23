From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 10/12] drm/tegra: Add pinctrl support for DPAUX
Date: Thu, 23 Jun 2016 16:59:03 +0100
Message-ID: <1466697545-11868-11-git-send-email-jonathanh@nvidia.com>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The DPAUX pins are shared with an internal I2C controller. To allow
these pins to be muxed to the I2C controller, register a pinctrl device
for the DPAUX device. Make Tegra DRM support dependent on PINCTRL to
avoid any compilation issues.

This is based upon work by Thierry Reding <treding@nvidia.com>.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 122 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 61821f457209..7b2abaf33a7a 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -12,6 +12,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of_gpio.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/regulator/consumer.h>
@@ -44,6 +47,11 @@ struct tegra_dpaux {
 	struct completion complete;
 	struct work_struct work;
 	struct list_head list;
+
+#ifdef CONFIG_PINCTRL
+	struct pinctrl_dev *pinctrl;
+	struct pinctrl_desc desc;
+#endif
 };
 
 static inline struct tegra_dpaux *to_dpaux(struct drm_dp_aux *aux)
@@ -267,6 +275,12 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 	return ret;
 }
 
+enum tegra_dpaux_functions {
+	DPAUX_PADCTL_FUNC_AUX,
+	DPAUX_PADCTL_FUNC_I2C,
+	DPAUX_PADCTL_FUNC_OFF,
+};
+
 static void tegra_dpaux_pad_power_down(struct tegra_dpaux *dpaux)
 {
 	u32 value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
@@ -290,18 +304,21 @@ static int tegra_dpaux_pad_config(struct tegra_dpaux *dpaux, unsigned function)
 	u32 value;
 
 	switch (function) {
-	case DPAUX_HYBRID_PADCTL_MODE_AUX:
+	case DPAUX_PADCTL_FUNC_AUX:
 		value = DPAUX_HYBRID_PADCTL_AUX_CMH(2) |
 			DPAUX_HYBRID_PADCTL_AUX_DRVZ(4) |
 			DPAUX_HYBRID_PADCTL_AUX_DRVI(0x18) |
 			DPAUX_HYBRID_PADCTL_AUX_INPUT_RCV |
 			DPAUX_HYBRID_PADCTL_MODE_AUX;
 		break;
-	case DPAUX_HYBRID_PADCTL_MODE_I2C:
+	case DPAUX_PADCTL_FUNC_I2C:
 		value = DPAUX_HYBRID_PADCTL_I2C_SDA_INPUT_RCV |
 			DPAUX_HYBRID_PADCTL_I2C_SCL_INPUT_RCV |
 			DPAUX_HYBRID_PADCTL_MODE_I2C;
 		break;
+	case DPAUX_PADCTL_FUNC_OFF:
+		tegra_dpaux_pad_power_down(dpaux);
+		return 0;
 	default:
 		return -ENOTSUPP;
 	}
@@ -312,6 +329,91 @@ static int tegra_dpaux_pad_config(struct tegra_dpaux *dpaux, unsigned function)
 	return 0;
 }
 
+#ifdef CONFIG_PINCTRL
+static const struct pinctrl_pin_desc tegra_dpaux_pins[] = {
+	PINCTRL_PIN(0, "DP_AUX_CHx_P"),
+	PINCTRL_PIN(1, "DP_AUX_CHx_N"),
+};
+
+static const unsigned tegra_dpaux_pin_numbers[] = { 0, 1 };
+
+static const char * const tegra_dpaux_groups[] = {
+	"dpaux-io",
+};
+
+static const char * const tegra_dpaux_functions[] = {
+	"aux",
+	"i2c",
+	"off",
+};
+
+static int tegra_dpaux_get_groups_count(struct pinctrl_dev *pinctrl)
+{
+	return ARRAY_SIZE(tegra_dpaux_groups);
+}
+
+static const char *tegra_dpaux_get_group_name(struct pinctrl_dev *pinctrl,
+					      unsigned int group)
+{
+	return tegra_dpaux_groups[group];
+}
+
+static int tegra_dpaux_get_group_pins(struct pinctrl_dev *pinctrl,
+				      unsigned group, const unsigned **pins,
+				      unsigned *num_pins)
+{
+	*pins = tegra_dpaux_pin_numbers;
+	*num_pins = ARRAY_SIZE(tegra_dpaux_pin_numbers);
+
+	return 0;
+}
+
+static const struct pinctrl_ops tegra_dpaux_pinctrl_ops = {
+	.get_groups_count = tegra_dpaux_get_groups_count,
+	.get_group_name = tegra_dpaux_get_group_name,
+	.get_group_pins = tegra_dpaux_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int tegra_dpaux_get_functions_count(struct pinctrl_dev *pinctrl)
+{
+	return ARRAY_SIZE(tegra_dpaux_functions);
+}
+
+static const char *tegra_dpaux_get_function_name(struct pinctrl_dev *pinctrl,
+						 unsigned int function)
+{
+	return tegra_dpaux_functions[function];
+}
+
+static int tegra_dpaux_get_function_groups(struct pinctrl_dev *pinctrl,
+					   unsigned int function,
+					   const char * const **groups,
+					   unsigned * const num_groups)
+{
+	*num_groups = ARRAY_SIZE(tegra_dpaux_groups);
+	*groups = tegra_dpaux_groups;
+
+	return 0;
+}
+
+static int tegra_dpaux_set_mux(struct pinctrl_dev *pinctrl,
+			       unsigned int function, unsigned int group)
+{
+	struct tegra_dpaux *dpaux = pinctrl_dev_get_drvdata(pinctrl);
+
+	return tegra_dpaux_pad_config(dpaux, function);
+}
+
+static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
+	.get_functions_count = tegra_dpaux_get_functions_count,
+	.get_function_name = tegra_dpaux_get_function_name,
+	.get_function_groups = tegra_dpaux_get_function_groups,
+	.set_mux = tegra_dpaux_set_mux,
+};
+#endif
+
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
@@ -425,6 +527,20 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+#ifdef CONFIG_PINCTRL
+	dpaux->desc.name = dev_name(&pdev->dev);
+	dpaux->desc.pins = tegra_dpaux_pins;
+	dpaux->desc.npins = ARRAY_SIZE(tegra_dpaux_pins);
+	dpaux->desc.pctlops = &tegra_dpaux_pinctrl_ops;
+	dpaux->desc.pmxops = &tegra_dpaux_pinmux_ops;
+	dpaux->desc.owner = THIS_MODULE;
+
+	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
+	if (!dpaux->pinctrl) {
+		dev_err(&pdev->dev, "failed to register pincontrol\n");
+		return -ENODEV;
+	}
+#endif
 	/* enable and clear all interrupts */
 	value = DPAUX_INTR_AUX_DONE | DPAUX_INTR_IRQ_EVENT |
 		DPAUX_INTR_UNPLUG_EVENT | DPAUX_INTR_PLUG_EVENT;
@@ -581,7 +697,7 @@ int drm_dp_aux_enable(struct drm_dp_aux *aux)
 {
 	struct tegra_dpaux *dpaux = to_dpaux(aux);
 
-	return tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_AUX);
+	return tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
 }
 
 int drm_dp_aux_disable(struct drm_dp_aux *aux)
-- 
2.1.4
