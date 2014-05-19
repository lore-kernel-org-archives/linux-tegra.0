From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 2/2] drm/gk20a/fb: fix compile error whith CMA and module
Date: Mon, 19 May 2014 15:51:08 +0900
Message-ID: <1400482268-4971-3-git-send-email-acourbot@nvidia.com>
References: <1400482268-4971-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400482268-4971-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: gnurou@gmail.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

CMA functions are not available to kernel modules, but the GK20A FB
driver currently (and temporarily) relies on them.

This patch replaces the calls to CMA functions in problematic cases (CMA
enabled and Nouveau compiled as a module) with dummy stubs that will
make this particular driver fail, but at least won't produce a compile
error.

This is a temporary fix until a better memory allocation scheme is
devised.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c | 25 +++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
index 5904af52e6d6..fa867ce5449e 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
@@ -39,6 +39,27 @@ struct gk20a_mem {
 	struct list_head head;
 };
 
+/*
+ * CMA is not available to modules. Until we find a better solution, make
+ * memory allocations fail in that case.
+ */
+#if IS_ENABLED(CONFIG_CMA) && IS_MODULE(CONFIG_DRM_NOUVEAU)
+static inline struct page *
+alloc_contiguous_memory(struct device *dev, int count, unsigned int order)
+{
+	dev_err(dev, "cannot use CMA from a module - allocation failed\n");
+	return NULL;
+}
+
+static inline void
+release_contiguous_memory(struct device *dev, struct page *page, int count)
+{
+}
+#else
+#define alloc_contiguous_memory(d, c, o) dma_alloc_from_contiguous(d, c, o)
+#define release_contiguous_memory(d, p, c) dma_release_from_contiguous(d, p, c)
+#endif
+
 static void
 gk20a_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
 {
@@ -51,7 +72,7 @@ gk20a_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
 		return;
 
 	list_for_each_entry_safe(chunk, n, &mem->head, list) {
-		dma_release_from_contiguous(dev, chunk->pages, chunk->npages);
+		release_contiguous_memory(dev, chunk->pages, chunk->npages);
 		kfree(chunk);
 	}
 
@@ -128,7 +149,7 @@ gk20a_ram_get(struct nouveau_fb *pfb, u64 size, u32 align, u32 ncmin,
 			return -ENOMEM;
 		}
 
-		chunk->pages = dma_alloc_from_contiguous(dev, ncmin, order);
+		chunk->pages = alloc_contiguous_memory(dev, ncmin, order);
 		if (!chunk->pages) {
 			kfree(chunk);
 			gk20a_ram_put(pfb, pmem);
-- 
1.9.2
