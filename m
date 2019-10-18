From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v3 3/7] dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
Date: Fri, 18 Oct 2019 16:31:28 -0700
Message-ID: <1571441492-21919-4-git-send-email-vdumpa@nvidia.com>
References: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, avanbrunt@nvidia.com, thomasz@nvidia.com, olof@lixom.net, jtukkinen@nvidia.com, mperttunen@nvidia.com, nicolinc@nvidia.com, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add binding for NVIDIA's Tegra194 Soc SMMU that is based
on ARM MMU-500.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3b..1d72fac 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -31,6 +31,10 @@ conditions.
                   as below, SoC-specific compatibles:
                   "qcom,sdm845-smmu-500", "arm,mmu-500"
 
+                  NVIDIA SoCs that use more than one ARM MMU-500 together
+                  needs following SoC-specific compatibles along with "arm,mmu-500":
+                  "nvidia,tegra194-smmu"
+
 - reg           : Base address and size of the SMMU.
 
 - #global-interrupts : The number of global interrupts exposed by the
-- 
2.7.4
