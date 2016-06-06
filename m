From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1 12/25] PCI: xilinx-nwl: Use dev_printk() when possible
Date: Mon, 06 Jun 2016 18:06:14 -0500
Message-ID: <20160606230614.20936.98599.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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

Use dev_printk() when possible to make messages more useful.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pcie-xilinx-nwl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pcie-xilinx-nwl.c b/drivers/pci/host/pcie-xilinx-nwl.c
index 3c16bbf..0b597d9 100644
--- a/drivers/pci/host/pcie-xilinx-nwl.c
+++ b/drivers/pci/host/pcie-xilinx-nwl.c
@@ -825,7 +825,7 @@ static int nwl_pcie_probe(struct platform_device *pdev)
 
 	err = of_pci_get_host_bridge_resources(node, 0, 0xff, &res, &iobase);
 	if (err) {
-		pr_err("Getting bridge resources failed\n");
+		dev_err(pcie->dev, "Getting bridge resources failed\n");
 		return err;
 	}
 
