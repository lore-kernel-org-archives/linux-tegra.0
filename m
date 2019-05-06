From: Tom Murphy <tmurphy@arista.com>
Subject: [PATCH v3 2/4] iommu/dma-iommu: Handle deferred devices
Date: Mon,  6 May 2019 19:52:04 +0100
Message-ID: <20190506185207.31069-3-tmurphy@arista.com>
References: <20190506185207.31069-1-tmurphy@arista.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506185207.31069-1-tmurphy@arista.com>
Sender: linux-kernel-owner@vger.kernel.org
To: iommu@lists.linux-foundation.org
Cc: murphyt7@tcd.ie, Tom Murphy <tmurphy@arista.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Gerald Schaefer <gerald.schaefer@de.ibm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Handle devices which defer their attach to the iommu in the dma-iommu api

Signed-off-by: Tom Murphy <tmurphy@arista.com>
---
 drivers/iommu/dma-iommu.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7a96c2c8f56b..b383498e2dc3 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/vmalloc.h>
+#include <linux/crash_dump.h>
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -322,6 +323,22 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	return iova_reserve_iommu_regions(dev, domain);
 }
 
+static int handle_deferred_device(struct device *dev)
+{
+	struct iommu_domain *domain;
+	const struct iommu_ops *ops;
+
+	if (!is_kdump_kernel())
+		return 0;
+
+	domain = iommu_get_domain_for_dev(dev);
+	ops = domain->ops;
+	if (ops->is_attach_deferred && ops->is_attach_deferred(domain, dev))
+		return iommu_attach_device(domain, dev);
+
+	return 0;
+}
+
 /**
  * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
  *                    page flags.
@@ -835,7 +852,10 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	bool coherent = dev_is_dma_coherent(dev);
 	dma_addr_t dma_handle;
 
-	dma_handle =__iommu_dma_map(dev, phys, size,
+	if (unlikely(handle_deferred_device(dev)))
+		return DMA_MAPPING_ERROR;
+
+	dma_handle = __iommu_dma_map(dev, phys, size,
 			dma_info_to_prot(dir, coherent, attrs),
 			iommu_get_dma_domain(dev));
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
@@ -953,6 +973,9 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	unsigned long mask = dma_get_seg_boundary(dev);
 	int i;
 
+	if (unlikely(handle_deferred_device(dev)))
+		return 0;
+
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
 
@@ -1056,6 +1079,9 @@ static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
 static void *iommu_dma_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
+	if (unlikely(handle_deferred_device(dev)))
+		return NULL;
+
 	gfp |= __GFP_ZERO;
 
 #ifdef CONFIG_DMA_DIRECT_REMAP
-- 
2.17.1
