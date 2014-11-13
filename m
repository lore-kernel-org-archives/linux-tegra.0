From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] PCI: tegra: remove bogus bridge setup fixup
Date: Thu, 13 Nov 2014 20:37:37 +0100
Message-ID: <1415907457-3147-3-git-send-email-l.stach@pengutronix.de>
References: <1415907457-3147-1-git-send-email-l.stach@pengutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415907457-3147-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The bridge setup is already done by generic code
while scanning the buses. Do not duplicate (or potentially
alter) this setup as a fixup.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index d5a14f22ebb8..0ef22505cead 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -624,19 +624,6 @@ static void tegra_pcie_port_free(struct tegra_pcie_port *port)
 	devm_kfree(pcie->dev, port);
 }
 
-static void tegra_pcie_fixup_bridge(struct pci_dev *dev)
-{
-	u16 reg;
-
-	if ((dev->class >> 16) == PCI_BASE_CLASS_BRIDGE) {
-		pci_read_config_word(dev, PCI_COMMAND, &reg);
-		reg |= (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
-			PCI_COMMAND_MASTER | PCI_COMMAND_SERR);
-		pci_write_config_word(dev, PCI_COMMAND, reg);
-	}
-}
-DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, tegra_pcie_fixup_bridge);
-
 /* Tegra PCIE root complex wrongly reports device class */
 static void tegra_pcie_fixup_class(struct pci_dev *dev)
 {
-- 
2.1.1
