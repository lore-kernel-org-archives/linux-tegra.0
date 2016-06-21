From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] pci: tegra: correctly program PADS_REFCLK registers
Date: Tue, 21 Jun 2016 12:46:40 -0600
Message-ID: <20160621184640.19885-1-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The value that should be programmed into the PADS_REFCLK register varies
per SoC. Fix the Tegra PCIe driver to program the correct values. Future
SoCs will require different values in cfg0/1, so the two values are stored
separately in the per-SoC data structures.

For reference, the values are all documented in NV bug 1771116 comment 20.
Rhe ASIC team has validated all these values, except for the Tegra20 value
which is simply left unchanged in this patch.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index c388468c202a..74887fedc3d4 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -228,15 +228,6 @@
 #define PADS_REFCLK_CFG_PREDI_SHIFT		8  /* 11:8 */
 #define PADS_REFCLK_CFG_DRVI_SHIFT		12 /* 15:12 */
 
-/* Default value provided by HW engineering is 0xfa5c */
-#define PADS_REFCLK_CFG_VALUE \
-	( \
-		(0x17 << PADS_REFCLK_CFG_TERM_SHIFT)   | \
-		(0    << PADS_REFCLK_CFG_E_TERM_SHIFT) | \
-		(0xa  << PADS_REFCLK_CFG_PREDI_SHIFT)  | \
-		(0xf  << PADS_REFCLK_CFG_DRVI_SHIFT)     \
-	)
-
 struct tegra_msi {
 	struct msi_controller chip;
 	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
@@ -252,6 +243,8 @@ struct tegra_pcie_soc_data {
 	unsigned int msi_base_shift;
 	u32 pads_pll_ctl;
 	u32 tx_ref_sel;
+	u32 pads_refclk_cfg0;
+	u32 pads_refclk_cfg1;
 	bool has_pex_clkreq_en;
 	bool has_pex_bias_ctrl;
 	bool has_intr_prsnt_sense;
@@ -839,10 +832,9 @@ static int tegra_pcie_phy_enable(struct tegra_pcie *pcie)
 	pads_writel(pcie, value, soc->pads_pll_ctl);
 
 	/* Configure the reference clock driver */
-	value = PADS_REFCLK_CFG_VALUE | (PADS_REFCLK_CFG_VALUE << 16);
-	pads_writel(pcie, value, PADS_REFCLK_CFG0);
+	pads_writel(pcie, soc->pads_refclk_cfg0, PADS_REFCLK_CFG0);
 	if (soc->num_ports > 2)
-		pads_writel(pcie, PADS_REFCLK_CFG_VALUE, PADS_REFCLK_CFG1);
+		pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
 
 	/* wait for the PLL to lock */
 	err = tegra_pcie_pll_wait(pcie, 500);
@@ -2078,6 +2070,7 @@ static const struct tegra_pcie_soc_data tegra20_pcie_data = {
 	.msi_base_shift = 0,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA20,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_DIV10,
+	.pads_refclk_cfg0 = 0xfa5cfa5c,
 	.has_pex_clkreq_en = false,
 	.has_pex_bias_ctrl = false,
 	.has_intr_prsnt_sense = false,
@@ -2090,6 +2083,8 @@ static const struct tegra_pcie_soc_data tegra30_pcie_data = {
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
+	.pads_refclk_cfg0 = 0xfa5cfa5c,
+	.pads_refclk_cfg1 = 0xfa5cfa5c,
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
@@ -2102,6 +2097,7 @@ static const struct tegra_pcie_soc_data tegra124_pcie_data = {
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
+	.pads_refclk_cfg0 = 0x44ac44ac,
 	.has_pex_clkreq_en = true,
 	.has_pex_bias_ctrl = true,
 	.has_intr_prsnt_sense = true,
-- 
2.9.0
