From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/4] PCI: Make host bridge interface publicly available
Date: Mon, 15 Aug 2016 17:36:46 +0200
Message-ID: <20160815153647.1075-3-thierry.reding@gmail.com>
References: <20160815153647.1075-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160815153647.1075-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Allow PCI host bridge drivers to use the new host bridge interfaces to
register their host bridge.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/probe.c | 6 ++++--
 include/linux/pci.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index ecf543014da3..4e05e703d1de 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -521,7 +521,7 @@ static void pci_release_host_bridge_dev(struct device *dev)
 	kfree(bridge);
 }
 
-static struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
+struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
 {
 	struct pci_host_bridge *bridge;
 
@@ -536,6 +536,7 @@ static struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
 
 	return bridge;
 }
+EXPORT_SYMBOL(pci_alloc_host_bridge);
 
 static const unsigned char pcix_bus_speed[] = {
 	PCI_SPEED_UNKNOWN,		/* 0 */
@@ -720,7 +721,7 @@ static void pci_set_bus_msi_domain(struct pci_bus *bus)
 	dev_set_msi_domain(&bus->dev, d);
 }
 
-static int pci_register_host_bridge(struct pci_host_bridge *bridge)
+int pci_register_host_bridge(struct pci_host_bridge *bridge)
 {
 	struct device *parent = bridge->dev.parent;
 	struct resource_entry *window, *n;
@@ -835,6 +836,7 @@ free:
 	kfree(bus);
 	return err;
 }
+EXPORT_SYMBOL(pci_register_host_bridge);
 
 static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
 					   struct pci_dev *bridge, int busnr)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 3aa7240800c8..2e22ee99c841 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -426,6 +426,8 @@ struct pci_host_bridge {
 
 #define	to_pci_host_bridge(n) container_of(n, struct pci_host_bridge, dev)
 
+struct pci_host_bridge *pci_alloc_host_bridge(size_t priv);
+int pci_register_host_bridge(struct pci_host_bridge *bridge);
 struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus);
 
 void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
-- 
2.9.0
