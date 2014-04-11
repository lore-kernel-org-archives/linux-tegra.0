From: Duan Jiong <duanj.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ARM: tegra: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Fri, 11 Apr 2014 15:56:40 +0800
Message-ID: <1397203000-16586-1-git-send-email-duanj.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Duan Jiong <duanj.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch fixes coccinelle error regarding usage of IS_ERR and
PTR_ERR instead of PTR_ERR_OR_ZERO.

Signed-off-by: Duan Jiong <duanj.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 330f7e3..e06ffa4 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -1024,10 +1024,7 @@ static int tegra_pcie_resets_get(struct tegra_pcie *pcie)
 		return PTR_ERR(pcie->afi_rst);
 
 	pcie->pcie_xrst = devm_reset_control_get(pcie->dev, "pcie_x");
-	if (IS_ERR(pcie->pcie_xrst))
-		return PTR_ERR(pcie->pcie_xrst);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(pcie->pcie_xrst);
 }
 
 static int tegra_pcie_get_resources(struct tegra_pcie *pcie)
-- 
1.8.3.1
