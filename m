From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] PCI: tegra: Do not allocate MSI target memory
Date: Thu,  4 May 2017 22:10:32 +0200
Message-ID: <20170504201032.32633-2-thierry.reding@gmail.com>
References: <20170504201032.32633-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504201032.32633-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The PCI host bridge found on Tegra SoCs doesn't require the MSI target
address to be backed by physical system memory. Writes are intercepted
within the controller and never make it to the memory pointed to.

Since no actual system memory is required, remove the allocation of a
single page and hardcode the MSI target address with a special address
that maps to the last 4 KiB page within the range that is reserved for
system memory and memory-mapped I/O in the FPCI address map.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index e69f828a9ab2..4f795a5dcbed 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -233,7 +233,6 @@ struct tegra_msi {
 	struct msi_controller chip;
 	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
 	struct irq_domain *domain;
-	unsigned long pages;
 	struct mutex lock;
 	u64 phys;
 	int irq;
@@ -1550,9 +1549,22 @@ static int tegra_pcie_enable_msi(struct tegra_pcie *pcie)
 		goto err;
 	}
 
-	/* setup AFI/FPCI range */
-	msi->pages = __get_free_pages(GFP_KERNEL, 0);
-	msi->phys = virt_to_phys((void *)msi->pages);
+	/*
+	 * The PCI host bridge on Tegra contains some logic that intercepts
+	 * MSI writes, which means that the MSI target address doesn't have
+	 * to point to actual physical memory. Rather than allocating one 4
+	 * KiB page of system memory that's never used, we can simply pick
+	 * an arbitrary address within an area reserved for system memory
+	 * in the FPCI address map.
+	 *
+	 * However, in order to avoid confusion, we pick an address that
+	 * doesn't map to physical memory. The FPCI address map reserves a
+	 * 1012 GiB region for system memory and memory-mapped I/O. Since
+	 * none of the Tegra SoCs that contain this PCI host bridge can
+	 * address more than 16 GiB of system memory, the last 4 KiB of
+	 * these 1012 GiB is a good candidate.
+	 */
+	msi->phys = 0xfcfffff000;
 
 	afi_writel(pcie, msi->phys >> soc->msi_base_shift, AFI_MSI_FPCI_BAR_ST);
 	afi_writel(pcie, msi->phys, AFI_MSI_AXI_BAR_ST);
@@ -1604,8 +1616,6 @@ static int tegra_pcie_disable_msi(struct tegra_pcie *pcie)
 	afi_writel(pcie, 0, AFI_MSI_EN_VEC6);
 	afi_writel(pcie, 0, AFI_MSI_EN_VEC7);
 
-	free_pages(msi->pages, 0);
-
 	if (msi->irq > 0)
 		free_irq(msi->irq, pcie);
 
-- 
2.12.0
