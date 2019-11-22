From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 0/6] Add support for PCIe endpoint mode in Tegra194
Date: Fri, 22 Nov 2019 16:14:59 +0530
Message-ID: <20191122104505.8986-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com
Cc: devicetree@vger.kernel.org, mmaddireddy@nvidia.com, kthota@nvidia.com, gustavo.pimentel@synopsys.com, linux-kernel@vger.kernel.org, kishon@ti.com, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, vidyas@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Tegra194 has three (C0, C4 & C5) dual mode PCIe controllers that can operate
either in root port mode or in end point mode but only in one mode at a time.
Platform P2972-0000 supports enabling endpoint mode for C5 controller. This
patch series adds support for PCIe endpoint mode in both the driver as well as
in DT.
This patch series depends on the changes made for Synopsys DesignWare endpoint
mode subsystem that are currently under review
@ https://patchwork.kernel.org/project/linux-pci/list/?series=202211
which in turn depends on the patch made by Kishon
@ https://patchwork.kernel.org/patch/10975123/
which is also under review.

Vidya Sagar (6):
  soc/tegra: bpmp: Update ABI header
  dt-bindings: PCI: tegra: Add DT support for PCIe EP nodes in Tegra194
  PCI: tegra: Add support for PCIe endpoint mode in Tegra194
  arm64: tegra: Add PCIe endpoint controllers nodes for Tegra194
  arm64: tegra: Enable GPIO controllers nodes for P2972-0000 platform
  arm64: tegra: Add support for PCIe endpoint mode in P2972-0000
    platform

 .../bindings/pci/nvidia,tegra194-pcie-ep.txt  | 138 ++++
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  37 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  99 +++
 drivers/pci/controller/dwc/Kconfig            |  30 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    | 751 +++++++++++++++++-
 include/soc/tegra/bpmp-abi.h                  |  10 +-
 6 files changed, 1048 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie-ep.txt

-- 
2.17.1
