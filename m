From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] drm/tegra: Protect IOMMU operations by mutex
Date: Thu,  9 Mar 2017 20:04:56 +0100
Message-ID: <20170309190457.4592-2-thierry.reding@gmail.com>
References: <20170309190457.4592-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170309190457.4592-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

IOMMU support is currently not thread-safe, which can cause crashes,
amongst other things, under certain workloads.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c |  5 +++++
 drivers/gpu/drm/tegra/drm.h |  1 +
 drivers/gpu/drm/tegra/gem.c | 12 ++++++++++--
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 1d7be5ea97ee..d2ec16332fe0 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -144,6 +144,7 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 		DRM_DEBUG_DRIVER("IOMMU aperture initialized (%#llx-%#llx)\n",
 				 start, end);
 		drm_mm_init(&tegra->mm, start, end - start + 1);
+		mutex_init(&tegra->mm_lock);
 	}
 
 	mutex_init(&tegra->clients_lock);
@@ -210,6 +211,7 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (tegra->domain) {
 		iommu_domain_free(tegra->domain);
 		drm_mm_takedown(&tegra->mm);
+		mutex_destroy(&tegra->mm_lock);
 	}
 free:
 	kfree(tegra);
@@ -234,6 +236,7 @@ static void tegra_drm_unload(struct drm_device *drm)
 	if (tegra->domain) {
 		iommu_domain_free(tegra->domain);
 		drm_mm_takedown(&tegra->mm);
+		mutex_destroy(&tegra->mm_lock);
 	}
 
 	kfree(tegra);
@@ -910,7 +913,9 @@ static int tegra_debugfs_iova(struct seq_file *s, void *data)
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_printer p = drm_seq_file_printer(s);
 
+	mutex_lock(&tegra->mm_lock);
 	drm_mm_print(&tegra->mm, &p);
+	mutex_unlock(&tegra->mm_lock);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index eda0d690faad..fe2db2afdca6 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -42,6 +42,7 @@ struct tegra_drm {
 	struct drm_device *drm;
 
 	struct iommu_domain *domain;
+	struct mutex mm_lock;
 	struct drm_mm mm;
 
 	struct mutex clients_lock;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index e9f664990859..94470112ed1f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -128,12 +128,14 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 	if (!bo->mm)
 		return -ENOMEM;
 
+	mutex_lock(&tegra->mm_lock);
+
 	err = drm_mm_insert_node_generic(&tegra->mm,
 					 bo->mm, bo->gem.size, PAGE_SIZE, 0, 0);
 	if (err < 0) {
 		dev_err(tegra->drm->dev, "out of I/O virtual memory: %zd\n",
 			err);
-		goto free;
+		goto unlock;
 	}
 
 	bo->paddr = bo->mm->start;
@@ -147,11 +149,14 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 
 	bo->size = err;
 
+	mutex_unlock(&tegra->mm_lock);
+
 	return 0;
 
 remove:
 	drm_mm_remove_node(bo->mm);
-free:
+unlock:
+	mutex_unlock(&tegra->mm_lock);
 	kfree(bo->mm);
 	return err;
 }
@@ -161,8 +166,11 @@ static int tegra_bo_iommu_unmap(struct tegra_drm *tegra, struct tegra_bo *bo)
 	if (!bo->mm)
 		return 0;
 
+	mutex_lock(&tegra->mm_lock);
 	iommu_unmap(tegra->domain, bo->paddr, bo->size);
 	drm_mm_remove_node(bo->mm);
+	mutex_unlock(&tegra->mm_lock);
+
 	kfree(bo->mm);
 
 	return 0;
-- 
2.12.0
