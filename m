From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 12/12] JUST FOR TEST: Add one-shot trigger to update display
Date: Mon, 11 May 2015 09:38:31 +0800
Message-ID: <1431308311-4470-13-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This HACK adds a workqueue to refresh the display periodically.
This is used just for testing.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b8231e2e3c92..48bddc795995 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1262,6 +1262,8 @@ static void tegra_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		value &= ~DISP_CTRL_MODE_MASK;
 		value |= DISP_CTRL_MODE_NC_DISPLAY;
 		tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+
+		schedule_work(&dc->one_shot_trigger);
 	} else {
 		value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
 		value &= ~DISP_CTRL_MODE_MASK;
@@ -1928,6 +1930,50 @@ static void tegra_dc_one_shot_work(struct work_struct *work)
 	 */
 }
 
+static void tegra_dc_one_shot_trigger(struct work_struct *work)
+{
+	struct tegra_dc *dc;
+	struct drm_connector *connector;
+	struct drm_device *drm;
+	unsigned long update_mask = GENERAL_ACT_REQ | NC_HOST_TRIG;
+	static int first_trigger = 1;
+	int err;
+	unsigned long value;
+
+	dc = container_of(work, struct tegra_dc, one_shot_trigger);
+	drm = dc->base.dev;
+	msleep(5000);
+
+	if (first_trigger) {
+		tegra_dc_writel(dc, update_mask, DC_CMD_STATE_CONTROL);
+		first_trigger = 0;
+		schedule_work(&dc->one_shot_trigger);
+		return;
+	}
+
+	dev_info(dc->dev, "one-shot: Wakeup dsi/panel.\n");
+	err = clk_prepare_enable(dc->clk);
+	if (err < 0)
+		dev_err(dc->dev, "failed to enable clock: %d\n", err);
+
+	value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
+	value &= ~DISP_CTRL_MODE_MASK;
+	value |= DISP_CTRL_MODE_NC_DISPLAY;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+
+	drm_modeset_lock_all(drm);
+	list_for_each_entry(connector, &drm->mode_config.connector_list, head) {
+		if (connector->funcs->dpms)
+			connector->funcs->dpms(connector,
+						DRM_MODE_DPMS_STANDBY);
+	}
+	drm_modeset_unlock_all(drm);
+
+	/* Trigger the one-shot */
+	tegra_dc_writel(dc, update_mask, DC_CMD_STATE_CONTROL);
+	schedule_work(&dc->one_shot_trigger);
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
@@ -1947,6 +1993,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	spin_lock_init(&dc->lock);
 	INIT_LIST_HEAD(&dc->list);
 	INIT_WORK(&dc->one_shot_work, tegra_dc_one_shot_work);
+	INIT_WORK(&dc->one_shot_trigger, tegra_dc_one_shot_trigger);
 	dc->dev = &pdev->dev;
 	dc->soc = id->data;
 
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 00daf427c831..5d606cacb098 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -132,6 +132,7 @@ struct tegra_dc {
 	struct drm_pending_vblank_event *event;
 
 	struct work_struct one_shot_work;
+	struct work_struct one_shot_trigger;
 
 	const struct tegra_dc_soc_info *soc;
 
-- 
2.1.4
