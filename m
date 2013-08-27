From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] PCI: tegra: replace devm_request_and_ioremap by devm_ioremap_resource
Date: Tue, 27 Aug 2013 12:52:33 -0600
Message-ID: <1377629554-17490-2-git-send-email-swarren@wwwdotorg.org>
References: <1377629554-17490-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377629554-17490-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 31 ++++++++++---------------------
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
-- 
1.8.1.5
