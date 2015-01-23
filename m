From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/6] instmem/gk20a: use DMA attributes
Date: Fri, 23 Jan 2015 17:53:56 +0900
Message-ID: <1422003238-14572-5-git-send-email-acourbot@nvidia.com>
References: <1422003238-14572-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422003238-14572-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

instmem for GK20A is allocated using dma_alloc_coherent(), which
provides us with a coherent CPU mapping that we never use because
instmem objects are accessed through PRAMIN. Switch to
dma_alloc_attrs() which gives us the option to dismiss that CPU mapping
and free up some CPU virtual space.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/subdev/instmem/gk20a.c | 24 ++++++++++++++++++++----
 lib/include/nvif/os.h                   | 31 +++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 6176f50..4c8af6e 100644
--- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -24,6 +24,10 @@
 #include <core/mm.h>
 #include <core/device.h>
 
+#ifdef __KERNEL__
+#include <linux/dma-attrs.h>
+#endif
+
 #include "priv.h"
 
 struct gk20a_instobj_priv {
@@ -34,6 +38,7 @@ struct gk20a_instobj_priv {
 	struct nvkm_mem _mem;
 	void *cpuaddr;
 	dma_addr_t handle;
+	struct dma_attrs attrs;
 	struct nvkm_mm_node r;
 };
 
@@ -91,8 +96,8 @@ gk20a_instobj_dtor(struct nvkm_object *object)
 	if (unlikely(!node->handle))
 		return;
 
-	dma_free_coherent(dev, node->mem->size << PAGE_SHIFT, node->cpuaddr,
-			  node->handle);
+	dma_free_attrs(dev, node->mem->size << PAGE_SHIFT, node->cpuaddr,
+		       node->handle, &node->attrs);
 
 	nvkm_instobj_destroy(&node->base);
 }
@@ -126,8 +131,19 @@ gk20a_instobj_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
 
 	node->mem = &node->_mem;
 
-	node->cpuaddr = dma_alloc_coherent(dev, npages << PAGE_SHIFT,
-					   &node->handle, GFP_KERNEL);
+	init_dma_attrs(&node->attrs);
+	/*
+	 * We will access this memory through PRAMIN and thus do not need a
+	 * consistent CPU pointer
+	 */
+	dma_set_attr(DMA_ATTR_NON_CONSISTENT, &node->attrs);
+	dma_set_attr(DMA_ATTR_WEAK_ORDERING, &node->attrs);
+	dma_set_attr(DMA_ATTR_WRITE_COMBINE, &node->attrs);
+	dma_set_attr(DMA_ATTR_NO_KERNEL_MAPPING, &node->attrs);
+
+	node->cpuaddr = dma_alloc_attrs(dev, npages << PAGE_SHIFT,
+					&node->handle, GFP_KERNEL,
+					&node->attrs);
 	if (!node->cpuaddr) {
 		nv_error(priv, "cannot allocate DMA memory\n");
 		return -ENOMEM;
diff --git a/lib/include/nvif/os.h b/lib/include/nvif/os.h
index f6391a5..b4d307e 100644
--- a/lib/include/nvif/os.h
+++ b/lib/include/nvif/os.h
@@ -683,6 +683,37 @@ dma_free_coherent(struct device *dev, size_t sz, void *vaddr, dma_addr_t bus)
 {
 }
 
+enum dma_attr {
+	DMA_ATTR_WRITE_BARRIER,
+	DMA_ATTR_WEAK_ORDERING,
+	DMA_ATTR_WRITE_COMBINE,
+	DMA_ATTR_NON_CONSISTENT,
+	DMA_ATTR_NO_KERNEL_MAPPING,
+	DMA_ATTR_SKIP_CPU_SYNC,
+	DMA_ATTR_FORCE_CONTIGUOUS,
+	DMA_ATTR_MAX,
+};
+
+struct dma_attrs {
+};
+
+static inline void init_dma_attrs(struct dma_attrs *attrs) {}
+static inline void dma_set_attr(enum dma_attr attr, struct dma_attrs *attrs) {}
+
+static inline void *
+dma_alloc_attrs(struct device *dev, size_t sz, dma_addr_t *hdl, gfp_t gfp,
+		struct dma_attrs *attrs)
+{
+	return NULL;
+}
+
+static inline void
+dma_free_attrs(struct device *dev, size_t sz, void *vaddr, dma_addr_t bus,
+	       struct dma_attrs *attrs)
+{
+}
+
+
 /******************************************************************************
  * PCI
  *****************************************************************************/
-- 
2.2.2
