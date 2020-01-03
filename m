From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH V2 5/5] arm64: tegra: Add support for PCIe endpoint mode in P2972-0000 platform
Date: Fri, 3 Jan 2020 18:14:04 +0530
Message-ID: <20200103124404.20662-6-vidyas@nvidia.com>
References: <20200103124404.20662-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200103124404.20662-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com
Cc: kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Add endpoint mode support for PCIe C5 controller in P2972-0000 platform
with information about supplies, PHY, PERST GPIO and GPIO that controls
PCIe reference clock coming from the host system.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
V2:
* Addressed Thierry's review comments
* Changed 'nvidia,pex-rst-gpio' to 'reset-gpios'
* Added 'nvidia,refclk-select-gpios'

 .../boot/dts/nvidia/tegra194-p2972-0000.dts    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 353a6a22196d..87ae7c6d38e2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -136,6 +136,24 @@
 			    "p2u-5", "p2u-6", "p2u-7";
 	};
 
+	pcie_ep@141a0000 {
+		status = "disabled";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		reset-gpios = <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
+
+		nvidia,refclk-select-gpios = <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
+					      GPIO_ACTIVE_HIGH>;
+
+		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+
+		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+			    "p2u-5", "p2u-6", "p2u-7";
+	};
+
 	fan: fan {
 		compatible = "pwm-fan";
 		pwms = <&pwm4 0 45334>;
-- 
2.17.1
