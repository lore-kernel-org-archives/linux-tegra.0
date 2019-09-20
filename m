From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] PCI: tegra: include linux/pinctrl/consumer.h
Date: Fri, 20 Sep 2019 16:55:05 +0200
Message-ID: <20190920145518.1721180-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Vidya Sagar <vidyas@nvidia.com>, Andrew Murray <andrew.murray@arm.com>, Thierry Reding <treding@nvidia.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Without this, we can run into a build failure:

drivers/pci/controller/dwc/pcie-tegra194.c:1394:8: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Werror,-Wimplicit-function-declaration]

Fixes: ab2a50e7602b ("PCI: tegra: Add support to configure sideband pins")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 09ed8e473cff..f89f5acee72d 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -22,6 +22,7 @@
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/random.h>
-- 
2.20.0
