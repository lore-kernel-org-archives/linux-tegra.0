From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 1/7] PCI: tegra: replace devm_request_and_ioremap by
 devm_ioremap_resource
Date: Tue, 20 Aug 2013 11:13:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1308201112400.2269@hadrien>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr> <1376911241-27720-2-git-send-email-Julia.Lawall@lip6.fr> <20130819120249.GA5740@ulmo> <alpine.DEB.2.02.1308191405450.2313@hadrien> <20130819121238.GB5740@ulmo> <alpine.DEB.2.02.1308191414360.2313@hadrien>
 <20130819193339.GB4961@mithrandir>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130819193339.GB4961@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>

Use devm_ioremap_resource instead of devm_request_and_ioremap.

This was done using the semantic patch
scripts/coccinelle/api/devm_ioremap_resource.cocci

Error-handling code was manually removed from the associated calls to
platform_get_resource.

Adjust the comment at the third platform_get_resource_byname to make clear
why ioremap is not done at this point.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
v2: add the change to the comment

 drivers/pci/host/pci-tegra.c |   31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 7356741..2e9888a 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -1031,32 +1031,21 @@ static int tegra_pcie_get_resources(struct tegra_pcie *pcie)
 		return err;
 	}

-	/* request and remap controller registers */
 	pads = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pads");
-	if (!pads) {
-		err = -EADDRNOTAVAIL;
+	pcie->pads = devm_ioremap_resource(&pdev->dev, pads);
+	if (IS_ERR(pcie->pads)) {
+		err = PTR_ERR(pcie->pads);
 		goto poweroff;
 	}

 	afi = platform_get_resource_byname(pdev, IORESOURCE_MEM, "afi");
-	if (!afi) {
-		err = -EADDRNOTAVAIL;
-		goto poweroff;
-	}
-
-	pcie->pads = devm_request_and_ioremap(&pdev->dev, pads);
-	if (!pcie->pads) {
-		err = -EADDRNOTAVAIL;
-		goto poweroff;
-	}
-
-	pcie->afi = devm_request_and_ioremap(&pdev->dev, afi);
-	if (!pcie->afi) {
-		err = -EADDRNOTAVAIL;
+	pcie->afi = devm_ioremap_resource(&pdev->dev, afi);
+	if (IS_ERR(pcie->afi)) {
+		err = PTR_ERR(pcie->afi);
 		goto poweroff;
 	}

-	/* request and remap configuration space */
+	/* request configuration space, but remap later, on demand */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cs");
 	if (!res) {
 		err = -EADDRNOTAVAIL;
@@ -1492,9 +1481,9 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		rp->lanes = value;
 		rp->pcie = pcie;

-		rp->base = devm_request_and_ioremap(pcie->dev, &rp->regs);
-		if (!rp->base)
-			return -EADDRNOTAVAIL;
+		rp->base = devm_ioremap_resource(pcie->dev, &rp->regs);
+		if (IS_ERR(rp->base))
+			return PTR_ERR(rp->base);

 		list_add_tail(&rp->list, &pcie->ports);
 	}
