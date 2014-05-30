From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 18/21] iommu/tegra124: smmu: adjust TLB_FLUSH_ASID bit range
Date: Fri, 30 May 2014 14:20:31 +0300
Message-ID: <1401448834-32659-19-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

TLB_FLUSH_ASID bit range depends on the number of asids to support
other number than the current 4, especially for a new Tegra124. Based
on Terje's internal patch.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 7f13133eab0a..f499ca1f8498 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -92,11 +92,14 @@ enum {
 #define SMMU_TLB_FLUSH_VA_MATCH_ALL		0
 #define SMMU_TLB_FLUSH_VA_MATCH_SECTION		2
 #define SMMU_TLB_FLUSH_VA_MATCH_GROUP		3
-#define SMMU_TLB_FLUSH_ASID_SHIFT		29
+#define SMMU_TLB_FLUSH_ASID_SHIFT_BASE		31
 #define SMMU_TLB_FLUSH_ASID_MATCH_DISABLE	0
 #define SMMU_TLB_FLUSH_ASID_MATCH_ENABLE	1
 #define SMMU_TLB_FLUSH_ASID_MATCH_SHIFT		31
 
+#define SMMU_TLB_FLUSH_ASID_SHIFT(as)					\
+	(SMMU_TLB_FLUSH_ASID_SHIFT_BASE - __ffs((as)->smmu->num_as))
+
 #define SMMU_PTC_FLUSH				0x34
 #define SMMU_PTC_FLUSH_TYPE_ALL			0
 #define SMMU_PTC_FLUSH_TYPE_ADR			1
@@ -562,7 +565,7 @@ static void flush_ptc_and_tlb(struct smmu_device *smmu,
 
 	val = tlb_flush_va |
 		SMMU_TLB_FLUSH_ASID_MATCH__ENABLE |
-		(as->asid << SMMU_TLB_FLUSH_ASID_SHIFT);
+		(as->asid << SMMU_TLB_FLUSH_ASID_SHIFT(as));
 	smmu_write(smmu, val, SMMU_TLB_FLUSH);
 	FLUSH_SMMU_REGS(smmu);
 }
@@ -729,7 +732,7 @@ static int alloc_pdir(struct smmu_as *as)
 
 	val = SMMU_TLB_FLUSH_VA_MATCH_ALL |
 		SMMU_TLB_FLUSH_ASID_MATCH__ENABLE |
-		(as->asid << SMMU_TLB_FLUSH_ASID_SHIFT);
+		(as->asid << SMMU_TLB_FLUSH_ASID_SHIFT(as));
 	smmu_write(smmu, val, SMMU_TLB_FLUSH);
 	FLUSH_SMMU_REGS(as->smmu);
 
-- 
2.0.0.rc1.15.g7e76a2f
