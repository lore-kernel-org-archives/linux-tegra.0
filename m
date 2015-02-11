From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 6/6] instmem/gk20a: add IOMMU support
Date: Wed, 11 Feb 2015 16:21:41 +0900
Message-ID: <1423639301-27304-7-git-send-email-acourbot@nvidia.com>
References: <1423639301-27304-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423639301-27304-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Let GK20A's instmem take advantage of the IOMMU if it is present. Having
an IOMMU means that instmem is no longer allocated using the DMA API,
but instead obtained through page_alloc and made contiguous to the GPU
by IOMMU mappings.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/subdev/instmem/gk20a.c | 272 ++++++++++++++++++++++++++++----
 1 file changed, 241 insertions(+), 31 deletions(-)

diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 4c8af6e..a20b93c 100644
--- a/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -20,12 +20,32 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+/*
+ * GK20A does not have dedicated video memory, and to accurately represent this
+ * fact Nouveau will not create a RAM device for it. Therefore its instmem
+ * implementation must be done directly on top of system memory, while providing
+ * coherent read and write operations.
+ *
+ * Instmem can be allocated through two means:
+ * 1) If a IOMMU mapping has been probed, the IOMMU API is used to make memory
+ *    pages contiguous to the GPU. This is the preferred way.
+ * 2) If no IOMMU mapping is probed, the DMA API is used to allocated physically
+ *    contiguous memory.
+ *
+ * In both cases CPU read and writes are performed using PRAMIN (i.e. using the
+ * GPU path) to ensure these operations are coherent for the GPU. This allows us
+ * to use more "relaxed" allocation parameters when using the DMA API, since we
+ * never need a kernel mapping.
+ */
+
 #include <subdev/fb.h>
 #include <core/mm.h>
 #include <core/device.h>
 
 #ifdef __KERNEL__
 #include <linux/dma-attrs.h>
+#include <linux/iommu.h>
+#include <nouveau_platform.h>
 #endif
 
 #include "priv.h"
@@ -36,18 +56,51 @@ struct gk20a_instobj_priv {
 	struct nvkm_mem *mem;
 	/* Pointed by mem */
 	struct nvkm_mem _mem;
+};
+
+/*
+ * Used for objects allocated using the DMA API
+ */
+struct gk20a_instobj_dma {
+	struct gk20a_instobj_priv base;
+
 	void *cpuaddr;
 	dma_addr_t handle;
 	struct dma_attrs attrs;
 	struct nvkm_mm_node r;
 };
 
+/*
+ * Used for objects flattened using the IOMMU API
+ */
+struct gk20a_instobj_iommu {
+	struct gk20a_instobj_priv base;
+
+	/* array of base.mem->size pages */
+	struct page *pages[];
+};
+
 struct gk20a_instmem_priv {
 	struct nvkm_instmem base;
 	spinlock_t lock;
 	u64 addr;
+
+	/* Only used if IOMMU if present */
+	struct mutex *mm_mutex;
+	struct nvkm_mm *mm;
+	struct iommu_domain *domain;
+	unsigned long iommu_pgshift;
 };
 
+/*
+ * Use PRAMIN to read/write data and avoid coherency issues.
+ * PRAMIN uses the GPU path and ensures data will always be coherent.
+ *
+ * A dynamic mapping based solution would be desirable in the future, but
+ * the issue remains of how to maintain coherency efficiently. On ARM it is
+ * not easy (if possible at all?) to create uncached temporary mappings.
+ */
+
 static u32
 gk20a_instobj_rd32(struct nvkm_object *object, u64 offset)
 {
@@ -87,50 +140,79 @@ gk20a_instobj_wr32(struct nvkm_object *object, u64 offset, u32 data)
 }
 
 static void
-gk20a_instobj_dtor(struct nvkm_object *object)
+gk20a_instobj_dtor_dma(struct gk20a_instobj_priv *_node)
 {
-	struct gk20a_instobj_priv *node = (void *)object;
+	struct gk20a_instobj_dma *node = (void *)_node;
 	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(node);
 	struct device *dev = nv_device_base(nv_device(priv));
 
 	if (unlikely(!node->handle))
 		return;
 
-	dma_free_attrs(dev, node->mem->size << PAGE_SHIFT, node->cpuaddr,
+	dma_free_attrs(dev, _node->mem->size << PAGE_SHIFT, node->cpuaddr,
 		       node->handle, &node->attrs);
+}
+
+static void
+gk20a_instobj_dtor_iommu(struct gk20a_instobj_priv *_node)
+{
+	struct gk20a_instobj_iommu *node = (void *)_node;
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(node);
+	struct nvkm_mm_node *r;
+	int i;
+
+	if (unlikely(list_empty(&_node->mem->regions)))
+		return;
+
+	r = list_first_entry(&_node->mem->regions, struct nvkm_mm_node,
+			     rl_entry);
+
+	/* clear bit 34 to unmap pages */
+	r->offset &= ~BIT(34 - priv->iommu_pgshift);
+
+	/* Unmap pages from GPU address space and free them */
+	for (i = 0; i < _node->mem->size; i++) {
+		iommu_unmap(priv->domain,
+			    (r->offset + i) << priv->iommu_pgshift, PAGE_SIZE);
+		__free_page(node->pages[i]);
+	}
+
+	/* Release area from GPU address space */
+	mutex_lock(priv->mm_mutex);
+	nvkm_mm_free(priv->mm, &r);
+	mutex_unlock(priv->mm_mutex);
+}
+
+static void
+gk20a_instobj_dtor(struct nvkm_object *object)
+{
+	struct gk20a_instobj_priv *node = (void *)object;
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(node);
+
+	if (priv->domain)
+		gk20a_instobj_dtor_iommu(node);
+	else
+		gk20a_instobj_dtor_dma(node);
 
 	nvkm_instobj_destroy(&node->base);
 }
 
 static int
-gk20a_instobj_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
-		   struct nvkm_oclass *oclass, void *data, u32 _size,
-		   struct nvkm_object **pobject)
+gk20a_instobj_ctor_dma(struct nvkm_object *parent, struct nvkm_object *engine,
+		       struct nvkm_oclass *oclass, u32 npages, u32 align,
+		       struct gk20a_instobj_priv **_node)
 {
-	struct nvkm_instobj_args *args = data;
+	struct gk20a_instobj_dma *node;
 	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(parent);
-	struct device *dev = nv_device_base(nv_device(priv));
-	struct gk20a_instobj_priv *node;
-	u32 size, align;
-	u32 npages;
+	struct device *dev = nv_device_base(nv_device(parent));
 	int ret;
 
-	nv_debug(parent, "%s: size: %x align: %x\n", __func__,
-		 args->size, args->align);
-
-	size  = max((args->size  + 4095) & ~4095, (u32)4096);
-	align = max((args->align + 4095) & ~4095, (u32)4096);
-
-	npages = size >> PAGE_SHIFT;
-
 	ret = nvkm_instobj_create_(parent, engine, oclass, sizeof(*node),
-				      (void **)&node);
-	*pobject = nv_object(node);
+				   (void **)&node);
+	*_node = &node->base;
 	if (ret)
 		return ret;
 
-	node->mem = &node->_mem;
-
 	init_dma_attrs(&node->attrs);
 	/*
 	 * We will access this memory through PRAMIN and thus do not need a
@@ -154,16 +236,132 @@ gk20a_instobj_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
 		nv_warn(priv, "memory not aligned as requested: %pad (0x%x)\n",
 			&node->handle, align);
 
-	node->mem->offset = node->handle;
+	/* present memory for being mapped using small pages */
+	node->r.type = 12;
+	node->r.offset = node->handle >> 12;
+	node->r.length = (npages << PAGE_SHIFT) >> 12;
+
+	node->base._mem.offset = node->handle;
+
+	INIT_LIST_HEAD(&node->base._mem.regions);
+	list_add_tail(&node->r.rl_entry, &node->base._mem.regions);
+
+	return 0;
+}
+
+static int
+gk20a_instobj_ctor_iommu(struct nvkm_object *parent, struct nvkm_object *engine,
+			 struct nvkm_oclass *oclass, u32 npages, u32 align,
+			 struct gk20a_instobj_priv **_node)
+{
+	struct gk20a_instobj_iommu *node;
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(parent);
+	struct nvkm_mm_node *r;
+	int ret;
+	int i;
+
+	ret = nvkm_instobj_create_(parent, engine, oclass,
+				sizeof(*node) + sizeof(node->pages[0]) * npages,
+				(void **)&node);
+	*_node = &node->base;
+	if (ret)
+		return ret;
+
+	/* Allocate backing memory */
+	for (i = 0; i < npages; i++) {
+		struct page *p = alloc_page(GFP_KERNEL);
+
+		if (p == NULL) {
+			ret = -ENOMEM;
+			goto free_pages;
+		}
+		node->pages[i] = p;
+	}
+
+	mutex_lock(priv->mm_mutex);
+	/* Reserve area from GPU address space */
+	ret = nvkm_mm_head(priv->mm, 0, 1, npages, npages,
+			   align >> priv->iommu_pgshift, &r);
+	mutex_unlock(priv->mm_mutex);
+	if (ret) {
+		nv_error(priv, "virtual space is full!\n");
+		goto free_pages;
+	}
+
+	/* Map into GPU address space */
+	for (i = 0; i < npages; i++) {
+		struct page *p = node->pages[i];
+		u32 offset = (r->offset + i) << priv->iommu_pgshift;
+
+		ret = iommu_map(priv->domain, offset, page_to_phys(p),
+				PAGE_SIZE, IOMMU_READ | IOMMU_WRITE);
+		if (ret < 0) {
+			nv_error(priv, "IOMMU mapping failure: %d\n", ret);
+
+			while (i-- > 0) {
+				offset -= PAGE_SIZE;
+				iommu_unmap(priv->domain, offset, PAGE_SIZE);
+			}
+			goto release_area;
+		}
+	}
+
+	/* Bit 34 tells that an address is to be resolved through the IOMMU */
+	r->offset |= BIT(34 - priv->iommu_pgshift);
+
+	node->base._mem.offset = ((u64)r->offset) << priv->iommu_pgshift;
+
+	INIT_LIST_HEAD(&node->base._mem.regions);
+	list_add_tail(&r->rl_entry, &node->base._mem.regions);
+
+	return 0;
+
+release_area:
+	mutex_lock(priv->mm_mutex);
+	nvkm_mm_free(priv->mm, &r);
+	mutex_unlock(priv->mm_mutex);
+
+free_pages:
+	for (i = 0; i < npages && node->pages[i] != NULL; i++)
+		__free_page(node->pages[i]);
+
+	return ret;
+}
+
+static int
+gk20a_instobj_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
+		   struct nvkm_oclass *oclass, void *data, u32 _size,
+		   struct nvkm_object **pobject)
+{
+	struct nvkm_instobj_args *args = data;
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(parent);
+	struct gk20a_instobj_priv *node;
+	u32 size, align;
+	int ret;
+
+	nv_debug(parent, "%s (%s): size: %x align: %x\n", __func__,
+		 priv->domain ? "IOMMU" : "DMA", args->size, args->align);
+
+	/* Round size and align to page bounds */
+	size = max((args->size  + ~PAGE_MASK) & PAGE_MASK, (u32)PAGE_SIZE);
+	align = max((args->align + ~PAGE_MASK) & PAGE_MASK, (u32)PAGE_SIZE);
+
+	if (priv->domain)
+		ret = gk20a_instobj_ctor_iommu(parent, engine, oclass,
+					      size >> PAGE_SHIFT, align, &node);
+	else
+		ret = gk20a_instobj_ctor_dma(parent, engine, oclass,
+					     size >> PAGE_SHIFT, align, &node);
+	*pobject = nv_object(node);
+	if (ret)
+		return ret;
+
+	node->mem = &node->_mem;
+
+	/* present memory for being mapped using small pages */
 	node->mem->size = size >> 12;
 	node->mem->memtype = 0;
 	node->mem->page_shift = 12;
-	INIT_LIST_HEAD(&node->mem->regions);
-
-	node->r.type = 12;
-	node->r.offset = node->handle >> 12;
-	node->r.length = npages;
-	list_add_tail(&node->r.rl_entry, &node->mem->regions);
 
 	node->base.addr = node->mem->offset;
 	node->base.size = size;
@@ -202,6 +400,7 @@ gk20a_instmem_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
 		   struct nvkm_object **pobject)
 {
 	struct gk20a_instmem_priv *priv;
+	struct nouveau_platform_device *plat;
 	int ret;
 
 	ret = nvkm_instmem_create(parent, engine, oclass, &priv);
@@ -211,6 +410,18 @@ gk20a_instmem_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
 
 	spin_lock_init(&priv->lock);
 
+	plat = nv_device_to_platform(nv_device(parent));
+	if (plat->gpu->iommu.domain) {
+		priv->domain = plat->gpu->iommu.domain;
+		priv->mm = plat->gpu->iommu.mm;
+		priv->iommu_pgshift = plat->gpu->iommu.pgshift;
+		priv->mm_mutex = &plat->gpu->iommu.mutex;
+
+		nv_info(priv, "using IOMMU\n");
+	} else {
+		nv_info(priv, "using DMA API\n");
+	}
+
 	return 0;
 }
 
@@ -225,4 +436,3 @@ gk20a_instmem_oclass = &(struct nvkm_instmem_impl) {
 	},
 	.instobj = &gk20a_instobj_oclass.base,
 }.base;
-
-- 
2.3.0
