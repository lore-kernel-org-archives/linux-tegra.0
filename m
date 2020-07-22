From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 07/19] PCI: xilinx-nwl: Use pci_is_root_bus() to check if bus is root bus
Date: Tue, 21 Jul 2020 20:25:02 -0600
Message-ID: <20200722022514.1283916-8-robh@kernel.org>
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

There was also a bug that the pci_host_bridge.busnr is set from
root_busno, but root_busno is never set which means the root bus number
is always 0 even if the DT said something else.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/pci/controller/pcie-xilinx-nwl.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 3c747aa4b6d1..566165c18fad 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -166,7 +166,6 @@ struct nwl_pcie {
 	int irq_misc;
 	u32 ecam_value;
 	u8 last_busno;
-	u8 root_busno;
 	struct nwl_msi msi;
 	struct irq_domain *legacy_irq_domain;
 	raw_spinlock_t leg_mask_lock;
@@ -217,13 +216,11 @@ static bool nwl_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
 	struct nwl_pcie *pcie = bus->sysdata;
 
 	/* Check link before accessing downstream ports */
-	if (bus->number != pcie->root_busno) {
+	if (!pci_is_root_bus(bus)) {
 		if (!nwl_pcie_link_up(pcie))
 			return false;
-	}
-
-	/* Only one device down on each root port */
-	if (bus->number == pcie->root_busno && devfn > 0)
+	} else if (devfn > 0)
+		/* Only one device down on each root port */
 		return false;
 
 	return true;
@@ -855,7 +852,6 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = pcie;
-	bridge->busnr = pcie->root_busno;
 	bridge->ops = &nwl_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
-- 
2.25.1
