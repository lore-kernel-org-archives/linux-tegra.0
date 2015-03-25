From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] drm/panel: sharp: lq101r1sx01: Send cmds to panel from link2
Date: Wed, 25 Mar 2015 14:56:42 +0800
Message-ID: <1427266602-31905-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Sharp lq101r1sx01 panel works as left-right gang mode. So link2
should send cmds like "exit sleep mode", "set display on"
to panel as well.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 3cce3ca19601..13e67a0ad3d9 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -119,10 +119,18 @@ static int sharp_panel_unprepare(struct drm_panel *panel)
 	err = mipi_dsi_dcs_set_display_off(sharp->link1);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
+	err = mipi_dsi_dcs_set_display_off(sharp->link2);
+	if (err < 0)
+		dev_err(panel->dev, "link2: failed to set display off: %d\n",
+					err);
 
 	err = mipi_dsi_dcs_enter_sleep_mode(sharp->link1);
 	if (err < 0)
 		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
+	err = mipi_dsi_dcs_enter_sleep_mode(sharp->link2);
+	if (err < 0)
+		dev_err(panel->dev, "link2: failed to enter sleep mode: %d\n",
+					err);
 
 	msleep(120);
 
@@ -193,6 +201,12 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
 		goto poweroff;
 	}
+	err = mipi_dsi_dcs_exit_sleep_mode(sharp->link2);
+	if (err < 0) {
+		dev_err(panel->dev, "link2: failed to exit sleep mode: %d\n",
+					err);
+		goto poweroff;
+	}
 
 	/*
 	 * The MIPI DCS specification mandates this delay only between the
@@ -222,6 +236,12 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
 		goto poweroff;
 	}
+	err = mipi_dsi_dcs_set_pixel_format(sharp->link2, format);
+	if (err < 0) {
+		dev_err(panel->dev, "link2: failed to set pixel format: %d\n",
+					err);
+		goto poweroff;
+	}
 
 	/*
 	 * TODO: The device supports both left-right and even-odd split
@@ -243,6 +263,12 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 		dev_err(panel->dev, "failed to set display on: %d\n", err);
 		goto poweroff;
 	}
+	err = mipi_dsi_dcs_set_display_on(sharp->link2);
+	if (err < 0) {
+		dev_err(panel->dev, "link2: failed to set display on: %d\n",
+					err);
+		goto poweroff;
+	}
 
 	sharp->prepared = true;
 
-- 
2.1.4
