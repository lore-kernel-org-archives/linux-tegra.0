From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 5/6] arm64: tegra: Enable XUSB on P2771
Date: Mon,  1 Apr 2019 12:40:49 +0200
Message-ID: <20190401104050.31355-6-thierry.reding@gmail.com>
References: <20190401104050.31355-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401104050.31355-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable the relevant pads for XUSB support on P2771-0000 and hook up the
USB supply voltage regulators to the ports.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   | 115 ++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  19 ++-
 2 files changed, 130 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 31457f32e4d0..75ee6cf1e1b4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -58,6 +58,93 @@
 		status = "okay";
 	};
 
+	padctl@3520000 {
+		status = "okay";
+
+		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
+		avdd-usb-supply = <&vdd_3v3_sys>;
+		dvdd-pex-supply = <&vdd_pex>;
+		dvdd-pex-pll-supply = <&vdd_pex>;
+		hvdd-pex-supply = <&vdd_1v8>;
+		hvdd-pex-pll-supply = <&vdd_1v8>;
+		vclamp-usb-supply = <&vdd_1v8>;
+		vddio-hsic-supply = <&gnd>;
+
+		pads {
+			usb2 {
+				status = "okay";
+
+				lanes {
+					usb2-0 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-1 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb2-2 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+				};
+			};
+
+			usb3 {
+				status = "okay";
+
+				lanes {
+					usb3-0 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb3-1 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+
+					usb3-2 {
+						nvidia,function = "xusb";
+						status = "okay";
+					};
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "okay";
+				mode = "otg";
+
+				vbus-supply = <&vdd_usb0>;
+			};
+
+			usb2-1 {
+				status = "okay";
+				mode = "host";
+
+				vbus-supply = <&vdd_usb1>;
+			};
+
+			usb3-0 {
+				nvidia,usb2-companion = <1>;
+				status = "okay";
+			};
+		};
+	};
+
+	usb@3530000 {
+		status = "okay";
+
+		phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+		       <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+		       <&{/padctl@3520000/pads/usb3/lanes/usb3-0}>;
+		phy-names = "usb2-0", "usb2-1", "usb3-0";
+	};
+
 	pcie@10003000 {
 		status = "okay";
 
@@ -182,5 +269,33 @@
 
 			vin-supply = <&vdd_5v0_sys>;
 		};
+
+		vdd_usb0: regulator@102 {
+			compatible = "regulator-fixed";
+			reg = <102>;
+
+			regulator-name = "VDD_USB0";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+
+			gpio = <&gpio TEGRA_MAIN_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
+		vdd_usb1: regulator@103 {
+			compatible = "regulator-fixed";
+			reg = <103>;
+
+			regulator-name = "VDD_USB1";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+
+			gpio = <&gpio TEGRA_MAIN_GPIO(L, 5) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+
+			vin-supply = <&vdd_5v0_sys>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 89a2da46efae..952062f0b9a9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -291,7 +291,7 @@
 						regulator-boot-on;
 					};
 
-					ldo0 {
+					vdd_1v8_pll: ldo0 {
 						regulator-name = "VDD_1V8_AP_PLL";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
@@ -360,10 +360,21 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		vdd_5v0_sys: regulator@0 {
+		gnd: regulator@0 {
 			compatible = "regulator-fixed";
 			reg = <0>;
 
+			regulator-name = "GND";
+			regulator-min-microvolt = <0>;
+			regulator-max-microvolt = <0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_5v0_sys: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+
 			regulator-name = "VDD_5V0_SYS";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
@@ -371,9 +382,9 @@
 			regulator-boot-on;
 		};
 
-		vdd_1v8_ap: regulator@1 {
+		vdd_1v8_ap: regulator@2 {
 			compatible = "regulator-fixed";
-			reg = <1>;
+			reg = <2>;
 
 			regulator-name = "VDD_1V8_AP";
 			regulator-min-microvolt = <1800000>;
-- 
2.21.0
