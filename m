From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 10/12] drm: panel: Add idle/busy in Sharp lq101r1sx01 driver
Date: Mon, 11 May 2015 09:38:29 +0800
Message-ID: <1431308311-4470-11-git-send-email-markz@nvidia.com>
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
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 654575607864..a0a7c80f23d6 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -90,6 +90,18 @@ static __maybe_unused int sharp_panel_read(struct sharp_panel *sharp,
 	return err;
 }
 
+static int sharp_panel_idle(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+	int err = 0;
+
+	err = mipi_dsi_dcs_enter_idle_mode(sharp->link1);
+	if (err < 0)
+		dev_err(panel->dev, "failed to enter idle: %d\n", err);
+
+	return err;
+}
+
 static int sharp_panel_disable(struct drm_panel *panel)
 {
 	struct sharp_panel *sharp = to_sharp_panel(panel);
@@ -168,6 +180,18 @@ static int sharp_setup_symmetrical_split(struct mipi_dsi_device *left,
 	return 0;
 }
 
+static int sharp_panel_busy(struct drm_panel *panel)
+{
+	struct sharp_panel *sharp = to_sharp_panel(panel);
+	int err = 0;
+
+	err = mipi_dsi_dcs_exit_idle_mode(sharp->link1);
+	if (err < 0)
+		dev_err(panel->dev, "failed to exit idle: %d\n", err);
+
+	return err;
+}
+
 static int sharp_panel_prepare(struct drm_panel *panel)
 {
 	struct sharp_panel *sharp = to_sharp_panel(panel);
@@ -324,6 +348,8 @@ static int sharp_panel_get_modes(struct drm_panel *panel)
 }
 
 static const struct drm_panel_funcs sharp_panel_funcs = {
+	.idle = sharp_panel_idle,
+	.busy = sharp_panel_busy,
 	.disable = sharp_panel_disable,
 	.unprepare = sharp_panel_unprepare,
 	.prepare = sharp_panel_prepare,
-- 
2.1.4
