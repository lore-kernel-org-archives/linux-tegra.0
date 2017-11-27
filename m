From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 12/12] drm/tegra: sor: Support HDMI 2.0 modes
Date: Mon, 27 Nov 2017 11:09:52 +0100
Message-ID: <20171127100952.22465-13-thierry.reding@gmail.com>
References: <20171127100952.22465-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100952.22465-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 121 +++++++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/sor.h |   4 ++
 2 files changed, 119 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 91fd0a48dcaa..d3cc25fcccdd 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_scdc_helper.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -342,11 +343,16 @@ struct tegra_sor {
 	struct regulator *avdd_io_supply;
 	struct regulator *vdd_pll_supply;
 	struct regulator *hdmi_supply;
+
+	struct delayed_work scdc;
+	bool scdc_enabled;
 };
 
 struct tegra_sor_state {
 	struct drm_connector_state base;
 
+	unsigned int link_speed;
+	unsigned long pclk;
 	unsigned int bpc;
 };
 
@@ -1481,10 +1487,6 @@ static enum drm_mode_status
 tegra_sor_connector_mode_valid(struct drm_connector *connector,
 			       struct drm_display_mode *mode)
 {
-	/* HDMI 2.0 modes are not yet supported */
-	if (mode->clock > 340000)
-		return MODE_NOCLOCK;
-
 	return MODE_OK;
 }
 
@@ -1909,6 +1911,18 @@ tegra_sor_encoder_atomic_check(struct drm_encoder *encoder,
 
 	info = &output->connector.display_info;
 
+	/*
+	 * For HBR2 modes, the SOR brick needs to use the x20 multiplier, so
+	 * the pixel clock must be corrected accordingly.
+	 */
+	if (pclk >= 340000000) {
+		state->link_speed = 20;
+		state->pclk = pclk / 2;
+	} else {
+		state->link_speed = 10;
+		state->pclk = pclk;
+	}
+
 	err = tegra_dc_state_setup_clock(dc, crtc_state, sor->clk_parent,
 					 pclk, 0);
 	if (err < 0) {
@@ -2059,6 +2073,81 @@ tegra_sor_hdmi_find_settings(struct tegra_sor *sor, unsigned long frequency)
 	return NULL;
 }
 
+static void tegra_sor_hdmi_disable_scrambling(struct tegra_sor *sor)
+{
+	u32 value;
+
+	value = tegra_sor_readl(sor, SOR_HDMI2_CTRL);
+	value &= ~SOR_HDMI2_CTRL_CLOCK_MODE_DIV_BY_4;
+	value &= ~SOR_HDMI2_CTRL_SCRAMBLE;
+	tegra_sor_writel(sor, value, SOR_HDMI2_CTRL);
+}
+
+static void tegra_sor_hdmi_scdc_disable(struct tegra_sor *sor)
+{
+	struct i2c_adapter *ddc = sor->output.ddc;
+
+	drm_scdc_set_high_tmds_clock_ratio(ddc, false);
+	drm_scdc_set_scrambling(ddc, false);
+
+	tegra_sor_hdmi_disable_scrambling(sor);
+}
+
+static void tegra_sor_hdmi_scdc_stop(struct tegra_sor *sor)
+{
+	if (sor->scdc_enabled) {
+		cancel_delayed_work_sync(&sor->scdc);
+		tegra_sor_hdmi_scdc_disable(sor);
+	}
+}
+
+static void tegra_sor_hdmi_enable_scrambling(struct tegra_sor *sor)
+{
+	u32 value;
+
+	value = tegra_sor_readl(sor, SOR_HDMI2_CTRL);
+	value |= SOR_HDMI2_CTRL_CLOCK_MODE_DIV_BY_4;
+	value |= SOR_HDMI2_CTRL_SCRAMBLE;
+	tegra_sor_writel(sor, value, SOR_HDMI2_CTRL);
+}
+
+static void tegra_sor_hdmi_scdc_enable(struct tegra_sor *sor)
+{
+	struct i2c_adapter *ddc = sor->output.ddc;
+
+	drm_scdc_set_high_tmds_clock_ratio(ddc, true);
+	drm_scdc_set_scrambling(ddc, true);
+
+	tegra_sor_hdmi_enable_scrambling(sor);
+}
+
+static void tegra_sor_hdmi_scdc_work(struct work_struct *work)
+{
+	struct tegra_sor *sor = container_of(work, struct tegra_sor, scdc.work);
+	struct i2c_adapter *ddc = sor->output.ddc;
+
+	if (!drm_scdc_get_scrambling_status(ddc)) {
+		DRM_DEBUG_KMS("SCDC not scrambled\n");
+		tegra_sor_hdmi_scdc_enable(sor);
+	}
+
+	schedule_delayed_work(&sor->scdc, msecs_to_jiffies(5000));
+}
+
+static void tegra_sor_hdmi_scdc_start(struct tegra_sor *sor)
+{
+	struct drm_scdc *scdc = &sor->output.connector.display_info.hdmi.scdc;
+	struct drm_display_mode *mode;
+
+	mode = &sor->output.encoder.crtc->state->adjusted_mode;
+
+	if (mode->clock >= 340000 && scdc->supported) {
+		schedule_delayed_work(&sor->scdc, msecs_to_jiffies(5000));
+		tegra_sor_hdmi_scdc_enable(sor);
+		sor->scdc_enabled = true;
+	}
+}
+
 static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
@@ -2067,6 +2156,8 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	tegra_sor_hdmi_scdc_stop(sor);
+
 	err = tegra_sor_detach(sor);
 	if (err < 0)
 		dev_err(sor->dev, "failed to detach SOR: %d\n", err);
@@ -2106,12 +2197,14 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	struct tegra_sor *sor = to_sor(output);
 	struct tegra_sor_state *state;
 	struct drm_display_mode *mode;
+	unsigned long rate, pclk;
 	unsigned int div, i;
 	u32 value;
 	int err;
 
 	state = to_sor_state(output->connector.state);
 	mode = &encoder->crtc->state->adjusted_mode;
+	pclk = mode->clock * 1000;
 
 	pm_runtime_get_sync(sor->dev);
 
@@ -2187,10 +2280,13 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	value &= ~SOR_CLK_CNTRL_DP_LINK_SPEED_MASK;
 	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
 
-	if (mode->clock < 340000)
+	if (mode->clock < 340000) {
+		DRM_DEBUG_KMS("setting 2.7 GHz link speed\n");
 		value |= SOR_CLK_CNTRL_DP_LINK_SPEED_G2_70;
-	else
+	} else {
+		DRM_DEBUG_KMS("setting 5.4 GHz link speed\n");
 		value |= SOR_CLK_CNTRL_DP_LINK_SPEED_G5_40;
+	}
 
 	value |= SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_PCLK;
 	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
@@ -2246,6 +2342,15 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	/* adjust clock rate for HDMI 2.0 modes */
+	rate = clk_get_rate(sor->clk_parent);
+
+	if (mode->clock >= 340000)
+		rate /= 2;
+
+	DRM_DEBUG_KMS("setting clock to %lu Hz, mode: %lu Hz\n", rate, pclk);
+
+	clk_set_rate(sor->clk, rate);
 
 	if (!sor->soc->has_nvdisplay) {
 		value = SOR_INPUT_CONTROL_HDMI_SRC_SELECT(dc->pipe);
@@ -2457,6 +2562,8 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	err = tegra_sor_wakeup(sor);
 	if (err < 0)
 		dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
+
+	tegra_sor_hdmi_scdc_start(sor);
 }
 
 static const struct drm_encoder_helper_funcs tegra_sor_hdmi_helpers = {
@@ -2644,6 +2751,8 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 		return err;
 	}
 
+	INIT_DELAYED_WORK(&sor->scdc, tegra_sor_hdmi_scdc_work);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/sor.h b/drivers/gpu/drm/tegra/sor.h
index e85ffc8d98e4..fb0854d92a27 100644
--- a/drivers/gpu/drm/tegra/sor.h
+++ b/drivers/gpu/drm/tegra/sor.h
@@ -382,4 +382,8 @@
 #define SOR_HDMI_VSI_INFOFRAME_STATUS 0x124
 #define SOR_HDMI_VSI_INFOFRAME_HEADER 0x125
 
+#define SOR_HDMI2_CTRL 0x13e
+#define  SOR_HDMI2_CTRL_CLOCK_MODE_DIV_BY_4 (1 << 1)
+#define  SOR_HDMI2_CTRL_SCRAMBLE (1 << 0)
+
 #endif
-- 
2.15.0
