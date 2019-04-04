From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V2 02/16] PCI/PME: Export pcie_pme_disable_msi() API
Date: Fri, 5 Apr 2019 01:24:29 +0530
Message-ID: <1554407683-31580-3-git-send-email-vidyas@nvidia.com>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Export pcie_pme_disable_msi() API to enable drivers using this API be able to
build as loadable modules

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
Changes from [v1]:
* This is a new patch in v2 series

 drivers/pci/pcie/pme.c     | 6 ++++++
 drivers/pci/pcie/portdrv.h | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
index 54d593d10396..18e815c1e3c9 100644
--- a/drivers/pci/pcie/pme.c
+++ b/drivers/pci/pcie/pme.c
@@ -27,6 +27,12 @@
  */
 bool pcie_pme_msi_disabled;
 
+void pcie_pme_disable_msi(void)
+{
+	pcie_pme_msi_disabled = true;
+}
+EXPORT_SYMBOL_GPL(pcie_pme_disable_msi);
+
 static int __init pcie_pme_setup(char *str)
 {
 	if (!strncmp(str, "nomsi", 5))
diff --git a/drivers/pci/pcie/portdrv.h b/drivers/pci/pcie/portdrv.h
index 1d50dc58ac40..2be7b7e9a784 100644
--- a/drivers/pci/pcie/portdrv.h
+++ b/drivers/pci/pcie/portdrv.h
@@ -127,10 +127,7 @@ struct pci_dev;
 #ifdef CONFIG_PCIE_PME
 extern bool pcie_pme_msi_disabled;
 
-static inline void pcie_pme_disable_msi(void)
-{
-	pcie_pme_msi_disabled = true;
-}
+void pcie_pme_disable_msi(void);
 
 static inline bool pcie_pme_no_msi(void)
 {
-- 
2.7.4
