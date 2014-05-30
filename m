From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 16/21] iommu/tegra124: smmu: support more than 32 bit pa
Date: Fri, 30 May 2014 14:20:29 +0300
Message-ID: <1401448834-32659-17-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add support for more than 32 bit physical address. If physical
address space is 32bit, there will be no register write
happening. Based on Pavan's internal patch.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Pavan Kunapuli <pkunapuli-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 12a4a8f68538..24fe16f1a1d8 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -101,6 +101,8 @@ enum {
 #define SMMU_PTC_FLUSH_TYPE_ADR			1
 #define SMMU_PTC_FLUSH_ADR_SHIFT		4
 
+#define SMMU_PTC_FLUSH_1			0x9b8
+
 #define SMMU_ASID_SECURITY			0x38
 
 #define SMMU_STATS_CACHE_COUNT_BASE		0x1f0
@@ -143,7 +145,7 @@ enum {
 #define SMMU_PDIR_SHIFT	12
 #define SMMU_PDE_SHIFT	12
 #define SMMU_PTE_SHIFT	12
-#define SMMU_PFN_MASK	0x000fffff
+#define SMMU_PFN_MASK	0x0fffffff
 
 #define SMMU_ADDR_TO_PFN(addr)	((addr) >> 12)
 #define SMMU_ADDR_TO_PDN(addr)	((addr) >> 22)
@@ -258,6 +260,7 @@ struct smmu_device {
 struct smmu_platform_data {
 	int asids;		/* number of asids */
 	int nr_xlats;		/* number of translation_enable registers */
+	bool lpae;		/* PA > 32 bit */
 };
 
 static struct smmu_device *smmu_handle; /* unique for a system */
@@ -301,6 +304,8 @@ static inline void smmu_write(struct smmu_device *smmu, u32 val, size_t offs)
 #define VA_PAGE_TO_PA(va, page)	\
 	(page_to_phys(page) + ((unsigned long)(va) & ~PAGE_MASK))
 
+#define VA_PAGE_TO_PA_HI(va, page) (u32)((u64)page_to_phys(page) >> 32)
+
 #define FLUSH_CPU_DCACHE(va, page, size)	\
 	do {	\
 		unsigned long _pa_ = VA_PAGE_TO_PA(va, page);		\
@@ -525,6 +530,20 @@ static int smmu_setup_regs(struct smmu_device *smmu)
 	return 0;
 }
 
+static void flush_ptc_by_addr(struct smmu_device *smmu, unsigned long *pte,
+			      struct page *page)
+{
+	u32 val;
+
+	val = VA_PAGE_TO_PA_HI(pte, page);
+	smmu_write(smmu, val, SMMU_PTC_FLUSH_1);
+
+	val = SMMU_PTC_FLUSH_TYPE_ADR | VA_PAGE_TO_PA(pte, page);
+	smmu_write(smmu, val, SMMU_PTC_FLUSH);
+
+	FLUSH_SMMU_REGS(smmu);
+}
+
 static void flush_ptc_and_tlb(struct smmu_device *smmu,
 		      struct smmu_as *as, dma_addr_t iova,
 		      unsigned long *pte, struct page *page, int is_pde)
@@ -534,9 +553,8 @@ static void flush_ptc_and_tlb(struct smmu_device *smmu,
 		?  SMMU_TLB_FLUSH_VA(iova, SECTION)
 		:  SMMU_TLB_FLUSH_VA(iova, GROUP);
 
-	val = SMMU_PTC_FLUSH_TYPE_ADR | VA_PAGE_TO_PA(pte, page);
-	smmu_write(smmu, val, SMMU_PTC_FLUSH);
-	FLUSH_SMMU_REGS(smmu);
+	flush_ptc_by_addr(smmu, pte, page);
+
 	val = tlb_flush_va |
 		SMMU_TLB_FLUSH_ASID_MATCH__ENABLE |
 		(as->asid << SMMU_TLB_FLUSH_ASID_SHIFT);
@@ -701,9 +719,9 @@ static int alloc_pdir(struct smmu_as *as)
 	for (pdn = 0; pdn < SMMU_PDIR_COUNT; pdn++)
 		pdir[pdn] = _PDE_VACANT(pdn);
 	FLUSH_CPU_DCACHE(pdir, as->pdir_page, SMMU_PDIR_SIZE);
-	val = SMMU_PTC_FLUSH_TYPE_ADR | VA_PAGE_TO_PA(pdir, as->pdir_page);
-	smmu_write(smmu, val, SMMU_PTC_FLUSH);
-	FLUSH_SMMU_REGS(as->smmu);
+
+	flush_ptc_by_addr(as->smmu, pdir, page);
+
 	val = SMMU_TLB_FLUSH_VA_MATCH_ALL |
 		SMMU_TLB_FLUSH_ASID_MATCH__ENABLE |
 		(as->asid << SMMU_TLB_FLUSH_ASID_SHIFT);
@@ -1252,6 +1270,10 @@ static void tegra_smmu_create_default_map(struct smmu_device *smmu)
 static const struct smmu_platform_data tegra124_smmu_pdata = {
 	.asids = 128,
 	.nr_xlats = 4,
+	.lpae = true,
+	.nr_asid_secs = 8,
+	.tlb_reset = SMMU_TLB_CONFIG_RESET_VAL | SMMU_TLB_RR_ARB | 0x20,
+	.ptc_reset = SMMU_PTC_CONFIG_RESET_VAL | SMMU_PTC_REQ_LIMIT,
 };
 
 static struct of_device_id tegra_smmu_of_match[] = {
-- 
2.0.0.rc1.15.g7e76a2f
