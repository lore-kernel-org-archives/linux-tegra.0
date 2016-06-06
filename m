From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1 04/25] PCI: designware: Simplify host bridge window
 iteration
Date: Mon, 06 Jun 2016 18:05:15 -0500
Message-ID: <20160606230515.20936.35308.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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
loop, so remove unnecessary "continue" statements in the switch.

No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pcie-designware.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
index 8304aeb..12afce1 100644
--- a/drivers/pci/host/pcie-designware.c
+++ b/drivers/pci/host/pcie-designware.c
@@ -465,11 +465,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->io_size = resource_size(pp->io);
 			pp->io_bus_addr = pp->io->start - win->offset;
 			ret = pci_remap_iospace(pp->io, pp->io_base);
-			if (ret) {
+			if (ret)
 				dev_warn(pp->dev, "error %d: failed to map resource %pR\n",
 					 ret, pp->io);
-				continue;
-			}
 			break;
 		case IORESOURCE_MEM:
 			pp->mem = win->res;
@@ -487,8 +485,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		case IORESOURCE_BUS:
 			pp->busn = win->res;
 			break;
-		default:
-			continue;
 		}
 	}
 
