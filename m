From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: dc: Apply clipping to the overlay plane
Date: Fri, 26 Aug 2016 12:22:26 +0300
Message-ID: <20160826092433.23771-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Overlay plane should be clipped, otherwise overlay output gets distorted
once plane crosses display boundary. As a "side effect" this patch also
adds a sanity check for the primary plane, insuring that it covers whole
display area.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 85 ++++++++++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 4010d69..ddac53c 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -480,31 +480,24 @@ static const struct drm_plane_funcs tegra_primary_plane_funcs = {
 	.atomic_destroy_state = tegra_plane_atomic_destroy_state,
 };
 
-static int tegra_plane_state_add(struct tegra_plane *plane,
-				 struct drm_plane_state *state)
+static void tegra_plane_state_add(struct tegra_plane *plane,
+				  struct drm_crtc_state *crtc_state)
 {
-	struct drm_crtc_state *crtc_state;
-	struct tegra_dc_state *tegra;
-
-	/* Propagate errors from allocation or locking failures. */
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
-	if (IS_ERR(crtc_state))
-		return PTR_ERR(crtc_state);
-
-	tegra = to_dc_state(crtc_state);
+	struct tegra_dc_state *tegra = to_dc_state(crtc_state);
 
 	tegra->planes |= WIN_A_ACT_REQ << plane->index;
-
-	return 0;
 }
 
 static int tegra_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_plane_state *state,
+				    bool overlay)
 {
 	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
 	struct tegra_plane *tegra = to_tegra_plane(plane);
 	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+	struct drm_crtc_state *crtc_state;
+	struct drm_rect clip;
 	int err;
 
 	/* no need for further checks if the plane is being disabled */
@@ -538,13 +531,38 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 		}
 	}
 
-	err = tegra_plane_state_add(tegra, state);
+	/* propagate errors from allocation or locking failures. */
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	/* check plane for visibility and apply clipping */
+	clip.x1 = 0;
+	clip.y1 = 0;
+	clip.x2 = crtc_state->mode.hdisplay;
+	clip.y2 = crtc_state->mode.vdisplay;
+
+	err = drm_plane_helper_check_state(state, &clip, 0, INT_MAX,
+					   overlay, true);
 	if (err < 0)
 		return err;
 
+	if (!state->visible) {
+		DRM_ERROR("hardware doesn't handle invisible plane\n");
+		return -EINVAL;
+	}
+
+	tegra_plane_state_add(tegra, crtc_state);
+
 	return 0;
 }
 
+static int tegra_primary_plane_atomic_check(struct drm_plane *plane,
+					    struct drm_plane_state *state)
+{
+	return tegra_plane_atomic_check(plane, state, false);
+}
+
 static void tegra_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
@@ -560,14 +578,14 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	memset(&window, 0, sizeof(window));
-	window.src.x = plane->state->src_x >> 16;
-	window.src.y = plane->state->src_y >> 16;
-	window.src.w = plane->state->src_w >> 16;
-	window.src.h = plane->state->src_h >> 16;
-	window.dst.x = plane->state->crtc_x;
-	window.dst.y = plane->state->crtc_y;
-	window.dst.w = plane->state->crtc_w;
-	window.dst.h = plane->state->crtc_h;
+	window.src.x = plane->state->src.x1 >> 16;
+	window.src.y = plane->state->src.y1 >> 16;
+	window.src.w = drm_rect_width(&plane->state->src) >> 16;
+	window.src.h = drm_rect_height(&plane->state->src) >> 16;
+	window.dst.x = plane->state->dst.x1;
+	window.dst.y = plane->state->dst.y1;
+	window.dst.w = drm_rect_width(&plane->state->dst);
+	window.dst.h = drm_rect_height(&plane->state->dst);
 	window.bits_per_pixel = fb->bits_per_pixel;
 	window.bottom_up = tegra_fb_is_bottom_up(fb);
 
@@ -620,7 +638,7 @@ static void tegra_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs tegra_primary_plane_helper_funcs = {
-	.atomic_check = tegra_plane_atomic_check,
+	.atomic_check = tegra_primary_plane_atomic_check,
 	.atomic_update = tegra_plane_atomic_update,
 	.atomic_disable = tegra_plane_atomic_disable,
 };
@@ -675,7 +693,7 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 				     struct drm_plane_state *state)
 {
 	struct tegra_plane *tegra = to_tegra_plane(plane);
-	int err;
+	struct drm_crtc_state *crtc_state;
 
 	/* no need for further checks if the plane is being disabled */
 	if (!state->crtc)
@@ -694,9 +712,12 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 	    state->crtc_w != 128 && state->crtc_w != 256)
 		return -EINVAL;
 
-	err = tegra_plane_state_add(tegra, state);
-	if (err < 0)
-		return err;
+	/* propagate errors from allocation or locking failures. */
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	tegra_plane_state_add(tegra, crtc_state);
 
 	return 0;
 }
@@ -857,8 +878,14 @@ static const uint32_t tegra_overlay_plane_formats[] = {
 	DRM_FORMAT_YUV422,
 };
 
+static int tegra_overlay_plane_atomic_check(struct drm_plane *plane,
+					    struct drm_plane_state *state)
+{
+	return tegra_plane_atomic_check(plane, state, true);
+}
+
 static const struct drm_plane_helper_funcs tegra_overlay_plane_helper_funcs = {
-	.atomic_check = tegra_plane_atomic_check,
+	.atomic_check = tegra_overlay_plane_atomic_check,
 	.atomic_update = tegra_plane_atomic_update,
 	.atomic_disable = tegra_plane_atomic_disable,
 };
-- 
2.9.3
