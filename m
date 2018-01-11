From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] drm/nouveau: Provide custom struct dma_buf_ops
Date: Thu, 11 Jan 2018 22:44:18 +0100
Message-ID: <20180111214420.26203-3-thierry.reding@gmail.com>
References: <20180111214420.26203-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111214420.26203-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Instead of relying on the DRM PRIME helpers to provide all of the
DMA-BUF operations, provide a custom version of struct dma_buf_ops to
allow additional functionality to be implemented.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h   |  15 +--
 drivers/gpu/drm/nouveau/nouveau_prime.c | 157 +++++++++++++++++++++++++-------
 3 files changed, 135 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 56fe261b6268..3ce2f02e9e58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1081,15 +1081,12 @@ driver_stub = {
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = drm_gem_prime_export,
-	.gem_prime_import = drm_gem_prime_import,
+	.gem_prime_export = nouveau_gem_prime_export,
+	.gem_prime_import = nouveau_gem_prime_import,
 	.gem_prime_pin = nouveau_gem_prime_pin,
-	.gem_prime_res_obj = nouveau_gem_prime_res_obj,
 	.gem_prime_unpin = nouveau_gem_prime_unpin,
+	.gem_prime_res_obj = nouveau_gem_prime_res_obj,
 	.gem_prime_get_sg_table = nouveau_gem_prime_get_sg_table,
-	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
-	.gem_prime_vmap = nouveau_gem_prime_vmap,
-	.gem_prime_vunmap = nouveau_gem_prime_vunmap,
 
 	.gem_free_object_unlocked = nouveau_gem_object_del,
 	.gem_open_object = nouveau_gem_object_open,
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index fe39998f65cc..eb55c1eb1d9f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -32,13 +32,14 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
 
-extern int nouveau_gem_prime_pin(struct drm_gem_object *);
+struct dma_buf *nouveau_gem_prime_export(struct drm_device *dev,
+					 struct drm_gem_object *obj,
+					 int flags);
+struct drm_gem_object *nouveau_gem_prime_import(struct drm_device *drm,
+						struct dma_buf *buf);
+int nouveau_gem_prime_pin(struct drm_gem_object *obj);
+void nouveau_gem_prime_unpin(struct drm_gem_object *obj);
 struct reservation_object *nouveau_gem_prime_res_obj(struct drm_gem_object *);
-extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
-extern struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *);
-extern struct drm_gem_object *nouveau_gem_prime_import_sg_table(
-	struct drm_device *, struct dma_buf_attachment *, struct sg_table *);
-extern void *nouveau_gem_prime_vmap(struct drm_gem_object *);
-extern void nouveau_gem_prime_vunmap(struct drm_gem_object *, void *);
+struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 1fefc93af1d7..63cf4aca2d8e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -23,69 +23,152 @@
  */
 
 #include <drm/drmP.h>
+#include <drm/drm_legacy.h>
 #include <linux/dma-buf.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
 
-struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
+static void *nouveau_gem_prime_kmap_atomic(struct dma_buf *buf,
+					   unsigned long page)
 {
-	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
-	int npages = nvbo->bo.num_pages;
+	return NULL;
+}
 
-	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages);
+static void nouveau_gem_prime_kunmap_atomic(struct dma_buf *buf,
+					    unsigned long page, void *addr)
+{
 }
 
-void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
+static void *nouveau_gem_prime_kmap(struct dma_buf *buf, unsigned long page)
 {
-	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+	return NULL;
+}
+
+static void nouveau_gem_prime_kunmap(struct dma_buf *buf, unsigned long page,
+				     void *addr)
+{
+}
+
+static void *nouveau_gem_prime_vmap(struct dma_buf *buf)
+{
+	struct nouveau_bo *bo = nouveau_gem_object(buf->priv);
 	int ret;
 
-	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.num_pages,
-			  &nvbo->dma_buf_vmap);
+	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->dma_buf_vmap);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return nvbo->dma_buf_vmap.virtual;
+	return bo->dma_buf_vmap.virtual;
 }
 
-void nouveau_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+static void nouveau_gem_prime_vunmap(struct dma_buf *buf, void *vaddr)
 {
-	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+	struct nouveau_bo *bo = nouveau_gem_object(buf->priv);
+
+	ttm_bo_kunmap(&bo->dma_buf_vmap);
+}
+
+static const struct dma_buf_ops nouveau_gem_prime_dmabuf_ops = {
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = drm_gem_dmabuf_release,
+	.map_atomic = nouveau_gem_prime_kmap_atomic,
+	.unmap_atomic = nouveau_gem_prime_kunmap_atomic,
+	.map = nouveau_gem_prime_kmap,
+	.unmap = nouveau_gem_prime_kunmap,
+	.vmap = nouveau_gem_prime_vmap,
+	.vunmap = nouveau_gem_prime_vunmap,
+};
+
+struct dma_buf *nouveau_gem_prime_export(struct drm_device *dev,
+					 struct drm_gem_object *obj,
+					 int flags)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(info);
+
+	info.exp_name = KBUILD_MODNAME;
+	info.owner = dev->driver->fops->owner;
+	info.ops = &nouveau_gem_prime_dmabuf_ops;
+	info.size = obj->size;
+	info.flags = flags;
+	info.priv = obj;
+
+	if (dev->driver->gem_prime_res_obj)
+		info.resv = dev->driver->gem_prime_res_obj(obj);
 
-	ttm_bo_kunmap(&nvbo->dma_buf_vmap);
+	return drm_gem_dmabuf_export(dev, &info);
 }
 
-struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
-							 struct dma_buf_attachment *attach,
-							 struct sg_table *sg)
+struct drm_gem_object *nouveau_gem_prime_import(struct drm_device *dev,
+						struct dma_buf *buf)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nouveau_bo *nvbo;
-	struct reservation_object *robj = attach->dmabuf->resv;
-	u32 flags = 0;
+	struct dma_buf_attachment *attach;
+	struct drm_gem_object *obj;
+	u32 flags = TTM_PL_FLAG_TT;
+	struct nouveau_bo *bo;
+	struct sg_table *sgt;
 	int ret;
 
-	flags = TTM_PL_FLAG_TT;
+	if (buf->ops == &nouveau_gem_prime_dmabuf_ops) {
+		obj = buf->priv;
+
+		if (obj->dev == dev) {
+			/*
+			 * Importing a DMA-BUF exported from our own GEM
+			 * increases the reference count on the GEM itself
+			 * instead of the f_count of the DMA-BUF.
+			 */
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
 
-	ww_mutex_lock(&robj->lock, NULL);
-	ret = nouveau_bo_new(&drm->client, attach->dmabuf->size, 0, flags, 0, 0,
-			     sg, robj, &nvbo);
-	ww_mutex_unlock(&robj->lock);
-	if (ret)
-		return ERR_PTR(ret);
+	attach = dma_buf_attach(buf, dev->dev);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
 
-	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
+	get_dma_buf(buf);
 
-	/* Initialize the embedded gem-object. We return a single gem-reference
-	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret = drm_gem_object_init(dev, &nvbo->gem, nvbo->bo.mem.size);
-	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
-		return ERR_PTR(-ENOMEM);
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto detach;
 	}
 
-	return &nvbo->gem;
+	ww_mutex_lock(&attach->dmabuf->resv->lock, NULL);
+	ret = nouveau_bo_new(&drm->client, attach->dmabuf->size, 0, flags, 0,
+			     0, sgt, attach->dmabuf->resv, &bo);
+	ww_mutex_unlock(&attach->dmabuf->resv->lock);
+	if (ret)
+		goto unmap;
+
+	bo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
+
+	/*
+	 * Initialize the embedded GEM object. We return a single GEM reference
+	 * to the caller, instead of a normal nouveau_bo TTM reference.
+	 */
+	ret = drm_gem_object_init(dev, &bo->gem, bo->bo.mem.size);
+	if (ret)
+		goto unref;
+
+	bo->gem.import_attach = attach;
+
+	return &bo->gem;
+
+unref:
+	nouveau_bo_ref(NULL, &bo);
+unmap:
+	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+detach:
+	dma_buf_detach(buf, attach);
+	dma_buf_put(buf);
+
+	return ERR_PTR(ret);
 }
 
 int nouveau_gem_prime_pin(struct drm_gem_object *obj)
@@ -114,3 +197,11 @@ struct reservation_object *nouveau_gem_prime_res_obj(struct drm_gem_object *obj)
 
 	return nvbo->bo.resv;
 }
+
+struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+	int npages = nvbo->bo.num_pages;
+
+	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages);
+}
-- 
2.15.1
