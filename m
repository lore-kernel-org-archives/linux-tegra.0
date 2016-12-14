From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/7] drm/tegra: Add Tegra DRM allocation API
Date: Wed, 14 Dec 2016 13:16:11 +0200
Message-ID: <20161214111617.24548-2-mperttunen@nvidia.com>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214111617.24548-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a new IO virtual memory allocation API to allow clients to
allocate non-GEM memory in the Tegra DRM IOMMU domain. This is
required e.g. for loading client firmware when clients are attached
to the IOMMU domain.

The allocator allocates contiguous physical pages that are then
mapped contiguously to the IOMMU domain using the iova_domain
library provided by the kernel. Contiguous physical pages are
used so that the same allocator works also when IOMMU support
is disabled and therefore devices access physical memory directly.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 111 +++++++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/drm.h |  11 +++++
 2 files changed, 115 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b8be3ee..cf714c6 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1,12 +1,13 @@
 /*
  * Copyright (C) 2012 Avionic Design GmbH
- * Copyright (C) 2012-2013 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2012-2016 NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
 
+#include <linux/bitops.h>
 #include <linux/host1x.h>
 #include <linux/iommu.h>
 
@@ -23,6 +24,8 @@
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
+#define CARVEOUT_SZ SZ_64M
+
 struct tegra_drm_file {
 	struct list_head contexts;
 };
@@ -127,7 +130,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 
 	if (iommu_present(&platform_bus_type)) {
 		struct iommu_domain_geometry *geometry;
-		u64 start, end;
+		unsigned long order;
+		u64 carveout_start, carveout_end, gem_start, gem_end;
 
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
@@ -136,12 +140,25 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 		}
 
 		geometry = &tegra->domain->geometry;
-		start = geometry->aperture_start;
-		end = geometry->aperture_end;
+		gem_start = geometry->aperture_start;
+		gem_end = geometry->aperture_end - CARVEOUT_SZ;
+		carveout_start = gem_end + 1;
+		carveout_end = geometry->aperture_end;
+
+		order = __ffs(tegra->domain->pgsize_bitmap);
+		init_iova_domain(&tegra->carveout.domain, 1UL << order,
+				 carveout_start >> order,
+				 carveout_end >> order);
+
+		tegra->carveout.shift = iova_shift(&tegra->carveout.domain);
+		tegra->carveout.limit = carveout_end >> tegra->carveout.shift;
+
+		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
 
-		DRM_DEBUG_DRIVER("IOMMU aperture initialized (%#llx-%#llx)\n",
-				 start, end);
-		drm_mm_init(&tegra->mm, start, end - start + 1);
+		DRM_DEBUG("IOMMU apertures:\n");
+		DRM_DEBUG("  GEM: %#llx-%#llx\n", gem_start, gem_end);
+		DRM_DEBUG("  Carveout: %#llx-%#llx\n", carveout_start,
+			  carveout_end);
 	}
 
 	mutex_init(&tegra->clients_lock);
@@ -208,6 +225,7 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (tegra->domain) {
 		iommu_domain_free(tegra->domain);
 		drm_mm_takedown(&tegra->mm);
+		put_iova_domain(&tegra->carveout.domain);
 	}
 free:
 	kfree(tegra);
@@ -232,6 +250,7 @@ static int tegra_drm_unload(struct drm_device *drm)
 	if (tegra->domain) {
 		iommu_domain_free(tegra->domain);
 		drm_mm_takedown(&tegra->mm);
+		put_iova_domain(&tegra->carveout.domain);
 	}
 
 	kfree(tegra);
@@ -975,6 +994,84 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 	return 0;
 }
 
+void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size,
+			      dma_addr_t *dma)
+{
+	struct iova *alloc;
+	void *virt;
+	gfp_t gfp;
+	int err;
+
+	if (tegra->domain)
+		size = iova_align(&tegra->carveout.domain, size);
+	else
+		size = PAGE_ALIGN(size);
+
+	gfp = GFP_KERNEL | __GFP_ZERO;
+	if (!tegra->domain) {
+		/*
+		 * Many units only support 32-bit addresses, even on 64-bit
+		 * SoCs. If there is no IOMMU to translate into a 32-bit IO
+		 * virtual address space, force allocations to be in the
+		 * lower 32-bit range.
+		 */
+		gfp |= GFP_DMA;
+	}
+
+	virt = (void *)__get_free_pages(gfp, get_order(size));
+	if (!virt)
+		return ERR_PTR(-ENOMEM);
+
+	if (!tegra->domain) {
+		/*
+		 * If IOMMU is disabled, devices address physical memory
+		 * directly.
+		 */
+		*dma = virt_to_phys(virt);
+		return virt;
+	}
+
+	alloc = alloc_iova(&tegra->carveout.domain,
+			   size >> tegra->carveout.shift,
+			   tegra->carveout.limit, true);
+	if (!alloc) {
+		err = -EBUSY;
+		goto free_pages;
+	}
+
+	*dma = iova_dma_addr(&tegra->carveout.domain, alloc);
+	err = iommu_map(tegra->domain, *dma, virt_to_phys(virt),
+			size, IOMMU_READ | IOMMU_WRITE);
+	if (err < 0)
+		goto free_iova;
+
+	return virt;
+
+free_iova:
+	__free_iova(&tegra->carveout.domain, alloc);
+free_pages:
+	free_pages((unsigned long)virt, get_order(size));
+
+	return ERR_PTR(err);
+}
+
+void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
+		    dma_addr_t dma)
+{
+	if (tegra->domain)
+		size = iova_align(&tegra->carveout.domain, size);
+	else
+		size = PAGE_ALIGN(size);
+
+	if (tegra->domain) {
+		iommu_unmap(tegra->domain, dma, size);
+		free_iova(&tegra->carveout.domain,
+			  iova_pfn(&tegra->carveout.domain, dma));
+	}
+
+	free_pages((unsigned long)virt, get_order(size));
+}
+
 static int host1x_drm_probe(struct host1x_device *dev)
 {
 	struct drm_driver *driver = &tegra_drm_driver;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0ddcce1..7351dee 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 
 #include <uapi/drm/tegra_drm.h>
 #include <linux/host1x.h>
+#include <linux/iova.h>
 #include <linux/of_gpio.h>
 
 #include <drm/drmP.h>
@@ -43,6 +44,12 @@ struct tegra_drm {
 	struct iommu_domain *domain;
 	struct drm_mm mm;
 
+	struct {
+		struct iova_domain domain;
+		unsigned long shift;
+		unsigned long limit;
+	} carveout;
+
 	struct mutex clients_lock;
 	struct list_head clients;
 
@@ -104,6 +111,10 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
 int tegra_drm_exit(struct tegra_drm *tegra);
 
+void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size, dma_addr_t *iova);
+void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
+		    dma_addr_t iova);
+
 struct tegra_dc_soc_info;
 struct tegra_output;
 
-- 
2.10.2
