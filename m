From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH] arm64: tegra: Add INA3221 channel info for Jetson TX2
Date: Mon, 17 Jun 2019 15:16:59 -0700
Message-ID: <20190617221659.25366-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There are four INA3221 chips on the Jetson TX2 (p3310 + p2771).
And each INA3221 chip has three input channels to monitor power.

So this patch adds these 12 channels to the DT of Jetson TX2, by
following the DT binding of INA3221 and official documents from
https://developer.nvidia.com/embedded/downloads

tegra186-p3310:
https://developer.nvidia.com/embedded/dlc/jetson-tx2-series-modules-oem-product-design-guide

tegra186-p2771-0000:
http://developer.nvidia.com/embedded/dlc/jetson-tx1-tx2-developer-kit-carrier-board-spec-20180618

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   | 40 +++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 40 +++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index ab6648c72ad5..9df4782c90f3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -14,11 +14,51 @@
 		power-monitor@42 {
 			compatible = "ti,ina3221";
 			reg = <0x42>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0x0>;
+				label = "VDD_MUX";
+				shunt-resistor-micro-ohms = <20000>;
+			};
+
+			channel@1 {
+				reg = <0x1>;
+				label = "VDD_5V0_IO_SYS";
+				shunt-resistor-micro-ohms = <5000>;
+			};
+
+			channel@2 {
+				reg = <0x2>;
+				label = "VDD_3V3_SYS";
+				shunt-resistor-micro-ohms = <10000>;
+			};
 		};
 
 		power-monitor@43 {
 			compatible = "ti,ina3221";
 			reg = <0x43>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0x0>;
+				label = "VDD_3V3_IO_SLP";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			channel@1 {
+				reg = <0x1>;
+				label = "VDD_1V8_IO";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			channel@2 {
+				reg = <0x2>;
+				label = "VDD_M2_IN";
+				shunt-resistor-micro-ohms = <10000>;
+			};
 		};
 
 		exp1: gpio@74 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 4bbee83d9943..5e18acf5cfad 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -67,11 +67,51 @@
 		power-monitor@40 {
 			compatible = "ti,ina3221";
 			reg = <0x40>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0x0>;
+				label = "VDD_SYS_GPU";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			channel@1 {
+				reg = <0x1>;
+				label = "VDD_SYS_SOC";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			channel@2 {
+				reg = <0x2>;
+				label = "VDD_3V8_WIFI";
+				shunt-resistor-micro-ohms = <10000>;
+			};
 		};
 
 		power-monitor@41 {
 			compatible = "ti,ina3221";
 			reg = <0x41>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0x0>;
+				label = "VDD_IN";
+				shunt-resistor-micro-ohms = <5000>;
+			};
+
+			channel@1 {
+				reg = <0x1>;
+				label = "VDD_SYS_CPU";
+				shunt-resistor-micro-ohms = <10000>;
+			};
+
+			channel@2 {
+				reg = <0x2>;
+				label = "VDD_5V0_DDR";
+				shunt-resistor-micro-ohms = <10000>;
+			};
 		};
 	};
 
-- 
2.17.1
