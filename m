From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] drm/tegra: Support kernel mappings with IOMMU
Date: Tue,  8 Nov 2016 19:51:34 +0200
Message-ID: <20161108175135.32004-3-mperttunen@nvidia.com>
References: <20161108175135.32004-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108175135.32004-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Host1x command buffer patching requires that the buffer object can be
mapped into kernel address space, however, the recent addition of
IOMMU did not account to this requirement. Therefore Host1x engines
cannot be used if IOMMU is enabled.

This patch implements kmap, kunmap, mmap and munmap functions to
host1x bo objects.

Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/gem.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 19bf9cd..2508372 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -2,7 +2,7 @@
  * NVIDIA Tegra DRM GEM helper functions
  *
  * Copyright (C) 2012 Sascha Hauer, Pengutronix
- * Copyright (C) 2013 NVIDIA CORPORATION, All rights reserved.
+ * Copyright (C) 2013-2015 NVIDIA CORPORATION, All rights reserved.
  *
  * Based on the GEM/CMA helpers
  *
@@ -47,23 +47,51 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
-	return obj->vaddr;
+	if (obj->vaddr)
+		return obj->vaddr;
+	else if (obj->gem.import_attach)
+		return dma_buf_vmap(obj->gem.import_attach->dmabuf);
+	else
+		return vmap(obj->pages, obj->num_pages, VM_MAP,
+			    pgprot_writecombine(PAGE_KERNEL));
 }
 
 static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 {
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
+
+	if (obj->vaddr)
+		return;
+	else if (obj->gem.import_attach)
+		dma_buf_vunmap(obj->gem.import_attach->dmabuf, addr);
+	else
+		vunmap(addr);
 }
 
 static void *tegra_bo_kmap(struct host1x_bo *bo, unsigned int page)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
-	return obj->vaddr + page * PAGE_SIZE;
+	if (obj->vaddr)
+		return obj->vaddr + page * PAGE_SIZE;
+	else if (obj->gem.import_attach)
+		return dma_buf_kmap(obj->gem.import_attach->dmabuf, page);
+	else
+		return vmap(obj->pages + page, 1, VM_MAP,
+			    pgprot_writecombine(PAGE_KERNEL));
 }
 
 static void tegra_bo_kunmap(struct host1x_bo *bo, unsigned int page,
 			    void *addr)
 {
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
+
+	if (obj->vaddr)
+		return;
+	else if (obj->gem.import_attach)
+		dma_buf_kunmap(obj->gem.import_attach->dmabuf, page, addr);
+	else
+		vunmap(addr);
 }
 
 static struct host1x_bo *tegra_bo_get(struct host1x_bo *bo)
-- 
2.9.3
