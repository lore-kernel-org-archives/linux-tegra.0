From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Revert "PCI: tegra: Do not allocate MSI target memory"
Date: Mon,  9 Oct 2017 12:29:35 +0200
Message-ID: <20171009102935.14515-1-thierry.reding@gmail.com>
References: <20171002201924.GC5407@bhelgaas-glaptop.roam.corp.google.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171002201924.GC5407-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Maciej Nowak <tmn505-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This reverts commit d7bd554f27c942e6b8b54100b4044f9be1038edf.

It turns out that Tegra20 has a bug in the implementation of the MSI
target address register (which is worked around by the existence of the
struct tegra_pcie_soc.msi_base_shift parameter) that restricts the MSI
target memory to the lower 32 bits of physical memory on that particular
generation. The offending patch causes a regression on TrimSlice, which
is a Tegra20-based device and has a PCI network interface card.

An initial, simpler fix was to change the MSI target address for Tegra20
only, but it was pointed out that the offending commit also prevents the
use of 32-bit only MSI capable devices, even on later chips. Technically
this was never guaranteed to work with the prior code in the first place
because the allocated page could have resided beyond the 4 GiB boundary,
but it is still possible that this could've introduced a regression.

The proper fix that was settled on is to select a fixed address within
the lowest 32 bits of physical address space that is otherwise unused,
but testing of that patch has provided mixed results that are not fully
understood yet.

Given all of the above and the relative urgency to get this fixed in
v4.13, revert the offending commit until a universal fix is found.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 4.13.x
Reported-by: Tomasz Maciej Nowak <tmn505-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reported-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 9c40da54f88a..1987fec1f126 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -233,6 +233,7 @@ struct tegra_msi {
 	struct msi_controller chip;
 	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
 	struct irq_domain *domain;
+	unsigned long pages;
 	struct mutex lock;
 	u64 phys;
 	int irq;
@@ -1529,22 +1530,9 @@ static int tegra_pcie_enable_msi(struct tegra_pcie *pcie)
 		goto err;
 	}
 
-	/*
-	 * The PCI host bridge on Tegra contains some logic that intercepts
-	 * MSI writes, which means that the MSI target address doesn't have
-	 * to point to actual physical memory. Rather than allocating one 4
-	 * KiB page of system memory that's never used, we can simply pick
-	 * an arbitrary address within an area reserved for system memory
-	 * in the FPCI address map.
-	 *
-	 * However, in order to avoid confusion, we pick an address that
-	 * doesn't map to physical memory. The FPCI address map reserves a
-	 * 1012 GiB region for system memory and memory-mapped I/O. Since
-	 * none of the Tegra SoCs that contain this PCI host bridge can
-	 * address more than 16 GiB of system memory, the last 4 KiB of
-	 * these 1012 GiB is a good candidate.
-	 */
-	msi->phys = 0xfcfffff000;
+	/* setup AFI/FPCI range */
+	msi->pages = __get_free_pages(GFP_KERNEL, 0);
+	msi->phys = virt_to_phys((void *)msi->pages);
 
 	afi_writel(pcie, msi->phys >> soc->msi_base_shift, AFI_MSI_FPCI_BAR_ST);
 	afi_writel(pcie, msi->phys, AFI_MSI_AXI_BAR_ST);
@@ -1596,6 +1584,8 @@ static int tegra_pcie_disable_msi(struct tegra_pcie *pcie)
 	afi_writel(pcie, 0, AFI_MSI_EN_VEC6);
 	afi_writel(pcie, 0, AFI_MSI_EN_VEC7);
 
+	free_pages(msi->pages, 0);
+
 	if (msi->irq > 0)
 		free_irq(msi->irq, pcie);
 
-- 
2.14.1
