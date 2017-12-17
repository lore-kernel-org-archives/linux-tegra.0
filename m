From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] drm/tegra: Trade overlay plane for cursor on older Tegra's
Date: Sun, 17 Dec 2017 20:25:45 +0300
Message-ID: <73fc5a5b95e6829e895dbd4ed97462451d0c0338.1513530923.git.digetx@gmail.com>
References: <8a87083279bb793dd21a0c621bcd002a851495e5.1513530934.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a87083279bb793dd21a0c621bcd002a851495e5.1513530934.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Older Tegra's do not support RGBA format for the cursor, but instead
overlay plane could be used for it. Since there is no much use for the
overlays on a regular desktop and HW-accelerated cursor is much nicer
than the jerky SW cursor, let's trade one overlay plane for the cursor.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 52 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7e58143f4145..3282aa911351 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -125,9 +125,10 @@ static inline u32 compute_initial_dda(unsigned int in)
 	return dfixed_frac(inf);
 }
 
-static void tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
+static void tegra_dc_setup_window(struct tegra_dc *dc, struct drm_plane *plane,
 				  const struct tegra_dc_window *window)
 {
+	struct tegra_plane *p = to_tegra_plane(plane);
 	unsigned h_offset, v_offset, h_size, v_size, h_dda, v_dda, bpp;
 	unsigned long value, flags;
 	bool yuv, planar;
@@ -144,7 +145,7 @@ static void tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 
 	spin_lock_irqsave(&dc->lock, flags);
 
-	value = WINDOW_A_SELECT << index;
+	value = WINDOW_A_SELECT << p->index;
 	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_WINDOW_HEADER);
 
 	tegra_dc_writel(dc, window->format, DC_WIN_COLOR_DEPTH);
@@ -275,23 +276,29 @@ static void tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_NOKEY);
 	tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_1WIN);
 
-	switch (index) {
+	switch (p->index) {
 	case 0:
 		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_X);
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
+		tegra_dc_writel(dc, 0x000008, DC_WIN_BLEND_2WIN_Y);
 		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
 		break;
 
 	case 1:
 		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
 		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
+		tegra_dc_writel(dc, 0x000008, DC_WIN_BLEND_3WIN_XY);
 		break;
 
 	case 2:
-		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
-		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_Y);
-		tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_3WIN_XY);
+		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+			tegra_dc_writel(dc, 0xffff04, DC_WIN_BLEND_2WIN_X);
+			tegra_dc_writel(dc, 0xffff04, DC_WIN_BLEND_2WIN_Y);
+			tegra_dc_writel(dc, 0xffff04, DC_WIN_BLEND_3WIN_XY);
+		} else {
+			tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_X);
+			tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_2WIN_Y);
+			tegra_dc_writel(dc, 0xffff00, DC_WIN_BLEND_3WIN_XY);
+		}
 		break;
 	}
 
@@ -438,7 +445,6 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	struct tegra_plane_state *state = to_tegra_plane_state(plane->state);
 	struct tegra_dc *dc = to_tegra_dc(plane->state->crtc);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_dc_window window;
 	unsigned int i;
 
@@ -480,7 +486,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 			window.stride[i] = fb->pitches[i];
 	}
 
-	tegra_dc_setup_window(dc, p->index, &window);
+	tegra_dc_setup_window(dc, plane, &window);
 }
 
 static const struct drm_plane_helper_funcs tegra_plane_helper_funcs = {
@@ -775,9 +781,11 @@ static const u32 tegra124_overlay_formats[] = {
 
 static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 						       struct tegra_dc *dc,
-						       unsigned int index)
+						       unsigned int index,
+						       bool cursor)
 {
 	struct tegra_plane *plane;
+	enum drm_plane_type type;
 	unsigned int num_formats;
 	const u32 *formats;
 	int err;
@@ -793,11 +801,14 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 
 	num_formats = dc->soc->num_overlay_formats;
 	formats = dc->soc->overlay_formats;
+	type = DRM_PLANE_TYPE_OVERLAY;
+
+	if (cursor)
+		type = DRM_PLANE_TYPE_CURSOR;
 
 	err = drm_universal_plane_init(drm, &plane->base, 1 << dc->pipe,
 				       &tegra_plane_funcs, formats,
-				       num_formats, NULL,
-				       DRM_PLANE_TYPE_OVERLAY, NULL);
+				       num_formats, NULL, type, NULL);
 	if (err < 0) {
 		kfree(plane);
 		return ERR_PTR(err);
@@ -846,14 +857,18 @@ static struct drm_plane *tegra_dc_add_planes(struct drm_device *drm,
 					     struct tegra_dc *dc)
 {
 	struct drm_plane *plane, *primary;
+	unsigned int planes_num = 2;
 	unsigned int i;
 
 	primary = tegra_primary_plane_create(drm, dc);
 	if (IS_ERR(primary))
 		return primary;
 
-	for (i = 0; i < 2; i++) {
-		plane = tegra_dc_overlay_plane_create(drm, dc, 1 + i);
+	if (!dc->soc->supports_cursor)
+		planes_num--;
+
+	for (i = 0; i < planes_num; i++) {
+		plane = tegra_dc_overlay_plane_create(drm, dc, 1 + i, false);
 		if (IS_ERR(plane)) {
 			/* XXX tegra_plane_destroy() */
 			drm_plane_cleanup(primary);
@@ -1770,6 +1785,13 @@ static int tegra_dc_init(struct host1x_client *client)
 			err = PTR_ERR(cursor);
 			goto cleanup;
 		}
+	} else {
+		/* trade overlay for RGBA cursor plane on older Tegra's */
+		cursor = tegra_dc_overlay_plane_create(drm, dc, 2, true);
+		if (IS_ERR(cursor)) {
+			err = PTR_ERR(cursor);
+			goto cleanup;
+		}
 	}
 
 	err = drm_crtc_init_with_planes(drm, &dc->base, primary, cursor,
-- 
2.15.1
