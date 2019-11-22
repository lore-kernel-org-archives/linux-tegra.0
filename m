From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 6/6] arm64: tegra: Add support for PCIe endpoint mode in P2972-0000 platform
Date: Fri, 22 Nov 2019 16:15:05 +0530
Message-ID: <20191122104505.8986-7-vidyas@nvidia.com>
References: <20191122104505.8986-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191122104505.8986-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com
Cc: kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Add endpoint mode support for PCIe C5 controller in P2972-0000 platform
with information about supplies, PHY, PERST GPIO and GPIO that controls
PCIe reference clock coming from the host system.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 7eb64b816e08..58c3a9677bc8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -43,6 +43,19 @@
 
 		gpio@c2f0000 {
 			status = "okay";
+			/*
+			 * Change the below node's status to 'okay' when
+			 * PCIe C5 controller is enabled to operate in endpoint
+			 * to allow REFCLK from the host system to flow into
+			 * the controller.
+			 */
+			pex-refclk-sel-high {
+				gpio-hog;
+				output-high;
+				gpios = <TEGRA194_AON_GPIO(AA, 5) 0>;
+				label = "pex_refclk_sel_high";
+				status = "disabled";
+			};
 		};
 
 		pwm@c340000 {
@@ -144,6 +157,22 @@
 			    "p2u-5", "p2u-6", "p2u-7";
 	};
 
+	pcie_ep@141a0000 {
+		status = "disabled";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		nvidia,pex-rst-gpio = <&gpio TEGRA194_MAIN_GPIO(GG, 1)
+					GPIO_ACTIVE_LOW>;
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
