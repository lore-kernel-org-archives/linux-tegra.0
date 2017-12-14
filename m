From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] PCI: tegra: Reorder parameters in offset computations
Date: Thu, 14 Dec 2017 14:45:43 +0100
Message-ID: <20171214134545.11143-3-thierry.reding@gmail.com>
References: <20171214134545.11143-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214134545.11143-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Saga <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The current computation of the configuration space offset is slightly
difficult to read because the fields aren't naturally ordered. This is
no doubt done to put extended register and register fields together,
but that's confusing because they are separate in the address mapping
given in the comment above the computations.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 8a07c6f9e1b0..26b734c84850 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -372,11 +372,11 @@ static inline u32 pads_readl(struct tegra_pcie *pcie, unsigned long offset)
  * address (access to which generates correct config transaction) falls in
  * this 4 KiB region.
  */
-static unsigned long tegra_pcie_conf_offset(unsigned char b, unsigned int devfn,
-					    int where)
+static unsigned int tegra_pcie_conf_offset(u8 bus, unsigned int devfn,
+					   unsigned int where)
 {
-	return (b << 16) | (PCI_SLOT(devfn) << 11) | (PCI_FUNC(devfn) << 8) |
-	       (((where & 0xf00) >> 8) << 24) | (where & 0xff);
+	return ((where & 0xf00) << 16) | (bus << 16) | (PCI_SLOT(devfn) << 11) |
+	       (PCI_FUNC(devfn) << 8) | (where & 0xff);
 }
 
 static int tegra_pcie_add_bus(struct pci_bus *bus)
-- 
2.15.1
