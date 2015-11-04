From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210 support
Date: Wed,  4 Nov 2015 18:11:49 +0100
Message-ID: <1446657109-15568-3-git-send-email-thierry.reding@gmail.com>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446657109-15568-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Extend the binding to cover the set of feature found in Tegra210.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/phy/nvidia,tegra-xusb-padctl.txt      | 330 +++++++++++++++++++++
 1 file changed, 330 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
index 026e924ae54a..e7d7400bc981 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
@@ -22,6 +22,7 @@ Required properties:
 --------------------
 - compatible: Must be:
   - "nvidia,tegra124-xusb-padctl": for Tegra124 and Tegra132
+  - "nvidia,tegra210-xusb-padctl": for Tegra210
 - reg: Physical base address and length of the controller's registers.
 - resets: Must contain an entry for each entry in reset-names.
 - reset-names: Must include the following entries:
@@ -45,6 +46,44 @@ the pad and any of its lanes, this property must be set to "okay".
 For Tegra124 and Tegra132, the following pads exist: utmi, ulpi, hsic, pcie
 and sata. No extra resources are required for operation of these pads.
 
+For Tegra210, the following pads exist: utmi, hsic, pcie and sata. Below is
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
@@ -74,6 +113,17 @@ For Tegra124 and Tegra132, the list of valid PHY nodes is given below:
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
+
 Port nodes:
 ===========
 
@@ -129,6 +179,7 @@ Required properties:
   this super-speed USB port to. The range of valid port numbers varies with
   the SoC generation:
   - 0-2: for Tegra124 and Tegra132
+  - 0-3: for Tegra210
 
 Optional properties:
 - nvidia,internal: A boolean property whose presence determines that a port
@@ -142,6 +193,11 @@ ports:
 - 2x HSIC: hsic-0, hsic-1
 - 2x super-speed USB: usb3-0, usb3-1
 
+For Tegra210, the XUSB pad controller exposes the following ports:
+- 4x UTMI: utmi-0, utmi-1, utmi-2, utmi-3
+- 2x HSIC: hsic-0, hsic-1
+- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
+
 
 Examples:
 =========
@@ -357,3 +413,277 @@ Board file:
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
+		mboxes = <&xusb_mbox>;
+		mbox-names = "xusb";
+
+		status = "disabled";
+
+		pads {
+			utmi {
+				clocks = <&tegra_car TEGRA210_CLK_USB2_TRK>;
+				clock-names = "trk";
+				status = "disabled";
+
+				utmi-0 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				utmi-1 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				utmi-2 {
+					status = "disabled";
+					#phy-cells = <0>;
+				};
+
+				utmi-3 {
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
+			utmi-0 {
+				status = "disabled";
+			};
+
+			utmi-1 {
+				status = "disabled";
+			};
+
+			utmi-2 {
+				status = "disabled";
+			};
+
+			utmi-3 {
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
+			utmi {
+				status = "okay";
+
+				utmi-0 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				utmi-1 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				utmi-2 {
+					nvidia,function = "xusb";
+					status = "okay";
+				};
+
+				utmi-3 {
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
+			utmi-0 {
+				status = "okay";
+				mode = "otg";
+			};
+
+			utmi-1 {
+				status = "okay";
+				vbus-supply = <&vdd_5v0_rtl>;
+				mode = "host";
+			};
+
+			utmi-2 {
+				status = "okay";
+				vbus-supply = <&vdd_usb_vbus>;
+				mode = "host";
+			};
+
+			utmi-3 {
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
2.5.0
