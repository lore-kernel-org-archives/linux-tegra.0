From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 00/21] Tegra,SMMU update V8
Date: Fri, 30 May 2014 14:20:13 +0300
Message-ID: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

This is the Tegra,SMMU update v8, including Tegra124 support. This
series hasn't been changed so much from v7. Just a few minor fixes are
added, rebased onto next-20140527. Still device population order issue
needs to be solved before being merged. If this problem is solved,
this series can be posted more wider MLs to review/merge.

This series is posted for ones to try your device with IOMMU.

Hiroshi Doyu (21):
  of: introduce of_property_for_each_phandle_with_args()
  iommu/of: introduce a global iommu device list
  iommu/of: check if dependee iommu is ready or not
  driver/core: populate devices in order for IOMMUs
  iommu/core: add ops->{bound,unbind}_driver()
  ARM: tegra: create a DT header defining SWGROUP ID
  iommu/tegra: smmu: register device to iommu dynamically
  iommu/tegra: smmu: calculate ASID register offset by ID
  iommu/tegra: smmu: get swgroups from DT "iommus="
  iommu/tegra: smmu: allow duplicate ASID wirte
  iommu/tegra: smmu: Rename hwgrp -> swgroups
  iommu/tegra: smmu: add SMMU to an global iommu list
  iommu/tegra124: smmu: optionaly AHB enables SMMU
  iommu/tegra124: smmu: convert swgroup ID to asid offset
  iommu/tegra124: smmu: add support platform data
  iommu/tegra124: smmu: support more than 32 bit pa
  iommu/tegra124: smmu: {TLB,PTC} reset value per SoC
  iommu/tegra124: smmu: adjust TLB_FLUSH_ASID bit range
  iommu/tegra124: smmu: add multiple asid_security support
  ARM: dt: tegra124: add tegra,smmu entry
  ARM: dt: tegra124: add sdhci iommus bindings

 .../bindings/iommu/nvidia,tegra30-smmu.txt         |   4 +-
 arch/arm/boot/dts/tegra124.dtsi                    |  19 +
 drivers/base/dd.c                                  |   5 +
 drivers/iommu/Kconfig                              |   1 +
 drivers/iommu/iommu.c                              |  13 +-
 drivers/iommu/of_iommu.c                           |  49 ++
 drivers/iommu/tegra-smmu.c                         | 567 ++++++++++++++-------
 drivers/of/base.c                                  |  50 ++
 include/dt-bindings/memory/tegra-swgroup.h         |  50 ++
 include/linux/iommu.h                              |   4 +
 include/linux/of.h                                 |  36 ++
 include/linux/of_iommu.h                           |  22 +
 12 files changed, 626 insertions(+), 194 deletions(-)
 create mode 100644 include/dt-bindings/memory/tegra-swgroup.h

-- 
2.0.0.rc1.15.g7e76a2f
