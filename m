From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 13/21] iommu/tegra124: smmu: optionaly AHB enables SMMU
Date: Fri, 30 May 2014 14:20:26 +0300
Message-ID: <1401448834-32659-14-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

SMMU used to depend on AHB bus. AHB driver needs to be populated and
AHB_XBAR_CTRL_SMMU_INIT_DONE bit needs to be set earliear than SMMU
being populated. Later Tegra SoC (>= T124) doesn't need AHB to enable
SMMU on AHB_XBAR_CTRL for AHB_XBAR_CTRL_SMMU_INIT_DONE any more. This
setting bit is now optional, depending on DT passing ahb phandle or
not.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 4a326476c364..20dddc305fb2 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -499,7 +499,10 @@ static int smmu_setup_regs(struct smmu_device *smmu)
 
 	smmu_flush_regs(smmu, 1);
 
-	return tegra_ahb_enable_smmu(smmu->ahb);
+	if (smmu->ahb)
+		return tegra_ahb_enable_smmu(smmu->ahb);
+
+	return 0;
 }
 
 static void flush_ptc_and_tlb(struct smmu_device *smmu,
@@ -1283,9 +1286,6 @@ static int tegra_smmu_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	smmu->ahb = of_parse_phandle(dev->of_node, "nvidia,ahb", 0);
-	if (!smmu->ahb)
-		return -ENODEV;
-
 	smmu->iommu.dev = dev;
 	smmu->num_as = asids;
 	smmu->iovmm_base = base;
-- 
2.0.0.rc1.15.g7e76a2f
