From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 11/12] drm/tegra: dsi: Set connector DPMS state when enable/disable
Date: Wed, 1 Jul 2015 16:21:54 +0800
Message-ID: <1435738915-31973-12-git-send-email-markz@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435738915-31973-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch fixes a bug when drm_helper_connector_dpms tries to
switch connector/encoder/crtc DPMS status.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dsi.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 1d21f149d7f2..7917b7875496 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -898,6 +898,8 @@ static void tegra_dsi_encoder_mode_set(struct drm_encoder *encoder,
 	if (output->panel)
 		drm_panel_enable(output->panel);
 
+	output->connector.dpms = DRM_MODE_DPMS_ON;
+
 	return;
 }
 
@@ -937,6 +939,7 @@ static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
 
 	tegra_dsi_disable(dsi);
 
+	output->connector.dpms = DRM_MODE_DPMS_OFF;
 	return;
 }
 
-- 
1.7.9.5
