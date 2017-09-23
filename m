From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] PCI: tegra: Use generic accessors where possible
Date: Fri, 22 Sep 2017 23:18:41 -0700
Message-ID: <20170923061841.6123-1-treding@nvidia.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Tegra PCI host controller can generate configuration space accesses
with byte, word and dword granularity for devices. Only root ports can't
have their configuration space accessed in this way.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pci/host/pci-tegra.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 9c40da54f88a..e8e1ddbaabc9 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -491,12 +491,32 @@ static void __iomem *tegra_pcie_map_bus(struct pci_bus *bus,
 	return addr;
 }
 
+static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 *value)
+{
+	if (bus->number == 0)
+		return pci_generic_config_read32(bus, devfn, where, size,
+						 value);
+
+	return pci_generic_config_read(bus, devfn, where, size, value);
+}
+
+static int tegra_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
+				   int where, int size, u32 value)
+{
+	if (bus->number == 0)
+		return pci_generic_config_write32(bus, devfn, where, size,
+						  value);
+
+	return pci_generic_config_write(bus, devfn, where, size, value);
+}
+
 static struct pci_ops tegra_pcie_ops = {
 	.add_bus = tegra_pcie_add_bus,
 	.remove_bus = tegra_pcie_remove_bus,
 	.map_bus = tegra_pcie_map_bus,
-	.read = pci_generic_config_read32,
-	.write = pci_generic_config_write32,
+	.read = tegra_pcie_config_read,
+	.write = tegra_pcie_config_write,
 };
 
 static unsigned long tegra_pcie_port_get_pex_ctrl(struct tegra_pcie_port *port)
-- 
2.14.1
