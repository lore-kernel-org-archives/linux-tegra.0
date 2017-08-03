From: Cihangir Akturk <cakturk@gmail.com>
Subject: [PATCH 22/29] drm/tegra: switch to drm_*{get,put} helpers
Date: Thu,  3 Aug 2017 14:58:37 +0300
Message-ID: <1501761585-11757-23-git-send-email-cakturk@gmail.com>
References: <1501761585-11757-1-git-send-email-cakturk@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501761585-11757-1-git-send-email-cakturk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Cihangir Akturk <cakturk@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

drm_*_reference() and drm_*_unreference() functions are just
compatibility alias for drm_*_get() and drm_*_put() adn should not be
used by new code. So convert all users of compatibility functions to use
the new APIs.

Signed-off-by: Cihangir Akturk <cakturk@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 12 ++++++------
 drivers/gpu/drm/tegra/fb.c  |  8 ++++----
 drivers/gpu/drm/tegra/gem.c | 10 +++++-----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 518f4b6..eddea77 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -304,7 +304,7 @@ host1x_bo_lookup(struct drm_file *file, u32 handle)
 	if (!gem)
 		return NULL;
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	bo = to_tegra_bo(gem);
 	return &bo->base;
@@ -591,7 +591,7 @@ static int tegra_gem_mmap(struct drm_device *drm, void *data,
 
 	args->offset = drm_vma_node_offset_addr(&bo->gem.vma_node);
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	return 0;
 }
@@ -858,7 +858,7 @@ static int tegra_gem_set_tiling(struct drm_device *drm, void *data,
 	bo->tiling.mode = mode;
 	bo->tiling.value = value;
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	return 0;
 }
@@ -898,7 +898,7 @@ static int tegra_gem_get_tiling(struct drm_device *drm, void *data,
 		break;
 	}
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	return err;
 }
@@ -923,7 +923,7 @@ static int tegra_gem_set_flags(struct drm_device *drm, void *data,
 	if (args->flags & DRM_TEGRA_GEM_BOTTOM_UP)
 		bo->flags |= TEGRA_BO_BOTTOM_UP;
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	return 0;
 }
@@ -945,7 +945,7 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 	if (bo->flags & TEGRA_BO_BOTTOM_UP)
 		args->flags |= DRM_TEGRA_GEM_BOTTOM_UP;
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 25acb73..80540c1 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -88,7 +88,7 @@ static void tegra_fb_destroy(struct drm_framebuffer *framebuffer)
 			if (bo->pages)
 				vunmap(bo->vaddr);
 
-			drm_gem_object_unreference_unlocked(&bo->gem);
+			drm_gem_object_put_unlocked(&bo->gem);
 		}
 	}
 
@@ -195,7 +195,7 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 
 unreference:
 	while (i--)
-		drm_gem_object_unreference_unlocked(&planes[i]->gem);
+		drm_gem_object_put_unlocked(&planes[i]->gem);
 
 	return ERR_PTR(err);
 }
@@ -242,7 +242,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 	info = drm_fb_helper_alloc_fbi(helper);
 	if (IS_ERR(info)) {
 		dev_err(drm->dev, "failed to allocate framebuffer info\n");
-		drm_gem_object_unreference_unlocked(&bo->gem);
+		drm_gem_object_put_unlocked(&bo->gem);
 		return PTR_ERR(info);
 	}
 
@@ -251,7 +251,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
 		err = PTR_ERR(fbdev->fb);
 		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
 			err);
-		drm_gem_object_unreference_unlocked(&bo->gem);
+		drm_gem_object_put_unlocked(&bo->gem);
 		return PTR_ERR(fbdev->fb);
 	}
 
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 7a39a35..fe77bcd 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -24,7 +24,7 @@ static void tegra_bo_put(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
-	drm_gem_object_unreference_unlocked(&obj->gem);
+	drm_gem_object_put_unlocked(&obj->gem);
 }
 
 static dma_addr_t tegra_bo_pin(struct host1x_bo *bo, struct sg_table **sgt)
@@ -95,7 +95,7 @@ static struct host1x_bo *tegra_bo_get(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
-	drm_gem_object_reference(&obj->gem);
+	drm_gem_object_get(&obj->gem);
 
 	return bo;
 }
@@ -325,7 +325,7 @@ struct tegra_bo *tegra_bo_create_with_handle(struct drm_file *file,
 		return ERR_PTR(err);
 	}
 
-	drm_gem_object_unreference_unlocked(&bo->gem);
+	drm_gem_object_put_unlocked(&bo->gem);
 
 	return bo;
 }
@@ -439,7 +439,7 @@ int tegra_bo_dumb_map_offset(struct drm_file *file, struct drm_device *drm,
 
 	*offset = drm_vma_node_offset_addr(&bo->gem.vma_node);
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	return 0;
 }
@@ -654,7 +654,7 @@ struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
 		struct drm_gem_object *gem = buf->priv;
 
 		if (gem->dev == drm) {
-			drm_gem_object_reference(gem);
+			drm_gem_object_get(gem);
 			return gem;
 		}
 	}
-- 
2.7.4
