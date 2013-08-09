From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 07/14] PCI: tegra: set up PADS_REFCLK_CFG1
Date: Fri,  9 Aug 2013 16:49:25 +0200
Message-ID: <1376059772-16669-8-git-send-email-treding@nvidia.com>
References: <1376059772-16669-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376059772-16669-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The registers PADS_REFCLK_CFG are an array of 16-bit data, one entry per
PCIe root port. For Tegra30, we therefore need to write a 3rd entry in
this array. Doing so mays the mini-PCIe slot on Beaver operate correctly.

While we're at it, add some #defines to partially document the fields
within these 16-bit values.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 75607c7..ad95c40 100644
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
@@ -808,11 +827,11 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
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
1.8.3.4
