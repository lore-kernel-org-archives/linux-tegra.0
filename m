From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] PCI: tegra: Use different MSI target address for Tegra20
Date: Fri, 22 Sep 2017 23:17:40 -0700
Message-ID: <20170923061740.6012-1-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Tegra20 PCIe controller has a different address range for MSI, so
select a different target address.

Fixes: d7bd554f27c9 ("PCI: tegra: Do not allocate MSI target memory")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index e8e1ddbaabc9..5b02ea59524b 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -1563,8 +1563,18 @@ static int tegra_pcie_enable_msi(struct tegra_pcie *pcie)
 	 * none of the Tegra SoCs that contain this PCI host bridge can
 	 * address more than 16 GiB of system memory, the last 4 KiB of
 	 * these 1012 GiB is a good candidate.
+	 *
+	 * Unfortunately, Tegra20 is slightly different in that the physical
+	 * address for this MSI region is limited to the lower 32 bits of the
+	 * address map, so the address that we pick is going to have to be
+	 * located somewhere within the region addressable by the CPU and
+	 * on-SoC controllers. To be on the safe side, we select an address
+	 * from a region that is marked unused (0xf0010000 - 0xfffeffff).
 	 */
-	msi->phys = 0xfcfffff000;
+	if (soc->msi_base_shift > 0)
+		msi->phys = 0xfcfffff000;
+	else
+		msi->phys = 0x00f0010000;
 
 	afi_writel(pcie, msi->phys >> soc->msi_base_shift, AFI_MSI_FPCI_BAR_ST);
 	afi_writel(pcie, msi->phys, AFI_MSI_AXI_BAR_ST);
-- 
2.14.1
