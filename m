From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 6/6] arm64: tegra: Enable XUSB host in P2972-0000 board
Date: Wed, 2 Oct 2019 16:00:51 +0800
Message-ID: <20191002080051.11142-7-jckuo@nvidia.com>
References: <20191002080051.11142-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002080051.11142-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This commit enables XUSB host and pad controller in Tegra194
P2972-0000 board.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 31 +++++++++-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 59 +++++++++++++++++++
 2 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 4c38426a6969..cb236edc6a0d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -229,7 +229,7 @@
 						regulator-max-microvolt = <3300000>;
 					};
 
-					ldo5 {
+					vdd_usb_3v3: ldo5 {
 						regulator-name = "VDD_USB_3V3";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
@@ -313,5 +313,34 @@
 			regulator-boot-on;
 			enable-active-low;
 		};
+
+		vdd_5v_sata: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+
+			regulator-name = "vdd-5v-sata";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 1) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	padctl@3520000 {
+		avdd-usb-supply = <&vdd_usb_3v3>;
+		vclamp-usb-supply = <&vdd_1v8ao>;
+		ports {
+			usb2-1 {
+				vbus-supply = <&vdd_5v0_sys>;
+			};
+			usb2-3 {
+				vbus-supply = <&vdd_5v_sata>;
+			};
+			usb3-0 {
+				vbus-supply = <&vdd_5v0_sys>;
+			};
+			usb3-3 {
+				vbus-supply = <&vdd_5v0_sys>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index d47cd8c4dd24..410221927dfa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -222,4 +222,63 @@
 			};
 		};
 	};
+
+	padctl@3520000 {
+		status = "okay";
+
+		pads {
+			usb2 {
+				lanes {
+					usb2-1 {
+						status = "okay";
+					};
+					usb2-2 {
+						status = "okay";
+					};
+					usb2-3 {
+						status = "okay";
+					};
+				};
+			};
+			usb3 {
+				lanes {
+					usb3-0 {
+						status = "okay";
+					};
+					usb3-3 {
+						status = "okay";
+					};
+				};
+			};
+		};
+
+		ports {
+			usb2-1 {
+				mode = "host";
+				status = "okay";
+			};
+			usb2-3 {
+				mode = "host";
+				status = "okay";
+			};
+			usb3-0 {
+				nvidia,usb2-companion = <1>;
+				status = "okay";
+			};
+			usb3-3 {
+				nvidia,usb2-companion = <3>;
+				nvidia,disable-gen2;
+				status = "okay";
+			};
+		};
+	};
+
+	tegra_xhci: xhci@3610000 {
+		status = "okay";
+		phys =	<&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+			<&{/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+			<&{/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+			<&{/padctl@3520000/pads/usb3/lanes/usb3-3}>;
+		phy-names = "usb2-1", "usb2-3", "usb3-0", "usb3-3";
+	};
 };
-- 
2.17.1
