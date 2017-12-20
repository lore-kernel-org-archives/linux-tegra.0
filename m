From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/5] drm/tegra: Restore opaque and drop alpha formats on Tegra20/30
Date: Wed, 20 Dec 2017 18:46:11 +0300
Message-ID: <0476e28d70b47ec599fb65d1cfa457276629de27.1513783738.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1513783738.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1513783738.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1513783738.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Commit 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats") broke
DRM's MODE_ADDFB IOCTL on Tegra20/30, because IOCTL uses XRGB format if
requested FB depth is 24bpp. As a result, Xorg doesn't work anymore with
both modesetting and opentegra drivers. On older Tegra's each plane has
a blending configuration which should be used to enable / disable alpha
blending and right now the blending configs are hardcoded to disabled
alpha blending. In order to support alpha formats properly, planes
blending configuration must be adjusted, until then the alpha formats
are equal to non-alpha.

Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c    | 29 ++++++++++++++++++-----------
 drivers/gpu/drm/tegra/dc.h    |  1 +
 drivers/gpu/drm/tegra/fb.c    | 13 -------------
 drivers/gpu/drm/tegra/hub.c   |  3 ++-
 drivers/gpu/drm/tegra/plane.c | 22 +++++++++++++++++-----
 drivers/gpu/drm/tegra/plane.h |  2 +-
 6 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 5299185cea2f..460510366bb8 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -299,12 +299,12 @@ static void tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 }
 
 static const u32 tegra20_primary_formats[] = {
-	DRM_FORMAT_ARGB4444,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGBA5551,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_ARGB8888,
+	/* non-native formats */
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
 };
 
 static const u32 tegra114_primary_formats[] = {
@@ -369,7 +369,8 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 
 	err = tegra_plane_format(state->fb->format->format,
 				 &plane_state->format,
-				 &plane_state->swap);
+				 &plane_state->swap,
+				 dc->soc->supports_opaque_formats);
 	if (err < 0)
 		return err;
 
@@ -692,12 +693,12 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 }
 
 static const u32 tegra20_overlay_formats[] = {
-	DRM_FORMAT_ARGB4444,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGBA5551,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_ARGB8888,
+	/* non-native formats */
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGBX5551,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
 	/* planar formats */
 	DRM_FORMAT_UYVY,
 	DRM_FORMAT_YUYV,
@@ -1854,6 +1855,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.primary_formats = tegra20_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra20_overlay_formats),
 	.overlay_formats = tegra20_overlay_formats,
+	.supports_opaque_formats = false,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -1869,6 +1871,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.primary_formats = tegra20_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra20_overlay_formats),
 	.overlay_formats = tegra20_overlay_formats,
+	.supports_opaque_formats = false,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -1884,6 +1887,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.primary_formats = tegra114_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra114_overlay_formats),
 	.overlay_formats = tegra114_overlay_formats,
+	.supports_opaque_formats = true,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -1899,6 +1903,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.primary_formats = tegra114_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra124_overlay_formats),
 	.overlay_formats = tegra114_overlay_formats,
+	.supports_opaque_formats = true,
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
@@ -1914,6 +1919,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.primary_formats = tegra114_primary_formats,
 	.num_overlay_formats = ARRAY_SIZE(tegra114_overlay_formats),
 	.overlay_formats = tegra114_overlay_formats,
+	.supports_opaque_formats = true,
 };
 
 static const struct tegra_windowgroup_soc tegra186_dc_wgrps[] = {
@@ -1961,6 +1967,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.has_nvdisplay = true,
 	.wgrps = tegra186_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra186_dc_wgrps),
+	.supports_opaque_formats = true,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 8098f49c0d96..3a66a1127ee7 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -65,6 +65,7 @@ struct tegra_dc_soc_info {
 	unsigned int num_primary_formats;
 	const u32 *overlay_formats;
 	unsigned int num_overlay_formats;
+	bool supports_opaque_formats;
 };
 
 struct tegra_dc {
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 5f6289c4e56a..bd8c9da1ed0d 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -253,19 +253,6 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	cmd.height = sizes->surface_height;
 	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
 				  tegra->pitch_align);
-
-	/*
-	 * Early generations of Tegra (Tegra20 and Tegra30) do not support any
-	 * of the X* or *X formats, only their A* or *A equivalents. Force the
-	 * legacy framebuffer format to include an alpha component so that the
-	 * framebuffer emulation can be supported on all generations.
-	 */
-	if (sizes->surface_bpp == 32 && sizes->surface_depth == 24)
-		sizes->surface_depth = 32;
-
-	if (sizes->surface_bpp == 16 && sizes->surface_depth == 15)
-		sizes->surface_depth = 16;
-
 	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 						     sizes->surface_depth);
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index f4911feda9ff..03298a1e87cc 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -332,7 +332,8 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
 
 	err = tegra_plane_format(state->fb->format->format,
 				 &plane_state->format,
-				 &plane_state->swap);
+				 &plane_state->swap,
+				 true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 326700cd0d80..345ec37c7481 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -103,7 +103,7 @@ int tegra_plane_state_add(struct tegra_plane *plane,
 	return 0;
 }
 
-int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
+int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool opaque_fmt)
 {
 	/* assume no swapping of fetched data */
 	if (swap)
@@ -147,11 +147,17 @@ int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
 		break;
 
 	case DRM_FORMAT_XRGB1555:
-		*format = WIN_COLOR_DEPTH_B5G5R5X1;
+		if (opaque_fmt)
+			*format = WIN_COLOR_DEPTH_B5G5R5X1;
+		else
+			*format = WIN_COLOR_DEPTH_B5G5R5A;
 		break;
 
 	case DRM_FORMAT_RGBX5551:
-		*format = WIN_COLOR_DEPTH_X1B5G5R5;
+		if (opaque_fmt)
+			*format = WIN_COLOR_DEPTH_X1B5G5R5;
+		else
+			*format = WIN_COLOR_DEPTH_AB5G5R5;
 		break;
 
 	case DRM_FORMAT_XBGR1555:
@@ -175,11 +181,17 @@ int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
 		break;
 
 	case DRM_FORMAT_XRGB8888:
-		*format = WIN_COLOR_DEPTH_B8G8R8X8;
+		if (opaque_fmt)
+			*format = WIN_COLOR_DEPTH_B8G8R8X8;
+		else
+			*format = WIN_COLOR_DEPTH_B8G8R8A8;
 		break;
 
 	case DRM_FORMAT_XBGR8888:
-		*format = WIN_COLOR_DEPTH_R8G8B8X8;
+		if (opaque_fmt)
+			*format = WIN_COLOR_DEPTH_R8G8B8X8;
+		else
+			*format = WIN_COLOR_DEPTH_R8G8B8A8;
 		break;
 
 	case DRM_FORMAT_UYVY:
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index fc7566f630fa..27145d64ad90 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -55,7 +55,7 @@ extern const struct drm_plane_funcs tegra_plane_funcs;
 int tegra_plane_state_add(struct tegra_plane *plane,
 			  struct drm_plane_state *state);
 
-int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
+int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool opaque_fmt);
 bool tegra_plane_format_is_yuv(unsigned int format, bool *planar);
 
 #endif /* TEGRA_PLANE_H */
-- 
2.15.1
