From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH 2/7] dt-bindings: arm-smmu: Add binding for nvidia,smmu-v2
Date: Thu, 29 Aug 2019 15:47:02 -0700
Message-ID: <1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, avanbrunt@nvidia.com, thomasz@nvidia.com, olof@lixom.net, jtukkinen@nvidia.com, mperttunen@nvidia.com, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add binding doc for Nvidia's smmu-v2 implementation.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3b..0de3759 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -17,6 +17,7 @@ conditions.
                         "arm,mmu-401"
                         "arm,mmu-500"
                         "cavium,smmu-v2"
+                        "nidia,smmu-v2"
                         "qcom,smmu-v2"
 
                   depending on the particular implementation and/or the
-- 
2.1.4
