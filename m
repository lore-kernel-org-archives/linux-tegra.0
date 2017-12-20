From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 4/5] drm/tegra: gem: Correct iommu_map_sg() error checking
Date: Wed, 20 Dec 2017 18:46:13 +0300
Message-ID: <1daf8bfe7c4ef37a4d5d6d5f87eae36425a3df14.1513783739.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513783738.git.digetx@gmail.com>
In-Reply-To: <cover.1513783738.git.digetx@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

iommu_map_sg() doesn't return a error value, but a size of the requested
IOMMU mapping or zero in case of error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gem.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index ab1e53d434e8..49b9bf28f872 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -114,7 +114,7 @@ static const struct host1x_bo_ops tegra_bo_ops = {
 static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 {
 	int prot = IOMMU_READ | IOMMU_WRITE;
-	ssize_t err;
+	int err;
 
 	if (bo->mm)
 		return -EBUSY;
@@ -128,22 +128,21 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 	err = drm_mm_insert_node_generic(&tegra->mm,
 					 bo->mm, bo->gem.size, PAGE_SIZE, 0, 0);
 	if (err < 0) {
-		dev_err(tegra->drm->dev, "out of I/O virtual memory: %zd\n",
+		dev_err(tegra->drm->dev, "out of I/O virtual memory: %d\n",
 			err);
 		goto unlock;
 	}
 
 	bo->paddr = bo->mm->start;
 
-	err = iommu_map_sg(tegra->domain, bo->paddr, bo->sgt->sgl,
-			   bo->sgt->nents, prot);
-	if (err < 0) {
-		dev_err(tegra->drm->dev, "failed to map buffer: %zd\n", err);
+	bo->size = iommu_map_sg(tegra->domain, bo->paddr, bo->sgt->sgl,
+				bo->sgt->nents, prot);
+	if (!bo->size) {
+		dev_err(tegra->drm->dev, "failed to map buffer\n");
+		err = -ENOMEM;
 		goto remove;
 	}
 
-	bo->size = err;
-
 	mutex_unlock(&tegra->mm_lock);
 
 	return 0;
-- 
2.15.1
