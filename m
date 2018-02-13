From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V8 2/4] PCI: tegra: Add loadable kernel module support
Date: Tue, 13 Feb 2018 20:54:08 +0530
Message-ID: <1518535450-24400-3-git-send-email-mmaddireddy@nvidia.com>
References: <1518535450-24400-1-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518535450-24400-1-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, cyndis-/1wQRMveznE@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Implement remove callback function for Tegra PCIe driver to add
loadable kernel module support. Change PCI_TEGRA config to tristate to
allow pci-tegra driver to be build as a module.

Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* no change in this patch
V3:
* use tegra_pcie_debugfs_exit() helper function in tegra_pcie_debugfs_init()
V4:
* no change in this patch
V5:
* Decoupled from https://patchwork.ozlabs.org/patch/832053/ and
rebased on linux-next
V6:
* no change in this patch
V7:
* no change in this patch
V8:
* Added new lines around conditional blocks

 drivers/pci/host/pci-tegra.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index e68507f658d8..17ccb5e3ba04 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -35,6 +35,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
@@ -2276,6 +2277,12 @@ static const struct file_operations tegra_pcie_ports_ops = {
 	.release = seq_release,
 };
 
+static void tegra_pcie_debugfs_exit(struct tegra_pcie *pcie)
+{
+	debugfs_remove_recursive(pcie->debugfs);
+	pcie->debugfs = NULL;
+}
+
 static int tegra_pcie_debugfs_init(struct tegra_pcie *pcie)
 {
 	struct dentry *file;
@@ -2292,8 +2299,7 @@ static int tegra_pcie_debugfs_init(struct tegra_pcie *pcie)
 	return 0;
 
 remove:
-	debugfs_remove_recursive(pcie->debugfs);
-	pcie->debugfs = NULL;
+	tegra_pcie_debugfs_exit(pcie);
 	return -ENOMEM;
 }
 
@@ -2311,6 +2317,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 
 	pcie = pci_host_bridge_priv(host);
 	host->sysdata = pcie;
+	platform_set_drvdata(pdev, pcie);
 
 	pcie->soc = of_device_get_match_data(dev);
 	INIT_LIST_HEAD(&pcie->ports);
@@ -2388,6 +2395,28 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 	return err;
 }
 
+static int tegra_pcie_remove(struct platform_device *pdev)
+{
+	struct tegra_pcie *pcie = platform_get_drvdata(pdev);
+	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		tegra_pcie_debugfs_exit(pcie);
+
+	pci_stop_root_bus(host->bus);
+	pci_remove_root_bus(host->bus);
+	tegra_pcie_disable_ports(pcie);
+
+	if (IS_ENABLED(CONFIG_PCI_MSI))
+		tegra_pcie_disable_msi(pcie);
+
+	tegra_pcie_free_resources(pcie);
+	tegra_pcie_disable_controller(pcie);
+	tegra_pcie_put_resources(pcie);
+
+	return 0;
+}
+
 static struct platform_driver tegra_pcie_driver = {
 	.driver = {
 		.name = "tegra-pcie",
@@ -2395,5 +2424,7 @@ static struct platform_driver tegra_pcie_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = tegra_pcie_probe,
+	.remove = tegra_pcie_remove,
 };
-builtin_platform_driver(tegra_pcie_driver);
+module_platform_driver(tegra_pcie_driver);
+MODULE_LICENSE("GPL");
-- 
2.1.4
