From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] PCI: tegra: Consolidate I/O register variables
Date: Thu, 14 Dec 2017 14:45:44 +0100
Message-ID: <20171214134545.11143-4-thierry.reding@gmail.com>
References: <20171214134545.11143-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214134545.11143-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Saga <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Move variables that store I/O register region mappings together for
slightly better readability.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 26b734c84850..7f8a81e17db6 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -270,13 +270,12 @@ struct tegra_pcie {
 
 	void __iomem *pads;
 	void __iomem *afi;
+	void __iomem *cfg;
 	int irq;
 
 	struct list_head buses;
 	struct resource *cs;
 
-	void __iomem *cfg_va_base;
-
 	struct resource io;
 	struct resource pio;
 	struct resource mem;
@@ -434,7 +433,7 @@ static void __iomem *tegra_pcie_map_bus(struct pci_bus *bus,
 		}
 	} else {
 		offset = tegra_pcie_conf_offset(bus->number, devfn, where);
-		addr = pcie->cfg_va_base + (offset & (SZ_4K - 1));
+		addr = pcie->cfg + (offset & (SZ_4K - 1));
 		val = offset & ~(SZ_4K - 1);
 		afi_writel(pcie, pcie->cs->start - val, AFI_AXI_BAR0_START);
 		afi_writel(pcie, (val + SZ_4K) >> 12, AFI_AXI_BAR0_SZ);
@@ -1305,8 +1304,8 @@ static int tegra_pcie_get_resources(struct tegra_pcie *pcie)
 		goto poweroff;
 	}
 
-	pcie->cfg_va_base = devm_ioremap(dev, pcie->cs->start, SZ_4K);
-	if (!pcie->cfg_va_base) {
+	pcie->cfg = devm_ioremap(dev, pcie->cs.start, SZ_4K);
+	if (!pcie->cfg) {
 		dev_err(pcie->dev, "failed to ioremap config space\n");
 		err = -EADDRNOTAVAIL;
 		goto poweroff;
-- 
2.15.1
