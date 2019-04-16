From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V3 03/16] PCI: Export pcie_bus_config symbol
Date: Wed, 17 Apr 2019 00:57:17 +0530
Message-ID: <20190416192730.15681-4-vidyas@nvidia.com>
References: <20190416192730.15681-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416192730.15681-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com
Cc: mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Export pcie_bus_config to enable host controller drivers setting it to a
specific configuration be able to build as loadable modules

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
Changes since [v2]:
* None

Changes since [v1]:
* This is a new patch in v2 series

 drivers/pci/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c1b362f599a..c3880af24f18 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -94,6 +94,7 @@ unsigned long pci_hotplug_mem_size = DEFAULT_HOTPLUG_MEM_SIZE;
 unsigned long pci_hotplug_bus_size = DEFAULT_HOTPLUG_BUS_SIZE;
 
 enum pcie_bus_config_types pcie_bus_config = PCIE_BUS_DEFAULT;
+EXPORT_SYMBOL_GPL(pcie_bus_config);
 
 /*
  * The default CLS is used if arch didn't set CLS explicitly and not
-- 
2.17.1
