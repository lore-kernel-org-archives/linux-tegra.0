From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2 -next] PCI: tegra: Add missing include file
Date: Fri, 20 Sep 2019 18:39:25 +0800
Message-ID: <20190920103925.34404-1-yuehaibing@huawei.com>
References: <20190920014807.38288-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920014807.38288-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, andrew.murray@arm.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, vidyas@nvidia.com, yuehaibing@huawei.com, treding@nvidia.com
Cc: linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fix build error without CONFIG_PINCTRL

drivers/pci/controller/dwc/pcie-tegra194.c: In function tegra_pcie_config_rp:
drivers/pci/controller/dwc/pcie-tegra194.c:1394:8: error: implicit declaration of function pinctrl_pm_select_default_state;
 did you mean prandom_seed_full_state? [-Werror=implicit-function-declaration]
  ret = pinctrl_pm_select_default_state(dev);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        prandom_seed_full_state

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: ab2a50e7602b ("PCI: tegra: Add support to configure sideband pins")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Vidya Sagar <vidyas@nvidia.com>
---
v2: keep alphabetical order
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 09ed8e4..f89f5ac 100644
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
2.7.4
