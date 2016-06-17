From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 02/13] drm/tegra: Add helper functions for setting up DPAUX pads
Date: Fri, 17 Jun 2016 13:03:36 +0100
Message-ID: <1466165027-17917-3-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

In preparation for adding pinctrl support for the DPAUX pads, add
helpers functions for configuring the pads and controlling the power
for the pads.

Please note that although a simple if-statement could be used instead
of a case statement for configuring the pads as there are only two
possible modes, a case statement is used because when integrating with
the pinctrl framework, we need to be able to handle invalid modes that
could be passed.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 75 ++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 0874a7e5b37b..aa3a037fcd3b 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -267,6 +267,45 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 	return ret;
 }
 
+static void tegra_dpaux_powerdown(struct tegra_dpaux *dpaux, bool enable)
+{
+	u32 value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
+
+	if (enable)
+		value |= DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
+	else
+		value &= ~DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
+
+	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
+}
+
+static int tegra_dpaux_config(struct tegra_dpaux *dpaux, int function)
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
+	tegra_dpaux_powerdown(dpaux, false);
+
+	return 0;
+}
+
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
@@ -372,15 +411,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
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
+	err = tegra_dpaux_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_I2C);
+	if (err < 0)
+		return err;
 
 	/* enable and clear all interrupts */
 	value = DPAUX_INTR_AUX_DONE | DPAUX_INTR_IRQ_EVENT |
@@ -408,12 +441,9 @@ assert_reset:
 static int tegra_dpaux_remove(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux = platform_get_drvdata(pdev);
-	u32 value;
 
 	/* make sure pads are powered down when not in use */
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
-	value |= DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
+	tegra_dpaux_powerdown(dpaux, true);
 
 	drm_dp_aux_unregister(&dpaux->aux);
 
@@ -538,30 +568,15 @@ enum drm_connector_status drm_dp_aux_detect(struct drm_dp_aux *aux)
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
-
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
-	value &= ~DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
 
-	return 0;
+	return tegra_dpaux_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_AUX);
 }
 
 int drm_dp_aux_disable(struct drm_dp_aux *aux)
 {
 	struct tegra_dpaux *dpaux = to_dpaux(aux);
-	u32 value;
 
-	value = tegra_dpaux_readl(dpaux, DPAUX_HYBRID_SPARE);
-	value |= DPAUX_HYBRID_SPARE_PAD_POWER_DOWN;
-	tegra_dpaux_writel(dpaux, value, DPAUX_HYBRID_SPARE);
+	tegra_dpaux_powerdown(dpaux, true);
 
 	return 0;
 }
-- 
2.1.4

