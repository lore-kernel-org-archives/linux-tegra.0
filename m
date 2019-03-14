From: Kangjie Lu <kjlu@umn.edu>
Subject: [PATCH] pci: pci-tegra: fix a potential NULL pointer dereference
Date: Thu, 14 Mar 2019 00:53:47 -0500
Message-ID: <20190314055347.3519-1-kjlu@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

In case __get_free_pages fails and returns NULL, the fix returns
-ENOMEM and releases resources to avoid NULL pointer dereference.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/pci/controller/pci-tegra.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index f4f53d092e00..0bdc6ee904f3 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1550,6 +1550,12 @@ static int tegra_pcie_msi_setup(struct tegra_pcie *pcie)
 
 	/* setup AFI/FPCI range */
 	msi->pages = __get_free_pages(GFP_KERNEL, 0);
+	if (!msi->pages) {
+		dev_err(dev, "failed to get free pages\n");
+		err = -ENOMEM;
+		goto err;
+	}
+
 	msi->phys = virt_to_phys((void *)msi->pages);
 	host->msi = &msi->chip;
 
-- 
2.17.1
