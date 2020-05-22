From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 06/15] PCI: tegra: Use pci_host_probe() to register host
Date: Fri, 22 May 2020 17:48:23 -0600
Message-ID: <20200522234832.954484-7-robh@kernel.org>
References: <20200522234832.954484-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200522234832.954484-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The tegra host driver does the same host registration and bus scanning
calls as pci_host_probe, so let's use it instead.

Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/pci/controller/pci-tegra.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index e3e917243e10..3cae96dfe75d 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2670,7 +2670,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct pci_host_bridge *host;
 	struct tegra_pcie *pcie;
-	struct pci_bus *child;
 	struct resource *bus;
 	int err;
 
@@ -2721,20 +2720,12 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	host->map_irq = tegra_pcie_map_irq;
 	host->swizzle_irq = pci_common_swizzle;
 
-	err = pci_scan_root_bus_bridge(host);
+	err = pci_host_probe(host);
 	if (err < 0) {
 		dev_err(dev, "failed to register host: %d\n", err);
 		goto pm_runtime_put;
 	}
 
-	pci_bus_size_bridges(host->bus);
-	pci_bus_assign_resources(host->bus);
-
-	list_for_each_entry(child, &host->bus->children, node)
-		pcie_bus_configure_settings(child);
-
-	pci_bus_add_devices(host->bus);
-
 	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
 		err = tegra_pcie_debugfs_init(pcie);
 		if (err < 0)
-- 
2.25.1
