From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] drm/nouveau: prime: Implement cache maintenance
Date: Thu, 11 Jan 2018 22:44:20 +0100
Message-ID: <20180111214420.26203-5-thierry.reding@gmail.com>
References: <20180111214420.26203-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111214420.26203-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Implement the ->begin_cpu_access() and ->end_cpu_access() callbacks to
allow userspace to invalidate the cache before accessing a buffer that
is exported using PRIME and flush the cache after modifying the buffer
through its userspace mapping.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 5d885d7cb059..a3a586ce864c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -29,6 +29,26 @@
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
 
+static int nouveau_gem_prime_begin_cpu_access(struct dma_buf *buf,
+					      enum dma_data_direction direction)
+{
+	struct nouveau_bo *bo = nouveau_gem_object(buf->priv);
+
+	nouveau_bo_sync_for_cpu(bo);
+
+	return 0;
+}
+
+static int nouveau_gem_prime_end_cpu_access(struct dma_buf *buf,
+					    enum dma_data_direction direction)
+{
+	struct nouveau_bo *bo = nouveau_gem_object(buf->priv);
+
+	nouveau_bo_sync_for_device(bo);
+
+	return 0;
+}
+
 static void *nouveau_gem_prime_kmap_atomic(struct dma_buf *buf,
 					   unsigned long page)
 {
@@ -106,6 +126,8 @@ static const struct dma_buf_ops nouveau_gem_prime_dmabuf_ops = {
 	.map_dma_buf = drm_gem_map_dma_buf,
 	.unmap_dma_buf = drm_gem_unmap_dma_buf,
 	.release = drm_gem_dmabuf_release,
+	.begin_cpu_access = nouveau_gem_prime_begin_cpu_access,
+	.end_cpu_access = nouveau_gem_prime_end_cpu_access,
 	.map_atomic = nouveau_gem_prime_kmap_atomic,
 	.unmap_atomic = nouveau_gem_prime_kunmap_atomic,
 	.map = nouveau_gem_prime_kmap,
-- 
2.15.1
