From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] drm/tegra: gem: Correct iommu_map_sg() error checking
Date: Sun, 17 Dec 2017 20:25:43 +0300
Message-ID: <ba3717f3c177bfa461a817b6db5d826bd71c142d.1513530929.git.digetx@gmail.com>
References: <8a87083279bb793dd21a0c621bcd002a851495e5.1513530934.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a87083279bb793dd21a0c621bcd002a851495e5.1513530934.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

iommu_map_sg() doesn't return a error value, but a size of the requested
IOMMU mapping or zero in case of error.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gem.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index ab1e53d434e8..710d3c289b2e 100644
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
@@ -135,15 +135,14 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 
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
