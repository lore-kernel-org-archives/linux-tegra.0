From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 3/3] drm/tegra: Add support for tiled buffer objects
Date: Thu,  4 Apr 2013 16:09:20 +0200
Message-ID: <1365084560-11069-4-git-send-email-thierry.reding@avionic-design.de>
References: <1365084560-11069-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365084560-11069-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The gr2d and gr3d engines work more efficiently on buffers with a tiled
memory layout. Allow created buffers to be marked as tiled so that the
display controller can scan them out properly.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/gpu/host1x/drm/dc.c  | 11 +++++++++++
 drivers/gpu/host1x/drm/dc.h  |  4 ++++
 drivers/gpu/host1x/drm/drm.c |  2 +-
 drivers/gpu/host1x/drm/drm.h |  2 ++
 drivers/gpu/host1x/drm/fb.c  | 12 +++++++++++-
 drivers/gpu/host1x/drm/gem.c | 20 +++++++++++++-------
 drivers/gpu/host1x/drm/gem.h | 13 +++++++++----
 include/uapi/drm/tegra_drm.h |  2 ++
 8 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/host1x/drm/dc.c b/drivers/gpu/host1x/drm/dc.c
index 14a09a4..5a0d111 100644
--- a/drivers/gpu/host1x/drm/dc.c
+++ b/drivers/gpu/host1x/drm/dc.c
@@ -51,6 +51,7 @@ static int tegra_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
 	window.dst.h = crtc_h;
 	window.format = tegra_dc_format(fb->pixel_format);
 	window.bits_per_pixel = fb->bits_per_pixel;
+	window.tiled = tegra_fb_is_tiled(fb);
 
 	for (i = 0; i < drm_format_num_planes(fb->pixel_format); i++) {
 		struct tegra_bo *bo = tegra_fb_get_plane(fb, i);
@@ -492,6 +493,16 @@ int tegra_dc_setup_window(struct tegra_dc *dc, unsigned int index,
 	tegra_dc_writel(dc, h_offset, DC_WINBUF_ADDR_H_OFFSET);
 	tegra_dc_writel(dc, v_offset, DC_WINBUF_ADDR_V_OFFSET);
 
+	if (window->tiled) {
+		value = DC_WIN_BUFFER_ADDR_MODE_TILE_UV |
+			DC_WIN_BUFFER_ADDR_MODE_TILE;
+	} else {
+		value = DC_WIN_BUFFER_ADDR_MODE_LINEAR_UV |
+			DC_WIN_BUFFER_ADDR_MODE_LINEAR;
+	}
+
+	tegra_dc_writel(dc, value, DC_WIN_BUFFER_ADDR_MODE);
+
 	value = WIN_ENABLE;
 
 	if (yuv) {
diff --git a/drivers/gpu/host1x/drm/dc.h b/drivers/gpu/host1x/drm/dc.h
index 79eaec9..e8da0ba 100644
--- a/drivers/gpu/host1x/drm/dc.h
+++ b/drivers/gpu/host1x/drm/dc.h
@@ -365,6 +365,10 @@
 #define DC_WIN_BUF_STRIDE			0x70b
 #define DC_WIN_UV_BUF_STRIDE			0x70c
 #define DC_WIN_BUFFER_ADDR_MODE			0x70d
+#define DC_WIN_BUFFER_ADDR_MODE_LINEAR    (0 <<  0)
+#define DC_WIN_BUFFER_ADDR_MODE_TILE      (1 <<  0)
+#define DC_WIN_BUFFER_ADDR_MODE_LINEAR_UV (0 << 16)
+#define DC_WIN_BUFFER_ADDR_MODE_TILE_UV   (1 << 16)
 #define DC_WIN_DV_CONTROL			0x70e
 
 #define DC_WIN_BLEND_NOKEY			0x70f
diff --git a/drivers/gpu/host1x/drm/drm.c b/drivers/gpu/host1x/drm/drm.c
index 298c5f0..33d04c3 100644
--- a/drivers/gpu/host1x/drm/drm.c
+++ b/drivers/gpu/host1x/drm/drm.c
@@ -328,7 +328,7 @@ static int tegra_gem_create(struct drm_device *drm, void *data,
 	struct drm_tegra_gem_create *args = data;
 	struct tegra_bo *bo;
 
-	bo = tegra_bo_create_with_handle(file, drm, args->size,
+	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
 					 &args->handle);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index 02ce020..fd1f373 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -162,6 +162,7 @@ struct tegra_dc_window {
 	unsigned int format;
 	unsigned int stride[2];
 	unsigned long base[3];
+	bool tiled;
 };
 
 /* from dc.c */
@@ -262,6 +263,7 @@ extern int tegra_output_exit(struct tegra_output *output);
 /* from fb.c */
 struct tegra_bo *tegra_fb_get_plane(struct drm_framebuffer *framebuffer,
 				    unsigned int index);
+bool tegra_fb_is_tiled(struct drm_framebuffer *framebuffer);
 extern int tegra_drm_fb_init(struct drm_device *drm);
 extern void tegra_drm_fb_exit(struct drm_device *drm);
 extern void tegra_fbdev_restore_mode(struct tegra_fbdev *fbdev);
diff --git a/drivers/gpu/host1x/drm/fb.c b/drivers/gpu/host1x/drm/fb.c
index 953e418..b8b3c21 100644
--- a/drivers/gpu/host1x/drm/fb.c
+++ b/drivers/gpu/host1x/drm/fb.c
@@ -34,6 +34,16 @@ struct tegra_bo *tegra_fb_get_plane(struct drm_framebuffer *framebuffer,
 	return fb->planes[index];
 }
 
+bool tegra_fb_is_tiled(struct drm_framebuffer *framebuffer)
+{
+	struct tegra_fb *fb = to_tegra_fb(framebuffer);
+
+	if (fb->planes[0]->flags & TEGRA_BO_TILED)
+		return true;
+
+	return false;
+}
+
 static void tegra_fb_destroy(struct drm_framebuffer *framebuffer)
 {
 	struct tegra_fb *fb = to_tegra_fb(framebuffer);
@@ -188,7 +198,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 
 	size = cmd.pitches[0] * cmd.height;
 
-	bo = tegra_bo_create(drm, size);
+	bo = tegra_bo_create(drm, size, 0);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/host1x/drm/gem.c b/drivers/gpu/host1x/drm/gem.c
index c5e9a9b..0bdbb50 100644
--- a/drivers/gpu/host1x/drm/gem.c
+++ b/drivers/gpu/host1x/drm/gem.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/dma-mapping.h>
 
+#include <drm/tegra_drm.h>
 #include <drm/drmP.h>
 #include <drm/drm.h>
 
@@ -111,7 +112,8 @@ unsigned int tegra_bo_get_mmap_offset(struct tegra_bo *bo)
 	return (unsigned int)bo->gem.map_list.hash.key << PAGE_SHIFT;
 }
 
-struct tegra_bo *tegra_bo_create(struct drm_device *drm, unsigned int size)
+struct tegra_bo *tegra_bo_create(struct drm_device *drm, unsigned int size,
+				 unsigned long flags)
 {
 	struct tegra_bo *bo;
 	int err;
@@ -140,6 +142,9 @@ struct tegra_bo *tegra_bo_create(struct drm_device *drm, unsigned int size)
 	if (err)
 		goto err_mmap;
 
+	if (flags & DRM_TEGRA_GEM_CREATE_TILED)
+		bo->flags |= TEGRA_BO_TILED;
+
 	return bo;
 
 err_mmap:
@@ -154,14 +159,15 @@ err_dma:
 }
 
 struct tegra_bo *tegra_bo_create_with_handle(struct drm_file *file,
-					    struct drm_device *drm,
-					    unsigned int size,
-					    unsigned int *handle)
+					     struct drm_device *drm,
+					     unsigned int size,
+					     unsigned long flags,
+					     unsigned int *handle)
 {
 	struct tegra_bo *bo;
 	int ret;
 
-	bo = tegra_bo_create(drm, size);
+	bo = tegra_bo_create(drm, size, flags);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -203,8 +209,8 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 	if (args->size < args->pitch * args->height)
 		args->size = args->pitch * args->height;
 
-	bo = tegra_bo_create_with_handle(file, drm, args->size,
-					    &args->handle);
+	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
+					 &args->handle);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/host1x/drm/gem.h b/drivers/gpu/host1x/drm/gem.h
index 34de2b4..a8fc68a 100644
--- a/drivers/gpu/host1x/drm/gem.h
+++ b/drivers/gpu/host1x/drm/gem.h
@@ -24,9 +24,12 @@
 
 #include "host1x_bo.h"
 
+#define TEGRA_BO_TILED (1 << 0)
+
 struct tegra_bo {
 	struct drm_gem_object gem;
 	struct host1x_bo base;
+	unsigned long flags;
 	dma_addr_t paddr;
 	void *vaddr;
 };
@@ -38,11 +41,13 @@ static inline struct tegra_bo *to_tegra_bo(struct drm_gem_object *gem)
 
 extern const struct host1x_bo_ops tegra_bo_ops;
 
-struct tegra_bo *tegra_bo_create(struct drm_device *drm, unsigned int size);
+struct tegra_bo *tegra_bo_create(struct drm_device *drm, unsigned int size,
+				 unsigned long flags);
 struct tegra_bo *tegra_bo_create_with_handle(struct drm_file *file,
-					    struct drm_device *drm,
-					    unsigned int size,
-					    unsigned int *handle);
+					     struct drm_device *drm,
+					     unsigned int size,
+					     unsigned long flags,
+					     unsigned int *handle);
 void tegra_bo_free_object(struct drm_gem_object *gem);
 unsigned int tegra_bo_get_mmap_offset(struct tegra_bo *bo);
 int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index 6e132a2..8b9424a 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -17,6 +17,8 @@
 #ifndef _UAPI_TEGRA_DRM_H_
 #define _UAPI_TEGRA_DRM_H_
 
+#define DRM_TEGRA_GEM_CREATE_TILED (1 << 0)
+
 struct drm_tegra_gem_create {
 	__u64 size;
 	__u32 flags;
-- 
1.8.2
