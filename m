From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/6] instmem/gk20a: move memory allocation to instmem
Date: Wed, 11 Feb 2015 16:21:37 +0900
Message-ID: <1423639301-27304-3-git-send-email-acourbot@nvidia.com>
References: <1423639301-27304-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423639301-27304-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

GK20A does not have dedicated RAM, thus having a RAM device for it does
not make sense. Move the contiguous physical memory allocation to
instmem.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/include/nvkm/subdev/instmem.h |   1 +
 drm/nouveau/nvkm/engine/device/gk104.c    |   2 +-
 drm/nouveau/nvkm/subdev/fb/ramgk20a.c     |  86 +-----------
 drm/nouveau/nvkm/subdev/instmem/Kbuild    |   1 +
 drm/nouveau/nvkm/subdev/instmem/gk20a.c   | 212 ++++++++++++++++++++++++++++++
 5 files changed, 217 insertions(+), 85 deletions(-)
 create mode 100644 drm/nouveau/nvkm/subdev/instmem/gk20a.c

diff --git a/drm/nouveau/include/nvkm/subdev/instmem.h b/drm/nouveau/include/nvkm/subdev/instmem.h
index d104c1a..1bcb763 100644
--- a/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -45,4 +45,5 @@ nvkm_instmem(void *obj)
 extern struct nvkm_oclass *nv04_instmem_oclass;
 extern struct nvkm_oclass *nv40_instmem_oclass;
 extern struct nvkm_oclass *nv50_instmem_oclass;
+extern struct nvkm_oclass *gk20a_instmem_oclass;
 #endif
diff --git a/drm/nouveau/nvkm/engine/device/gk104.c b/drm/nouveau/nvkm/engine/device/gk104.c
index bf58934..8f266a9 100644
--- a/drm/nouveau/nvkm/engine/device/gk104.c
+++ b/drm/nouveau/nvkm/engine/device/gk104.c
@@ -171,7 +171,7 @@ gk104_identify(struct nvkm_device *device)
 		device->oclass[NVDEV_SUBDEV_FB     ] =  gk20a_fb_oclass;
 		device->oclass[NVDEV_SUBDEV_LTC    ] =  gk104_ltc_oclass;
 		device->oclass[NVDEV_SUBDEV_IBUS   ] = &gk20a_ibus_oclass;
-		device->oclass[NVDEV_SUBDEV_INSTMEM] = nv50_instmem_oclass;
+		device->oclass[NVDEV_SUBDEV_INSTMEM] = gk20a_instmem_oclass;
 		device->oclass[NVDEV_SUBDEV_MMU    ] = &gf100_mmu_oclass;
 		device->oclass[NVDEV_SUBDEV_BAR    ] = &gk20a_bar_oclass;
 		device->oclass[NVDEV_ENGINE_DMAOBJ ] =  gf110_dmaeng_oclass;
diff --git a/drm/nouveau/nvkm/subdev/fb/ramgk20a.c b/drm/nouveau/nvkm/subdev/fb/ramgk20a.c
index 5f30db1..60d8e1c 100644
--- a/drm/nouveau/nvkm/subdev/fb/ramgk20a.c
+++ b/drm/nouveau/nvkm/subdev/fb/ramgk20a.c
@@ -23,99 +23,17 @@
 
 #include <core/device.h>
 
-struct gk20a_mem {
-	struct nvkm_mem base;
-	void *cpuaddr;
-	dma_addr_t handle;
-};
-#define to_gk20a_mem(m) container_of(m, struct gk20a_mem, base)
-
 static void
 gk20a_ram_put(struct nvkm_fb *pfb, struct nvkm_mem **pmem)
 {
-	struct device *dev = nv_device_base(nv_device(pfb));
-	struct gk20a_mem *mem = to_gk20a_mem(*pmem);
-
-	*pmem = NULL;
-	if (unlikely(mem == NULL))
-		return;
-
-	if (likely(mem->cpuaddr))
-		dma_free_coherent(dev, mem->base.size << PAGE_SHIFT,
-				  mem->cpuaddr, mem->handle);
-
-	kfree(mem->base.pages);
-	kfree(mem);
+	BUG();
 }
 
 static int
 gk20a_ram_get(struct nvkm_fb *pfb, u64 size, u32 align, u32 ncmin,
 	     u32 memtype, struct nvkm_mem **pmem)
 {
-	struct device *dev = nv_device_base(nv_device(pfb));
-	struct gk20a_mem *mem;
-	u32 type = memtype & 0xff;
-	u32 npages, order;
-	int i;
-
-	nv_debug(pfb, "%s: size: %llx align: %x, ncmin: %x\n", __func__, size,
-		 align, ncmin);
-
-	npages = size >> PAGE_SHIFT;
-	if (npages == 0)
-		npages = 1;
-
-	if (align == 0)
-		align = PAGE_SIZE;
-	align >>= PAGE_SHIFT;
-
-	/* round alignment to the next power of 2, if needed */
-	order = fls(align);
-	if ((align & (align - 1)) == 0)
-		order--;
-	align = BIT(order);
-
-	/* ensure returned address is correctly aligned */
-	npages = max(align, npages);
-
-	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
-	if (!mem)
-		return -ENOMEM;
-
-	mem->base.size = npages;
-	mem->base.memtype = type;
-
-	mem->base.pages = kzalloc(sizeof(dma_addr_t) * npages, GFP_KERNEL);
-	if (!mem->base.pages) {
-		kfree(mem);
-		return -ENOMEM;
-	}
-
-	*pmem = &mem->base;
-
-	mem->cpuaddr = dma_alloc_coherent(dev, npages << PAGE_SHIFT,
-					  &mem->handle, GFP_KERNEL);
-	if (!mem->cpuaddr) {
-		nv_error(pfb, "%s: cannot allocate memory!\n", __func__);
-		gk20a_ram_put(pfb, pmem);
-		return -ENOMEM;
-	}
-
-	align <<= PAGE_SHIFT;
-
-	/* alignment check */
-	if (unlikely(mem->handle & (align - 1)))
-		nv_warn(pfb, "memory not aligned as requested: %pad (0x%x)\n",
-			&mem->handle, align);
-
-	nv_debug(pfb, "alloc size: 0x%x, align: 0x%x, paddr: %pad, vaddr: %p\n",
-		 npages << PAGE_SHIFT, align, &mem->handle, mem->cpuaddr);
-
-	for (i = 0; i < npages; i++)
-		mem->base.pages[i] = mem->handle + (PAGE_SIZE * i);
-
-	mem->base.offset = (u64)mem->base.pages[0];
-	return 0;
+	BUG();
 }
 
 static int
diff --git a/drm/nouveau/nvkm/subdev/instmem/Kbuild b/drm/nouveau/nvkm/subdev/instmem/Kbuild
index e6f35ab..13bb7fc 100644
--- a/drm/nouveau/nvkm/subdev/instmem/Kbuild
+++ b/drm/nouveau/nvkm/subdev/instmem/Kbuild
@@ -2,3 +2,4 @@ nvkm-y += nvkm/subdev/instmem/base.o
 nvkm-y += nvkm/subdev/instmem/nv04.o
 nvkm-y += nvkm/subdev/instmem/nv40.o
 nvkm-y += nvkm/subdev/instmem/nv50.o
+nvkm-y += nvkm/subdev/instmem/gk20a.o
diff --git a/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
new file mode 100644
index 0000000..6176f50
--- /dev/null
+++ b/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -0,0 +1,212 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <subdev/fb.h>
+#include <core/mm.h>
+#include <core/device.h>
+
+#include "priv.h"
+
+struct gk20a_instobj_priv {
+	struct nvkm_instobj base;
+	/* Must be second member here - see nouveau_gpuobj_map_vm() */
+	struct nvkm_mem *mem;
+	/* Pointed by mem */
+	struct nvkm_mem _mem;
+	void *cpuaddr;
+	dma_addr_t handle;
+	struct nvkm_mm_node r;
+};
+
+struct gk20a_instmem_priv {
+	struct nvkm_instmem base;
+	spinlock_t lock;
+	u64 addr;
+};
+
+static u32
+gk20a_instobj_rd32(struct nvkm_object *object, u64 offset)
+{
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(object);
+	struct gk20a_instobj_priv *node = (void *)object;
+	unsigned long flags;
+	u64 base = (node->mem->offset + offset) & 0xffffff00000ULL;
+	u64 addr = (node->mem->offset + offset) & 0x000000fffffULL;
+	u32 data;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	if (unlikely(priv->addr != base)) {
+		nv_wr32(priv, 0x001700, base >> 16);
+		priv->addr = base;
+	}
+	data = nv_rd32(priv, 0x700000 + addr);
+	spin_unlock_irqrestore(&priv->lock, flags);
+	return data;
+}
+
+static void
+gk20a_instobj_wr32(struct nvkm_object *object, u64 offset, u32 data)
+{
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(object);
+	struct gk20a_instobj_priv *node = (void *)object;
+	unsigned long flags;
+	u64 base = (node->mem->offset + offset) & 0xffffff00000ULL;
+	u64 addr = (node->mem->offset + offset) & 0x000000fffffULL;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	if (unlikely(priv->addr != base)) {
+		nv_wr32(priv, 0x001700, base >> 16);
+		priv->addr = base;
+	}
+	nv_wr32(priv, 0x700000 + addr, data);
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void
+gk20a_instobj_dtor(struct nvkm_object *object)
+{
+	struct gk20a_instobj_priv *node = (void *)object;
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(node);
+	struct device *dev = nv_device_base(nv_device(priv));
+
+	if (unlikely(!node->handle))
+		return;
+
+	dma_free_coherent(dev, node->mem->size << PAGE_SHIFT, node->cpuaddr,
+			  node->handle);
+
+	nvkm_instobj_destroy(&node->base);
+}
+
+static int
+gk20a_instobj_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
+		   struct nvkm_oclass *oclass, void *data, u32 _size,
+		   struct nvkm_object **pobject)
+{
+	struct nvkm_instobj_args *args = data;
+	struct gk20a_instmem_priv *priv = (void *)nvkm_instmem(parent);
+	struct device *dev = nv_device_base(nv_device(priv));
+	struct gk20a_instobj_priv *node;
+	u32 size, align;
+	u32 npages;
+	int ret;
+
+	nv_debug(parent, "%s: size: %x align: %x\n", __func__,
+		 args->size, args->align);
+
+	size  = max((args->size  + 4095) & ~4095, (u32)4096);
+	align = max((args->align + 4095) & ~4095, (u32)4096);
+
+	npages = size >> PAGE_SHIFT;
+
+	ret = nvkm_instobj_create_(parent, engine, oclass, sizeof(*node),
+				      (void **)&node);
+	*pobject = nv_object(node);
+	if (ret)
+		return ret;
+
+	node->mem = &node->_mem;
+
+	node->cpuaddr = dma_alloc_coherent(dev, npages << PAGE_SHIFT,
+					   &node->handle, GFP_KERNEL);
+	if (!node->cpuaddr) {
+		nv_error(priv, "cannot allocate DMA memory\n");
+		return -ENOMEM;
+	}
+
+	/* alignment check */
+	if (unlikely(node->handle & (align - 1)))
+		nv_warn(priv, "memory not aligned as requested: %pad (0x%x)\n",
+			&node->handle, align);
+
+	node->mem->offset = node->handle;
+	node->mem->size = size >> 12;
+	node->mem->memtype = 0;
+	node->mem->page_shift = 12;
+	INIT_LIST_HEAD(&node->mem->regions);
+
+	node->r.type = 12;
+	node->r.offset = node->handle >> 12;
+	node->r.length = npages;
+	list_add_tail(&node->r.rl_entry, &node->mem->regions);
+
+	node->base.addr = node->mem->offset;
+	node->base.size = size;
+
+	nv_debug(parent, "alloc size: 0x%x, align: 0x%x, gaddr: 0x%llx\n",
+		 size, align, node->mem->offset);
+
+	return 0;
+}
+
+static struct nvkm_instobj_impl
+gk20a_instobj_oclass = {
+	.base.ofuncs = &(struct nvkm_ofuncs) {
+		.ctor = gk20a_instobj_ctor,
+		.dtor = gk20a_instobj_dtor,
+		.init = _nvkm_instobj_init,
+		.fini = _nvkm_instobj_fini,
+		.rd32 = gk20a_instobj_rd32,
+		.wr32 = gk20a_instobj_wr32,
+	},
+};
+
+
+
+static int
+gk20a_instmem_fini(struct nvkm_object *object, bool suspend)
+{
+	struct gk20a_instmem_priv *priv = (void *)object;
+	priv->addr = ~0ULL;
+	return nvkm_instmem_fini(&priv->base, suspend);
+}
+
+static int
+gk20a_instmem_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
+		   struct nvkm_oclass *oclass, void *data, u32 size,
+		   struct nvkm_object **pobject)
+{
+	struct gk20a_instmem_priv *priv;
+	int ret;
+
+	ret = nvkm_instmem_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&priv->lock);
+
+	return 0;
+}
+
+struct nvkm_oclass *
+gk20a_instmem_oclass = &(struct nvkm_instmem_impl) {
+	.base.handle = NV_SUBDEV(INSTMEM, 0xea),
+	.base.ofuncs = &(struct nvkm_ofuncs) {
+		.ctor = gk20a_instmem_ctor,
+		.dtor = _nvkm_instmem_dtor,
+		.init = _nvkm_instmem_init,
+		.fini = gk20a_instmem_fini,
+	},
+	.instobj = &gk20a_instobj_oclass.base,
+}.base;
+
-- 
2.3.0
