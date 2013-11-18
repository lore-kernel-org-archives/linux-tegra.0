From: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] PCI: Disable Gen2 for Tegra20 and Tegra30
Date: Mon, 18 Nov 2013 14:55:06 -0800
Message-ID: <1384815306-3149-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra20 and Tegra30 do not support gen2 PCIe, so correct the
register setting to disable it.

Signed-off-by: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 0afbbbc..b8ba2f7 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -805,7 +805,7 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
 	afi_writel(pcie, value, AFI_PCIE_CONFIG);
 
 	value = afi_readl(pcie, AFI_FUSE);
-	value &= ~AFI_FUSE_PCIE_T0_GEN2_DIS;
+	value |= AFI_FUSE_PCIE_T0_GEN2_DIS;
 	afi_writel(pcie, value, AFI_FUSE);
 
 	/* initialize internal PHY, enable up to 16 PCIE lanes */
-- 
1.8.1.5
