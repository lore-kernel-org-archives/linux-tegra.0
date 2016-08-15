From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] PCI: tegra: Use of_device_get_match_data()
Date: Mon, 15 Aug 2016 17:31:32 +0200
Message-ID: <20160815153132.520-2-thierry.reding@gmail.com>
References: <20160815153132.520-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160815153132.520-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This function was introduced a couple of releases ago to help reduce the
the boilerplate required to get at the SoC specific data.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 7756a792600c..2d520755b1d7 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -2201,21 +2201,16 @@ remove:
 
 static int tegra_pcie_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct tegra_pcie *pcie;
 	int err;
 
-	match = of_match_device(tegra_pcie_of_match, &pdev->dev);
-	if (!match)
-		return -ENODEV;
-
 	pcie = devm_kzalloc(&pdev->dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
 		return -ENOMEM;
 
+	pcie->soc = of_device_get_match_data(&pdev->dev);
 	INIT_LIST_HEAD(&pcie->buses);
 	INIT_LIST_HEAD(&pcie->ports);
-	pcie->soc = match->data;
 	pcie->dev = &pdev->dev;
 
 	err = tegra_pcie_parse_dt(pcie);
-- 
2.9.0
