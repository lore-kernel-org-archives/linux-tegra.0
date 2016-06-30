From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] PCI: tegra: Stop setting pcibios_min_mem
Date: Thu, 30 Jun 2016 15:14:30 +0200
Message-ID: <20160630131430.32096-3-thierry.reding@gmail.com>
References: <20160630131430.32096-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160630131430.32096-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In practice this value will never be used and it hinders portability of
the driver, so remove it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index f04b062e8c67..bbf77a49517d 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -2249,8 +2249,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	pcibios_min_mem = 0;
-
 	err = tegra_pcie_get_resources(pcie);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to request resources: %d\n", err);
-- 
2.8.3
