From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/12] drm/tegra: sor: Parameterize register offsets
Date: Mon, 27 Nov 2017 11:09:50 +0100
Message-ID: <20171127100952.22465-11-thierry.reding@gmail.com>
References: <20171127100952.22465-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100952.22465-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Future Tegra generations have an increased number of display controllers
that can drive individual SORs. In order to support that, the offset and
layout of some registers has changed in backwards-incompatible ways. Use
parameterized register offsets to support this.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 203 +++++++++++++++++++++++++++-----------------
 1 file changed, 127 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2fba6c2bd486..d51399587aca 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -144,12 +144,29 @@ static const struct tegra_sor_hdmi_settings tegra210_sor_hdmi_defaults[] = {
 };
 #endif
 
+struct tegra_sor_regs {
+	unsigned int head_state0;
+	unsigned int head_state1;
+	unsigned int head_state2;
+	unsigned int head_state3;
+	unsigned int head_state4;
+	unsigned int head_state5;
+	unsigned int pll0;
+	unsigned int pll1;
+	unsigned int pll2;
+	unsigned int pll3;
+	unsigned int dp_padctl0;
+	unsigned int dp_padctl2;
+};
+
 struct tegra_sor_soc {
 	bool supports_edp;
 	bool supports_lvds;
 	bool supports_hdmi;
 	bool supports_dp;
 
+	const struct tegra_sor_regs *regs;
+
 	const struct tegra_sor_hdmi_settings *settings;
 	unsigned int num_settings;
 
@@ -387,23 +404,23 @@ static int tegra_sor_dp_train_fast(struct tegra_sor *sor,
 	/* disable LVDS mode */
 	tegra_sor_writel(sor, 0, SOR_LVDS);
 
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value |= SOR_DP_PADCTL_TX_PU_ENABLE;
 	value &= ~SOR_DP_PADCTL_TX_PU_MASK;
 	value |= SOR_DP_PADCTL_TX_PU(2); /* XXX: don't hardcode? */
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value |= SOR_DP_PADCTL_CM_TXD_3 | SOR_DP_PADCTL_CM_TXD_2 |
 		 SOR_DP_PADCTL_CM_TXD_1 | SOR_DP_PADCTL_CM_TXD_0;
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	usleep_range(10, 100);
 
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value &= ~(SOR_DP_PADCTL_CM_TXD_3 | SOR_DP_PADCTL_CM_TXD_2 |
 		   SOR_DP_PADCTL_CM_TXD_1 | SOR_DP_PADCTL_CM_TXD_0);
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	err = drm_dp_aux_prepare(sor->aux, DP_SET_ANSI_8B10B);
 	if (err < 0)
@@ -895,31 +912,31 @@ static void tegra_sor_mode_set(struct tegra_sor *sor,
 	 */
 
 	value = ((mode->vtotal & 0x7fff) << 16) | (mode->htotal & 0x7fff);
-	tegra_sor_writel(sor, value, SOR_HEAD_STATE1(dc->pipe));
+	tegra_sor_writel(sor, value, sor->soc->regs->head_state1 + dc->pipe);
 
 	/* sync end = sync width - 1 */
 	vse = mode->vsync_end - mode->vsync_start - 1;
 	hse = mode->hsync_end - mode->hsync_start - 1;
 
 	value = ((vse & 0x7fff) << 16) | (hse & 0x7fff);
-	tegra_sor_writel(sor, value, SOR_HEAD_STATE2(dc->pipe));
+	tegra_sor_writel(sor, value, sor->soc->regs->head_state2 + dc->pipe);
 
 	/* blank end = sync end + back porch */
 	vbe = vse + (mode->vtotal - mode->vsync_end);
 	hbe = hse + (mode->htotal - mode->hsync_end);
 
 	value = ((vbe & 0x7fff) << 16) | (hbe & 0x7fff);
-	tegra_sor_writel(sor, value, SOR_HEAD_STATE3(dc->pipe));
+	tegra_sor_writel(sor, value, sor->soc->regs->head_state3 + dc->pipe);
 
 	/* blank start = blank end + active */
 	vbs = vbe + mode->vdisplay;
 	hbs = hbe + mode->hdisplay;
 
 	value = ((vbs & 0x7fff) << 16) | (hbs & 0x7fff);
-	tegra_sor_writel(sor, value, SOR_HEAD_STATE4(dc->pipe));
+	tegra_sor_writel(sor, value, sor->soc->regs->head_state4 + dc->pipe);
 
 	/* XXX interlacing support */
-	tegra_sor_writel(sor, 0x001, SOR_HEAD_STATE5(dc->pipe));
+	tegra_sor_writel(sor, 0x001, sor->soc->regs->head_state5 + dc->pipe);
 }
 
 static int tegra_sor_detach(struct tegra_sor *sor)
@@ -1001,10 +1018,10 @@ static int tegra_sor_power_down(struct tegra_sor *sor)
 		return err;
 	}
 
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_0 |
 		   SOR_DP_PADCTL_PD_TXD_1 | SOR_DP_PADCTL_PD_TXD_2);
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	/* stop lane sequencer */
 	value = SOR_LANE_SEQ_CTL_TRIGGER | SOR_LANE_SEQ_CTL_SEQUENCE_UP |
@@ -1024,20 +1041,20 @@ static int tegra_sor_power_down(struct tegra_sor *sor)
 	if ((value & SOR_LANE_SEQ_CTL_TRIGGER) != 0)
 		return -ETIMEDOUT;
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value |= SOR_PLL2_PORT_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	usleep_range(20, 100);
 
-	value = tegra_sor_readl(sor, SOR_PLL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
 	value |= SOR_PLL0_VCOPD | SOR_PLL0_PWR;
-	tegra_sor_writel(sor, value, SOR_PLL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value |= SOR_PLL2_SEQ_PLLCAPPD;
 	value |= SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	usleep_range(20, 100);
 
@@ -1528,40 +1545,40 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	value |= SOR_CLK_CNTRL_DP_CLK_SEL_SINGLE_DPCLK;
 	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 	usleep_range(20, 100);
 
-	value = tegra_sor_readl(sor, SOR_PLL3);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll3);
 	value |= SOR_PLL3_PLL_VDD_MODE_3V3;
-	tegra_sor_writel(sor, value, SOR_PLL3);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll3);
 
 	value = SOR_PLL0_ICHPMP(0xf) | SOR_PLL0_VCOCAP_RST |
 		SOR_PLL0_PLLREG_LEVEL_V45 | SOR_PLL0_RESISTOR_EXT;
-	tegra_sor_writel(sor, value, SOR_PLL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value |= SOR_PLL2_SEQ_PLLCAPPD;
 	value &= ~SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
 	value |= SOR_PLL2_LVDS_ENABLE;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	value = SOR_PLL1_TERM_COMPOUT | SOR_PLL1_TMDS_TERM;
-	tegra_sor_writel(sor, value, SOR_PLL1);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll1);
 
 	while (true) {
-		value = tegra_sor_readl(sor, SOR_PLL2);
+		value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 		if ((value & SOR_PLL2_SEQ_PLLCAPPD_ENFORCE) == 0)
 			break;
 
 		usleep_range(250, 1000);
 	}
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_POWERDOWN_OVERRIDE;
 	value &= ~SOR_PLL2_PORT_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	/*
 	 * power up
@@ -1574,18 +1591,18 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, value, SOR_CLK_CNTRL);
 
 	/* step 1 */
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value |= SOR_PLL2_SEQ_PLLCAPPD_ENFORCE | SOR_PLL2_PORT_POWERDOWN |
 		 SOR_PLL2_BANDGAP_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
-	value = tegra_sor_readl(sor, SOR_PLL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
 	value |= SOR_PLL0_VCOPD | SOR_PLL0_PWR;
-	tegra_sor_writel(sor, value, SOR_PLL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value &= ~SOR_DP_PADCTL_PAD_CAL_PD;
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	/* step 2 */
 	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_LVDS);
@@ -1595,28 +1612,28 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	usleep_range(5, 100);
 
 	/* step 3 */
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	usleep_range(20, 100);
 
 	/* step 4 */
-	value = tegra_sor_readl(sor, SOR_PLL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
 	value &= ~SOR_PLL0_VCOPD;
 	value &= ~SOR_PLL0_PWR;
-	tegra_sor_writel(sor, value, SOR_PLL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	usleep_range(200, 1000);
 
 	/* step 5 */
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_PORT_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	/* XXX not in TRM */
 	for (value = 0, i = 0; i < 5; i++)
@@ -1632,7 +1649,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
 
 	/* power DP lanes */
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 
 	if (link.num_lanes <= 2)
 		value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_2);
@@ -1649,7 +1666,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	else
 		value |= SOR_DP_PADCTL_PD_TXD_0;
 
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	value = tegra_sor_readl(sor, SOR_DP_LINKCTL0);
 	value &= ~SOR_DP_LINKCTL_LANE_COUNT_MASK;
@@ -1693,9 +1710,9 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, value, SOR_DP_TPG);
 
 	/* enable pad calibration logic */
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value |= SOR_DP_PADCTL_PAD_CAL_PD;
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	err = drm_dp_link_probe(sor->aux, &link);
 	if (err < 0)
@@ -2017,38 +2034,38 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 
 	usleep_range(20, 100);
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_BANDGAP_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	usleep_range(20, 100);
 
-	value = tegra_sor_readl(sor, SOR_PLL3);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll3);
 	value &= ~SOR_PLL3_PLL_VDD_MODE_3V3;
-	tegra_sor_writel(sor, value, SOR_PLL3);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll3);
 
-	value = tegra_sor_readl(sor, SOR_PLL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
 	value &= ~SOR_PLL0_VCOPD;
 	value &= ~SOR_PLL0_PWR;
-	tegra_sor_writel(sor, value, SOR_PLL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_SEQ_PLLCAPPD_ENFORCE;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	usleep_range(200, 400);
 
-	value = tegra_sor_readl(sor, SOR_PLL2);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll2);
 	value &= ~SOR_PLL2_POWERDOWN_OVERRIDE;
 	value &= ~SOR_PLL2_PORT_POWERDOWN;
-	tegra_sor_writel(sor, value, SOR_PLL2);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll2);
 
 	usleep_range(20, 100);
 
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value |= SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_0 |
 		 SOR_DP_PADCTL_PD_TXD_1 | SOR_DP_PADCTL_PD_TXD_2;
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	while (true) {
 		value = tegra_sor_readl(sor, SOR_LANE_SEQ_CTL);
@@ -2166,9 +2183,9 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, value, SOR_STATE1);
 
 	/* power up pad calibration */
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value &= ~SOR_DP_PADCTL_PAD_CAL_PD;
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	/* production settings */
 	settings = tegra_sor_hdmi_find_settings(sor, mode->clock * 1000);
@@ -2178,24 +2195,24 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	value = tegra_sor_readl(sor, SOR_PLL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll0);
 	value &= ~SOR_PLL0_ICHPMP_MASK;
 	value &= ~SOR_PLL0_VCOCAP_MASK;
 	value |= SOR_PLL0_ICHPMP(settings->ichpmp);
 	value |= SOR_PLL0_VCOCAP(settings->vcocap);
-	tegra_sor_writel(sor, value, SOR_PLL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll0);
 
 	tegra_sor_dp_term_calibrate(sor);
 
-	value = tegra_sor_readl(sor, SOR_PLL1);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll1);
 	value &= ~SOR_PLL1_LOADADJ_MASK;
 	value |= SOR_PLL1_LOADADJ(settings->loadadj);
-	tegra_sor_writel(sor, value, SOR_PLL1);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll1);
 
-	value = tegra_sor_readl(sor, SOR_PLL3);
+	value = tegra_sor_readl(sor, sor->soc->regs->pll3);
 	value &= ~SOR_PLL3_BG_VREF_LEVEL_MASK;
 	value |= SOR_PLL3_BG_VREF_LEVEL(settings->bg_vref);
-	tegra_sor_writel(sor, value, SOR_PLL3);
+	tegra_sor_writel(sor, value, sor->soc->regs->pll3);
 
 	value = settings->drive_current[0] << 24 |
 		settings->drive_current[1] << 16 |
@@ -2209,16 +2226,16 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 		settings->preemphasis[3] <<  0;
 	tegra_sor_writel(sor, value, SOR_LANE_PREEMPHASIS0);
 
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value &= ~SOR_DP_PADCTL_TX_PU_MASK;
 	value |= SOR_DP_PADCTL_TX_PU_ENABLE;
 	value |= SOR_DP_PADCTL_TX_PU(settings->tx_pu);
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	/* power down pad calibration */
-	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
+	value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
 	value |= SOR_DP_PADCTL_PAD_CAL_PD;
-	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
+	tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
 
 	/* miscellaneous display controller settings */
 	value = VSYNC_H_POSITION(1);
@@ -2250,16 +2267,16 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
 
 	/* configure dynamic range of output */
-	value = tegra_sor_readl(sor, SOR_HEAD_STATE0(dc->pipe));
+	value = tegra_sor_readl(sor, sor->soc->regs->head_state0 + dc->pipe);
 	value &= ~SOR_HEAD_STATE_RANGECOMPRESS_MASK;
 	value &= ~SOR_HEAD_STATE_DYNRANGE_MASK;
-	tegra_sor_writel(sor, value, SOR_HEAD_STATE0(dc->pipe));
+	tegra_sor_writel(sor, value, sor->soc->regs->head_state0 + dc->pipe);
 
 	/* configure colorspace */
-	value = tegra_sor_readl(sor, SOR_HEAD_STATE0(dc->pipe));
+	value = tegra_sor_readl(sor, sor->soc->regs->head_state0 + dc->pipe);
 	value &= ~SOR_HEAD_STATE_COLORSPACE_MASK;
 	value |= SOR_HEAD_STATE_COLORSPACE_RGB;
-	tegra_sor_writel(sor, value, SOR_HEAD_STATE0(dc->pipe));
+	tegra_sor_writel(sor, value, sor->soc->regs->head_state0 + dc->pipe);
 
 	tegra_sor_mode_set(sor, mode, state);
 
@@ -2488,19 +2505,51 @@ static const u8 tegra124_sor_xbar_cfg[5] = {
 	0, 1, 2, 3, 4
 };
 
+static const struct tegra_sor_regs tegra124_sor_regs = {
+	.head_state0 = 0x05,
+	.head_state1 = 0x07,
+	.head_state2 = 0x09,
+	.head_state3 = 0x0b,
+	.head_state4 = 0x0d,
+	.head_state5 = 0x0f,
+	.pll0 = 0x17,
+	.pll1 = 0x18,
+	.pll2 = 0x19,
+	.pll3 = 0x1a,
+	.dp_padctl0 = 0x5c,
+	.dp_padctl2 = 0x73,
+};
+
 static const struct tegra_sor_soc tegra124_sor = {
 	.supports_edp = true,
 	.supports_lvds = true,
 	.supports_hdmi = false,
 	.supports_dp = false,
+	.regs = &tegra124_sor_regs,
 	.xbar_cfg = tegra124_sor_xbar_cfg,
 };
 
+static const struct tegra_sor_regs tegra210_sor_regs = {
+	.head_state0 = 0x05,
+	.head_state1 = 0x07,
+	.head_state2 = 0x09,
+	.head_state3 = 0x0b,
+	.head_state4 = 0x0d,
+	.head_state5 = 0x0f,
+	.pll0 = 0x17,
+	.pll1 = 0x18,
+	.pll2 = 0x19,
+	.pll3 = 0x1a,
+	.dp_padctl0 = 0x5c,
+	.dp_padctl2 = 0x73,
+};
+
 static const struct tegra_sor_soc tegra210_sor = {
 	.supports_edp = true,
 	.supports_lvds = false,
 	.supports_hdmi = false,
 	.supports_dp = false,
+	.regs = &tegra210_sor_regs,
 	.xbar_cfg = tegra124_sor_xbar_cfg,
 };
 
@@ -2514,6 +2563,8 @@ static const struct tegra_sor_soc tegra210_sor1 = {
 	.supports_hdmi = true,
 	.supports_dp = true,
 
+	.regs = &tegra210_sor_regs,
+
 	.num_settings = ARRAY_SIZE(tegra210_sor_hdmi_defaults),
 	.settings = tegra210_sor_hdmi_defaults,
 
-- 
2.15.0
