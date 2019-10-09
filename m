From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v4 5/5] arm64: tegra: Enable XUSB host in P2972-0000 board
Date: Wed, 9 Oct 2019 10:43:43 +0800
Message-ID: <20191009024343.30218-6-jckuo@nvidia.com>
References: <20191009024343.30218-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009024343.30218-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This commit enables XUSB host and pad controller in Tegra194
P2972-0000 board.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
Changes in v4: none
Changes in v3: none
Changes in v2:
- use capitalization of regulator names
- fix gpio property of VDD_5V_SATA regulator

 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 36 ++++++++++-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 62 +++++++++++++++++++
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 4c38426a6969..e7d5e8a30f93 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -66,6 +66,29 @@
 			vmmc-supply = <&vdd_emmc_3v3>;
 		};
 
+		padctl@3520000 {
+			avdd-usb-supply = <&vdd_usb_3v3>;
+			vclamp-usb-supply = <&vdd_1v8ao>;
+
+			ports {
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v_sata>;
+				};
+
+				usb3-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb3-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+
 		rtc@c2a0000 {
 			status = "okay";
 		};
@@ -229,7 +252,7 @@
 						regulator-max-microvolt = <3300000>;
 					};
 
-					ldo5 {
+					vdd_usb_3v3: ldo5 {
 						regulator-name = "VDD_USB_3V3";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
@@ -313,5 +336,16 @@
 			regulator-boot-on;
 			enable-active-low;
 		};
+
+		vdd_5v_sata: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+
+			regulator-name = "VDD_5V_SATA";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index d47cd8c4dd24..b60eef64c487 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -62,6 +62,68 @@
 							 GPIO_ACTIVE_LOW>;
 			};
 		};
+		padctl@3520000 {
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-1 {
+							status = "okay";
+						};
+
+						usb2-3 {
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							status = "okay";
+						};
+
+						usb3-3 {
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-3 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb3-0 {
+					nvidia,usb2-companion = <1>;
+					status = "okay";
+				};
+
+				usb3-3 {
+					nvidia,usb2-companion = <3>;
+					nvidia,disable-gen2;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys =	<&{/cbb/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/cbb/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+				<&{/cbb/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+				<&{/cbb/padctl@3520000/pads/usb3/lanes/usb3-3}>;
+			phy-names = "usb2-1", "usb2-3", "usb3-0", "usb3-3";
+		};
 	};
 
 	pcie@14100000 {
-- 
2.17.1
