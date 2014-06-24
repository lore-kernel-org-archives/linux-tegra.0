From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/3] drm/ttm: introduce dma cache sync helpers
Date: Tue, 24 Jun 2014 18:54:26 +0900
Message-ID: <1403603667-11302-3-git-send-email-acourbot@nvidia.com>
References: <1403603667-11302-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1403603667-11302-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>

On architectures for which access to GPU memory is non-coherent,
caches need to be flushed and invalidated explicitly at the
appropriate places. Introduce two small helpers to make things
easy for TTM-based drivers.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c    | 25 +++++++++++++++++++++++++
 include/drm/ttm/ttm_bo_driver.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 75f319090043..66c16ad35f70 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -38,6 +38,7 @@
 #include <linux/swap.h>
 #include <linux/slab.h>
 #include <linux/export.h>
+#include <linux/dma-mapping.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_mem_util.h>
 #include <drm/ttm/ttm_module.h>
@@ -248,6 +249,30 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma)
 }
 EXPORT_SYMBOL(ttm_dma_tt_fini);
 
+void ttm_dma_tt_cache_sync_for_device(struct ttm_dma_tt *ttm_dma,
+				      struct device *dev)
+{
+	unsigned long i;
+
+	for (i = 0; i < ttm_dma->ttm.num_pages; i++) {
+		dma_sync_single_for_device(dev, ttm_dma->dma_address[i],
+					   PAGE_SIZE, DMA_TO_DEVICE);
+	}
+}
+EXPORT_SYMBOL(ttm_dma_tt_cache_sync_for_device);
+
+void ttm_dma_tt_cache_sync_for_cpu(struct ttm_dma_tt *ttm_dma,
+				   struct device *dev)
+{
+	unsigned long i;
+
+	for (i = 0; i < ttm_dma->ttm.num_pages; i++) {
+		dma_sync_single_for_cpu(dev, ttm_dma->dma_address[i],
+					PAGE_SIZE, DMA_FROM_DEVICE);
+	}
+}
+EXPORT_SYMBOL(ttm_dma_tt_cache_sync_for_cpu);
+
 void ttm_tt_unbind(struct ttm_tt *ttm)
 {
 	int ret;
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index a5183da3ef92..52fb709568fc 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -41,6 +41,7 @@
 #include <linux/fs.h>
 #include <linux/spinlock.h>
 #include <linux/reservation.h>
+#include <linux/device.h>
 
 struct ttm_backend_func {
 	/**
@@ -690,6 +691,33 @@ extern int ttm_tt_swapout(struct ttm_tt *ttm,
  */
 extern void ttm_tt_unpopulate(struct ttm_tt *ttm);
 
+/**
+ * ttm_dma_tt_cache_sync_for_device:
+ *
+ * @ttm A struct ttm_tt of the type returned by ttm_dma_tt_init.
+ * @dev A struct device representing the device to which to sync.
+ *
+ * This function will flush the CPU caches on arches where snooping in the
+ * TT is not available. On fully coherent arches this will turn into an (almost)
+ * noop. This makes sure that data written by the CPU is visible to the device.
+ */
+extern void ttm_dma_tt_cache_sync_for_device(struct ttm_dma_tt *ttm_dma,
+					     struct device *dev);
+
+/**
+ * ttm_dma_tt_cache_sync_for_cpu:
+ *
+ * @ttm A struct ttm_tt of the type returned by ttm_dma_tt_init.
+ * @dev A struct device representing the device from which to sync.
+ *
+ * This function will invalidate the CPU caches on arches where snooping in the
+ * TT is not available. On fully coherent arches this will turn into an (almost)
+ * noop. This makes sure that the CPU does not read any stale cached or
+ * prefetched data.
+ */
+extern void ttm_dma_tt_cache_sync_for_cpu(struct ttm_dma_tt *ttm_dma,
+					  struct device *dev);
+
 /*
  * ttm_bo.c
  */
-- 
2.0.0
