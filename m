From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 10/13] drm/tegra: Add pinctrl support for DPAUX
Date: Fri, 17 Jun 2016 13:03:44 +0100
Message-ID: <1466165027-17917-11-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The DPAUX pins are shared with an internal I2C controller. To allow
these pins to be muxed to the I2C controller, register a pinctrl device
for the DPAUX device. Make Tegra DRM support dependent on PINCTRL to
avoid any compilation issues.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/Kconfig |   1 +
 drivers/gpu/drm/tegra/dpaux.c | 117 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 63ebb154b9b5..d34937a96f94 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -4,6 +4,7 @@ config DRM_TEGRA
 	depends on COMMON_CLK
 	depends on DRM
 	depends on RESET_CONTROLLER
+	depends on PINCTRL
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 289bb064ca1e..391273652fc8 100644
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
@@ -45,6 +48,9 @@ struct tegra_dpaux {
 	struct completion complete;
 	struct work_struct work;
 	struct list_head list;
+
+	struct pinctrl_dev *pinctrl;
+	struct pinctrl_desc desc;
 };
 
 static inline struct tegra_dpaux *to_dpaux(struct drm_dp_aux *aux)
@@ -268,6 +274,80 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 	return ret;
 }
 
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
+enum tegra_dpaux_functions {
+	DPAUX_PADCTL_FUNC_AUX,
+	DPAUX_PADCTL_FUNC_I2C,
+	DPAUX_PADCTL_FUNC_OFF,
+};
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
 static void tegra_dpaux_powerdown(struct tegra_dpaux *dpaux, bool enable)
 {
 	u32 value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
@@ -285,18 +365,21 @@ static int tegra_dpaux_config(struct tegra_dpaux *dpaux, int function)
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
+		tegra_dpaux_powerdown(dpaux, true);
+		return 0;
 	default:
 		return -ENOTSUPP;
 	}
@@ -307,6 +390,21 @@ static int tegra_dpaux_config(struct tegra_dpaux *dpaux, int function)
 	return 0;
 }
 
+static int tegra_dpaux_set_mux(struct pinctrl_dev *pinctrl,
+			       unsigned int function, unsigned int group)
+{
+	struct tegra_dpaux *dpaux = pinctrl_dev_get_drvdata(pinctrl);
+
+	return tegra_dpaux_config(dpaux, function);
+}
+
+static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
+	.get_functions_count = tegra_dpaux_get_functions_count,
+	.get_function_name = tegra_dpaux_get_function_name,
+	.get_function_groups = tegra_dpaux_get_function_groups,
+	.set_mux = tegra_dpaux_set_mux,
+};
+
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
@@ -439,6 +537,19 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+	dpaux->desc.name = dev_name(&pdev->dev);
+	dpaux->desc.pins = tegra_dpaux_pins;
+	dpaux->desc.npins = ARRAY_SIZE(tegra_dpaux_pins);
+	dpaux->desc.pctlops = &tegra_dpaux_pinctrl_ops;
+	dpaux->desc.pmxops = &tegra_dpaux_pinmux_ops;
+	dpaux->desc.owner = THIS_MODULE;
+
+	dpaux->pinctrl = pinctrl_register(&dpaux->desc, &pdev->dev, dpaux);
+	if (!dpaux->pinctrl) {
+		dev_err(&pdev->dev, "failed to register pincontrol\n");
+		return -ENODEV;
+	}
+
 	/* enable and clear all interrupts */
 	value = DPAUX_INTR_AUX_DONE | DPAUX_INTR_IRQ_EVENT |
 		DPAUX_INTR_UNPLUG_EVENT | DPAUX_INTR_PLUG_EVENT;
@@ -600,7 +711,7 @@ int drm_dp_aux_enable(struct drm_dp_aux *aux)
 {
 	struct tegra_dpaux *dpaux = to_dpaux(aux);
 
-	return tegra_dpaux_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_AUX);
+	return tegra_dpaux_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
 }
 
 int drm_dp_aux_disable(struct drm_dp_aux *aux)
-- 
2.1.4

