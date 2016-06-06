From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1 25/25] PCI: versatile: Simplify host bridge window
 iteration
Date: Mon, 06 Jun 2016 18:07:51 -0500
Message-ID: <20160606230751.20936.38789.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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
checking for the required non-prefetchable memory aperture.

No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pci-versatile.c |   17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/host/pci-versatile.c b/drivers/pci/host/pci-versatile.c
index 273edac..f2344057 100644
--- a/drivers/pci/host/pci-versatile.c
+++ b/drivers/pci/host/pci-versatile.c
@@ -90,11 +90,9 @@ static int versatile_pci_parse_request_of_pci_ranges(struct device *dev,
 		switch (resource_type(res)) {
 		case IORESOURCE_IO:
 			err = pci_remap_iospace(res, iobase);
-			if (err) {
+			if (err)
 				dev_warn(dev, "error %d: failed to map resource %pR\n",
 					 err, res);
-				continue;
-			}
 			break;
 		case IORESOURCE_MEM:
 			res_valid |= !(res->flags & IORESOURCE_PREFETCH);
@@ -104,19 +102,14 @@ static int versatile_pci_parse_request_of_pci_ranges(struct device *dev,
 			mem++;
 
 			break;
-		case IORESOURCE_BUS:
-		default:
-			continue;
 		}
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
 	pci_free_resource_list(res);
