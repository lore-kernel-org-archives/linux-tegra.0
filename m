From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] PCI: tegra: Clarify configuration space address computations
Date: Thu, 14 Dec 2017 14:45:42 +0100
Message-ID: <20171214134545.11143-2-thierry.reding@gmail.com>
References: <20171214134545.11143-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214134545.11143-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Saga <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra uses a non-compatible variant of ECAM where the extended register
field is separate from the register field. Clarify that the register
offset also factors into the computation of the configuration space
addresses.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index f6d0430e6704..8a07c6f9e1b0 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -364,11 +364,13 @@ static inline u32 pads_readl(struct tegra_pcie *pcie, unsigned long offset)
  *
  * Mapping the whole extended configuration space would require 256 MiB of
  * virtual address space, only a small part of which will actually be used.
- * To work around this, a 4K of region is used to generate required
- * configuration transaction with relevant B:D:F values. This is achieved by
- * dynamically programming base address and size of AFI_AXI_BAR used for
- * end point config space mapping to make sure that the address (access to
- * which generates correct config transaction) falls in this 4K region
+ *
+ * To work around this, a 4 KiB region is used to generate the required
+ * configuration transaction with relevant B:D:F and register offset values.
+ * This is achieved by dynamically programming base address and size of
+ * AFI_AXI_BAR used for end point config space mapping to make sure that the
+ * address (access to which generates correct config transaction) falls in
+ * this 4 KiB region.
  */
 static unsigned long tegra_pcie_conf_offset(unsigned char b, unsigned int devfn,
 					    int where)
-- 
2.15.1
