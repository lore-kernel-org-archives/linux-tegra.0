From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] drm/gk20a/fb: fix huge memory leak
Date: Mon, 19 May 2014 15:51:07 +0900
Message-ID: <1400482268-4971-2-git-send-email-acourbot@nvidia.com>
References: <1400482268-4971-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400482268-4971-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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

CMA-allocated memory must be freed by an exact mirror call to
dma_release_from_contiguous(). It cannot be freed page-by-page as was
previously believed without severe memory leakage.

This page records the address and size of every allocated memory chunk
so they can be properly freed when needed.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c | 74 ++++++++++++++---------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
index 7effd1a63458..5904af52e6d6 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
@@ -28,28 +28,34 @@
 #include <linux/types.h>
 #include <linux/dma-contiguous.h>
 
+struct gk20a_mem_chunk {
+	struct list_head list;
+	struct page *pages;
+	u32 npages;
+};
+
+struct gk20a_mem {
+	struct nouveau_mem base;
+	struct list_head head;
+};
+
 static void
 gk20a_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
 {
 	struct device *dev = nv_device_base(nv_device(pfb));
-	struct nouveau_mem *mem = *pmem;
-	int i;
+	struct gk20a_mem *mem = container_of(*pmem, struct gk20a_mem, base);
+	struct gk20a_mem_chunk *chunk, *n;
 
 	*pmem = NULL;
 	if (unlikely(mem == NULL))
 		return;
 
-	for (i = 0; i < mem->size; i++) {
-		struct page *page;
-
-		if (mem->pages[i] == 0)
-			break;
-
-		page = pfn_to_page(mem->pages[i] >> PAGE_SHIFT);
-		dma_release_from_contiguous(dev, page, 1);
+	list_for_each_entry_safe(chunk, n, &mem->head, list) {
+		dma_release_from_contiguous(dev, chunk->pages, chunk->npages);
+		kfree(chunk);
 	}
 
-	kfree(mem->pages);
+	kfree(mem->base.pages);
 	kfree(mem);
 }
 
@@ -58,9 +64,8 @@ gk20a_ram_get(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 	     u32 memtype, struct nouveau_mem **pmem)
 {
 	struct device *dev = nv_device_base(nv_device(pfb));
-	struct nouveau_mem *mem;
+	struct gk20a_mem *mem;
 	int type = memtype & 0xff;
-	dma_addr_t dma_addr;
 	int npages;
 	int order;
 	int i;
@@ -95,44 +100,57 @@ gk20a_ram_get(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 	if (!mem)
 		return -ENOMEM;
 
-	mem->size = npages;
-	mem->memtype = type;
+	mem->base.size = npages;
+	mem->base.memtype = type;
 
-	mem->pages = kzalloc(sizeof(dma_addr_t) * npages, GFP_KERNEL);
-	if (!mem) {
+	mem->base.pages = kzalloc(sizeof(dma_addr_t) * npages, GFP_KERNEL);
+	if (!mem->base.pages) {
 		kfree(mem);
 		return -ENOMEM;
 	}
 
+	INIT_LIST_HEAD(&mem->head);
+
+	*pmem = &mem->base;
+
 	while (npages) {
-		struct page *pages;
+		struct gk20a_mem_chunk *chunk;
+		dma_addr_t addr;
 		int pos = 0;
 
 		/* don't overflow in case size is not a multiple of ncmin */
 		if (ncmin > npages)
 			ncmin = npages;
 
-		pages = dma_alloc_from_contiguous(dev, ncmin, order);
-		if (!pages) {
-			gk20a_ram_put(pfb, &mem);
+		chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
+		if (!chunk) {
+			gk20a_ram_put(pfb, pmem);
 			return -ENOMEM;
 		}
 
-		dma_addr = (dma_addr_t)(page_to_pfn(pages) << PAGE_SHIFT);
+		chunk->pages = dma_alloc_from_contiguous(dev, ncmin, order);
+		if (!chunk->pages) {
+			kfree(chunk);
+			gk20a_ram_put(pfb, pmem);
+			return -ENOMEM;
+		}
 
-		nv_debug(pfb, "  alloc count: %x, order: %x, addr: %pad\n", ncmin,
-			 order, &dma_addr);
+		chunk->npages = ncmin;
+		list_add_tail(&chunk->list, &mem->head);
+
+		addr = (dma_addr_t)(page_to_pfn(chunk->pages) << PAGE_SHIFT);
+
+		nv_debug(pfb, "  alloc count: %x, order: %x, addr: %pad\n",
+			 ncmin, order, &addr);
 
 		for (i = 0; i < ncmin; i++)
-			mem->pages[pos + i] = dma_addr + (PAGE_SIZE * i);
+			mem->base.pages[pos + i] = addr + (PAGE_SIZE * i);
 
 		pos += ncmin;
 		npages -= ncmin;
 	}
 
-	mem->offset = (u64)mem->pages[0];
-
-	*pmem = mem;
+	mem->base.offset = (u64)mem->base.pages[0];
 
 	return 0;
 }
-- 
1.9.2
