From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 05/19] PCI: designware: Use pci_is_root_bus() to check if bus is root bus
Date: Tue, 21 Jul 2020 20:25:00 -0600
Message-ID: <20200722022514.1283916-6-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200722022514.1283916-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use pci_is_root_bus() rather than tracking the root bus number to
determine if the bus is the root bus or not. This removes storing
duplicated data as well as the need for the host bridge driver to have
to care about the bus numbers in most cases.

Cc: Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>
Cc: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/pci/controller/dwc/pci-imx6.c          |  2 +-
 drivers/pci/controller/dwc/pci-keystone.c      |  4 ++--
 .../pci/controller/dwc/pcie-designware-host.c  | 18 +++++++-----------
 drivers/pci/controller/dwc/pcie-designware.h   |  1 -
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 8f08ae53f53e..9f1e4d9c008b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1269,7 +1269,7 @@ static void imx6_pcie_quirk(struct pci_dev *dev)
 	if (bus->dev.parent->parent->driver != &imx6_pcie_driver.driver)
 		return;
 
-	if (bus->number == pp->root_bus_nr) {
+	if (pci_is_root_bus(bus)) {
 		struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 		struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
 
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 790679fdfa48..fcc3586c345b 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -440,7 +440,7 @@ static int ks_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 
 	reg = CFG_BUS(bus->number) | CFG_DEVICE(PCI_SLOT(devfn)) |
 		CFG_FUNC(PCI_FUNC(devfn));
-	if (bus->parent->number != pp->root_bus_nr)
+	if (!pci_is_root_bus(bus->parent))
 		reg |= CFG_TYPE1;
 	ks_pcie_app_writel(ks_pcie, CFG_SETUP, reg);
 
@@ -457,7 +457,7 @@ static int ks_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 
 	reg = CFG_BUS(bus->number) | CFG_DEVICE(PCI_SLOT(devfn)) |
 		CFG_FUNC(PCI_FUNC(devfn));
-	if (bus->parent->number != pp->root_bus_nr)
+	if (!pci_is_root_bus(bus->parent))
 		reg |= CFG_TYPE1;
 	ks_pcie_app_writel(ks_pcie, CFG_SETUP, reg);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 4a16306cec25..9e8a9cfc6d3a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -473,10 +473,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		goto err_free_msi;
 	}
 
-	pp->root_bus_nr = pp->busn->start;
-
 	bridge->sysdata = pp;
-	bridge->busnr = pp->root_bus_nr;
+	bridge->busnr = pp->busn->start;
 	bridge->ops = &dw_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
@@ -528,7 +526,7 @@ static int dw_pcie_access_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 	busdev = PCIE_ATU_BUS(bus->number) | PCIE_ATU_DEV(PCI_SLOT(devfn)) |
 		 PCIE_ATU_FUNC(PCI_FUNC(devfn));
 
-	if (bus->parent->number == pp->root_bus_nr) {
+	if (pci_is_root_bus(bus->parent)) {
 		type = PCIE_ATU_TYPE_CFG0;
 		cpu_addr = pp->cfg0_base;
 		cfg_size = pp->cfg0_size;
@@ -584,13 +582,11 @@ static int dw_pcie_valid_device(struct pcie_port *pp, struct pci_bus *bus,
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	/* If there is no link, then there is no device */
-	if (bus->number != pp->root_bus_nr) {
+	if (!pci_is_root_bus(bus)) {
 		if (!dw_pcie_link_up(pci))
 			return 0;
-	}
-
-	/* Access only one slot on each root port */
-	if (bus->number == pp->root_bus_nr && dev > 0)
+	} else if (dev > 0)
+		/* Access only one slot on each root port */
 		return 0;
 
 	return 1;
@@ -606,7 +602,7 @@ static int dw_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-	if (bus->number == pp->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return dw_pcie_rd_own_conf(pp, where, size, val);
 
 	return dw_pcie_rd_other_conf(pp, bus, devfn, where, size, val);
@@ -620,7 +616,7 @@ static int dw_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	if (!dw_pcie_valid_device(pp, bus, PCI_SLOT(devfn)))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	if (bus->number == pp->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return dw_pcie_wr_own_conf(pp, where, size, val);
 
 	return dw_pcie_wr_other_conf(pp, bus, devfn, where, size, val);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 656e00f8fbeb..fd2146298b58 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -173,7 +173,6 @@ struct dw_pcie_host_ops {
 };
 
 struct pcie_port {
-	u8			root_bus_nr;
 	u64			cfg0_base;
 	void __iomem		*va_cfg0_base;
 	u32			cfg0_size;
-- 
2.25.1
