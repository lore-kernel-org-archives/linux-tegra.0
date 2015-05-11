From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 11/12] drm/tegra: Suspend dc/dsi/panel in one-shot mode
Date: Mon, 11 May 2015 09:38:30 +0800
Message-ID: <1431308311-4470-12-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c  | 34 ++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h |  3 +++
 drivers/gpu/drm/tegra/dsi.c | 63 +++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 95 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b88c29322c6f..b8231e2e3c92 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1330,6 +1330,7 @@ static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
 static irqreturn_t tegra_dc_irq(int irq, void *data)
 {
 	struct tegra_dc *dc = data;
+	struct drm_display_mode *mode = &dc->base.state->adjusted_mode;
 	unsigned long status;
 
 	status = tegra_dc_readl(dc, DC_CMD_INT_STATUS);
@@ -1342,6 +1343,9 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
 		dev_info(dc->dev, "%s(): vertical blank\n", __func__);
 		drm_crtc_handle_vblank(&dc->base);
 		tegra_dc_finish_page_flip(dc);
+
+		if (mode->flags & DRM_MODE_FLAG_PREFER_ONE_SHOT)
+			schedule_work(&dc->one_shot_work);
 	}
 
 	if (status & (WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT)) {
@@ -1895,6 +1899,35 @@ static int tegra_dc_parse_dt(struct tegra_dc *dc)
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
+	dev_info(dc->dev, "one-shot: Suspend encoder & connector.\n");
+	drm_modeset_lock_all(drm);
+	list_for_each_entry(connector, &drm->mode_config.connector_list, head) {
+		if (connector->funcs->dpms)
+			connector->funcs->dpms(connector,
+						DRM_MODE_DPMS_SUSPEND);
+	}
+	drm_modeset_unlock_all(drm);
+
+	dev_info(dc->dev, "one-shot: Suspend dc.\n");
+	/* Stop dc since dc doesn't have dpms functions */
+	tegra_dc_stop(dc);
+	clk_disable_unprepare(dc->clk);
+
+	/*
+	 * TODO: Powergate dc. This requires we re-init all stuffs
+	 * next time we want to trigger the one-shot.
+	 */
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
@@ -1913,6 +1946,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
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
index ed970f622903..7e00279982b7 100644
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
@@ -756,7 +752,7 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs tegra_dsi_connector_funcs = {
-	.dpms = tegra_dsi_connector_dpms,
+	.dpms = drm_helper_connector_dpms,
 	.reset = tegra_dsi_connector_reset,
 	.detect = tegra_output_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -784,6 +780,63 @@ static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
 
 static void tegra_dsi_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
+	struct tegra_output *output = encoder_to_output(encoder);
+	struct drm_crtc *crtc = encoder->crtc;
+	struct tegra_dc *dc = to_tegra_dc(encoder->crtc);
+	struct tegra_dsi *dsi = to_dsi(output);
+	struct tegra_dsi_state *state;
+	u32 value;
+	int err;
+
+	if (mode == DRM_MODE_DPMS_SUSPEND) {
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
+		 * The D-PHY timing fields are expressed in byte-clock cycles, so
+		 * multiply the period by 8.
+		 */
+		tegra_dsi_set_phy_timing(dsi, state->period * 8, &state->timing);
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
2.1.4
