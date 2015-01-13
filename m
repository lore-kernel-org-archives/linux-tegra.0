From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 2/2] PCI: tegra: apply relaxed ordering fixup only on Tegra
Date: Tue, 13 Jan 2015 20:57:28 +0100
Message-ID: <1421179048-25370-2-git-send-email-l.stach@pengutronix.de>
References: <1421179048-25370-1-git-send-email-l.stach@pengutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421179048-25370-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The fixup to enable relaxed ordering on all PCI devices was
executed unconditionally if the Tegra PCI host driver was
built into the kernel. This doesn't play nice with a
multiplatform kernel executed on other platforms which
may not need this fixup.

Make sure to only apply the fixup if the root port is
a Tegra.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
- split out PCI hierarchy walk
- separate code from data by moving PCI IDs into own structure
v3:
- fixup for helper rename
- applied Thierry's ACK
---
 drivers/pci/host/pci-tegra.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 6f9c29fa70e7..e87d79559723 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -635,10 +635,42 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_fixup_class);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1c, tegra_pcie_fixup_class);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1d, tegra_pcie_fixup_class);
 
+static const struct pci_device_id tegra_rootport_ids[] = {
+	{
+		/* Tegra20 4 lane root port */
+		.vendor = PCI_VENDOR_ID_NVIDIA, .device = 0x0bf0,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
+	}, {
+		/* Tegra20 2 lane root port */
+		.vendor = PCI_VENDOR_ID_NVIDIA, .device = 0x0bf1,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
+	}, {
+		/* Tegra30 4 lane root port */
+		.vendor = PCI_VENDOR_ID_NVIDIA, .device = 0x0e1c,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
+	}, {
+		/* Tegra30 2 lane root port */
+		.vendor = PCI_VENDOR_ID_NVIDIA, .device = 0x0e1d,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
+	}, {
+		/* Tegra124 4 lane root port */
+		.vendor = PCI_VENDOR_ID_NVIDIA, .device = 0x0e12,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
+	}, {
+		/* Tegra124 1 lane root port */
+		.vendor = PCI_VENDOR_ID_NVIDIA, .device = 0x0e13,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
+	}, {
+		/* sentinel */
+	}
+};
+
 /* Tegra PCIE requires relaxed ordering */
 static void tegra_pcie_relax_enable(struct pci_dev *dev)
 {
-	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_RELAX_EN);
+	if (pci_match_id(tegra_rootport_ids, pci_find_root_port(dev)))
+		pcie_capability_set_word(dev, PCI_EXP_DEVCTL,
+					 PCI_EXP_DEVCTL_RELAX_EN);
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, tegra_pcie_relax_enable);
 
-- 
2.1.4
