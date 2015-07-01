From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 03/12] drm: panel: Turn on TE(Tearing Effect) on Sharp lq101r1sx01
Date: Wed, 1 Jul 2015 16:21:46 +0800
Message-ID: <1435738915-31973-4-git-send-email-markz@nvidia.com>
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
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index da2cf7ab64c2..fd04c419190c 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -238,6 +238,13 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
+	err = mipi_dsi_dcs_set_tear_on(sharp->link1,
+					MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (err < 0) {
+		dev_err(panel->dev, "failed to turn on TE: %d\n", err);
+		goto poweroff;
+	}
+
 	err = mipi_dsi_dcs_set_display_on(sharp->link1);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", err);
-- 
1.7.9.5
