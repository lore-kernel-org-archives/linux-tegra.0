From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 5/6] platform: probe IOMMU if present
Date: Fri, 20 Feb 2015 18:23:03 +0900
Message-ID: <1424424184-15001-6-git-send-email-acourbot@nvidia.com>
References: <1424424184-15001-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424424184-15001-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra SoCs have an IOMMU that can be used to present non-contiguous
physical memory as contiguous to the GPU and maximize the use of large
pages in the GPU MMU, leading to performance gains. This patch adds
support for probing such a IOMMU if present and make its properties
available in the nouveau_platform_gpu structure so subsystems can take
advantage of it.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nouveau_platform.c | 75 +++++++++++++++++++++++++++++++++++++++++-
 drm/nouveau/nouveau_platform.h | 18 ++++++++++
 lib/include/nvif/os.h          | 32 ++++++++++++++++++
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drm/nouveau/nouveau_platform.c b/drm/nouveau/nouveau_platform.c
index dc5900bf54ff..3691982452a9 100644
--- a/drm/nouveau/nouveau_platform.c
+++ b/drm/nouveau/nouveau_platform.c
@@ -27,6 +27,7 @@
 #include <linux/of.h>
 #include <linux/reset.h>
 #include <linux/regulator/consumer.h>
+#include <linux/iommu.h>
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
@@ -91,6 +92,71 @@ static int nouveau_platform_power_down(struct nouveau_platform_gpu *gpu)
 	return 0;
 }
 
+static void nouveau_platform_probe_iommu(struct device *dev,
+					 struct nouveau_platform_gpu *gpu)
+{
+	int err;
+	unsigned long pgsize_bitmap;
+
+	mutex_init(&gpu->iommu.mutex);
+
+	if (iommu_present(&platform_bus_type)) {
+		gpu->iommu.domain = iommu_domain_alloc(&platform_bus_type);
+		if (IS_ERR(gpu->iommu.domain))
+			goto error;
+
+		/*
+		 * A IOMMU is only usable if it supports page sizes smaller
+		 * or equal to the system's PAGE_SIZE, with a preference if
+		 * both are equal.
+		 */
+		pgsize_bitmap = gpu->iommu.domain->ops->pgsize_bitmap;
+		if (pgsize_bitmap & PAGE_SIZE) {
+			gpu->iommu.pgshift = PAGE_SHIFT;
+		} else {
+			gpu->iommu.pgshift = fls(pgsize_bitmap & ~PAGE_MASK);
+			if (gpu->iommu.pgshift == 0) {
+				dev_warn(dev, "unsupported IOMMU page size\n");
+				goto free_domain;
+			}
+			gpu->iommu.pgshift -= 1;
+		}
+
+		err = iommu_attach_device(gpu->iommu.domain, dev);
+		if (err)
+			goto free_domain;
+
+		err = nvkm_mm_init(&gpu->iommu._mm, 0,
+				   (1ULL << 40) >> gpu->iommu.pgshift, 1);
+		if (err)
+			goto detach_device;
+
+		gpu->iommu.mm = &gpu->iommu._mm;
+	}
+
+	return;
+
+detach_device:
+	iommu_detach_device(gpu->iommu.domain, dev);
+
+free_domain:
+	iommu_domain_free(gpu->iommu.domain);
+
+error:
+	gpu->iommu.domain = NULL;
+	gpu->iommu.pgshift = 0;
+	dev_err(dev, "cannot initialize IOMMU MM\n");
+}
+
+static void nouveau_platform_remove_iommu(struct device *dev,
+					  struct nouveau_platform_gpu *gpu)
+{
+	if (gpu->iommu.domain) {
+		iommu_detach_device(gpu->iommu.domain, dev);
+		iommu_domain_free(gpu->iommu.domain);
+	}
+}
+
 static int nouveau_platform_probe(struct platform_device *pdev)
 {
 	struct nouveau_platform_gpu *gpu;
@@ -118,6 +184,8 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(gpu->clk_pwr))
 		return PTR_ERR(gpu->clk_pwr);
 
+	nouveau_platform_probe_iommu(&pdev->dev, gpu);
+
 	err = nouveau_platform_power_up(gpu);
 	if (err)
 		return err;
@@ -154,10 +222,15 @@ static int nouveau_platform_remove(struct platform_device *pdev)
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct nvkm_device *device = nvxx_device(&drm->device);
 	struct nouveau_platform_gpu *gpu = nv_device_to_platform(device)->gpu;
+	int err;
 
 	nouveau_drm_device_remove(drm_dev);
 
-	return nouveau_platform_power_down(gpu);
+	err = nouveau_platform_power_down(gpu);
+
+	nouveau_platform_remove_iommu(&pdev->dev, gpu);
+
+	return err;
 }
 
 #if IS_ENABLED(CONFIG_OF)
diff --git a/drm/nouveau/nouveau_platform.h b/drm/nouveau/nouveau_platform.h
index 268bb7213681..392874cf4725 100644
--- a/drm/nouveau/nouveau_platform.h
+++ b/drm/nouveau/nouveau_platform.h
@@ -24,10 +24,12 @@
 #define __NOUVEAU_PLATFORM_H__
 
 #include "core/device.h"
+#include "core/mm.h"
 
 struct reset_control;
 struct clk;
 struct regulator;
+struct iommu_domain;
 struct platform_driver;
 
 struct nouveau_platform_gpu {
@@ -36,6 +38,22 @@ struct nouveau_platform_gpu {
 	struct clk *clk_pwr;
 
 	struct regulator *vdd;
+
+	struct {
+		/*
+		 * Protects accesses to mm from subsystems
+		 */
+		struct mutex mutex;
+
+		struct nvkm_mm _mm;
+		/*
+		 * Just points to _mm. We need this to avoid embedding
+		 * struct nvkm_mm in os.h
+		 */
+		struct nvkm_mm *mm;
+		struct iommu_domain *domain;
+		unsigned long pgshift;
+	} iommu;
 };
 
 struct nouveau_platform_device {
diff --git a/lib/include/nvif/os.h b/lib/include/nvif/os.h
index b4d307e3ac44..275fa84ad003 100644
--- a/lib/include/nvif/os.h
+++ b/lib/include/nvif/os.h
@@ -715,6 +715,29 @@ dma_free_attrs(struct device *dev, size_t sz, void *vaddr, dma_addr_t bus,
 
 
 /******************************************************************************
+ * IOMMU
+ *****************************************************************************/
+struct iommu_domain;
+
+#define IOMMU_READ     (1 << 0)
+#define IOMMU_WRITE    (1 << 1)
+#define IOMMU_CACHE    (1 << 2) /* DMA cache coherency */
+#define IOMMU_NOEXEC   (1 << 3)
+
+static inline int
+iommu_map(struct iommu_domain *domain, unsigned long iova, dma_addr_t paddr,
+	  size_t size, int prot)
+{
+	return 0;
+}
+
+static inline size_t
+iommu_unmap(struct iommu_domain *domain, unsigned long iova, size_t size)
+{
+	return 0;
+}
+
+/******************************************************************************
  * PCI
  *****************************************************************************/
 #include <pciaccess.h>
@@ -1208,9 +1231,18 @@ regulator_get_voltage(struct regulator *regulator)
  * nouveau drm platform device
  *****************************************************************************/
 
+struct nvkm_mm;
+
 struct nouveau_platform_gpu {
 	struct clk *clk;
 	struct regulator *vdd;
+
+	struct {
+		struct mutex mutex;
+		struct nvkm_mm *mm;
+		struct iommu_domain *domain;
+		unsigned long pgshift;
+	} iommu;
 };
 
 struct nouveau_platform_device {
-- 
2.3.0
