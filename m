From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/12] drm/tegra: Support ARGB and ABGR formats
Date: Mon, 27 Nov 2017 11:09:49 +0100
Message-ID: <20171127100952.22465-10-thierry.reding@gmail.com>
References: <20171127100952.22465-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100952.22465-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These formats can easily be supported on all generations of Tegra.

Note that the XRGB and XBGR formats that we supported were in fact using
the ARGB and ABGR Tegra formats. This happened to work in cases where no
alpha was being considered. This change is also a fix for those formats.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c    | 4 ++++
 drivers/gpu/drm/tegra/dc.h    | 2 ++
 drivers/gpu/drm/tegra/plane.c | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2d54657b538e..e40272493235 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -287,7 +287,9 @@ static void tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 
 static const u32 tegra_primary_plane_formats[] = {
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_RGB565,
 };
 
@@ -649,7 +651,9 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 
 static const uint32_t tegra_overlay_plane_formats[] = {
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_UYVY,
 	DRM_FORMAT_YUYV,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 47f43663adcb..018fea74fb50 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -598,6 +598,8 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define WIN_COLOR_DEPTH_YUV422R        23
 #define WIN_COLOR_DEPTH_YCbCr422RA     24
 #define WIN_COLOR_DEPTH_YUV422RA       25
+#define WIN_COLOR_DEPTH_B8G8R8X8       37
+#define WIN_COLOR_DEPTH_R8G8B8X8       38
 
 #define DC_WIN_POSITION				0x704
 #define H_POSITION(x) (((x) & 0x1fff) <<  0) /* XXX 0x7fff on Tegra186 */
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 1847d0204e46..1fff98fe6962 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -111,10 +111,18 @@ int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
 
 	switch (fourcc) {
 	case DRM_FORMAT_XBGR8888:
+		*format = WIN_COLOR_DEPTH_R8G8B8X8;
+		break;
+
+	case DRM_FORMAT_ABGR8888:
 		*format = WIN_COLOR_DEPTH_R8G8B8A8;
 		break;
 
 	case DRM_FORMAT_XRGB8888:
+		*format = WIN_COLOR_DEPTH_B8G8R8X8;
+		break;
+
+	case DRM_FORMAT_ARGB8888:
 		*format = WIN_COLOR_DEPTH_B8G8R8A8;
 		break;
 
-- 
2.15.0
