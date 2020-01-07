From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2] PCI: tegra: Fix afi_pex2_ctrl reg offset for Tegra30
Date: Tue,  7 Jan 2020 09:14:02 +0100
Message-ID: <20200107081402.213149-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Thierry Reding <treding@nvidia.com>, Marcel Ziswiler <marcel@ziswiler.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: linux-tegra@vger.kernel.org

Fix AFI_PEX2_CTRL reg offset for Tegra30 by moving it from the Tegra20
SoC struct where it erroneously got added. This fixes the AFI_PEX2_CTRL
reg offset being uninitialised subsequently failing to bring up the
third PCIe port.

Fixes: adb2653b3d2e ("PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of SoC struct")

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
Acked-by: Thierry Reding <treding@nvidia.com>

---

Changes in v2:
- Fix recipient list concerning CC: and To: lines as suggested by
  Thierry.
- Fix subject line and commit message to adhere to standard formatting
  rules as suggested by Thierry.
- Add Thierry's Acked-by tag.
- Add standard Fixes tag as suggested by Andrew.

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
