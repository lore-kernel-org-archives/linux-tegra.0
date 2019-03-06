From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] drm/tegra: gem: Fix CPU-cache maintenance for BO's allocated using get_pages()
Date: Thu,  7 Mar 2019 01:55:19 +0300
Message-ID: <20190306225519.4538-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The allocated pages need to be invalidated in CPU caches. On ARM32 the
DMA_BIDIRECTIONAL flag only ensures that data is written-back to DRAM and
the data stays in CPU cache lines. While the DMA_FROM_DEVICE flag ensures
that the corresponding CPU cache lines are getting invalidated and nothing
more, that's exactly what is needed for a newly allocated pages.

This fixes randomly failing rendercheck tests on Tegra30 using the
Opentegra driver for tests that use small-sized pixmaps (10x10 and less,
i.e. 1-2 memory pages) because apparently CPU reads out stale data from
caches and/or that data is getting evicted to DRAM at the time of HW job
execution.

Cc: stable <stable@vger.kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 4f80100ff5f3..4cce11fd8836 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -204,7 +204,7 @@ static void tegra_bo_free(struct drm_device *drm, struct tegra_bo *bo)
 {
 	if (bo->pages) {
 		dma_unmap_sg(drm->dev, bo->sgt->sgl, bo->sgt->nents,
-			     DMA_BIDIRECTIONAL);
+			     DMA_FROM_DEVICE);
 		drm_gem_put_pages(&bo->gem, bo->pages, true, true);
 		sg_free_table(bo->sgt);
 		kfree(bo->sgt);
@@ -230,7 +230,7 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
 	}
 
 	err = dma_map_sg(drm->dev, bo->sgt->sgl, bo->sgt->nents,
-			 DMA_BIDIRECTIONAL);
+			 DMA_FROM_DEVICE);
 	if (err == 0) {
 		err = -EFAULT;
 		goto free_sgt;
-- 
2.20.1
