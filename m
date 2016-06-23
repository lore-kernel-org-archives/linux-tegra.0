From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 03/12] drm/tegra: Add helper functions for setting up DPAUX pads
Date: Thu, 23 Jun 2016 16:58:56 +0100
Message-ID: <1466697545-11868-4-git-send-email-jonathanh@nvidia.com>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466697545-11868-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In preparation for adding pinctrl support for the DPAUX pads, add
helpers functions for configuring the pads and controlling the power
for the pads.

Please note that although a simple if-statement could be used instead
of a case statement for configuring the pads as there are only two
possible modes, a case statement is used because when integrating with
the pinctrl framework, we need to be able to handle invalid modes that
could be passed.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dpaux.c | 81 +++++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 0874a7e5b37b..4014ec57ed31 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -267,6 +267,51 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 	return ret;
 }
 
+static void tegra_dpaux_pad_power_down(struct tegra_dpaux *dpaux)
+{
+	u32 value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
+
+	value |= DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
+
+	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
+}
+
+static void tegra_dpaux_pad_power_up(struct tegra_dpaux *dpaux)
+{
+	u32 value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
+
+	value &= ~DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
+
+	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
+}
+
+static int tegra_dpaux_pad_config(struct tegra_dpaux *dpaux, unsigned function)
+{
+	u32 value;
+
+	switch (function) {
+	case DPAUX_HYBRID_PADCTL_MODE_AUX:
+		value = DPAUX_HYBRID_PADCTL_AUX_CMH(2) |
+			DPAUX_HYBRID_PADCTL_AUX_DRVZ(4) |
+			DPAUX_HYBRID_PADCTL_AUX_DRVI(0x18) |
+			DPAUX_HYBRID_PADCTL_AUX_INPUT_RCV |
+			DPAUX_HYBRID_PADCTL_MODE_AUX;
+		break;
+	case DPAUX_HYBRID_PADCTL_MODE_I2C:
+		value = DPAUX_HYBRID_PADCTL_I2C_SDA_INPUT_RCV |
+			DPAUX_HYBRID_PADCTL_I2C_SCL_INPUT_RCV |
+			DPAUX_HYBRID_PADCTL_MODE_I2C;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_PADCTL);
+	tegra_dpaux_pad_power_up(dpaux);
+
+	return 0;
+}
+
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
@@ -372,15 +417,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	 * is no possibility to perform the I2C mode configuration in the
 	 * HDMI path.
 	 */
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
-	value &= ~DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
-
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_PADCTL);
-	value = DPAUX_HYBRID_PADCTL_I2C_SDA_INPUT_RCV |
-		DPAUX_HYBRID_PADCTL_I2C_SCL_INPUT_RCV |
-		DPAUX_HYBRID_PADCTL_MODE_I2C;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_PADCTL);
+	err = tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_I2C);
+	if (err < 0)
+		return err;
 
 	/* enable and clear all interrupts */
 	value = DPAUX_INTR_AUX_DONE | DPAUX_INTR_IRQ_EVENT |
@@ -408,12 +447,9 @@ assert_reset:
 static int tegra_dpaux_remove(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux = platform_get_drvdata(pdev);
-	u32 value;
 
 	/* make sure pads are powered down when not in use */
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
-	value |= DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
+	tegra_dpaux_pad_power_down(dpaux);
 
 	drm_dp_aux_unregister(&dpaux->aux);
 
@@ -538,30 +574,15 @@ enum drm_connector_status drm_dp_aux_detect(struct drm_dp_aux *aux)
 int drm_dp_aux_enable(struct drm_dp_aux *aux)
 {
 	struct tegra_dpaux *dpaux = to_dpaux(aux);
-	u32 value;
-
-	value = DPAUX_HYBRID_PADCTL_AUX_CMH(2) |
-		DPAUX_HYBRID_PADCTL_AUX_DRVZ(4) |
-		DPAUX_HYBRID_PADCTL_AUX_DRVI(0x18) |
-		DPAUX_HYBRID_PADCTL_AUX_INPUT_RCV |
-		DPAUX_HYBRID_PADCTL_MODE_AUX;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_PADCTL);
 
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
-	value &= ~DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
-
-	return 0;
+	return tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_AUX);
 }
 
 int drm_dp_aux_disable(struct drm_dp_aux *aux)
 {
 	struct tegra_dpaux *dpaux = to_dpaux(aux);
-	u32 value;
 
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
-	value |= DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
+	tegra_dpaux_pad_power_down(dpaux);
 
 	return 0;
 }
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
