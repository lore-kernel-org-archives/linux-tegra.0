From: Anvesh Salveru <anvesh.s@samsung.com>
Subject: [PATCH 1/2] PCI: tegra: Remove support for ZRX-DC compliant PHY
 from platform driver
Date: Mon, 28 Oct 2019 18:12:19 +0530
Message-ID: <1572266540-17626-2-git-send-email-anvesh.s@samsung.com>
References: <1572266540-17626-1-git-send-email-anvesh.s@samsung.com>
        <CGME20191028124253epcas5p3fd6b58e5ecd45bfd9c51dfdbd1a4ae40@epcas5p3.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1572266540-17626-1-git-send-email-anvesh.s@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: pankaj.dubey@samsung.com, thierry.reding@gmail.com, jonathanh@nvidia.com, Anvesh Salveru <anvesh.s@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Vidya Sagar <vidyas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

As part of dw_pcie_setup(), PHYs which are compliant to ZRX-DC
specification are already handled based on "snps,phy-zrxdc-compliant"
property in controller DT node. So, instead of handling ZRX-DC
compliant settings in each platform driver, remove this driver
specific code.

CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: Andrew Murray <andrew.murray@arm.com>
CC: Bjorn Helgaas <bhelgaas@google.com>
CC: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Anvesh Salveru <anvesh.s@samsung.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
Depends on the following patch:
https://patchwork.kernel.org/patch/11215241/
https://patchwork.kernel.org/patch/11215239/

 drivers/pci/controller/dwc/pcie-tegra194.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f89f5acee72d..f3a6ea89b8a8 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -782,10 +782,6 @@ static void tegra_pcie_prepare_host(struct pcie_port *pp)
 
 	init_host_aspm(pcie);
 
-	val = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
-	val &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
-	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
-
 	if (pcie->update_fc_fixup) {
 		val = dw_pcie_readl_dbi(pci, CFG_TIMER_CTRL_MAX_FUNC_NUM_OFF);
 		val |= 0x1 << CFG_TIMER_CTRL_ACK_NAK_SHIFT;
-- 
2.17.1
