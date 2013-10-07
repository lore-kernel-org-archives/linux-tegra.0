From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 09/27] drm/tegra: gem: Miscellaneous cleanups
Date: Mon,  7 Oct 2013 10:34:26 +0200
Message-ID: <1381134884-5816-10-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Rename the host1x_to_drm_bo() macro to host1x_to_tegra_bo() for
consistency and fixup various stylistic issues.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/gem.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/host1x/drm/gem.c b/drivers/gpu/host1x/drm/gem.c
index 4a21378..267c0c2 100644
--- a/drivers/gpu/host1x/drm/gem.c
+++ b/drivers/gpu/host1x/drm/gem.c
@@ -20,14 +20,14 @@
 
 #include "gem.h"
 
-static inline struct tegra_bo *host1x_to_drm_bo(struct host1x_bo *bo)
+static inline struct tegra_bo *host1x_to_tegra_bo(struct host1x_bo *bo)
 {
 	return container_of(bo, struct tegra_bo, base);
 }
 
 static void tegra_bo_put(struct host1x_bo *bo)
 {
-	struct tegra_bo *obj = host1x_to_drm_bo(bo);
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 	struct drm_device *drm = obj->gem.dev;
 
 	mutex_lock(&drm->struct_mutex);
@@ -37,7 +37,7 @@ static void tegra_bo_put(struct host1x_bo *bo)
 
 static dma_addr_t tegra_bo_pin(struct host1x_bo *bo, struct sg_table **sgt)
 {
-	struct tegra_bo *obj = host1x_to_drm_bo(bo);
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
 	return obj->paddr;
 }
@@ -48,7 +48,7 @@ static void tegra_bo_unpin(struct host1x_bo *bo, struct sg_table *sgt)
 
 static void *tegra_bo_mmap(struct host1x_bo *bo)
 {
-	struct tegra_bo *obj = host1x_to_drm_bo(bo);
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
 	return obj->vaddr;
 }
@@ -59,7 +59,7 @@ static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 
 static void *tegra_bo_kmap(struct host1x_bo *bo, unsigned int page)
 {
-	struct tegra_bo *obj = host1x_to_drm_bo(bo);
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
 	return obj->vaddr + page * PAGE_SIZE;
 }
@@ -71,7 +71,7 @@ static void tegra_bo_kunmap(struct host1x_bo *bo, unsigned int page,
 
 static struct host1x_bo *tegra_bo_get(struct host1x_bo *bo)
 {
-	struct tegra_bo *obj = host1x_to_drm_bo(bo);
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 	struct drm_device *drm = obj->gem.dev;
 
 	mutex_lock(&drm->struct_mutex);
@@ -140,9 +140,9 @@ err_dma:
 }
 
 struct tegra_bo *tegra_bo_create_with_handle(struct drm_file *file,
-					    struct drm_device *drm,
-					    unsigned int size,
-					    unsigned int *handle)
+					     struct drm_device *drm,
+					     unsigned int size,
+					     unsigned int *handle)
 {
 	struct tegra_bo *bo;
 	int ret;
@@ -169,7 +169,6 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
 	drm_gem_free_mmap_offset(gem);
-
 	drm_gem_object_release(gem);
 	tegra_bo_destroy(gem->dev, bo);
 
@@ -189,7 +188,7 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 		args->size = args->pitch * args->height;
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size,
-					    &args->handle);
+					 &args->handle);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
