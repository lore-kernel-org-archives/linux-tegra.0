From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: prime: Add vmap support
Date: Wed, 12 Feb 2014 08:35:05 +0100
Message-ID: <1392190505-2575-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is trivial to support since all GEM objects are mapped into kernel
space anyway.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/gem.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index ef853e558036..29913eb9b25d 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -394,6 +394,18 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 	return -EINVAL;
 }
 
+static void *tegra_gem_prime_vmap(struct dma_buf *buf)
+{
+	struct drm_gem_object *gem = buf->priv;
+	struct tegra_bo *bo = to_tegra_bo(gem);
+
+	return bo->vaddr;
+}
+
+static void tegra_gem_prime_vunmap(struct dma_buf *buf, void *vaddr)
+{
+}
+
 static const struct dma_buf_ops tegra_gem_prime_dmabuf_ops = {
 	.map_dma_buf = tegra_gem_prime_map_dma_buf,
 	.unmap_dma_buf = tegra_gem_prime_unmap_dma_buf,
@@ -403,6 +415,8 @@ static const struct dma_buf_ops tegra_gem_prime_dmabuf_ops = {
 	.kmap = tegra_gem_prime_kmap,
 	.kunmap = tegra_gem_prime_kunmap,
 	.mmap = tegra_gem_prime_mmap,
+	.vmap = tegra_gem_prime_vmap,
+	.vunmap = tegra_gem_prime_vunmap,
 };
 
 struct dma_buf *tegra_gem_prime_export(struct drm_device *drm,
-- 
1.8.4.2
