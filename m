From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] iommu/tegra: smmu: Add device tree support for SMMU
Date: Thu, 10 May 2012 10:50:19 +0300
Message-ID: <1336636221-31575-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series add device tree support for Tegra30 IOMMU(SMMU).

This requires the following patches sent earlier:

DMA window:
  http://article.gmane.org/gmane.linux.ports.tegra/4603

AHB:
  http://article.gmane.org/gmane.linux.ports.tegra/4657

Hiroshi DOYU (2):
  iommu/tegra: smmu: Add device tree support for SMMU
  ARM: dt: tegra30.dtsi: Add SMMU node

 .../bindings/iommu/nvidia,tegra30-smmu.txt         |   21 +++
 arch/arm/boot/dts/tegra30.dtsi                     |   10 ++
 drivers/iommu/Kconfig                              |    2 +-
 drivers/iommu/tegra-smmu.c                         |  150 +++++++++++++-------
 4 files changed, 128 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.txt

-- 
1.7.5.4
