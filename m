From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 6/6] =?UTF-8?q?drm/tegra:=20plane:=20Support=20180?= =?UTF-8?q?=C2=B0=20rotation?=
Date: Sun, 14 Jun 2020 22:03:48 +0300
Message-ID: <20200614190348.12193-7-digetx@gmail.com>
References: <20200614190348.12193-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200614190348.12193-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Combining horizontal and vertical reflections gives us 180 degrees of
rotation.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index f31bca27cde4..ddd9b88f8fce 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -608,6 +608,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 {
 	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
 	unsigned int rotation = DRM_MODE_ROTATE_0 |
+				DRM_MODE_ROTATE_180 |
 				DRM_MODE_REFLECT_X |
 				DRM_MODE_REFLECT_Y;
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
@@ -659,6 +660,14 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	else
 		plane_state->reflect_y = false;
 
+	if (tegra_fb_is_bottom_up(state->fb))
+		plane_state->reflect_y = true;
+
+	if (rotation & DRM_MODE_ROTATE_180) {
+		plane_state->reflect_x = !plane_state->reflect_x;
+		plane_state->reflect_y = !plane_state->reflect_y;
+	}
+
 	/*
 	 * Tegra doesn't support different strides for U and V planes so we
 	 * error out if the user tries to display a framebuffer with such a
@@ -720,7 +729,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.dst.h = drm_rect_height(&plane->state->dst);
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
 	window.reflect_x = state->reflect_x;
-	window.reflect_y = tegra_fb_is_bottom_up(fb) || state->reflect_y;
+	window.reflect_y = state->reflect_y;
 
 	/* copy from state */
 	window.zpos = plane->state->normalized_zpos;
@@ -806,6 +815,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
@@ -1094,6 +1104,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
 						 DRM_MODE_ROTATE_0 |
+						 DRM_MODE_ROTATE_180 |
 						 DRM_MODE_REFLECT_X |
 						 DRM_MODE_REFLECT_Y);
 	if (err < 0)
-- 
2.26.0
