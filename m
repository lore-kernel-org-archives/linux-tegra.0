From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/19] PCI: Set default bridge parent device
Date: Tue, 21 Jul 2020 20:24:57 -0600
Message-ID: <20200722022514.1283916-3-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200722022514.1283916-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The host bridge's parent device is always the platform device. As we
already have a pointer to it in the devres functions, let's initialize
the parent device. Drivers can still override the parent if desired.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c   | 1 -
 drivers/pci/controller/dwc/pcie-designware-host.c    | 1 -
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 1 -
 drivers/pci/controller/pci-aardvark.c                | 1 -
 drivers/pci/controller/pci-ftpci100.c                | 1 -
 drivers/pci/controller/pci-host-common.c             | 1 -
 drivers/pci/controller/pci-loongson.c                | 1 -
 drivers/pci/controller/pci-mvebu.c                   | 1 -
 drivers/pci/controller/pci-tegra.c                   | 1 -
 drivers/pci/controller/pci-v3-semi.c                 | 1 -
 drivers/pci/controller/pci-versatile.c               | 1 -
 drivers/pci/controller/pci-xgene.c                   | 1 -
 drivers/pci/controller/pcie-altera.c                 | 1 -
 drivers/pci/controller/pcie-brcmstb.c                | 1 -
 drivers/pci/controller/pcie-iproc.c                  | 1 -
 drivers/pci/controller/pcie-mediatek.c               | 1 -
 drivers/pci/controller/pcie-rcar-host.c              | 2 --
 drivers/pci/controller/pcie-rockchip-host.c          | 1 -
 drivers/pci/controller/pcie-xilinx-nwl.c             | 1 -
 drivers/pci/controller/pcie-xilinx.c                 | 1 -
 drivers/pci/probe.c                                  | 2 ++
 21 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 9f77e47983c3..84aaf8834e11 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -244,7 +244,6 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	if (ret)
 		goto err_init;
 
-	bridge->dev.parent = dev;
 	bridge->busnr = pcie->bus;
 	bridge->ops = &cdns_pcie_host_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0a4a5aa6fe46..4a16306cec25 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -475,7 +475,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 	pp->root_bus_nr = pp->busn->start;
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pp;
 	bridge->busnr = pp->root_bus_nr;
 	bridge->ops = &dw_pcie_ops;
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
index 5974619811ec..705542b4bd21 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -605,7 +605,6 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie)
 	}
 
 	/* Initialize bridge */
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = rp->root_bus_nr;
 	bridge->ops = &mobiveil_pcie_ops;
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 90ff291c24f0..8210bf88734b 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1184,7 +1184,6 @@ static int advk_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = 0;
 	bridge->ops = &advk_pcie_ops;
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index 1b67564de7af..5037aa9f6fd8 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -437,7 +437,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 	if (!host)
 		return -ENOMEM;
 
-	host->dev.parent = dev;
 	host->ops = &faraday_pci_ops;
 	host->busnr = 0;
 	host->msi = NULL;
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index b76e55f495e4..ad395d7feddc 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -76,7 +76,6 @@ int pci_host_common_probe(struct platform_device *pdev)
 	if (!pci_has_flag(PCI_PROBE_ONLY))
 		pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = cfg;
 	bridge->busnr = cfg->busr.start;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
diff --git a/drivers/pci/controller/pci-loongson.c b/drivers/pci/controller/pci-loongson.c
index 459009c8a4a0..0198c15ed97c 100644
--- a/drivers/pci/controller/pci-loongson.c
+++ b/drivers/pci/controller/pci-loongson.c
@@ -225,7 +225,6 @@ static int loongson_pci_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = priv;
 	bridge->ops = &loongson_pci_ops;
 	bridge->map_irq = loongson_map_irq;
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 801044523a3d..7be6db851614 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1116,7 +1116,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 
 	pcie->nports = i;
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = 0;
 	bridge->ops = &mvebu_pcie_ops;
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 82fb36ed6f52..5f91900c3fa3 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2715,7 +2715,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	}
 
 	host->busnr = bus->start;
-	host->dev.parent = &pdev->dev;
 	host->ops = &tegra_pcie_ops;
 	host->map_irq = tegra_pcie_map_irq;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index 198cf2c6ed92..e8b5e55803b2 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -723,7 +723,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 	if (!host)
 		return -ENOMEM;
 
-	host->dev.parent = dev;
 	host->ops = &v3_pci_ops;
 	host->busnr = 0;
 	host->msi = NULL;
diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index 6e55cc59999b..f32ef8072147 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -155,7 +155,6 @@ static int versatile_pci_probe(struct platform_device *pdev)
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = NULL;
 	bridge->busnr = 0;
 	bridge->ops = &pci_versatile_ops;
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 5aee802946cb..fbb461cf8eca 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -624,7 +624,6 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = port;
 	bridge->busnr = 0;
 	bridge->ops = &xgene_pcie_ops;
diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 26ac3ad81de0..83ee09baf95f 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -816,7 +816,6 @@ static int altera_pcie_probe(struct platform_device *pdev)
 	cra_writel(pcie, P2A_INT_ENA_ALL, P2A_INT_ENABLE);
 	altera_pcie_host_init(pcie);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = pcie->root_bus_nr;
 	bridge->ops = &altera_pcie_ops;
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 15c747c1390a..4291a15abdcf 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -996,7 +996,6 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		}
 	}
 
-	bridge->dev.parent = &pdev->dev;
 	bridge->busnr = 0;
 	bridge->ops = &brcm_pcie_ops;
 	bridge->sysdata = pcie;
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 232fca0754e1..cf1cb717c7df 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1524,7 +1524,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
 			dev_info(dev, "not using iProc MSI\n");
 
 	host->busnr = 0;
-	host->dev.parent = dev;
 	host->ops = &iproc_pcie_ops;
 	host->sysdata = pcie;
 	host->map_irq = pcie->map_irq;
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index ebfa7d5a4e2d..a8710121264f 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1097,7 +1097,6 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 		return err;
 
 	host->busnr = pcie->busnr;
-	host->dev.parent = pcie->dev;
 	host->ops = pcie->soc->ops;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 9069ad96fe95..3a8e749b4904 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -329,7 +329,6 @@ static int rcar_pcie_enable(struct rcar_pcie_host *host)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
 	struct rcar_pcie *pcie = &host->pcie;
-	struct device *dev = pcie->dev;
 
 	/* Try setting 5 GT/s link speed */
 	rcar_pcie_force_speedup(pcie);
@@ -338,7 +337,6 @@ static int rcar_pcie_enable(struct rcar_pcie_host *host)
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = host;
 	bridge->busnr = host->root_bus_nr;
 	bridge->ops = &rcar_pcie_ops;
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 6a3c8442258b..4eb79c60d627 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -1007,7 +1007,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		goto err_remove_irq_domain;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = rockchip;
 	bridge->busnr = 0;
 	bridge->ops = &rockchip_pcie_ops;
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 32a0b08d6da5..3c747aa4b6d1 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -854,7 +854,6 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = pcie;
 	bridge->busnr = pcie->root_busno;
 	bridge->ops = &nwl_pcie_ops;
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 05547497f391..7c0f3268fc5c 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -651,7 +651,6 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	bridge->dev.parent = dev;
 	bridge->sysdata = port;
 	bridge->busnr = 0;
 	bridge->ops = &xilinx_pcie_ops;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea25..5583037dbdfa 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -628,6 +628,8 @@ struct pci_host_bridge *devm_pci_alloc_host_bridge(struct device *dev,
 	if (!bridge)
 		return NULL;
 
+	bridge->dev.parent = dev;
+
 	ret = devm_add_action_or_reset(dev, devm_pci_alloc_host_bridge_release,
 				       bridge);
 	if (ret)
-- 
2.25.1
