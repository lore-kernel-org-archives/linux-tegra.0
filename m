From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 03/19] PCI: Drop unnecessary zeroing of bridge fields
Date: Tue, 21 Jul 2020 20:24:58 -0600
Message-ID: <20200722022514.1283916-4-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200722022514.1283916-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The struct pci_host_bridge is 0 initialized when allocated, so there's
no need to explicitly set fields to 0.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/pci/controller/pci-aardvark.c       | 1 -
 drivers/pci/controller/pci-ftpci100.c       | 2 --
 drivers/pci/controller/pci-mvebu.c          | 1 -
 drivers/pci/controller/pci-v3-semi.c        | 2 --
 drivers/pci/controller/pci-versatile.c      | 2 --
 drivers/pci/controller/pci-xgene.c          | 1 -
 drivers/pci/controller/pcie-brcmstb.c       | 1 -
 drivers/pci/controller/pcie-iproc.c         | 1 -
 drivers/pci/controller/pcie-rockchip-host.c | 1 -
 drivers/pci/controller/pcie-xilinx.c        | 1 -
 10 files changed, 13 deletions(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 8210bf88734b..f38663af795c 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1185,7 +1185,6 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = pcie;
-	bridge->busnr = 0;
 	bridge->ops = &advk_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index 5037aa9f6fd8..84b6b5a21a89 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -438,8 +438,6 @@ static int faraday_pci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	host->ops = &faraday_pci_ops;
-	host->busnr = 0;
-	host->msi = NULL;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
 	p = pci_host_bridge_priv(host);
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 7be6db851614..db93823a2dcb 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1117,7 +1117,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 	pcie->nports = i;
 
 	bridge->sysdata = pcie;
-	bridge->busnr = 0;
 	bridge->ops = &mvebu_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index e8b5e55803b2..d79af39e6e60 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -724,8 +724,6 @@ static int v3_pci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	host->ops = &v3_pci_ops;
-	host->busnr = 0;
-	host->msi = NULL;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
 	v3 = pci_host_bridge_priv(host);
diff --git a/drivers/pci/controller/pci-versatile.c b/drivers/pci/controller/pci-versatile.c
index f32ef8072147..80f594beea81 100644
--- a/drivers/pci/controller/pci-versatile.c
+++ b/drivers/pci/controller/pci-versatile.c
@@ -155,8 +155,6 @@ static int versatile_pci_probe(struct platform_device *pdev)
 
 	pci_add_flags(PCI_REASSIGN_ALL_BUS);
 
-	bridge->sysdata = NULL;
-	bridge->busnr = 0;
 	bridge->ops = &pci_versatile_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index fbb461cf8eca..1d3286823c16 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -625,7 +625,6 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	bridge->sysdata = port;
-	bridge->busnr = 0;
 	bridge->ops = &xgene_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 4291a15abdcf..a92b337af20f 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -996,7 +996,6 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		}
 	}
 
-	bridge->busnr = 0;
 	bridge->ops = &brcm_pcie_ops;
 	bridge->sysdata = pcie;
 	bridge->map_irq = of_irq_parse_and_map_pci;
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index cf1cb717c7df..e98dafd0fff4 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1523,7 +1523,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
 		if (iproc_pcie_msi_enable(pcie))
 			dev_info(dev, "not using iProc MSI\n");
 
-	host->busnr = 0;
 	host->ops = &iproc_pcie_ops;
 	host->sysdata = pcie;
 	host->map_irq = pcie->map_irq;
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 4eb79c60d627..fb88030161f2 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -1008,7 +1008,6 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = rockchip;
-	bridge->busnr = 0;
 	bridge->ops = &rockchip_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 7c0f3268fc5c..cce67cb8fb2b 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -652,7 +652,6 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 	}
 
 	bridge->sysdata = port;
-	bridge->busnr = 0;
 	bridge->ops = &xilinx_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
-- 
2.25.1
