From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/5] drm/tegra: Trade overlay plane for cursor on older Tegra's
Date: Wed, 20 Dec 2017 18:46:12 +0300
Message-ID: <fd0034ee935cc17915f4189ee65865c974f34d98.1513783739.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1513783738.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1513783738.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1513783738.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Older Tegra's do not support RGBA format for the cursor, but instead
overlay plane could be used for it. Since there is no much use for the
overlays on a regular desktop and HW-accelerated cursor is much nicer
than the jerky SW cursor, let's trade one overlay plane for the cursor.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 75 +++++++++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/tegra/dc.h |  2 ++
 2 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 460510366bb8..eaff8757bbe0 100644
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
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_2WIN_Y);
-		tegra_dc_writel(dc, 0x000000, DC_WIN_BLEND_3WIN_XY);
+		tegra_dc_writel(dc, 0x000008, DC_WIN_BLEND_2WIN_Y);
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
 
@@ -433,7 +440,6 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	struct tegra_plane_state *state = to_tegra_plane_state(plane->state);
 	struct tegra_dc *dc = to_tegra_dc(plane->state->crtc);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_dc_window window;
 	unsigned int i;
 
@@ -475,7 +481,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 			window.stride[i] = fb->pitches[i];
 	}
 
-	tegra_dc_setup_window(dc, p->index, &window);
+	tegra_dc_setup_window(dc, plane, &window);
 }
 
 static const struct drm_plane_helper_funcs tegra_plane_helper_funcs = {
@@ -706,6 +712,14 @@ static const u32 tegra20_overlay_formats[] = {
 	DRM_FORMAT_YUV422,
 };
 
+static const u32 tegra20_overlay_cursor_formats[] = {
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB8888,
+};
+
 static const u32 tegra114_overlay_formats[] = {
 	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_ARGB1555,
@@ -765,9 +779,11 @@ static const u32 tegra124_overlay_formats[] = {
 
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
@@ -781,13 +797,19 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	plane->index = index;
 	plane->depth = 0;
 
-	num_formats = dc->soc->num_overlay_formats;
-	formats = dc->soc->overlay_formats;
+	if (cursor) {
+		num_formats = dc->soc->num_overlay_cursor_formats;
+		formats = dc->soc->overlay_cursor_formats;
+		type = DRM_PLANE_TYPE_CURSOR;
+	} else {
+		num_formats = dc->soc->num_overlay_formats;
+		formats = dc->soc->overlay_formats;
+		type = DRM_PLANE_TYPE_OVERLAY;
+	}
 
 	err = drm_universal_plane_init(drm, &plane->base, 1 << dc->pipe,
 				       &tegra_plane_funcs, formats,
-				       num_formats, NULL,
-				       DRM_PLANE_TYPE_OVERLAY, NULL);
+				       num_formats, NULL, type, NULL);
 	if (err < 0) {
 		kfree(plane);
 		return ERR_PTR(err);
@@ -836,14 +858,18 @@ static struct drm_plane *tegra_dc_add_planes(struct drm_device *drm,
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
@@ -1766,6 +1792,13 @@ static int tegra_dc_init(struct host1x_client *client)
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
@@ -1855,6 +1888,9 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.primary_formats = tegra20_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra20_overlay_formats),
 	.overlay_formats = tegra20_overlay_formats,
+	.num_overlay_cursor_formats =
+				ARRAY_SIZE(tegra20_overlay_cursor_formats),
+	.overlay_cursor_formats = tegra20_overlay_cursor_formats,
 	.supports_opaque_formats = false,
 };
 
@@ -1871,6 +1907,9 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.primary_formats = tegra20_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra20_overlay_formats),
 	.overlay_formats = tegra20_overlay_formats,
+	.num_overlay_cursor_formats =
+				ARRAY_SIZE(tegra20_overlay_cursor_formats),
+	.overlay_cursor_formats = tegra20_overlay_cursor_formats,
 	.supports_opaque_formats = false,
 };
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 3a66a1127ee7..e7cdf1d0729d 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -65,6 +65,8 @@ struct tegra_dc_soc_info {
 	unsigned int num_primary_formats;
 	const u32 *overlay_formats;
 	unsigned int num_overlay_formats;
+	const u32 *overlay_cursor_formats;
+	unsigned int num_overlay_cursor_formats;
 	bool supports_opaque_formats;
 };
 
-- 
2.15.1
