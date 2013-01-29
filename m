From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v3 1/1] ARM: dma-mapping: Set arm_dma_set_mask() for iommu->set_dma_mask()
Date: Tue, 29 Jan 2013 14:57:07 +0200
Message-ID: <1359464227-19669-1-git-send-email-hdoyu@nvidia.com>
References: <5107C4DE.7060607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5107C4DE.7060607-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

struct dma_map_ops iommu_ops doesn't have ->set_dma_mask, which causes
crash when dma_set_mask() is called from some driver.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mm/dma-mapping.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 6b2fb87..5dfc71f 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1730,6 +1730,8 @@ struct dma_map_ops iommu_ops = {
 	.unmap_sg		= arm_iommu_unmap_sg,
 	.sync_sg_for_cpu	= arm_iommu_sync_sg_for_cpu,
 	.sync_sg_for_device	= arm_iommu_sync_sg_for_device,
+
+	.set_dma_mask		= arm_dma_set_mask,
 };
 
 struct dma_map_ops iommu_coherent_ops = {
@@ -1743,6 +1745,8 @@ struct dma_map_ops iommu_coherent_ops = {
 
 	.map_sg		= arm_coherent_iommu_map_sg,
 	.unmap_sg	= arm_coherent_iommu_unmap_sg,
+
+	.set_dma_mask	= arm_dma_set_mask,
 };
 
 /**
-- 
1.7.9.5
