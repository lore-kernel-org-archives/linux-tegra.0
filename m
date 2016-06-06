From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1 14/25] PCI: altera: Simplify host bridge window iteration
Date: Mon, 06 Jun 2016 18:06:29 -0500
Message-ID: <20160606230629.20936.61795.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Herring <robh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>, Pratyush Anand <pratyush.anand@gmail.com>, linux-kernel@vger.kernel.org, rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Tanmay Inamdar <tinamdar@apm.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, Ley Foon Tan <lftan@altera.com>, Michal Simek <michal.simek@xilinx.com>, =?utf-8?b?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

The switch is the only statement in the resource_list_for_each_entry()
loop, so remove unnecessary "continue" statements in the switch.  Simplify
checking for the required non-prefetchable memory aperture.  Inline
altera_pcie_release_of_pci_ranges(), which is only called once.

No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pcie-altera.c |   24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/host/pcie-altera.c b/drivers/pci/host/pcie-altera.c
index b97abbc..cf20c67 100644
--- a/drivers/pci/host/pcie-altera.c
+++ b/drivers/pci/host/pcie-altera.c
@@ -415,11 +415,6 @@ static void altera_pcie_isr(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static void altera_pcie_release_of_pci_ranges(struct altera_pcie *pcie)
-{
-	pci_free_resource_list(&pcie->resources);
-}
-
 static int altera_pcie_parse_request_of_pci_ranges(struct altera_pcie *pcie)
 {
 	int err, res_valid = 0;
@@ -439,25 +434,18 @@ static int altera_pcie_parse_request_of_pci_ranges(struct altera_pcie *pcie)
 	resource_list_for_each_entry(win, &pcie->resources) {
 		struct resource *res = win->res;
 
-		switch (resource_type(res)) {
-		case IORESOURCE_MEM:
+		if (resource_type(res) == IORESOURCE_MEM)
 			res_valid |= !(res->flags & IORESOURCE_PREFETCH);
-			break;
-		default:
-			continue;
-		}
 	}
 
-	if (!res_valid) {
-		dev_err(dev, "non-prefetchable memory resource required\n");
-		err = -EINVAL;
-		goto out_release_res;
-	}
+	if (res_valid)
+		return 0;
 
-	return 0;
+	dev_err(dev, "non-prefetchable memory resource required\n");
+	err = -EINVAL;
 
 out_release_res:
-	altera_pcie_release_of_pci_ranges(pcie);
+	pci_free_resource_list(&pcie->resources);
 	return err;
 }
 
