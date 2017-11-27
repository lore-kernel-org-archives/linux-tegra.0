From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/12] drm/tegra: dc: Remove duplicate plane funcs
Date: Mon, 27 Nov 2017 11:09:42 +0100
Message-ID: <20171127100952.22465-3-thierry.reding@gmail.com>
References: <20171127100952.22465-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100952.22465-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Both tegra_primary_plane_funcs and tegra_cursor_plane_funcs are
identical. Get rid of the duplicate and use one set of function pointers
for all planes.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 552710f5c386..2b7ece1d0c18 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -458,7 +458,7 @@ static void tegra_plane_atomic_destroy_state(struct drm_plane *plane,
 	kfree(state);
 }
 
-static const struct drm_plane_funcs tegra_primary_plane_funcs = {
+static const struct drm_plane_funcs tegra_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = tegra_plane_destroy,
@@ -673,7 +673,7 @@ static struct drm_plane *tegra_dc_primary_plane_create(struct drm_device *drm,
 	formats = tegra_primary_plane_formats;
 
 	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
-				       &tegra_primary_plane_funcs, formats,
+				       &tegra_plane_funcs, formats,
 				       num_formats, NULL,
 				       DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (err < 0) {
@@ -799,15 +799,6 @@ static void tegra_cursor_atomic_disable(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 }
 
-static const struct drm_plane_funcs tegra_cursor_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = tegra_plane_destroy,
-	.reset = tegra_plane_reset,
-	.atomic_duplicate_state = tegra_plane_atomic_duplicate_state,
-	.atomic_destroy_state = tegra_plane_atomic_destroy_state,
-};
-
 static const struct drm_plane_helper_funcs tegra_cursor_plane_helper_funcs = {
 	.atomic_check = tegra_cursor_atomic_check,
 	.atomic_update = tegra_cursor_atomic_update,
@@ -840,7 +831,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	formats = tegra_cursor_plane_formats;
 
 	err = drm_universal_plane_init(drm, &plane->base, 1 << dc->pipe,
-				       &tegra_cursor_plane_funcs, formats,
+				       &tegra_plane_funcs, formats,
 				       num_formats, NULL,
 				       DRM_PLANE_TYPE_CURSOR, NULL);
 	if (err < 0) {
-- 
2.15.0
