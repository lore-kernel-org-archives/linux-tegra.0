From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] iommu/tegra-smmu: Add missing locks around mapping operations
Date: Sun, 24 May 2020 21:37:55 +0300
Message-ID: <20200524183755.3774-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The mapping operations of the Tegra SMMU driver are subjected to a race
condition issues because SMMU Address Space isn't allocated and freed
atomically, while it should be. This patch makes the mapping operations
atomic, it fixes an accidentally released Host1x Address Space problem
which happens while running multiple graphics tests in parallel on
Tegra30, i.e. by having multiple threads racing with each other in the
Host1x's submission and completion code paths, performing IOVA mappings
and unmappings in parallel.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 43 +++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 7426b7666e2b..4f956a797838 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
 
 #include <soc/tegra/ahb.h>
@@ -49,6 +50,7 @@ struct tegra_smmu_as {
 	struct iommu_domain domain;
 	struct tegra_smmu *smmu;
 	unsigned int use_count;
+	spinlock_t lock;
 	u32 *count;
 	struct page **pts;
 	struct page *pd;
@@ -308,6 +310,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 		return NULL;
 	}
 
+	spin_lock_init(&as->lock);
+
 	/* setup aperture */
 	as->domain.geometry.aperture_start = 0;
 	as->domain.geometry.aperture_end = 0xffffffff;
@@ -578,7 +582,7 @@ static u32 *as_get_pte(struct tegra_smmu_as *as, dma_addr_t iova,
 		struct page *page;
 		dma_addr_t dma;
 
-		page = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
+		page = alloc_page(GFP_ATOMIC | __GFP_DMA | __GFP_ZERO);
 		if (!page)
 			return NULL;
 
@@ -655,8 +659,9 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *as, unsigned long iova,
 	smmu_flush(smmu);
 }
 
-static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
-			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+static int
+tegra_smmu_map_locked(struct iommu_domain *domain, unsigned long iova,
+		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	dma_addr_t pte_dma;
@@ -685,8 +690,9 @@ static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
 	return 0;
 }
 
-static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
-			       size_t size, struct iommu_iotlb_gather *gather)
+static size_t
+tegra_smmu_unmap_locked(struct iommu_domain *domain, unsigned long iova,
+			size_t size, struct iommu_iotlb_gather *gather)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	dma_addr_t pte_dma;
@@ -702,6 +708,33 @@ static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 	return size;
 }
 
+static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
+			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+{
+	struct tegra_smmu_as *as = to_smmu_as(domain);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&as->lock, flags);
+	ret = tegra_smmu_map_locked(domain, iova, paddr, size, prot, gfp);
+	spin_unlock_irqrestore(&as->lock, flags);
+
+	return ret;
+}
+
+static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
+			       size_t size, struct iommu_iotlb_gather *gather)
+{
+	struct tegra_smmu_as *as = to_smmu_as(domain);
+	unsigned long flags;
+
+	spin_lock_irqsave(&as->lock, flags);
+	size = tegra_smmu_unmap_locked(domain, iova, size, gather);
+	spin_unlock_irqrestore(&as->lock, flags);
+
+	return size;
+}
+
 static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 					   dma_addr_t iova)
 {
-- 
2.26.0
