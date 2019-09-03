From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH v2 0/7] Nvidia Arm SMMUv2 Implementation
Date: Mon, 2 Sep 2019 20:32:01 -0700
Message-ID: <1567481528-31163-1-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, avanbrunt@nvidia.com, thomasz@nvidia.com, olof@lixom.net, jtukkinen@nvidia.com, mperttunen@nvidia.com, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Changes in v2:
- Prepare arm_smu_flush_ops for override.
- Remove NVIDIA_SMMUv2 and use ARM_SMMUv2 model as T194 SMMU hasn't modified ARM MMU-500.
- Add T194 specific compatible string - "nvidia,tegra194-smmu"
- Remove tlb_sync hook added in v1 and Override arm_smmu_flush_ops->tlb_sync() from implementation.
- Register implementation specific context/global fault hooks directly for irq handling.
- Update global/context interrupt list in DT and releant fault handling code in arm-smmu-nvidia.c.
- Implement reset hook in arm-smmu-nvidia.c to clear irq status and sync tlb.

v1 - https://lkml.org/lkml/2019/8/29/1588

Krishna Reddy (7):
  iommu/arm-smmu: prepare arm_smmu_flush_ops for override
  iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
  dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
  iommu/arm-smmu: Add global/context fault implementation hooks
  arm64: tegra: Add Memory controller DT node on T194
  arm64: tegra: Add DT node for T194 SMMU
  arm64: tegra: enable SMMU for SDHCI and EQOS on T194

 .../devicetree/bindings/iommu/arm,smmu.txt         |   4 +
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  88 +++++++
 drivers/iommu/Makefile                             |   2 +-
 drivers/iommu/arm-smmu-impl.c                      |   3 +
 drivers/iommu/arm-smmu-nvidia.c                    | 287 +++++++++++++++++++++
 drivers/iommu/arm-smmu.c                           |  27 +-
 drivers/iommu/arm-smmu.h                           |   8 +-
 9 files changed, 413 insertions(+), 12 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c

-- 
2.1.4
