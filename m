From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v1] pci: tegra: fix afi_pex2_ctrl reg offset for tegra30
Date: Mon, 30 Dec 2019 01:52:09 +0100
Message-ID: <20191230005209.1546434-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, Thierry Reding <treding@nvidia.com>, Marcel Ziswiler <marcel@ziswiler.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thierry Reding <thierry.reding@gmail.com>, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fix AFI_PEX2_CTRL reg offset for tegra30 by moving it from the tegra20
SoC struct where it erroneously got added by commit adb2653b3d2e
("PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of SoC struct").
This fixes the AFI_PEX2_CTRL reg offset being uninitialised
subsequently failing to bring up the third PCIe port.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>

---

 drivers/pci/controller/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 090b632965e2..ac93f5a0398e 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2499,7 +2499,6 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.num_ports = 2,
 	.ports = tegra20_pcie_ports,
 	.msi_base_shift = 0,
-	.afi_pex2_ctrl = 0x128,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA20,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_DIV10,
 	.pads_refclk_cfg0 = 0xfa5cfa5c,
@@ -2528,6 +2527,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.num_ports = 3,
 	.ports = tegra30_pcie_ports,
 	.msi_base_shift = 8,
+	.afi_pex2_ctrl = 0x128,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
 	.pads_refclk_cfg0 = 0xfa5cfa5c,
-- 
2.24.1
