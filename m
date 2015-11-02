From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [RFC 6/8] Adding binding for XUSB to tegra124 dtsi.
Date: Mon,  2 Nov 2015 11:55:21 +0000
Message-ID: <1446465323-9493-7-git-send-email-martyn.welch@collabora.co.uk>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446465323-9493-1-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>

Adding the binding for the tegra xHCI controller implementation. In
addition to the dtsi entry, adding the defines needed to compile the
binding.

These bindings are based are in part based on the binding documentation
proposed here:

https://www.spinics.net/lists/linux-usb/msg130940.html

As you will see from the patch, I've had to add a few extra entries to get
the driver to load.
---
 arch/arm/boot/dts/tegra124-nyan-big.dts          | 32 ++++++++++++
 arch/arm/boot/dts/tegra124-nyan-blaze.dts        | 62 ++++++++++++++++++++++++
 arch/arm/boot/dts/tegra124-nyan.dtsi             | 47 +++++++++++++++++-
 arch/arm/boot/dts/tegra124.dtsi                  |  3 +-
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h |  7 +++
 5 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 2d21253..a7b2838 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -26,6 +26,38 @@
 		nvidia,model = "GoogleNyanBig";
 	};
 
+
+	padctl@0,7009f000 {
+		pinctrl-0 = <&padctl_default>;
+		pinctrl-names = "default";
+
+		vbus-0-supply = <&vdd_usb1_vbus>;
+		vbus-1-supply = <&vdd_run_cam>;
+		vbus-2-supply = <&vdd_usb3_vbus>;
+
+		padctl_default: pinmux {
+			otg {
+				nvidia,lanes = "otg-0", "otg-1", "otg-2";
+				nvidia,function = "xusb";
+			};
+			usb3 {
+				nvidia,lanes = "pcie-0";
+				nvidia,function = "usb3";
+				nvidia,iddq = <0>;
+				nvidia,usb2-port = <0>;
+				nvidia,usb3-port = <0>;
+			};
+			usb3p1 {
+				nvidia,lanes = "pcie-1";
+				nvidia,function = "usb3";
+				nvidia,iddq = <0>;
+				nvidia,usb2-port = <2>;
+				nvidia,usb3-port = <1>;
+			};
+		};
+	};
+
+
 	pinmux@0,70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_default>;
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
index 0d30c51..cb2bacc 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
@@ -22,6 +22,68 @@
 		nvidia,model = "GoogleNyanBlaze";
 	};
 
+	padctl@0,7009f000 {
+		pinctrl-0 = <&padctl_default>;
+		pinctrl-names = "default";
+
+		vbus-0-supply = <&vdd_usb1_vbus>;
+		vbus-1-supply = <&vdd_run_cam>;
+		vbus-2-supply = <&vdd_usb3_vbus>;
+
+		phys {
+			pcie-0 {
+				status = "disabled";
+			};
+
+			sata-0 {
+				status = "disabled";
+			};
+
+			usb3-0 {
+				status = "ok";
+				nvidia,lanes = "pcie-0";
+				nvidia,function = "usb3";
+				nvidia,port = <0>;
+			};
+
+			usb3-1 {
+				status = "ok";
+				nvidia,lanes = "pcie-1";
+				nvidia,function = "usb3";
+				nvidia,port = <1>;
+			};
+
+			utmi-0 {
+				status = "ok";
+			};
+
+			utmi-1 {
+				status = "ok";
+			};
+
+			utmi-2 {
+				status = "ok";
+			};
+		};
+
+		padctl_default: pinmux {
+/*
+			otg {
+				nvidia,lanes = "otg-0", "otg-1", "otg-2";
+				nvidia,function = "xusb";
+			};
+*/
+			usb3 {
+				nvidia,lanes = "pcie-0";
+				nvidia,function = "usb3";
+				nvidia,iddq = <0>;
+				nvidia,usb2-port = <0>;
+				nvidia,usb3-port = <0>;
+			};
+		};
+
+	};
+
 	pinmux@0,70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_default>;
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index a9aec23..2d2e6b5 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -220,7 +220,7 @@
 					regulator-always-on;
 				};
 
-				ldo0 {
+				avdd_1v05_run: ldo0 {
 					regulator-name = "+1.05V_RUN_AVDD";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
@@ -364,6 +364,51 @@
 		status = "okay";
 	};
 
+	xusb_usb:usb-host@0,70090000 {
+		compatible = "nvidia,tegra124-xusb";
+		reg = <0x0 0x70090000 0x0 0x8000>,
+		      <0x0 0x70099000 0x0 0x1000>,
+		      <0x0 0x70098000 0x0 0x1000>;
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
+			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
+			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
+			 <&tegra_car TEGRA124_CLK_CLK_M>,
+			 <&tegra_car TEGRA124_CLK_PLL_E>;
+		clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
+			      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
+			      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
+			      "clk_m", "pll_e";
+		resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
+		reset-names = "xusb_host", "xusb_ss", "xusb_src";
+		phys = <&padctl TEGRA_XUSB_PADCTL_UTMI_P0>,
+		       <&padctl TEGRA_XUSB_PADCTL_UTMI_P1>,
+		       <&padctl TEGRA_XUSB_PADCTL_UTMI_P2>,
+		       <&padctl TEGRA_XUSB_PADCTL_USB3_P0>,
+		       <&padctl TEGRA_XUSB_PADCTL_USB3_P1>,
+		       <&padctl TEGRA_XUSB_PADCTL_HSIC_P0>,
+		       <&padctl TEGRA_XUSB_PADCTL_HSIC_P1>;
+		phy-names = "utmi-0", "utmi-1", "utmi-2", "usb3-0", "usb3-1", "hsic-0", "hsic-1";
+		mboxes = <&xusb_usb>;
+		mbox-names = "xusb";
+		#mbox-cells = <0>;
+		avddio-pex-supply = <&vdd_1v05_run>;
+		dvddio-pex-supply = <&vdd_1v05_run>;
+		avdd-usb-supply = <&vdd_3v3_lp0>;
+		avdd-pll-utmip-supply = <&vddio_1v8>;
+		avdd-pll-erefe-supply = <&avdd_1v05_run>;
+		avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
+		hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
+		hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
+	};
+
 	sdhci0_pwrseq: sdhci0_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 819e2ae..e2dd4d2 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -653,7 +653,8 @@
 		reg = <0x0 0x7009f000 0x0 0x1000>;
 		resets = <&tegra_car 142>;
 		reset-names = "padctl";
-
+		mboxes = <&xusb_usb>;
+		mbox-names = "xusb";
 		#phy-cells = <1>;
 	};
 
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
index 914d56d..c83a4d4 100644
--- a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
+++ b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
@@ -3,5 +3,12 @@
 
 #define TEGRA_XUSB_PADCTL_PCIE 0
 #define TEGRA_XUSB_PADCTL_SATA 1
+#define TEGRA_XUSB_PADCTL_USB3_P0 2
+#define TEGRA_XUSB_PADCTL_USB3_P1 3
+#define TEGRA_XUSB_PADCTL_UTMI_P0 4
+#define TEGRA_XUSB_PADCTL_UTMI_P1 5
+#define TEGRA_XUSB_PADCTL_UTMI_P2 6
+#define TEGRA_XUSB_PADCTL_HSIC_P0 7
+#define TEGRA_XUSB_PADCTL_HSIC_P1 8
 
 #endif /* _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H */
-- 
2.1.4
