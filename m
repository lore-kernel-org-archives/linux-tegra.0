From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 15/19] PCI: rcar: Use struct pci_host_bridge.windows list directly
Date: Tue, 21 Jul 2020 20:25:10 -0600
Message-ID: <20200722022514.1283916-16-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200722022514.1283916-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There's no need to create a temporary resource list and then splice it to
struct pci_host_bridge.windows list. Just use pci_host_bridge.windows
directly. The necessary clean-up is already handled by the PCI core.

Cc: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/pci/controller/pcie-rcar-host.c | 45 +++----------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index c470bff5af0f..fa7b89378904 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -53,7 +53,6 @@ struct rcar_pcie_host {
 	struct device		*dev;
 	struct phy		*phy;
 	void __iomem		*base;
-	struct list_head	resources;
 	struct clk		*bus_clk;
 	struct			rcar_msi msi;
 	int			(*phy_init_fn)(struct rcar_pcie_host *host);
@@ -203,38 +202,6 @@ static struct pci_ops rcar_pcie_ops = {
 	.write	= rcar_pcie_write_conf,
 };
 
-static int rcar_pcie_setup(struct list_head *resource,
-			   struct rcar_pcie_host *host)
-{
-	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
-	struct resource_entry *win;
-	int i = 0;
-
-	/* Setup PCI resources */
-	resource_list_for_each_entry(win, &host->resources) {
-		struct resource *res = win->res;
-
-		if (!res->flags)
-			continue;
-
-		switch (resource_type(res)) {
-		case IORESOURCE_IO:
-		case IORESOURCE_MEM:
-			rcar_pcie_set_outbound(&host->pcie, i, win);
-			i++;
-			break;
-		case IORESOURCE_BUS:
-			break;
-		default:
-			continue;
-		}
-
-		pci_add_resource(resource, res);
-	}
-
-	return 1;
-}
-
 static void rcar_pcie_force_speedup(struct rcar_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
@@ -292,6 +259,7 @@ static void rcar_pcie_force_speedup(struct rcar_pcie *pcie)
 static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 {
 	struct rcar_pcie *pcie = &host->pcie;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
 	struct resource_entry *win;
 	LIST_HEAD(res);
 	int i = 0;
@@ -300,7 +268,7 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 	rcar_pcie_force_speedup(pcie);
 
 	/* Setup PCI resources */
-	resource_list_for_each_entry(win, &host->resources) {
+	resource_list_for_each_entry(win, &bridge->windows) {
 		struct resource *res = win->res;
 
 		if (!res->flags)
@@ -319,12 +287,8 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 static int rcar_pcie_enable(struct rcar_pcie_host *host)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
-	struct rcar_pcie *pcie = &host->pcie;
 
-	/* Try setting 5 GT/s link speed */
-	rcar_pcie_force_speedup(pcie);
-
-	rcar_pcie_setup(&bridge->windows, host);
+	rcar_pcie_hw_enable(host);
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
@@ -949,7 +913,7 @@ static int rcar_pcie_probe(struct platform_device *pdev)
 	pcie->dev = dev;
 	platform_set_drvdata(pdev, host);
 
-	err = pci_parse_request_of_pci_ranges(dev, &host->resources,
+	err = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
 					      &bridge->dma_ranges, NULL);
 	if (err)
 		return err;
@@ -1032,7 +996,6 @@ static int rcar_pcie_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(dev);
-	pci_free_resource_list(&host->resources);
 
 	return err;
 }
-- 
2.25.1
