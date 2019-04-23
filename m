From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V4 02/16] PCI/PME: Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs
Date: Tue, 23 Apr 2019 13:57:16 +0530
Message-ID: <20190423082730.370-3-vidyas@nvidia.com>
References: <20190423082730.370-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423082730.370-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com
Cc: mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs to enable drivers
using this API be able to build as loadable modules.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
Changes from [v3]:
* None

Changes from [v2]:
* Exported pcie_pme_no_msi() API after making pcie_pme_msi_disabled a static

Changes from [v1]:
* This is a new patch in v2 series

 drivers/pci/pcie/pme.c     | 14 +++++++++++++-
 drivers/pci/pcie/portdrv.h | 16 +++-------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
index 54d593d10396..d5e0ea4a62fc 100644
--- a/drivers/pci/pcie/pme.c
+++ b/drivers/pci/pcie/pme.c
@@ -25,7 +25,19 @@
  * that using MSI for PCIe PME signaling doesn't play well with PCIe PME-based
  * wake-up from system sleep states.
  */
-bool pcie_pme_msi_disabled;
+static bool pcie_pme_msi_disabled;
+
+void pcie_pme_disable_msi(void)
+{
+	pcie_pme_msi_disabled = true;
+}
+EXPORT_SYMBOL_GPL(pcie_pme_disable_msi);
+
+bool pcie_pme_no_msi(void)
+{
+	return pcie_pme_msi_disabled;
+}
+EXPORT_SYMBOL_GPL(pcie_pme_no_msi);
 
 static int __init pcie_pme_setup(char *str)
 {
diff --git a/drivers/pci/pcie/portdrv.h b/drivers/pci/pcie/portdrv.h
index 1d50dc58ac40..7c8c3da4bd58 100644
--- a/drivers/pci/pcie/portdrv.h
+++ b/drivers/pci/pcie/portdrv.h
@@ -125,22 +125,12 @@ void pcie_port_bus_unregister(void);
 struct pci_dev;
 
 #ifdef CONFIG_PCIE_PME
-extern bool pcie_pme_msi_disabled;
-
-static inline void pcie_pme_disable_msi(void)
-{
-	pcie_pme_msi_disabled = true;
-}
-
-static inline bool pcie_pme_no_msi(void)
-{
-	return pcie_pme_msi_disabled;
-}
-
+void pcie_pme_disable_msi(void);
+bool pcie_pme_no_msi(void);
 void pcie_pme_interrupt_enable(struct pci_dev *dev, bool enable);
 #else /* !CONFIG_PCIE_PME */
 static inline void pcie_pme_disable_msi(void) {}
-static inline bool pcie_pme_no_msi(void) { return false; }
+static inline bool pcie_pme_no_msi(void) {}
 static inline void pcie_pme_interrupt_enable(struct pci_dev *dev, bool en) {}
 #endif /* !CONFIG_PCIE_PME */
 
-- 
2.17.1
