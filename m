From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] PCI: tegra: apply relaxed ordering fixup only on Tegra
Date: Thu, 13 Nov 2014 20:37:36 +0100
Message-ID: <1415907457-3147-2-git-send-email-l.stach@pengutronix.de>
References: <1415907457-3147-1-git-send-email-l.stach@pengutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415907457-3147-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The fixup to enable relaxed ordering on all PCI devices was
executed unconditionally if the Tegra PCI host driver was
built into the kernel. This doesn't play nice with a
multiplatform kernel executed on other platforms which
may not need this fixup.

Make sure to only apply the fixup if the root port is
a Tegra.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 3d43874319be..d5a14f22ebb8 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -647,10 +647,34 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_fixup_class);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1c, tegra_pcie_fixup_class);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1d, tegra_pcie_fixup_class);
 
+static int tegra_pcie_root_is_tegra(struct pci_dev *dev)
+{
+	struct pci_bus *bus = dev->bus;
+	struct pci_dev *root_bridge;
+
+	/* walk up the PCIe hierarchy to the first level below the root bus */
+	while (bus->parent && bus->parent->self)
+		bus = bus->parent;
+
+	/*
+	 * If there is no bridge on the bus the passed device is the root
+	 * bridge itself.
+	 */
+	root_bridge = bus->self ? bus->self : dev;
+	if (root_bridge->vendor == PCI_VENDOR_ID_NVIDIA &&
+	    (root_bridge->device == 0x0bf0 || root_bridge->device == 0x0bf1 ||
+	     root_bridge->device == 0x0e1c || root_bridge->device == 0x0e1d ||
+	     root_bridge->device == 0x0e12 || root_bridge->device == 0x0e13))
+		return 1;
+
+	return 0;
+}
 /* Tegra PCIE requires relaxed ordering */
 static void tegra_pcie_relax_enable(struct pci_dev *dev)
 {
-	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_RELAX_EN);
+	if (tegra_pcie_root_is_tegra(dev))
+		pcie_capability_set_word(dev, PCI_EXP_DEVCTL,
+					 PCI_EXP_DEVCTL_RELAX_EN);
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, tegra_pcie_relax_enable);
 
-- 
2.1.1
