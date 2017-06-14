From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 07/20] drm/tegra: dc: Apply clipping to the plane
Date: Thu, 15 Jun 2017 02:18:30 +0300
Message-ID: <1306db6555e16d0bed85d731d79c05a29fda3bda.1497480757.git.digetx@gmail.com>
References: <cover.1497480751.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tegra20 an overlay plane should be clipped, otherwise its output is
distorted once plane crosses display boundary.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 98ee6abb056c..a7a7cce1afd0 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -486,12 +486,25 @@ static int tegra_plane_state_add(struct tegra_plane *plane,
 {
 	struct drm_crtc_state *crtc_state;
 	struct tegra_dc_state *tegra;
+	struct drm_rect clip;
+	int err;
 
 	/* Propagate errors from allocation or locking failures. */
 	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
+	clip.x1 = 0;
+	clip.y1 = 0;
+	clip.x2 = crtc_state->mode.hdisplay;
+	clip.y2 = crtc_state->mode.vdisplay;
+
+	/* Check plane state for visibility and calculate clipping bounds */
+	err = drm_plane_helper_check_state(state, &clip, 0, INT_MAX,
+					   true, true);
+	if (err < 0)
+		return err;
+
 	tegra = to_dc_state(crtc_state);
 
 	tegra->planes |= WIN_A_ACT_REQ << plane->index;
@@ -561,14 +574,14 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
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
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
 	window.bottom_up = tegra_fb_is_bottom_up(fb);
 
-- 
2.13.0
