From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 1/6] drm/ttm: expose CPU address of
	DMA-allocated pages
Date: Tue, 8 Jul 2014 17:25:56 +0900
Message-ID: <1404807961-30530-2-git-send-email-acourbot@nvidia.com>
References: <1404807961-30530-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404807961-30530-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Pages allocated using the DMA API have a coherent memory mapping. Make
this mapping visible to drivers so they can decide to use it instead of
creating their own redundant one.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 2 ++
 drivers/gpu/drm/ttm/ttm_tt.c             | 6 +++++-
 include/drm/ttm/ttm_bo_driver.h          | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
index fb8259f69839..0301fac5badd 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
@@ -847,6 +847,7 @@ static int ttm_dma_pool_get_pages(struct dma_pool *pool,
 	if (count) {
 		d_page = list_first_entry(&pool->free_list, struct dma_page, page_list);
 		ttm->pages[index] = d_page->p;
+		ttm_dma->cpu_address[index] = d_page->vaddr;
 		ttm_dma->dma_address[index] = d_page->dma;
 		list_move_tail(&d_page->page_list, &ttm_dma->pages_list);
 		r = 0;
@@ -978,6 +979,7 @@ void ttm_dma_unpopulate(struct ttm_dma_tt *ttm_dma, struct device *dev)
 	INIT_LIST_HEAD(&ttm_dma->pages_list);
 	for (i = 0; i < ttm->num_pages; i++) {
 		ttm->pages[i] = NULL;
+		ttm_dma->cpu_address[i] = 0;
 		ttm_dma->dma_address[i] = 0;
 	}
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 75f319090043..341594ede596 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -58,6 +58,8 @@ static void ttm_dma_tt_alloc_page_directory(struct ttm_dma_tt *ttm)
 	ttm->ttm.pages = drm_calloc_large(ttm->ttm.num_pages, sizeof(void*));
 	ttm->dma_address = drm_calloc_large(ttm->ttm.num_pages,
 					    sizeof(*ttm->dma_address));
+	ttm->cpu_address = drm_calloc_large(ttm->ttm.num_pages,
+					    sizeof(*ttm->cpu_address));
 }
 
 #ifdef CONFIG_X86
@@ -228,7 +230,7 @@ int ttm_dma_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_bo_device *bdev,
 
 	INIT_LIST_HEAD(&ttm_dma->pages_list);
 	ttm_dma_tt_alloc_page_directory(ttm_dma);
-	if (!ttm->pages || !ttm_dma->dma_address) {
+	if (!ttm->pages || !ttm_dma->dma_address || !ttm_dma->cpu_address) {
 		ttm_tt_destroy(ttm);
 		pr_err("Failed allocating page table\n");
 		return -ENOMEM;
@@ -243,6 +245,8 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma)
 
 	drm_free_large(ttm->pages);
 	ttm->pages = NULL;
+	drm_free_large(ttm_dma->cpu_address);
+	ttm_dma->cpu_address = NULL;
 	drm_free_large(ttm_dma->dma_address);
 	ttm_dma->dma_address = NULL;
 }
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index a5183da3ef92..7d30f0666d24 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -133,6 +133,7 @@ struct ttm_tt {
  * struct ttm_dma_tt
  *
  * @ttm: Base ttm_tt struct.
+ * @cpu_address: The CPU address of the pages
  * @dma_address: The DMA (bus) addresses of the pages
  * @pages_list: used by some page allocation backend
  *
@@ -142,6 +143,7 @@ struct ttm_tt {
  */
 struct ttm_dma_tt {
 	struct ttm_tt ttm;
+	void **cpu_address;
 	dma_addr_t *dma_address;
 	struct list_head pages_list;
 };
-- 
2.0.0
