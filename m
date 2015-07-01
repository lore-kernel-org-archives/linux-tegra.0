From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 10/12] drm/tegra: Suspend dc/dsi/panel in one-shot mode
Date: Wed, 1 Jul 2015 16:21:53 +0800
Message-ID: <1435738915-31973-11-git-send-email-markz@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435738915-31973-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c  |   58 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h |    3 ++
 drivers/gpu/drm/tegra/dsi.c |   76 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 132 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2fdbed9b2b04..24a91613c4f5 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1089,6 +1089,39 @@ static int tegra_dc_wait_idle(struct tegra_dc *dc, unsigned long timeout)
 	return -ETIMEDOUT;
 }
 
+static void tegra_dc_dpms(struct drm_crtc *crtc, int mode)
+{
+	struct tegra_dc *dc = to_tegra_dc(crtc);
+	int err;
+	unsigned long value;
+
+	if (mode == DRM_MODE_DPMS_SUSPEND) {
+		tegra_dc_stop(dc);
+		clk_disable_unprepare(dc->clk);
+
+		/*
+		 * TODO: Powergate dc. This requires we re-init all stuffs
+		 * next time we want to trigger the one-shot.
+		 */
+	}
+
+	if (mode == DRM_MODE_DPMS_STANDBY) {
+		/*
+		 * TODO: Unpowergate dc if dc is powergated during DPMS SUSPEND
+		 */
+		err = clk_prepare_enable(dc->clk);
+		if (err < 0) {
+			dev_err(dc->dev, "failed to enable clock: %d\n", err);
+			return;
+		}
+
+		value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
+		value &= ~DISP_CTRL_MODE_MASK;
+		value |= DISP_CTRL_MODE_NC_DISPLAY;
+		tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+	}
+}
+
 static void tegra_crtc_disable(struct drm_crtc *crtc)
 {
 	struct tegra_dc *dc = to_tegra_dc(crtc);
@@ -1318,6 +1351,7 @@ static void tegra_crtc_atomic_flush(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
+	.dpms = tegra_dc_dpms,
 	.disable = tegra_crtc_disable,
 	.mode_fixup = tegra_crtc_mode_fixup,
 	.mode_set_nofb = tegra_crtc_mode_set_nofb,
@@ -1331,6 +1365,7 @@ static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
 static irqreturn_t tegra_dc_irq(int irq, void *data)
 {
 	struct tegra_dc *dc = data;
+	struct drm_display_mode *mode = &dc->base.state->adjusted_mode;
 	unsigned long status;
 
 	status = tegra_dc_readl(dc, DC_CMD_INT_STATUS);
@@ -1348,6 +1383,9 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		*/
 		drm_crtc_handle_vblank(&dc->base);
 		tegra_dc_finish_page_flip(dc);
+
+		if (mode->private_flags & DRM_PANEL_FLAG_PREFER_ONE_SHOT)
+			schedule_work(&dc->one_shot_work);
 	}
 
 	if (status & (WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT)) {
@@ -1901,6 +1939,25 @@ static int tegra_dc_parse_dt(struct tegra_dc *dc)
 	return 0;
 }
 
+static void tegra_dc_one_shot_work(struct work_struct *work)
+{
+	struct tegra_dc *dc;
+	struct drm_connector *connector;
+	struct drm_device *drm;
+
+	dc = container_of(work, struct tegra_dc, one_shot_work);
+	drm = dc->base.dev;
+
+	dev_dbg(dc->dev, "one-shot: Suspend encoder & connector.\n");
+	drm_modeset_lock_all(drm);
+	list_for_each_entry(connector, &drm->mode_config.connector_list, head) {
+		if (connector->funcs->dpms)
+			connector->funcs->dpms(connector,
+						DRM_MODE_DPMS_SUSPEND);
+	}
+	drm_modeset_unlock_all(drm);
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
@@ -1919,6 +1976,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&dc->lock);
 	INIT_LIST_HEAD(&dc->list);
+	INIT_WORK(&dc->one_shot_work, tegra_dc_one_shot_work);
 	dc->dev = &pdev->dev;
 	dc->soc = id->data;
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 659b2fcc986d..00daf427c831 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 
 #include <uapi/drm/tegra_drm.h>
 #include <linux/host1x.h>
+#include <linux/workqueue.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
@@ -130,6 +131,8 @@ struct tegra_dc {
 	/* page-flip handling */
 	struct drm_pending_vblank_event *event;
 
+	struct work_struct one_shot_work;
+
 	const struct tegra_dc_soc_info *soc;
 
 	struct iommu_domain *domain;
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index ed970f622903..1d21f149d7f2 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -726,10 +726,6 @@ static void tegra_dsi_soft_reset(struct tegra_dsi *dsi)
 		tegra_dsi_soft_reset(dsi->slave);
 }
 
-static void tegra_dsi_connector_dpms(struct drm_connector *connector, int mode)
-{
-}
-
 static void tegra_dsi_connector_reset(struct drm_connector *connector)
 {
 	struct tegra_dsi_state *state;
@@ -756,7 +752,11 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs tegra_dsi_connector_funcs = {
-	.dpms = tegra_dsi_connector_dpms,
+	/*
+	 * drm_atomic_helper_connector_dpms only handles DPMS ON/OFF,
+	 * so use drm_helper_connector_dpms instead.
+	 */
+	.dpms = drm_helper_connector_dpms,
 	.reset = tegra_dsi_connector_reset,
 	.detect = tegra_output_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -784,6 +784,72 @@ static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
 
 static void tegra_dsi_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
+	struct tegra_output *output = encoder_to_output(encoder);
+	struct drm_crtc *crtc = encoder->crtc;
+	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
+	struct tegra_dsi *dsi = to_dsi(output);
+	struct tegra_dsi_state *state;
+	unsigned long value;
+	int err;
+
+	if (mode == DRM_MODE_DPMS_SUSPEND) {
+		/*
+		 * Wait DSI idle first, otherwise we suspend the dsi & panel
+		 * in the middle of a frame.
+		 */
+		err = tegra_dsi_wait_idle(dsi, 100);
+		if (err < 0)
+			dev_dbg(dsi->dev, "failed to idle DSI: %d\n", err);
+
+		tegra_dsi_video_disable(dsi);
+
+		if (dc) {
+			value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+			value &= ~DSI_ENABLE;
+			tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+
+			tegra_dc_commit(dc);
+		}
+
+		err = tegra_dsi_wait_idle(dsi, 100);
+		if (err < 0)
+			dev_dbg(dsi->dev, "failed to idle DSI: %d\n", err);
+
+		tegra_dsi_soft_reset(dsi);
+
+		if (output->panel)
+			drm_panel_idle(output->panel);
+
+		tegra_dsi_disable(dsi);
+	}
+
+	if (mode == DRM_MODE_DPMS_STANDBY) {
+		state = tegra_dsi_get_state(dsi);
+
+		tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
+
+		/*
+		 * The D-PHY timing fields are expressed in byte-clock cycles,
+		 * so multiply the period by 8.
+		 */
+		tegra_dsi_set_phy_timing(dsi, state->period * 8,
+						&state->timing);
+
+		if (output->panel)
+			drm_panel_busy(output->panel);
+
+		tegra_dsi_configure(dsi, dc->pipe, &crtc->mode);
+
+		/* enable display controller */
+		value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+		value |= DSI_ENABLE;
+		tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+
+		tegra_dc_commit(dc);
+
+		/* enable DSI controller */
+		tegra_dsi_enable(dsi);
+	}
 }
 
 static void tegra_dsi_encoder_prepare(struct drm_encoder *encoder)
-- 
1.7.9.5
