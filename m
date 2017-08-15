From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] drm/tegra: gem: Implement mmap() for PRIME buffers
Date: Tue, 15 Aug 2017 15:42:40 +0200
Message-ID: <20170815134240.17770-2-thierry.reding@gmail.com>
References: <20170815134240.17770-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134240.17770-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The mapping of PRIME buffers can reuse much of the GEM mapping code, so
extract the common bits into a new tegra_gem_mmap() helper.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/gem.c | 48 +++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 7a39a355678a..88b0250ec6d0 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -481,30 +481,27 @@ const struct vm_operations_struct tegra_bo_vm_ops = {
 	.close = drm_gem_vm_close,
 };
 
-int tegra_drm_mmap(struct file *file, struct vm_area_struct *vma)
+int tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 {
-	struct drm_gem_object *gem;
-	struct tegra_bo *bo;
-	int ret;
-
-	ret = drm_gem_mmap(file, vma);
-	if (ret)
-		return ret;
-
-	gem = vma->vm_private_data;
-	bo = to_tegra_bo(gem);
+	struct tegra_bo *bo = to_tegra_bo(gem);
 
 	if (!bo->pages) {
 		unsigned long vm_pgoff = vma->vm_pgoff;
+		int err;
 
+		/*
+		 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(),
+		 * and set the vm_pgoff (used as a fake buffer offset by DRM)
+		 * to 0 as we want to map the whole buffer.
+		 */
 		vma->vm_flags &= ~VM_PFNMAP;
 		vma->vm_pgoff = 0;
 
-		ret = dma_mmap_wc(gem->dev->dev, vma, bo->vaddr, bo->paddr,
+		err = dma_mmap_wc(gem->dev->dev, vma, bo->vaddr, bo->paddr,
 				  gem->size);
-		if (ret) {
+		if (err < 0) {
 			drm_gem_vm_close(vma);
-			return ret;
+			return err;
 		}
 
 		vma->vm_pgoff = vm_pgoff;
@@ -520,6 +517,20 @@ int tegra_drm_mmap(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 
+int tegra_drm_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct drm_gem_object *gem;
+	int err;
+
+	err = drm_gem_mmap(file, vma);
+	if (err < 0)
+		return err;
+
+	gem = vma->vm_private_data;
+
+	return tegra_gem_mmap(gem, vma);
+}
+
 static struct sg_table *
 tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 			    enum dma_data_direction dir)
@@ -603,7 +614,14 @@ static void tegra_gem_prime_kunmap(struct dma_buf *buf, unsigned long page,
 
 static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 {
-	return -EINVAL;
+	struct drm_gem_object *gem = buf->priv;
+	int err;
+
+	err = drm_gem_mmap_obj(gem, gem->size, vma);
+	if (err < 0)
+		return err;
+
+	return tegra_gem_mmap(gem, vma);
 }
 
 static void *tegra_gem_prime_vmap(struct dma_buf *buf)
-- 
2.13.3
