From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 1/2] PCI: tegra: Fix CLKREQ dependency programming
Date: Sat, 5 Oct 2019 22:12:11 +0530
Message-ID: <20191005164212.3646-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Corrects the programming to provide REFCLK to the downstream device
when there is no CLKREQ sideband signal routing present from root port
to the endpont.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f89f5acee72d..cbe95f0ea0ca 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -40,8 +40,6 @@
 #define APPL_PINMUX_CLKREQ_OVERRIDE		BIT(3)
 #define APPL_PINMUX_CLK_OUTPUT_IN_OVERRIDE_EN	BIT(4)
 #define APPL_PINMUX_CLK_OUTPUT_IN_OVERRIDE	BIT(5)
-#define APPL_PINMUX_CLKREQ_OUT_OVRD_EN		BIT(9)
-#define APPL_PINMUX_CLKREQ_OUT_OVRD		BIT(10)
 
 #define APPL_CTRL				0x4
 #define APPL_CTRL_SYS_PRE_DET_STATE		BIT(6)
@@ -1193,8 +1191,8 @@ static int tegra_pcie_config_controller(struct tegra_pcie_dw *pcie,
 
 	if (!pcie->supports_clkreq) {
 		val = appl_readl(pcie, APPL_PINMUX);
-		val |= APPL_PINMUX_CLKREQ_OUT_OVRD_EN;
-		val |= APPL_PINMUX_CLKREQ_OUT_OVRD;
+		val |= APPL_PINMUX_CLKREQ_OVERRIDE_EN;
+		val &= ~APPL_PINMUX_CLKREQ_OVERRIDE;
 		appl_writel(pcie, val, APPL_PINMUX);
 	}
 
-- 
2.17.1
