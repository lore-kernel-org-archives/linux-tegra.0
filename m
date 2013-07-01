From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2] pci: tegra: set up PADS_REFCLK_CFG1
Date: Mon,  1 Jul 2013 10:14:31 -0600
Message-ID: <1372695271-3541-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The registers PADS_REFCLK_CFG are an array of 16-bit data, one entry per
PCIe root port. For Tegra30, we therefore need to write a 3rd entry in
this array. Doing so mays the mini-PCIe slot on Beaver operate correctly.

While we're at it, add some #defines to partially document the fields
within these 16-bit values.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This is to be applied to Thierry's PCIe driver staging branch.

v2:
* Write to PADS_REFCLK_CFG1 only when there are 3 PCIe root ports.
* Various cosmetic cleanups.
---
 drivers/pci/host/pci-tegra.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 2888307..522fd9c 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -195,6 +195,25 @@
 #define PADS_REFCLK_CFG0			0x000000C8
 #define PADS_REFCLK_CFG1			0x000000CC
 
+/*
+ * Fields in PADS_REFCLK_CFG*. Those registers form an array of 16-bit
+ * entries, one entry per PCIe port. These field definitions and desired
+ * values aren't in the TRM, but do come from NVIDIA.
+ */
+#define PADS_REFCLK_CFG_TERM_SHIFT		2  /* 6:2 */
+#define PADS_REFCLK_CFG_E_TERM_SHIFT		7
+#define PADS_REFCLK_CFG_PREDI_SHIFT		8  /* 11:8 */
+#define PADS_REFCLK_CFG_DRVI_SHIFT		12 /* 15:12 */
+
+/* Default value provided by HW engineering is 0xfa5c */
+#define PADS_REFCLK_CFG_VALUE \
+	( \
+		(0x17 << PADS_REFCLK_CFG_TERM_SHIFT)   | \
+		(0    << PADS_REFCLK_CFG_E_TERM_SHIFT) | \
+		(0xa  << PADS_REFCLK_CFG_PREDI_SHIFT)  | \
+		(0xf  << PADS_REFCLK_CFG_DRVI_SHIFT)     \
+	)
+
 struct tegra_msi {
 	struct msi_chip chip;
 	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
@@ -814,11 +833,11 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
 	value |= PADS_PLL_CTL_RST_B4SM;
 	pads_writel(pcie, value, soc->pads_pll_ctl);
 
-	/*
-	 * Hack, set the clock voltage to the DEFAULT provided by hw folks.
-	 * This doesn't exist in the documentation.
-	 */
-	pads_writel(pcie, 0xfa5cfa5c, PADS_REFCLK_CFG0);
+	/* Configure the reference clock driver */
+	value = PADS_REFCLK_CFG_VALUE | (PADS_REFCLK_CFG_VALUE << 16);
+	pads_writel(pcie, value, PADS_REFCLK_CFG0);
+	if (soc->num_ports > 2)
+		pads_writel(pcie, PADS_REFCLK_CFG_VALUE, PADS_REFCLK_CFG1);
 
 	/* wait for the PLL to lock */
 	timeout = 300;
-- 
1.8.1.5
