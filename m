From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 11/19] PCI: Move setting pci_host_bridge.busnr out of host drivers
Date: Tue, 21 Jul 2020 20:25:06 -0600
Message-ID: <20200722022514.1283916-12-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200722022514.1283916-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Most host drivers only parse the DT bus range to set the root bus number
in pci_host_bridge.busnr. The ones that don't set busnr are buggy in
that they ignore what's in DT. Let's set busnr in pci_scan_root_bus_bridge()
where we already check for the bus resource and remove setting it in
host drivers.

Cc: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 4 ----
 drivers/pci/controller/dwc/pcie-designware.h      | 1 -
 drivers/pci/controller/pci-aardvark.c             | 5 ++---
 drivers/pci/controller/pci-host-common.c          | 1 -
 drivers/pci/controller/pci-tegra.c                | 4 +---
 drivers/pci/controller/pci-v3-semi.c              | 2 --
 drivers/pci/controller/pcie-mediatek.c            | 8 +-------
 drivers/pci/controller/pcie-rcar-host.c           | 1 -
 drivers/pci/probe.c                               | 1 +
 9 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9e8a9cfc6d3a..fa922cb876a3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -374,9 +374,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->cfg0_base = pp->cfg->start;
 			pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
 			break;
-		case IORESOURCE_BUS:
-			pp->busn = win->res;
-			break;
 		}
 	}
 
@@ -474,7 +471,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	}
 
 	bridge->sysdata = pp;
-	bridge->busnr = pp->busn->start;
 	bridge->ops = &dw_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index fd2146298b58..9fb44290ed43 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -188,7 +188,6 @@ struct pcie_port {
 	struct resource		*cfg;
 	struct resource		*io;
 	struct resource		*mem;
-	struct resource		*busn;
 	int			irq;
 	const struct dw_pcie_host_ops *ops;
 	int			msi_irq;
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 07d4a75b5c8f..61c59a6935c9 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1104,7 +1104,7 @@ static int advk_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct advk_pcie *pcie;
-	struct resource *res, *bus;
+	struct resource *res;
 	struct pci_host_bridge *bridge;
 	int ret, irq;
 
@@ -1133,12 +1133,11 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	}
 
 	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
-					      &bridge->dma_ranges, &bus);
+					      &bridge->dma_ranges, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to parse resources\n");
 		return ret;
 	}
-	bridge->busnr = bus->start;
 
 	pcie->reset_gpio = devm_gpiod_get_from_of_node(dev, dev->of_node,
 						       "reset-gpios", 0,
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index ad395d7feddc..e662910fe032 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -77,7 +77,6 @@ int pci_host_common_probe(struct platform_device *pdev)
 		pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
 	bridge->sysdata = cfg;
-	bridge->busnr = cfg->busr.start;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 5f91900c3fa3..9c91df9cd2ba 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2670,7 +2670,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct pci_host_bridge *host;
 	struct tegra_pcie *pcie;
-	struct resource *bus;
 	int err;
 
 	host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
@@ -2685,7 +2684,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&pcie->ports);
 	pcie->dev = dev;
 
-	err = pci_parse_request_of_pci_ranges(dev, &host->windows, NULL, &bus);
+	err = pci_parse_request_of_pci_ranges(dev, &host->windows, NULL, NULL);
 	if (err) {
 		dev_err(dev, "Getting bridge resources failed\n");
 		return err;
@@ -2714,7 +2713,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 		goto pm_runtime_put;
 	}
 
-	host->busnr = bus->start;
 	host->ops = &tegra_pcie_ops;
 	host->map_irq = tegra_pcie_map_irq;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index d79af39e6e60..d2619f583bfb 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -584,8 +584,6 @@ static int v3_pci_setup_resource(struct v3_pci *v3,
 		}
 		break;
 	case IORESOURCE_BUS:
-		dev_dbg(dev, "BUS %pR\n", win->res);
-		host->busnr = win->res->start;
 		break;
 	default:
 		dev_info(dev, "Unknown resource type %lu\n",
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index a8710121264f..acbb656a8092 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -209,7 +209,6 @@ struct mtk_pcie_port {
  * @mem: non-prefetchable memory resource
  * @ports: pointer to PCIe port information
  * @soc: pointer to SoC-dependent operations
- * @busnr: root bus number
  */
 struct mtk_pcie {
 	struct device *dev;
@@ -218,7 +217,6 @@ struct mtk_pcie {
 
 	struct list_head ports;
 	const struct mtk_pcie_soc *soc;
-	unsigned int busnr;
 };
 
 static void mtk_pcie_subsys_powerdown(struct mtk_pcie *pcie)
@@ -1033,16 +1031,13 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
 	struct mtk_pcie_port *port, *tmp;
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
 	struct list_head *windows = &host->windows;
-	struct resource *bus;
 	int err;
 
 	err = pci_parse_request_of_pci_ranges(dev, windows,
-					      &host->dma_ranges, &bus);
+					      &host->dma_ranges, NULL);
 	if (err)
 		return err;
 
-	pcie->busnr = bus->start;
-
 	for_each_available_child_of_node(node, child) {
 		int slot;
 
@@ -1096,7 +1091,6 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	host->busnr = pcie->busnr;
 	host->ops = pcie->soc->ops;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index bf10f1cf04f4..58f4d339eb0c 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -224,7 +224,6 @@ static int rcar_pcie_setup(struct list_head *resource,
 			i++;
 			break;
 		case IORESOURCE_BUS:
-			bridge->busnr = res->start;
 			break;
 		default:
 			continue;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 5583037dbdfa..f850782efc35 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3088,6 +3088,7 @@ int pci_scan_root_bus_bridge(struct pci_host_bridge *bridge)
 
 	resource_list_for_each_entry(window, &bridge->windows)
 		if (window->res->flags & IORESOURCE_BUS) {
+			bridge->busnr = window->res->start;
 			found = true;
 			break;
 		}
-- 
2.25.1
