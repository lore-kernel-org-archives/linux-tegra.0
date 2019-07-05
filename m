From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] PCI: tegra: Fix support for GPIO based PERST#
Date: Fri, 5 Jul 2019 09:48:50 +0100
Message-ID: <20190705084850.30777-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit 5e5e9c23f82a ("PCI: tegra: Add support for GPIO based PERST#")
calls the function devm_gpiod_get_from_of_node() to request a GPIO.
Unfortunately, around the same time this was merged, commit 025bf37725f1
("gpio: Fix return value mismatch of function gpiod_get_from_of_node()")
was also merged to fix the return value of the function
devm_gpiod_get_from_of_node() that was incorrectly returning NULL
instead of an error pointer encoded with -ENOENT if no GPIO was found.
When this fix for the GPIO subsystem was merged, PCI support for Tegra
devices that did not provide a GPIO for the PERST# (which is optional)
broke because the Tegra PCI driver was expecting NULL to be returned if
no GPIO was present and not -ENOENT.

Fix this by checking to see if -ENOENT is returned from the function
devm_gpiod_get_from_of_node(), to indicate there is no GPIO for PERST#
present, and if this is the case set the variable 'reset_gpio' to NULL.
If the variable 'reset_gpio' is NULL then the Tegra PCI driver will
fallback to using the AFI register to toggle the PERST#. Finally,
correct the comment now that NULL is no longer returned from
devm_gpiod_get_from_of_node().

Fixes: 5e5e9c23f82a ("PCI: tegra: Add support for GPIO based PERST#")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/pci/controller/pci-tegra.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 9cc03a2549c0..ff8a346f3e04 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2295,18 +2295,22 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		}
 
 		/*
-		 * Returns null if reset-gpios property is not populated and
-		 * fall back to using AFI per port register to toggle PERST#
-		 * SFIO line.
+		 * Returns -ENOENT if reset-gpios property is not populated
+		 * and in this case fall back to using AFI per port register
+		 * to toggle PERST# SFIO line.
 		 */
 		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
 							     "reset-gpios", 0,
 							     GPIOD_OUT_LOW,
 							     label);
 		if (IS_ERR(rp->reset_gpio)) {
-			err = PTR_ERR(rp->reset_gpio);
-			dev_err(dev, "failed to get reset GPIO: %d\n", err);
-			return err;
+			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
+				rp->reset_gpio = NULL;
+			} else {
+				dev_err(dev, "failed to get reset GPIO: %d\n",
+					err);
+				return PTR_ERR(rp->reset_gpio);
+			}
 		}
 
 		list_add_tail(&rp->list, &pcie->ports);
-- 
2.17.1
