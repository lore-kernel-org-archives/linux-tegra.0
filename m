From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 08/37] ARM: tegra: colibri_t20: regulator clean-up
Date: Sun,  2 Sep 2018 12:08:37 +0200
Message-ID: <20180902100906.25792-9-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Just cosmetic regulator clean-up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts |  20 ++--
 arch/arm/boot/dts/tegra20-colibri.dtsi     | 147 +++++++++++------------------
 2 files changed, 66 insertions(+), 101 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 3d430fa93e8c..6f89a417b0f2 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -104,16 +104,14 @@
 		no-1-8-v;
 	};
 
-	regulators {
-		regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "usb_host_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-boot-on;
-			regulator-always-on;
-			gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
-		};
+	/* USBH_PEN resp. USB_P_EN */
+	reg_usbh_vbus: regulator-usbh-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_USB1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index c060b58cb490..1cf64f197c08 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -19,8 +19,8 @@
 			nvidia,ddc-i2c-bus = <&i2c_ddc>;
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			pll-supply = <&hdmi_pll_reg>;
-			vdd-supply = <&hdmi_vdd_reg>;
+			pll-supply = <&reg_1v8_avdd_hdmi_pll>;
+			vdd-supply = <&reg_3v3_avdd_hdmi>;
 		};
 	};
 
@@ -260,49 +260,38 @@
 			#gpio-cells = <2>;
 			gpio-controller;
 
-			sys-supply = <&vdd_3v3_reg>;
-			vin-sm0-supply = <&sys_reg>;
-			vin-sm1-supply = <&sys_reg>;
-			vin-sm2-supply = <&sys_reg>;
-			vinldo01-supply = <&sm2_reg>;
-			vinldo23-supply = <&vdd_3v3_reg>;
-			vinldo4-supply = <&vdd_3v3_reg>;
-			vinldo678-supply = <&vdd_3v3_reg>;
-			vinldo9-supply = <&vdd_3v3_reg>;
+			sys-supply = <&reg_module_3v3>;
+			vin-sm0-supply = <&reg_3v3_vsys>;
+			vin-sm1-supply = <&reg_3v3_vsys>;
+			vin-sm2-supply = <&reg_3v3_vsys>;
+			vinldo01-supply = <&reg_1v8_vdd_ddr2>;
+			vinldo23-supply = <&reg_module_3v3>;
+			vinldo4-supply = <&reg_module_3v3>;
+			vinldo678-supply = <&reg_module_3v3>;
+			vinldo9-supply = <&reg_module_3v3>;
 
 			regulators {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				sys_reg: regulator@0 {
-					reg = <0>;
-					regulator-compatible = "sys";
-					regulator-name = "vdd_sys";
+				reg_3v3_vsys: sys {
+					regulator-name = "VSYS_3.3V";
 					regulator-always-on;
 				};
 
-				regulator@1 {
-					reg = <1>;
-					regulator-compatible = "sm0";
-					regulator-name = "vdd_sm0,vdd_core";
+				sm0 {
+					regulator-name = "VDD_CORE_1.2V";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 					regulator-always-on;
 				};
 
-				regulator@2 {
-					reg = <2>;
-					regulator-compatible = "sm1";
-					regulator-name = "vdd_sm1,vdd_cpu";
+				sm1 {
+					regulator-name = "VDD_CPU_1.0V";
 					regulator-min-microvolt = <1000000>;
 					regulator-max-microvolt = <1000000>;
 					regulator-always-on;
 				};
 
-				sm2_reg: regulator@3 {
-					reg = <3>;
-					regulator-compatible = "sm2";
-					regulator-name = "vdd_sm2,vin_ldo*";
+				reg_1v8_vdd_ddr2: sm2 {
+					regulator-name = "VDD_DDR2_1.8V";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 					regulator-always-on;
@@ -310,80 +299,68 @@
 
 				/* LDO0 is not connected to anything */
 
-				regulator@5 {
-					reg = <5>;
-					regulator-compatible = "ldo1";
-					regulator-name = "vdd_ldo1,avdd_pll*";
+				/*
+				 * +3.3V_ENABLE_N switching via FET:
+				 * AVDD_AUDIO_S and +3.3V
+				 * see also +3.3V fixed supply
+				 */
+				ldo1 {
+					regulator-name = "AVDD_PLL_1.1V";
 					regulator-min-microvolt = <1100000>;
 					regulator-max-microvolt = <1100000>;
 					regulator-always-on;
 				};
 
-				regulator@6 {
-					reg = <6>;
-					regulator-compatible = "ldo2";
-					regulator-name = "vdd_ldo2,vdd_rtc";
+				ldo2 {
+					regulator-name = "VDD_RTC_1.2V";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 				};
 
 				/* LDO3 is not connected to anything */
 
-				regulator@8 {
-					reg = <8>;
-					regulator-compatible = "ldo4";
-					regulator-name = "vdd_ldo4,avdd_osc,vddio_sys";
+				ldo4 {
+					regulator-name = "VDDIO_SYS_1.8V";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 					regulator-always-on;
 				};
 
-				ldo5_reg: regulator@9 {
-					reg = <9>;
-					regulator-compatible = "ldo5";
-					regulator-name = "vdd_ldo5,vdd_fuse";
+				/* Switched via FET from regular +3.3V */
+				ldo5 {
+					regulator-name = "+3.3V_USB";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-always-on;
 				};
 
-				regulator@10 {
-					reg = <10>;
-					regulator-compatible = "ldo6";
-					regulator-name = "vdd_ldo6,avdd_vdac,vddio_vi,vddio_cam";
+				ldo6 {
+					regulator-name = "AVDD_VDAC_2.85V";
 					regulator-min-microvolt = <2850000>;
 					regulator-max-microvolt = <2850000>;
 				};
 
-				hdmi_vdd_reg: regulator@11 {
-					reg = <11>;
-					regulator-compatible = "ldo7";
-					regulator-name = "vdd_ldo7,avdd_hdmi";
+				reg_3v3_avdd_hdmi: ldo7 {
+					regulator-name = "AVDD_HDMI_3.3V";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 				};
 
-				hdmi_pll_reg: regulator@12 {
-					reg = <12>;
-					regulator-compatible = "ldo8";
-					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
+				reg_1v8_avdd_hdmi_pll: ldo8 {
+					regulator-name = "AVDD_HDMI_PLL_1.8V";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 				};
 
-				regulator@13 {
-					reg = <13>;
-					regulator-compatible = "ldo9";
-					regulator-name = "vdd_ldo9,avdd_2v85,vdd_ddr_rx";
+				ldo9 {
+					regulator-name = "VDDIO_RX_DDR_2.85V";
 					regulator-min-microvolt = <2850000>;
 					regulator-max-microvolt = <2850000>;
 					regulator-always-on;
 				};
 
-				regulator@14 {
-					reg = <14>;
-					regulator-compatible = "ldo_rtc";
-					regulator-name = "vdd_rtc_out,vdd_cell";
+				ldo_rtc {
+					regulator-name = "VCC_BATT";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-always-on;
@@ -513,31 +490,21 @@
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd_3v3_reg: regulator@100 {
-			compatible = "regulator-fixed";
-			reg = <100>;
-			regulator-name = "vdd_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_lan_v_bus: regulator-lan-v-bus {
+		compatible = "regulator-fixed";
+		regulator-name = "LAN_V_BUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio TEGRA_GPIO(BB, 1) GPIO_ACTIVE_HIGH>;
+	};
 
-		regulator@101 {
-			compatible = "regulator-fixed";
-			reg = <101>;
-			regulator-name = "internal_usb";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			regulator-boot-on;
-			regulator-always-on;
-			gpio = <&gpio TEGRA_GPIO(BB, 1) GPIO_ACTIVE_HIGH>;
-		};
+	reg_module_3v3: regulator-module-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 	};
 
 	sound {
-- 
2.14.4
