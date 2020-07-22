From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 13/19] PCI: cadence: Remove private bus number and range storage
Date: Tue, 21 Jul 2020 20:25:08 -0600
Message-ID: <20200722022514.1283916-14-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200722022514.1283916-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There's no need to store the bus number or range resource as the driver
only needs the bus number which is already in the pci_host_bridge.

For endpoint mode, the bus number is always 0.

Cc: Tom Joseph <tjoseph-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../pci/controller/cadence/pcie-cadence-ep.c  |  6 ++---
 .../controller/cadence/pcie-cadence-host.c    | 27 +++++++++----------
 drivers/pci/controller/cadence/pcie-cadence.c |  9 ++++---
 drivers/pci/controller/cadence/pcie-cadence.h |  8 +++---
 4 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 1c15c8352125..317262bdb1ee 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -156,7 +156,7 @@ static int cdns_pcie_ep_map_addr(struct pci_epc *epc, u8 fn, phys_addr_t addr,
 		return -EINVAL;
 	}
 
-	cdns_pcie_set_outbound_region(pcie, fn, r, false, addr, pci_addr, size);
+	cdns_pcie_set_outbound_region(pcie, 0, fn, r, false, addr, pci_addr, size);
 
 	set_bit(r, &ep->ob_region_map);
 	ep->ob_addr[r] = addr;
@@ -239,7 +239,7 @@ static void cdns_pcie_ep_assert_intx(struct cdns_pcie_ep *ep, u8 fn,
 	if (unlikely(ep->irq_pci_addr != CDNS_PCIE_EP_IRQ_PCI_ADDR_LEGACY ||
 		     ep->irq_pci_fn != fn)) {
 		/* First region was reserved for IRQ writes. */
-		cdns_pcie_set_outbound_region_for_normal_msg(pcie, fn, 0,
+		cdns_pcie_set_outbound_region_for_normal_msg(pcie, 0, fn, 0,
 							     ep->irq_phys_addr);
 		ep->irq_pci_addr = CDNS_PCIE_EP_IRQ_PCI_ADDR_LEGACY;
 		ep->irq_pci_fn = fn;
@@ -318,7 +318,7 @@ static int cdns_pcie_ep_send_msi_irq(struct cdns_pcie_ep *ep, u8 fn,
 	if (unlikely(ep->irq_pci_addr != (pci_addr & ~pci_addr_mask) ||
 		     ep->irq_pci_fn != fn)) {
 		/* First region was reserved for IRQ writes. */
-		cdns_pcie_set_outbound_region(pcie, fn, 0,
+		cdns_pcie_set_outbound_region(pcie, 0, fn, 0,
 					      false,
 					      ep->irq_phys_addr,
 					      pci_addr & ~pci_addr_mask,
diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index f485c0405fb5..6b5d20f026de 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -20,7 +20,7 @@ static void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 	unsigned int busn = bus->number;
 	u32 addr0, desc0;
 
-	if (busn == rc->bus_range->start) {
+	if (pci_is_root_bus(bus)) {
 		/*
 		 * Only the root port (devfn == 0) is connected to this bus.
 		 * All other PCI devices are behind some bridge hence on another
@@ -50,7 +50,7 @@ static void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
 	 * The bus number was already set once for all in desc1 by
 	 * cdns_pcie_host_init_address_translation().
 	 */
-	if (busn == rc->bus_range->start + 1)
+	if (busn == bridge->busnr + 1)
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_TYPE_CONF_TYPE0;
 	else
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_TYPE_CONF_TYPE1;
@@ -106,12 +106,15 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	struct cdns_pcie *pcie = &rc->pcie;
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
 	struct resource *mem_res = pcie->mem_res;
-	struct resource *bus_range = rc->bus_range;
 	struct resource *cfg_res = rc->cfg_res;
 	struct resource_entry *entry;
 	u32 addr0, addr1, desc1;
 	u64 cpu_addr;
-	int r;
+	int r, busnr = 0;
+
+	entry = resource_list_first_type(&bridge->windows, IORESOURCE_BUS);
+	if (entry)
+		busnr = entry->res->start;
 
 	/*
 	 * Reserve region 0 for PCI configure space accesses:
@@ -119,7 +122,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	 * cdns_pci_map_bus(), other region registers are set here once for all.
 	 */
 	addr1 = 0; /* Should be programmed to zero. */
-	desc1 = CDNS_PCIE_AT_OB_REGION_DESC1_BUS(bus_range->start);
+	desc1 = CDNS_PCIE_AT_OB_REGION_DESC1_BUS(busnr);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_PCI_ADDR1(0), addr1);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(0), desc1);
 
@@ -136,12 +139,14 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 		u64 pci_addr = res->start - entry->offset;
 
 		if (resource_type(res) == IORESOURCE_IO)
-			cdns_pcie_set_outbound_region(pcie, 0, r, true,
+			cdns_pcie_set_outbound_region(pcie, busnr, 0, r,
+						      true,
 						      pci_pio_to_address(res->start),
 						      pci_addr,
 						      resource_size(res));
 		else
-			cdns_pcie_set_outbound_region(pcie, 0, r, false,
+			cdns_pcie_set_outbound_region(pcie, busnr, 0, r,
+						      false,
 						      res->start,
 						      pci_addr,
 						      resource_size(res));
@@ -167,18 +172,13 @@ static int cdns_pcie_host_init(struct device *dev,
 			       struct cdns_pcie_rc *rc)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
-	struct resource *bus_range = NULL;
 	int err;
 
 	/* Parse our PCI ranges and request their resources */
-	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL,
-					      &bus_range);
+	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL, NULL);
 	if (err)
 		return err;
 
-	rc->bus_range = bus_range;
-	rc->pcie.bus = bus_range->start;
-
 	err = cdns_pcie_host_init_root_port(rc);
 	if (err)
 		return err;
@@ -239,7 +239,6 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	if (ret)
 		goto err_init;
 
-	bridge->busnr = pcie->bus;
 	bridge->ops = &cdns_pcie_host_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index cd795f6fc1e2..fdd13765ee75 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -7,7 +7,7 @@
 
 #include "pcie-cadence.h"
 
-void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 				   u32 r, bool is_io,
 				   u64 cpu_addr, u64 pci_addr, size_t size)
 {
@@ -60,7 +60,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
 		/* The device and function numbers are always 0. */
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_HARDCODED_RID |
 			 CDNS_PCIE_AT_OB_REGION_DESC0_DEVFN(0);
-		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(pcie->bus);
+		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(busnr);
 	} else {
 		/*
 		 * Use captured values for bus and device numbers but still
@@ -82,7 +82,8 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_CPU_ADDR1(r), addr1);
 }
 
-void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
+						  u8 busnr, u8 fn,
 						  u32 r, u64 cpu_addr)
 {
 	u32 addr0, addr1, desc0, desc1;
@@ -94,7 +95,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie, u8 fn,
 	if (pcie->is_rc) {
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_HARDCODED_RID |
 			 CDNS_PCIE_AT_OB_REGION_DESC0_DEVFN(0);
-		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(pcie->bus);
+		desc1 |= CDNS_PCIE_AT_OB_REGION_DESC1_BUS(busnr);
 	} else {
 		desc0 |= CDNS_PCIE_AT_OB_REGION_DESC0_DEVFN(fn);
 	}
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index df14ad002fe9..02803f262f0c 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -235,7 +235,6 @@ struct cdns_pcie {
 	struct resource		*mem_res;
 	struct device		*dev;
 	bool			is_rc;
-	u8			bus;
 	int			phy_count;
 	struct phy		**phy;
 	struct device_link	**link;
@@ -248,7 +247,6 @@ struct cdns_pcie {
  * @dev: pointer to PCIe device
  * @cfg_res: start/end offsets in the physical system memory to map PCI
  *           configuration space accesses
- * @bus_range: first/last buses behind the PCIe host controller
  * @cfg_base: IO mapped window to access the PCI configuration space of a
  *            single function at a time
  * @no_bar_nbits: Number of bits to keep for inbound (PCIe -> CPU) address
@@ -259,7 +257,6 @@ struct cdns_pcie {
 struct cdns_pcie_rc {
 	struct cdns_pcie	pcie;
 	struct resource		*cfg_res;
-	struct resource		*bus_range;
 	void __iomem		*cfg_base;
 	u32			no_bar_nbits;
 	u32			vendor_id;
@@ -381,11 +378,12 @@ static inline int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
 	return 0;
 }
 #endif
-void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 				   u32 r, bool is_io,
 				   u64 cpu_addr, u64 pci_addr, size_t size);
 
-void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie, u8 fn,
+void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
+						  u8 busnr, u8 fn,
 						  u32 r, u64 cpu_addr);
 
 void cdns_pcie_reset_outbound_region(struct cdns_pcie *pcie, u32 r);
-- 
2.25.1
