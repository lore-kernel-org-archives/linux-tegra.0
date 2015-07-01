From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 05/12] drm: panel: Set TE polarity flag in Sharp lq101r1sx01 driver
Date: Wed, 1 Jul 2015 16:21:48 +0800
Message-ID: <1435738915-31973-6-git-send-email-markz@nvidia.com>
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
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index fd04c419190c..e32f1449b067 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -291,7 +291,8 @@ static const struct drm_display_mode default_mode = {
 	.vsync_end = 1600 + 4 + 8,
 	.vtotal = 1600 + 4 + 8 + 32,
 	.vrefresh = 60,
-	.private_flags = DRM_PANEL_FLAG_PREFER_ONE_SHOT,
+	.private_flags = DRM_PANEL_FLAG_PREFER_ONE_SHOT |
+			 DRM_PANEL_FLAG_TE_POLARITY_LOW,
 };
 
 static int sharp_panel_get_modes(struct drm_panel *panel)
-- 
1.7.9.5
