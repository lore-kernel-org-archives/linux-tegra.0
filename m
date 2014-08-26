From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 4/6] PCI: tegra: Fix extended configuration space mapping
Date: Tue, 26 Aug 2014 17:11:36 +0200
Message-ID: <1409065898-26887-5-git-send-email-thierry.reding@gmail.com>
References: <1409065898-26887-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409065898-26887-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Peter Daifuku <pdaifuku-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The 16 chunks of 64 KiB that need to be stitched together to make up the
configuration space for one bus (1 MiB) are located 24 bits (== 16 MiB)
apart in physical address space. This is determined by the start of the
extended register field (bits 24-27) in the physical mapping.

Signed-off-by: Peter Daifuku <pdaifuku-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index bd53b123218b..8264bce77750 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -383,7 +383,7 @@ static struct tegra_pcie_bus *tegra_pcie_bus_alloc(struct tegra_pcie *pcie,
 	for (i = 0; i < 16; i++) {
 		unsigned long virt = (unsigned long)bus->area->addr +
 				     i * SZ_64K;
-		phys_addr_t phys = cs + i * SZ_1M + busnr * SZ_64K;
+		phys_addr_t phys = cs + i * SZ_16M + busnr * SZ_64K;
 
 		err = ioremap_page_range(virt, virt + SZ_64K, phys, prot);
 		if (err < 0) {
-- 
2.0.4
