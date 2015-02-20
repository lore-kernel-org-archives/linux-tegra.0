From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH] drm/tegra: Remove unused .mode_set and .mode_set_base CRTC helpers
Date: Fri, 20 Feb 2015 13:43:56 +0200
Message-ID: <1424432636-14762-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The two CRTC helper operations are called only for non-atomic mode
setting, by either the drm_crtc_helper_set_config() helper or the
drm_helper_resume_force_mode() helper. As the driver has switched to
atomic mode setting and neither of those helpers is used, the operations
are not used anymore. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 2 --
 1 file changed, 2 deletions(-)

Hi Thierry,

I stumbled on this while trying to understand the atomic mode setting code
paths. Could you please test the patch ?

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 3aaa84ae2681..4476d6a35a0f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1327,9 +1327,7 @@ static void tegra_crtc_atomic_flush(struct drm_crtc *crtc)
 static const struct drm_crtc_helper_funcs tegra_crtc_helper_funcs = {
 	.disable = tegra_crtc_disable,
 	.mode_fixup = tegra_crtc_mode_fixup,
-	.mode_set = drm_helper_crtc_mode_set,
 	.mode_set_nofb = tegra_crtc_mode_set_nofb,
-	.mode_set_base = drm_helper_crtc_mode_set_base,
 	.prepare = tegra_crtc_prepare,
 	.commit = tegra_crtc_commit,
 	.atomic_check = tegra_crtc_atomic_check,
-- 
Regards,

Laurent Pinchart
