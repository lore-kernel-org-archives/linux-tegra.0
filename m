From: Anvesh Salveru <anvesh.s@samsung.com>
Subject: [PATCH 0/2] Add support for ZRX-DC phy property
Date: Mon, 28 Oct 2019 18:12:18 +0530
Message-ID: <1572266540-17626-1-git-send-email-anvesh.s@samsung.com>
References: <CGME20191028124238epcas5p451c77e6f4b37e4db69c87f839bd25574@epcas5p4.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: pankaj.dubey@samsung.com, thierry.reding@gmail.com, jonathanh@nvidia.com, Anvesh Salveru <anvesh.s@samsung.com>
List-Id: linux-tegra@vger.kernel.org

DesignWare controller driver provides the support to handle the PHYs which
are compliant to ZRX-DC specification based on "snps,phy-zrxdc-compliant"
DT property. So, add "snps,phy-zrxdc-compliant" property in tegra pcie
controller DT nodes and remove platform specific code from platform driver.

Anvesh Salveru (2):
  PCI: tegra: Remove support for ZRX-DC compliant PHY from platform
    driver
  arm64: tegra: Add support for ZRX-DC phy property

 arch/arm64/boot/dts/nvidia/tegra194.dtsi   | 6 ++++++
 drivers/pci/controller/dwc/pcie-tegra194.c | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.17.1
