From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] PCI: tegra: Remove misleading PHYS_OFFSET
Date: Tue,  9 Feb 2016 15:52:33 +0100
Message-ID: <1455029553-9460-3-git-send-email-thierry.reding@gmail.com>
References: <1455029553-9460-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455029553-9460-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

BARs are disabled when the size register is 0, so it's misleading to
write a base address into the start register.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index f6fc54b48606..9d5817546425 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -774,7 +774,7 @@ static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
 	afi_writel(pcie, 0, AFI_FPCI_BAR5);
 
 	/* map all upstream transactions as uncached */
-	afi_writel(pcie, PHYS_OFFSET, AFI_CACHE_BAR0_ST);
+	afi_writel(pcie, 0, AFI_CACHE_BAR0_ST);
 	afi_writel(pcie, 0, AFI_CACHE_BAR0_SZ);
 	afi_writel(pcie, 0, AFI_CACHE_BAR1_ST);
 	afi_writel(pcie, 0, AFI_CACHE_BAR1_SZ);
-- 
2.7.1
