From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] drm/nouveau: prime: Implement mmap()
Date: Thu, 11 Jan 2018 22:44:19 +0100
Message-ID: <20180111214420.26203-4-thierry.reding@gmail.com>
References: <20180111214420.26203-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111214420.26203-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Provide an implementation of mmap() for PRIME exported buffers. This
allows userspace to map these buffers and access them using the CPU.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 63cf4aca2d8e..5d885d7cb059 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -50,6 +50,37 @@ static void nouveau_gem_prime_kunmap(struct dma_buf *buf, unsigned long page,
 {
 }
 
+static inline u64 nouveau_bo_mmap_offset(struct nouveau_bo *bo)
+{
+	return drm_vma_node_offset_addr(&bo->bo.vma_node) >> PAGE_SHIFT;
+}
+
+static int nouveau_gem_prime_mmap(struct dma_buf *buf,
+				  struct vm_area_struct *vma)
+{
+	struct nouveau_bo *bo = nouveau_gem_object(buf->priv);
+	struct drm_gem_object *obj = buf->priv;
+	int ret;
+
+	/* check for valid size */
+	if (obj->size < vma->vm_end - vma->vm_start)
+		return -EINVAL;
+
+	vma->vm_pgoff += nouveau_bo_mmap_offset(bo);
+
+	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET))
+		return drm_legacy_mmap(vma->vm_file, vma);
+
+	ret = drm_vma_node_allow(&obj->vma_node, vma->vm_file->private_data);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_mmap(vma->vm_file, vma, bo->bo.bdev);
+	drm_vma_node_revoke(&obj->vma_node, vma->vm_file->private_data);
+
+	return ret;
+}
+
 static void *nouveau_gem_prime_vmap(struct dma_buf *buf)
 {
 	struct nouveau_bo *bo = nouveau_gem_object(buf->priv);
@@ -79,6 +110,7 @@ static const struct dma_buf_ops nouveau_gem_prime_dmabuf_ops = {
 	.unmap_atomic = nouveau_gem_prime_kunmap_atomic,
 	.map = nouveau_gem_prime_kmap,
 	.unmap = nouveau_gem_prime_kunmap,
+	.mmap = nouveau_gem_prime_mmap,
 	.vmap = nouveau_gem_prime_vmap,
 	.vunmap = nouveau_gem_prime_vunmap,
 };
-- 
2.15.1
