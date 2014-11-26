From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] PCI: tegra: Use physical range for I/O mapping
Date: Wed, 26 Nov 2014 17:21:37 +0100
Message-ID: <1417018897-3965-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 0b0b0893d49b ("of/pci: Fix the conversion of IO ranges into IO
resources") changed how I/O resources are parsed from DT. Rather than
containing the physical address of the I/O region, the addresses will
now be in I/O address space.

On Tegra the union of all ranges is used to expose a top-level memory-
mapped resource for the PCI host bridge. This helps to make /proc/iomem
more readable.

Combining both of the above, the union would now include the I/O space
region. This causes a regression on Tegra20, where the physical base
address of the PCIe controller (and therefore of the union) is located
at physical address 0x80000000. Since I/O space starts at 0, the union
will now include all of system RAM which starts at 0x00000000.

This commit fixes this by keeping two copies of the I/O range: one that
represents the range in the CPU's physical address space, the other for
the range in the I/O address space. This allows the translation setup
within the driver to reuse the physical addresses. The code registering
the I/O region with the PCI core uses both ranges to establish the
mapping.

While at it, make sure to register the I/O region along with the rest of
the system resources.

Fixes: 0b0b0893d49b ("of/pci: Fix the conversion of IO ranges into IO resources")
Reported-by: Mark Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 3d43874319be..9c75bd998a38 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -276,6 +276,7 @@ struct tegra_pcie {
 
 	struct resource all;
 	struct resource io;
+	struct resource pio;
 	struct resource mem;
 	struct resource prefetch;
 	struct resource busn;
@@ -658,7 +659,14 @@ static int tegra_pcie_setup(int nr, struct pci_sys_data *sys)
 {
 	struct tegra_pcie *pcie = sys_to_pcie(sys);
 	int err;
-	phys_addr_t io_start;
+
+	err = devm_request_resource(pcie->dev, &pcie->all, &pcie->io);
+	if (err < 0)
+		return err;
+
+	err = devm_request_resource(pcie->dev, &ioport_resource, &pcie->pio);
+	if (err < 0)
+		return err;
 
 	err = devm_request_resource(pcie->dev, &pcie->all, &pcie->mem);
 	if (err < 0)
@@ -668,14 +676,13 @@ static int tegra_pcie_setup(int nr, struct pci_sys_data *sys)
 	if (err)
 		return err;
 
-	io_start = pci_pio_to_address(pcie->io.start);
-
+	pci_add_resource_offset(&sys->resources, &pcie->pio, sys->io_offset);
 	pci_add_resource_offset(&sys->resources, &pcie->mem, sys->mem_offset);
 	pci_add_resource_offset(&sys->resources, &pcie->prefetch,
 				sys->mem_offset);
 	pci_add_resource(&sys->resources, &pcie->busn);
 
-	pci_ioremap_io(nr * SZ_64K, io_start);
+	pci_ioremap_io(pcie->pio.start, pcie->io.start);
 
 	return 1;
 }
@@ -786,7 +793,6 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
 static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
 {
 	u32 fpci_bar, size, axi_address;
-	phys_addr_t io_start = pci_pio_to_address(pcie->io.start);
 
 	/* Bar 0: type 1 extended configuration space */
 	fpci_bar = 0xfe100000;
@@ -799,7 +805,7 @@ static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
 	/* Bar 1: downstream IO bar */
 	fpci_bar = 0xfdfc0000;
 	size = resource_size(&pcie->io);
-	axi_address = io_start;
+	axi_address = pcie->io.start;
 	afi_writel(pcie, axi_address, AFI_AXI_BAR1_START);
 	afi_writel(pcie, size >> 12, AFI_AXI_BAR1_SZ);
 	afi_writel(pcie, fpci_bar, AFI_FPCI_BAR1);
@@ -1690,8 +1696,23 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 
 		switch (res.flags & IORESOURCE_TYPE_BITS) {
 		case IORESOURCE_IO:
-			memcpy(&pcie->io, &res, sizeof(res));
-			pcie->io.name = np->full_name;
+			memcpy(&pcie->pio, &res, sizeof(res));
+			pcie->pio.name = np->full_name;
+
+			/*
+			 * The Tegra PCIe host bridge uses this to program the
+			 * mapping of the I/O space to the physical address,
+			 * so we override the .start and .end fields here that
+			 * of_pci_range_to_resource() converted to I/O space.
+			 * We also set the IORESOURCE_MEM type to clarify that
+			 * the resource is in the physical memory space.
+			 */
+			pcie->io.start = range.cpu_addr;
+			pcie->io.end = range.cpu_addr + range.size - 1;
+			pcie->io.flags = IORESOURCE_MEM;
+			pcie->io.name = "I/O";
+
+			memcpy(&res, &pcie->io, sizeof(res));
 			break;
 
 		case IORESOURCE_MEM:
-- 
2.1.3
