From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V8 3/4] PCI: tegra: Broadcast PME_Turn_Off message before link goes to L2
Date: Tue, 13 Feb 2018 20:54:09 +0530
Message-ID: <1518535450-24400-4-git-send-email-mmaddireddy@nvidia.com>
References: <1518535450-24400-1-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518535450-24400-1-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, cyndis-/1wQRMveznE@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Per PCIe r3.0, sec 5.3.3.2.1, PCIe root port shoould broadcast PME_Turn_Off
message before PCIe link goes to L2. PME_Turn_Off broadcast mechanism is
implemented in AFI module. Each Tegra PCIe root port has its own
PME_Turn_Off and PME_TO_Ack bitmap in AFI_PME register, program this
register to broadcast PME_Turn_Off message.

Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* no change in this patch
V3:
* add PME bitmap in soc data instead of using compatible string
* replace while loop with readl_poll_timeout() for polling
* commit log correction
V4:
* no change in this patch
V5:
* Rebased on linux-next
V6:
* no change in this patch
V7:
* Per port soc data is added for pme bits
* list_for_each_entry_safe is changed to list_for_each_entry for pme turnoff
V8:
* Rebased on top of latest patch-2

 drivers/pci/host/pci-tegra.c | 66 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 17ccb5e3ba04..60b1d5e1cfa4 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -31,6 +31,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -153,6 +154,8 @@
 #define  AFI_INTR_EN_FPCI_TIMEOUT	(1 << 7)
 #define  AFI_INTR_EN_PRSNT_SENSE	(1 << 8)
 
+#define AFI_PCIE_PME		0xf0
+
 #define AFI_PCIE_CONFIG					0x0f8
 #define  AFI_PCIE_CONFIG_PCIE_DISABLE(x)		(1 << ((x) + 1))
 #define  AFI_PCIE_CONFIG_PCIE_DISABLE_ALL		0xe
@@ -233,6 +236,8 @@
 #define PADS_REFCLK_CFG_PREDI_SHIFT		8  /* 11:8 */
 #define PADS_REFCLK_CFG_DRVI_SHIFT		12 /* 15:12 */
 
+#define PME_ACK_TIMEOUT 10000
+
 struct tegra_msi {
 	struct msi_controller chip;
 	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
@@ -244,8 +249,16 @@ struct tegra_msi {
 };
 
 /* used to differentiate between Tegra SoC generations */
+struct tegra_pcie_port_soc {
+	struct {
+		u8 turnoff_bit;
+		u8 ack_bit;
+	} pme;
+};
+
 struct tegra_pcie_soc {
 	unsigned int num_ports;
+	const struct tegra_pcie_port_soc *ports;
 	unsigned int msi_base_shift;
 	u32 pads_pll_ctl;
 	u32 tx_ref_sel;
@@ -1358,6 +1371,32 @@ static int tegra_pcie_put_resources(struct tegra_pcie *pcie)
 	return 0;
 }
 
+static void tegra_pcie_pme_turnoff(struct tegra_pcie_port *port)
+{
+	struct tegra_pcie *pcie = port->pcie;
+	const struct tegra_pcie_soc *soc = pcie->soc;
+	int err;
+	u32 val;
+	u8 ack_bit;
+
+	val = afi_readl(pcie, AFI_PCIE_PME);
+	val |= (0x1 << soc->ports[port->index].pme.turnoff_bit);
+	afi_writel(pcie, val, AFI_PCIE_PME);
+
+	ack_bit = soc->ports[port->index].pme.ack_bit;
+	err = readl_poll_timeout(pcie->afi + AFI_PCIE_PME, val,
+				 val & (0x1 << ack_bit), 1, PME_ACK_TIMEOUT);
+	if (err)
+		dev_err(pcie->dev, "PME Ack is not received on port: %d\n",
+			port->index);
+
+	usleep_range(10000, 11000);
+
+	val = afi_readl(pcie, AFI_PCIE_PME);
+	val &= ~(0x1 << soc->ports[port->index].pme.turnoff_bit);
+	afi_writel(pcie, val, AFI_PCIE_PME);
+}
+
 static int tegra_msi_alloc(struct tegra_msi *chip)
 {
 	int msi;
@@ -2103,8 +2142,14 @@ static void tegra_pcie_disable_ports(struct tegra_pcie *pcie)
 	}
 }
 
+static const struct tegra_pcie_port_soc tegra20_pcie_ports[] = {
+	{ .pme.turnoff_bit = 0, .pme.ack_bit =  5 },
+	{ .pme.turnoff_bit = 8, .pme.ack_bit = 10 },
+};
+
 static const struct tegra_pcie_soc tegra20_pcie = {
 	.num_ports = 2,
+	.ports = tegra20_pcie_ports,
 	.msi_base_shift = 0,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA20,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_DIV10,
@@ -2118,8 +2163,15 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.program_uphy = true,
 };
 
+static const struct tegra_pcie_port_soc tegra30_pcie_ports[] = {
+	{ .pme.turnoff_bit =  0, .pme.ack_bit =  5 },
+	{ .pme.turnoff_bit =  8, .pme.ack_bit = 10 },
+	{ .pme.turnoff_bit = 16, .pme.ack_bit = 18 },
+};
+
 static const struct tegra_pcie_soc tegra30_pcie = {
 	.num_ports = 3,
+	.ports = tegra30_pcie_ports,
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
@@ -2136,6 +2188,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 
 static const struct tegra_pcie_soc tegra124_pcie = {
 	.num_ports = 2,
+	.ports = tegra20_pcie_ports,
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
@@ -2151,6 +2204,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 
 static const struct tegra_pcie_soc tegra210_pcie = {
 	.num_ports = 2,
+	.ports = tegra20_pcie_ports,
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
@@ -2164,8 +2218,15 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.program_uphy = true,
 };
 
+static const struct tegra_pcie_port_soc tegra186_pcie_ports[] = {
+	{ .pme.turnoff_bit =  0, .pme.ack_bit =  5 },
+	{ .pme.turnoff_bit =  8, .pme.ack_bit = 10 },
+	{ .pme.turnoff_bit = 12, .pme.ack_bit = 14 },
+};
+
 static const struct tegra_pcie_soc tegra186_pcie = {
 	.num_ports = 3,
+	.ports = tegra186_pcie_ports,
 	.msi_base_shift = 8,
 	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
 	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
@@ -2399,12 +2460,17 @@ static int tegra_pcie_remove(struct platform_device *pdev)
 {
 	struct tegra_pcie *pcie = platform_get_drvdata(pdev);
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	struct tegra_pcie_port *port;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		tegra_pcie_debugfs_exit(pcie);
 
 	pci_stop_root_bus(host->bus);
 	pci_remove_root_bus(host->bus);
+
+	list_for_each_entry(port, &pcie->ports, list)
+		tegra_pcie_pme_turnoff(port);
+
 	tegra_pcie_disable_ports(pcie);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI))
-- 
2.1.4
