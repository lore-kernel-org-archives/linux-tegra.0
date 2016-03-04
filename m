From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v10 3/9] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210 support
Date: Fri,  4 Mar 2016 17:19:33 +0100
Message-ID: <1457108379-20794-3-git-send-email-thierry.reding@gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Extend the binding to cover the set of feature found in Tegra210.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   | 327 +++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 8b642d9e3433..8cbfeb60f864 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -35,6 +35,7 @@ Required properties:
 - compatible: Must be:
   - Tegra124: "nvidia,tegra124-xusb-padctl"
   - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
+  - Tegra210: "nvidia,tegra210-xusb-padctl"
 - reg: Physical base address and length of the controller's registers.
 - resets: Must contain an entry for each entry in reset-names.
 - reset-names: Must include the following entries:
@@ -55,6 +56,44 @@ the pad and any of its lanes, this property must be set to "okay".
 For Tegra124 and Tegra132, the following pads exist: usb2, ulpi, hsic, pcie
 and sata. No extra resources are required for operation of these pads.
 
+For Tegra210, the following pads exist: usb2, hsic, pcie and sata. Below is
+a description of the properties of each pad.
+
+UTMI pad:
+---------
+
+Required properties:
+- clocks: Must contain an entry for each entry in clock-names.
+- clock-names: Must contain the following entries:
+  - "trk": phandle and specifier referring to the USB2 tracking clock
+
+HSIC pad:
+---------
+
+Required properties:
+- clocks: Must contain an entry for each entry in clock-names.
+- clock-names: Must contain the following entries:
+  - "trk": phandle and specifier referring to the HSIC tracking clock
+
+PCIe pad:
+---------
+
+Required properties:
+- clocks: Must contain an entry for each entry in clock-names.
+- clock-names: Must contain the following entries:
+  - "pll": phandle and specifier referring to the PLLE
+- resets: Must contain an entry for each entry in reset-names.
+- reset-names: Must contain the following entries:
+  - "phy": reset for the PCIe UPHY block
+
+SATA pad:
+---------
+
+Required properties:
+- resets: Must contain an entry for each entry in reset-names.
+- reset-names: Must contain the following entries:
+  - "phy": reset for the SATA UPHY block
+
 
 PHY nodes:
 ==========
@@ -84,6 +123,16 @@ For Tegra124 and Tegra132, the list of valid PHY nodes is given below:
 - sata: sata-0
   - functions: "usb3-ss", "sata"
 
+For Tegra210, the list of valid PHY nodes is given below:
+- utmi: utmi-0, utmi-1, utmi-2, utmi-3
+  - functions: "snps", "xusb", "uart"
+- hsic: hsic-0, hsic-1
+  - functions: "snps", "xusb"
+- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6
+  - functions: "pcie-x1", "usb3-ss", "pcie-x4"
+- sata: sata-0
+  - functions: "usb3-ss", "sata"
+
 
 Port nodes:
 ===========
@@ -144,6 +193,7 @@ Required properties:
   to map this super-speed USB port to. The range of valid port numbers varies
   with the SoC generation:
   - 0-2: for Tegra124 and Tegra132
+  - 0-3: for Tegra210
 
 Optional properties:
 - nvidia,internal: A boolean property whose presence determines that a port
@@ -157,6 +207,11 @@ ports:
 - 2x HSIC: hsic-0, hsic-1
 - 2x super-speed USB: usb3-0, usb3-1
 
+For Tegra210, the XUSB pad controller exposes the following ports:
+- 4x USB2: usb2-0, usb2-1, usb2-2, usb2-3
+- 2x HSIC: hsic-0, hsic-1
+- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
+
 
 Examples:
 =========
@@ -374,3 +429,275 @@ Board file:
 			};
 		};
 	};
+
+Tegra210:
+---------
+
+SoC include:
+
+	padctl@0,7009f000 {
+		compatible = "nvidia,tegra210-xusb-padctl";
+		reg = <0x0 0x7009f000 0x0 0x1000>;
+		resets = <&tegra_car 142>;
+		reset-names = "padctl";
+
+		status = "disabled";
+
+		pads {
+			usb2 {
+				clocks = <&tegra_car TEGRA210_CLK_USB2_TRK>;
+				clock-names = "trk";
+				status = "disabled";
+
+				usb2-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				usb2-1 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				usb2-2 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				usb2-3 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+
+			hsic {
+				clocks = <&tegra_car TEGRA210_CLK_HSIC_TRK>;
+				clock-names = "trk";
+				status = "disabled";
+
+				hsic-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				hsic-1 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+
+			pcie {
+				clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
+				clock-names = "pll";
+				resets = <&tegra_car 205>;
+				reset-names = "phy";
+				status = "disabled";
+
+				pcie-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-1 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-2 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-3 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-4 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-5 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				pcie-6 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+
+			sata {
+				clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
+				clock-names = "pll";
+				resets = <&tegra_car 204>;
+				reset-names = "phy";
+				status = "disabled";
+
+				sata-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "disabled";
+			};
+
+			usb2-1 {
+				status = "disabled";
+			};
+
+			usb2-2 {
+				status = "disabled";
+			};
+
+			usb2-3 {
+				status = "disabled";
+			};
+
+			hsic-0 {
+				status = "disabled";
+			};
+
+			hsic-1 {
+				status = "disabled";
+			};
+
+			usb3-0 {
+				status = "disabled";
+			};
+
+			usb3-1 {
+				status = "disabled";
+			};
+
+			usb3-2 {
+				status = "disabled";
+			};
+
+			usb3-3 {
+				status = "disabled";
+			};
+		};
+	};
+
+Board file:
+
+	padctl@0,7009f000 {
+		status = "okay";
+
+		pads {
+			usb2 {
+				status = "okay";
+
+				usb2-0 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				usb2-1 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				usb2-2 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				usb2-3 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+			};
+
+			pcie {
+				status = "okay";
+
+				pcie-0 {
+					nvidia,function = "pcie-x1";
+					status = "okay";
+				};
+
+				pcie-1 {
+					nvidia,function = "pcie-x4";
+					status = "okay";
+				};
+
+				pcie-2 {
+					nvidia,function = "pcie-x4";
+					status = "okay";
+				};
+
+				pcie-3 {
+					nvidia,function = "pcie-x4";
+					status = "okay";
+				};
+
+				pcie-4 {
+					nvidia,function = "pcie-x4";
+					status = "okay";
+				};
+
+				pcie-5 {
+					nvidia,function = "usb3-ss";
+					status = "okay";
+				};
+
+				pcie-6 {
+					nvidia,function = "usb3-ss";
+					status = "okay";
+				};
+			};
+
+			sata {
+				status = "okay";
+
+				sata-0 {
+					nvidia,function = "sata";
+					status = "okay";
+				};
+			};
+		};
+
+		ports {
+			usb2-0 {
+				status = "okay";
+				mode = "otg";
+			};
+
+			usb2-1 {
+				status = "okay";
+				vbus-supply = <&vdd_5v0_rtl>;
+				mode = "host";
+			};
+
+			usb2-2 {
+				status = "okay";
+				vbus-supply = <&vdd_usb_vbus>;
+				mode = "host";
+			};
+
+			usb2-3 {
+				status = "okay";
+				mode = "host";
+			};
+
+			usb3-0 {
+				status = "okay";
+				nvidia,lanes = "pcie-6";
+				nvidia,port = <1>;
+			};
+
+			usb3-1 {
+				status = "okay";
+				nvidia,lanes = "pcie-5";
+				nvidia,port = <2>;
+			};
+		};
+	};
-- 
2.7.1
