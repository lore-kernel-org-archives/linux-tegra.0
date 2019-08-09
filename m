From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V15 06/13] PCI: dwc: Export dw_pcie_wait_for_link() API
Date: Fri, 9 Aug 2019 10:16:02 +0530
Message-ID: <20190809044609.20401-7-vidyas@nvidia.com>
References: <20190809044609.20401-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809044609.20401-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com
Cc: digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Export dw_pcie_wait_for_link() API to be able to build drivers using
this API as loadable modules (Ex:- Tegra194 PCIe host controller driver).

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
V15:
* None

V14:
* This is a new patch in V14 series.

 drivers/pci/controller/dwc/pcie-designware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 181449e342f1..1d87e823de21 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -460,6 +460,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
 
 	return -ETIMEDOUT;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_wait_for_link);
 
 int dw_pcie_link_up(struct dw_pcie *pci)
 {
-- 
2.17.1
