From: Himanshu Jha <himanshujha199640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] PCI: tegra: Use PTR_ERR_OR_ZERO
Date: Tue, 29 Aug 2017 19:09:00 +0530
Message-ID: <1504013940-16304-1-git-send-email-himanshujha199640@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Himanshu Jha <himanshujha199640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: Himanshu Jha <himanshujha199640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 9c40da5..90cda5b 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -1156,10 +1156,7 @@ static int tegra_pcie_resets_get(struct tegra_pcie *pcie)
 		return PTR_ERR(pcie->afi_rst);
 
 	pcie->pcie_xrst = devm_reset_control_get_exclusive(dev, "pcie_x");
-	if (IS_ERR(pcie->pcie_xrst))
-		return PTR_ERR(pcie->pcie_xrst);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(pcie->pcie_xrst);
 }
 
 static int tegra_pcie_phys_get_legacy(struct tegra_pcie *pcie)
-- 
2.7.4
