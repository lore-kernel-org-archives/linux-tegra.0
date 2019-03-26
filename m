From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 00/10] Add Tegra194 PCIe support
Date: Tue, 26 Mar 2019 20:43:17 +0530
Message-ID: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, vidyas@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Tegra194 has six PCIe controllers based on Synopsys DesignWare core.
There are two Universal PHY (UPHY) blocks with each supporting 12(HSIO:
Hisg Speed IO) and 8(NVHS: NVIDIA High Speed) lanes respectively.
Controllers:0~4 use UPHY lanes from HSIO brick whereas Controller:5 uses
UPHY lanes from NVHS brick. Lane mapping in HSIO UPHY brick to each PCIe
controller (0~4) is controlled in XBAR module by BPMP-FW. Since PCIe
core has PIPE interface, a glue module called PIPE-to-UPHY (P2U) is used
to connect each UPHY lane (applicable to both HSIO and NVHS UPHY bricks)
to PCIe controller
This patch series
- Adds support for P2U PHY driver
- Adds support for PCIe host controller
- Adds device tree nodes each PCIe controllers
- Enables nodes applicable to p2972-0000 platform
- Adds helper APIs in Designware core driver to get capability regs offset
- Adds defines for new feature registers of PCIe spec revision 4
- Makes changes in DesignWare core driver to get Tegra194 PCIe working

Testing done on P2972-0000 platform
- Able to get PCIe link up with on-board Marvel eSATA controller
- Able to get PCIe link up with NVMe cards connected to M.2 Key-M slot
- Able to do data transfers with both SATA drives and NVMe cards

Note
- Enabling x8 slot on P2972-0000 platform requires pinmux driver for Tegra194.
  It is being worked on currently and hence Controller:5 (i.e. x8 slot) is
  disabled in this patch series. A future patch series would enable this.
Vidya Sagar (10):
  PCI: save pci_bus pointer in pcie_port structure
  PCI: perform dbi regs write lock towards the end
  PCI: dwc: Move config space capability search API
  PCI: Add #defines for PCIe spec r4.0 features
  dt-bindings: PCI: tegra: Add device tree support for T194
  arm64: tegra: Add P2U and PCIe controller nodes to Tegra194 DT
  arm64: tegra: Enable PCIe slots in P2972-0000 board
  phy: tegra: Add PCIe PIPE2UPHY support
  PCI: tegra: Add Tegra194 PCIe support
  arm64: Add Tegra194 PCIe driver to defconfig

 .../bindings/pci/nvidia,tegra194-pcie.txt          |  209 +++
 .../devicetree/bindings/phy/phy-tegra194-p2u.txt   |   34 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   50 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  473 +++++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pci/controller/dwc/Kconfig                 |   10 +
 drivers/pci/controller/dwc/Makefile                |    1 +
 drivers/pci/controller/dwc/pcie-designware-ep.c    |   37 +-
 drivers/pci/controller/dwc/pcie-designware-host.c  |    4 +-
 drivers/pci/controller/dwc/pcie-designware.c       |   73 +
 drivers/pci/controller/dwc/pcie-designware.h       |    4 +
 drivers/pci/controller/dwc/pcie-tegra194.c         | 1862 ++++++++++++++++++++
 drivers/phy/tegra/Kconfig                          |    7 +
 drivers/phy/tegra/Makefile                         |    1 +
 drivers/phy/tegra/pcie-p2u-tegra194.c              |  138 ++
 include/uapi/linux/pci_regs.h                      |   22 +-
 17 files changed, 2888 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
 create mode 100644 drivers/pci/controller/dwc/pcie-tegra194.c
 create mode 100644 drivers/phy/tegra/pcie-p2u-tegra194.c

-- 
2.7.4
