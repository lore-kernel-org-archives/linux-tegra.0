From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/12] drm/nouveau/fb: add GK20A support
Date: Mon, 24 Mar 2014 17:42:29 +0900
Message-ID: <1395650554-31925-8-git-send-email-acourbot@nvidia.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add a simple FB device for GK20A, as well as a RAM implementation based
on contiguous DMA memory allocations suitable for chips that use system
memory as video RAM.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile                 |   2 +
 drivers/gpu/drm/nouveau/core/include/subdev/fb.h |   1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/nvea.c    |  56 ++++++++
 drivers/gpu/drm/nouveau/core/subdev/fb/priv.h    |   1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnvea.c | 168 +++++++++++++++++++++++
 5 files changed, 228 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/nvea.c
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/ramnvea.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 592141e62dda..708d2e33835f 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -100,6 +100,7 @@ nouveau-y += core/subdev/fb/nvaa.o
 nouveau-y += core/subdev/fb/nvaf.o
 nouveau-y += core/subdev/fb/nvc0.o
 nouveau-y += core/subdev/fb/nve0.o
+nouveau-y += core/subdev/fb/nvea.o
 nouveau-y += core/subdev/fb/ramnv04.o
 nouveau-y += core/subdev/fb/ramnv10.o
 nouveau-y += core/subdev/fb/ramnv1a.o
@@ -114,6 +115,7 @@ nouveau-y += core/subdev/fb/ramnva3.o
 nouveau-y += core/subdev/fb/ramnvaa.o
 nouveau-y += core/subdev/fb/ramnvc0.o
 nouveau-y += core/subdev/fb/ramnve0.o
+nouveau-y += core/subdev/fb/ramnvea.o
 nouveau-y += core/subdev/fb/sddr3.o
 nouveau-y += core/subdev/fb/gddr5.o
 nouveau-y += core/subdev/gpio/base.o
diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/fb.h b/drivers/gpu/drm/nouveau/core/include/subdev/fb.h
index d7ecafbae1ca..3905816755ba 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/fb.h
@@ -105,6 +105,7 @@ extern struct nouveau_oclass *nvaa_fb_oclass;
 extern struct nouveau_oclass *nvaf_fb_oclass;
 extern struct nouveau_oclass *nvc0_fb_oclass;
 extern struct nouveau_oclass *nve0_fb_oclass;
+extern struct nouveau_oclass *nvea_fb_oclass;
 
 #include <subdev/bios/ramcfg.h>
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nvea.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nvea.c
new file mode 100644
index 000000000000..62dbec48481e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nvea.c
@@ -0,0 +1,56 @@
+/*
+ * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
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
+#include "nvc0.h"
+
+struct nvea_fb_priv {
+	struct nouveau_fb base;
+};
+
+static int
+nvea_fb_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	     struct nouveau_oclass *oclass, void *data, u32 size,
+	     struct nouveau_object **pobject)
+{
+	struct nvea_fb_priv *priv;
+	int ret;
+
+	ret = nouveau_fb_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+struct nouveau_oclass *
+nvea_fb_oclass = &(struct nouveau_fb_impl) {
+	.base.handle = NV_SUBDEV(FB, 0xea),
+	.base.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = nvea_fb_ctor,
+		.dtor = _nouveau_fb_dtor,
+		.init = _nouveau_fb_init,
+		.fini = _nouveau_fb_fini,
+	},
+	.memtype = nvc0_fb_memtype_valid,
+	.ram = &nvea_ram_oclass,
+}.base;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
index edaf95dee612..0b95a25504d3 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
@@ -32,6 +32,7 @@ extern struct nouveau_oclass nva3_ram_oclass;
 extern struct nouveau_oclass nvaa_ram_oclass;
 extern struct nouveau_oclass nvc0_ram_oclass;
 extern struct nouveau_oclass nve0_ram_oclass;
+extern struct nouveau_oclass nvea_ram_oclass;
 
 int nouveau_sddr3_calc(struct nouveau_ram *ram);
 int nouveau_gddr5_calc(struct nouveau_ram *ram, bool nuts);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvea.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvea.c
new file mode 100644
index 000000000000..4e3d757614b6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvea.c
@@ -0,0 +1,168 @@
+/*
+ * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
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
+#include "priv.h"
+
+#include <subdev/fb.h>
+
+#include <linux/mm.h>
+#include <linux/types.h>
+#include <linux/dma-contiguous.h>
+
+static void
+nvea_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
+{
+	struct device *dev = nv_device_base(nv_device(pfb));
+	struct nouveau_mem *mem = *pmem;
+	int i;
+
+	*pmem = NULL;
+
+	for (i = 0; i < mem->size; i++) {
+		struct page *page;
+
+		if (mem->pages[i] == 0)
+			break;
+
+		page = pfn_to_page(dma_to_pfn(dev, mem->pages[i]));
+		dma_release_from_contiguous(dev, page, 1);
+	}
+
+	kfree(mem->pages);
+	kfree(mem);
+}
+
+static int
+nvea_ram_get(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
+	     u32 memtype, struct nouveau_mem **pmem)
+{
+	struct device *dev = nv_device_base(nv_device(pfb));
+	struct nouveau_mem *mem;
+	int type = memtype & 0xff;
+	dma_addr_t dma_addr;
+	int npages;
+	int order;
+	int i;
+
+	nv_debug(pfb, "%s: size: %llx align: %x, ncmin: %x\n", __func__, size,
+		 align, ncmin);
+
+	npages = size >> PAGE_SHIFT;
+	if (npages == 0)
+		npages = 1;
+
+	if (align == 0)
+		align = PAGE_SIZE;
+	align >>= PAGE_SHIFT;
+
+	/* round alignment to the next power of 2, if needed */
+	order = fls(align);
+	if ((align & (align - 1)) == 0)
+		order--;
+
+	ncmin >>= PAGE_SHIFT;
+	/*
+	 * allocate pages by chunks of "align" size, otherwise we may leave
+	 * holes in the contiguous memory area.
+	 */
+	if (ncmin == 0)
+		ncmin = npages;
+	else if (align > ncmin)
+		ncmin = align;
+
+	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
+	if (!mem)
+		return -ENOMEM;
+
+	mem->size = npages;
+	mem->memtype = type;
+
+	mem->pages = kzalloc(sizeof(dma_addr_t) * npages, GFP_KERNEL);
+	if (!mem) {
+		kfree(mem);
+		return -ENOMEM;
+	}
+
+	while (npages) {
+		struct page *pages;
+		int pos = 0;
+
+		/* don't overflow in case size is not a multiple of ncmin */
+		if (ncmin > npages)
+			ncmin = npages;
+
+		pages = dma_alloc_from_contiguous(dev, ncmin, order);
+		if (!pages) {
+			nvea_ram_put(pfb, &mem);
+			return -ENOMEM;
+		}
+
+		dma_addr = pfn_to_dma(nv_device_base(nv_device(pfb)),
+				      page_to_pfn(pages));
+
+		nv_debug(pfb, "  alloc count: %x, order: %x, addr: %x\n", ncmin,
+			 order, dma_addr);
+
+		for (i = 0; i < ncmin; i++)
+			mem->pages[pos + i] = dma_addr + (PAGE_SIZE * i);
+
+		pos += ncmin;
+		npages -= ncmin;
+	}
+
+	mem->offset = (u64)mem->pages[0];
+
+	*pmem = mem;
+
+	return 0;
+}
+
+static int
+nvea_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	      struct nouveau_oclass *oclass, void *data, u32 datasize,
+	      struct nouveau_object **pobject)
+{
+	struct nouveau_ram *ram;
+	int ret;
+
+	ret = nouveau_ram_create(parent, engine, oclass, &ram);
+	*pobject = nv_object(ram);
+	if (ret)
+		return ret;
+	ram->type = NV_MEM_TYPE_STOLEN;
+	ram->size = get_num_physpages() << PAGE_SHIFT;
+
+	ram->get = nvea_ram_get;
+	ram->put = nvea_ram_put;
+
+	return 0;
+}
+
+struct nouveau_oclass
+nvea_ram_oclass = {
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = nvea_ram_ctor,
+		.dtor = _nouveau_ram_dtor,
+		.init = _nouveau_ram_init,
+		.fini = _nouveau_ram_fini,
+	},
+};
-- 
1.9.1
