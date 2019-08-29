From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH 0/7] Nvidia Arm SMMUv2 Implementation
Date: Thu, 29 Aug 2019 15:47:00 -0700
Message-ID: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, avanbrunt@nvidia.com, thomasz@nvidia.com, olof@lixom.net, jtukkinen@nvidia.com, mperttunen@nvidia.com, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi All,
Nvidia Arm SMMUv2 implementation has two ARM SMMU(MMU-500) instances
that are used together for SMMU translations. The IOVA accesses from
HW devices are interleaved across these two SMMU instances and need
to be programmed identical except during tlb sync and fault handling.

This patch set adds Nvidia Arm SMMUv2 Implementation on top of ARM SMMU
driver to handle Nvidia specific implementation. It is also adding
hooks for tlb sync and fault handling to allow vendor specific
implementation for the same.

Please review the patch set and provide the feedback.

This patch set is based on the following branch as it is dependent on the
Arm SMMU Refactor changes from Robin Murphy that are present in this branch.

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-joerg/arm-smmu/updates


Krishna Reddy (7):
  iommu/arm-smmu: add Nvidia SMMUv2 implementation
  dt-bindings: arm-smmu: Add binding for nvidia,smmu-v2
  iommu/arm-smmu: Add tlb_sync implementation hook
  iommu/arm-smmu: Add global/context fault implementation hooks
  arm64: tegra: Add Memory controller DT node on T194
  arm64: tegra: Add DT node for T194 SMMU
  arm64: tegra: enable SMMU for SDHCI and EQOS

 .../devicetree/bindings/iommu/arm,smmu.txt         |   1 +
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  86 +++++++
 drivers/iommu/Makefile                             |   2 +-
 drivers/iommu/arm-smmu-impl.c                      |   2 +
 drivers/iommu/arm-smmu-nvidia.c                    | 256 +++++++++++++++++++++
 drivers/iommu/arm-smmu.c                           |  16 +-
 drivers/iommu/arm-smmu.h                           |  10 +
 9 files changed, 375 insertions(+), 4 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c

-- 
2.1.4
