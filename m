From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1 13/25] PCI: altera: Request host bridge window resources
 with core function
Date: Mon, 06 Jun 2016 18:06:21 -0500
Message-ID: <20160606230621.20936.79245.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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

Use devm_request_pci_bus_resources() to request host bridge window
resources instead of doing it by hand in the driver.

No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pcie-altera.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/host/pcie-altera.c b/drivers/pci/host/pcie-altera.c
index dbac6fb..b97abbc 100644
--- a/drivers/pci/host/pcie-altera.c
+++ b/drivers/pci/host/pcie-altera.c
@@ -432,21 +432,20 @@ static int altera_pcie_parse_request_of_pci_ranges(struct altera_pcie *pcie)
 	if (err)
 		return err;
 
+	err = devm_request_pci_bus_resources(dev, &pcie->resources);
+	if (err)
+		goto out_release_res;
+
 	resource_list_for_each_entry(win, &pcie->resources) {
-		struct resource *parent, *res = win->res;
+		struct resource *res = win->res;
 
 		switch (resource_type(res)) {
 		case IORESOURCE_MEM:
-			parent = &iomem_resource;
 			res_valid |= !(res->flags & IORESOURCE_PREFETCH);
 			break;
 		default:
 			continue;
 		}
-
-		err = devm_request_resource(dev, parent, res);
-		if (err)
-			goto out_release_res;
 	}
 
 	if (!res_valid) {
