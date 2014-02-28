From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 01/10] ARM: tegra: Overhaul Venice2 regulators
Date: Fri, 28 Feb 2014 17:40:20 +0100
Message-ID: <1393605629-30514-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some of the regulators and the relationships to other regulators are
wrong. This commit attempts to rectify this by making them more similar
to what the schematics contain. This starts by adding a +VDD_MUX supply
that represents the 12V input and derives the main +3.3V_SYS and +5V_SYS
supplies from that. The majority of the other regulators derive from one
of those three.

While at it, rename the regulators to match the names in the schematics
to make them easier to match up.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- make the two +1.35V_LP0 regulator names unique by adding the PMIC
  output as suffix
- mark +1.05V_RUN as not always on since it isn't used and to prevent
  it from being shorted to ground when PMU_REGEN3 is pulled low

Changes in v2:
- rename as3722_sd2 label to vdd_1v35_lp0 and as3722_sd5 label to vddio_1v8
- rename sd0 regulator from +VDD_CPU to +VDD_CPU_AP to match schematics
- rename sd6 regulator from +VDD_GPU to +VDD_GPU_AP to match schematics
- change polarity of GPIO K.01 from low to high for regulator +5V_VDD_TS_SW
- rename +3.3V_AVDD_HDMI regulator to +3.3V_AVDD_HDMI_AP_GATED
- make +3.3V_RUN regulator controlled by PMU_REGEN3
- add +3.3V_LP0 regulator (controlled by PMU_REGEN1), marking it as always
  on because it supplies the USB VBUS pins and we don't have a supply
  input for those yet

 arch/arm/boot/dts/tegra124-venice2.dts | 171 +++++++++++++++++++--------------
 1 file changed, 98 insertions(+), 73 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index c950c76185d2..cedf06416266 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -644,19 +644,19 @@
 			};
 
 			regulators {
-				vsup-sd2-supply = <&vdd_ac_bat_reg>;
-				vsup-sd3-supply = <&vdd_ac_bat_reg>;
-				vsup-sd4-supply = <&vdd_ac_bat_reg>;
-				vsup-sd5-supply = <&vdd_ac_bat_reg>;
-				vin-ldo0-supply = <&as3722_sd2>;
-				vin-ldo1-6-supply = <&vdd_ac_bat_reg>;
-				vin-ldo2-5-7-supply = <&as3722_sd5>;
-				vin-ldo3-4-supply = <&vdd_ac_bat_reg>;
-				vin-ldo9-10-supply = <&vdd_ac_bat_reg>;
-				vin-ldo11-supply = <&vdd_ac_bat_reg>;
+				vsup-sd2-supply = <&vdd_5v0_sys>;
+				vsup-sd3-supply = <&vdd_5v0_sys>;
+				vsup-sd4-supply = <&vdd_5v0_sys>;
+				vsup-sd5-supply = <&vdd_5v0_sys>;
+				vin-ldo0-supply = <&vdd_1v35_lp0>;
+				vin-ldo1-6-supply = <&vdd_3v3_run>;
+				vin-ldo2-5-7-supply = <&vddio_1v8>;
+				vin-ldo3-4-supply = <&vdd_3v3_sys>;
+				vin-ldo9-10-supply = <&vdd_5v0_sys>;
+				vin-ldo11-supply = <&vdd_3v3_run>;
 
 				sd0 {
-					regulator-name = "vdd-cpu";
+					regulator-name = "+VDD_CPU_AP";
 					regulator-min-microvolt = <700000>;
 					regulator-max-microvolt = <1400000>;
 					regulator-min-microamp = <3500000>;
@@ -667,7 +667,7 @@
 				};
 
 				sd1 {
-					regulator-name = "vdd-core";
+					regulator-name = "+VDD_CORE";
 					regulator-min-microvolt = <700000>;
 					regulator-max-microvolt = <1350000>;
 					regulator-min-microamp = <2500000>;
@@ -677,8 +677,8 @@
 					ams,external-control = <1>;
 				};
 
-				as3722_sd2: sd2 {
-					regulator-name = "vddio-ddr";
+				vdd_1v35_lp0: sd2 {
+					regulator-name = "+1.35V_LP0(sd2)";
 					regulator-min-microvolt = <1350000>;
 					regulator-max-microvolt = <1350000>;
 					regulator-always-on;
@@ -686,7 +686,7 @@
 				};
 
 				sd3 {
-					regulator-name = "vddio-ddr-2phase";
+					regulator-name = "+1.35V_LP0(sd3)";
 					regulator-min-microvolt = <1350000>;
 					regulator-max-microvolt = <1350000>;
 					regulator-always-on;
@@ -694,15 +694,13 @@
 				};
 
 				sd4 {
-					regulator-name = "avdd-pex-sata";
+					regulator-name = "+1.05V_RUN";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
-					regulator-boot-on;
-					regulator-always-on;
 				};
 
-				as3722_sd5: sd5 {
-					regulator-name = "vddio-sys";
+				vddio_1v8: sd5 {
+					regulator-name = "+1.8V_VDDIO";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 					regulator-boot-on;
@@ -710,7 +708,7 @@
 				};
 
 				sd6 {
-					regulator-name = "vdd-gpu";
+					regulator-name = "+VDD_GPU_AP";
 					regulator-min-microvolt = <650000>;
 					regulator-max-microvolt = <1200000>;
 					regulator-min-microamp = <3500000>;
@@ -720,7 +718,7 @@
 				};
 
 				ldo0 {
-					regulator-name = "avdd_pll";
+					regulator-name = "+1.05V_RUN_AVDD";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
 					regulator-boot-on;
@@ -729,13 +727,13 @@
 				};
 
 				ldo1 {
-					regulator-name = "run-cam-1.8";
+					regulator-name = "+1.8V_RUN_CAM";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 				};
 
 				ldo2 {
-					regulator-name = "gen-avdd,vddio-hsic";
+					regulator-name = "+1.2V_GEN_AVDD";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 					regulator-boot-on;
@@ -743,7 +741,7 @@
 				};
 
 				ldo3 {
-					regulator-name = "vdd-rtc";
+					regulator-name = "+1.00V_LP0_VDD_RTC";
 					regulator-min-microvolt = <1000000>;
 					regulator-max-microvolt = <1000000>;
 					regulator-boot-on;
@@ -752,21 +750,19 @@
 				};
 
 				ldo4 {
-					regulator-name = "vdd-cam";
+					regulator-name = "+3.3V_RUN_CAM";
 					regulator-min-microvolt = <2800000>;
 					regulator-max-microvolt = <2800000>;
-					regulator-boot-on;
-					regulator-always-on;
 				};
 
 				ldo5 {
-					regulator-name = "vdd-cam-front";
+					regulator-name = "+1.2V_RUN_CAM_FRONT";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 				};
 
 				ldo6 {
-					regulator-name = "vddio-sdmmc3";
+					regulator-name = "+VDDIO_SDMMC3";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-boot-on;
@@ -774,25 +770,25 @@
 				};
 
 				ldo7 {
-					regulator-name = "vdd-cam-rear";
+					regulator-name = "+1.05V_RUN_CAM_REAR";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
 				};
 
 				ldo9 {
-					regulator-name = "vdd-touch";
+					regulator-name = "+2.8V_RUN_TOUCH";
 					regulator-min-microvolt = <2800000>;
 					regulator-max-microvolt = <2800000>;
 				};
 
 				ldo10 {
-					regulator-name = "vdd-cam-af";
+					regulator-name = "+2.8V_RUN_CAM_AF";
 					regulator-min-microvolt = <2800000>;
 					regulator-max-microvolt = <2800000>;
 				};
 
 				ldo11 {
-					regulator-name = "vpp-fuse";
+					regulator-name = "+1.8V_RUN_VPP_FUSE";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 				};
@@ -975,99 +971,128 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		vdd_ac_bat_reg: regulator@0 {
+		vdd_mux: regulator@0 {
 			compatible = "regulator-fixed";
 			reg = <0>;
-			regulator-name = "vdd_ac_bat";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+			regulator-name = "+VDD_MUX";
+			regulator-min-microvolt = <12000000>;
+			regulator-max-microvolt = <12000000>;
 			regulator-always-on;
+			regulator-boot-on;
 		};
 
-		vdd_3v3_reg: regulator@1 {
+		vdd_5v0_sys: regulator@1 {
 			compatible = "regulator-fixed";
 			reg = <1>;
-			regulator-name = "vdd_3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
+			regulator-name = "+5V_SYS";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
 			regulator-always-on;
 			regulator-boot-on;
-			enable-active-high;
-			gpio = <&as3722 1 GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_mux>;
 		};
 
-		vdd_3v3_modem_reg: regulator@2 {
+		vdd_3v3_sys: regulator@2 {
 			compatible = "regulator-fixed";
 			reg = <2>;
-			regulator-name = "vdd-modem-3v3";
+			regulator-name = "+3.3V_SYS";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
-			enable-active-high;
-			gpio = <&as3722 2 GPIO_ACTIVE_HIGH>;
+			regulator-always-on;
+			regulator-boot-on;
+			vin-supply = <&vdd_mux>;
 		};
 
-		vdd_hdmi_5v0_reg: regulator@3 {
+		vdd_3v3_run: regulator@3 {
 			compatible = "regulator-fixed";
 			reg = <3>;
-			regulator-name = "vdd-hdmi-5v0";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+			regulator-name = "+3.3V_RUN";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&as3722 1 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_3v3_sys>;
 		};
 
-		vdd_bl_reg: regulator@4 {
+		vdd_3v3_hdmi: regulator@4 {
 			compatible = "regulator-fixed";
 			reg = <4>;
-			regulator-name = "vdd-bl";
+			regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_LOW>;
+			vin-supply = <&vdd_3v3_run>;
 		};
 
-		vdd_ts_sw_5v0: regulator@5 {
+		vdd_led: regulator@5 {
 			compatible = "regulator-fixed";
 			reg = <5>;
-			regulator-name = "vdd_ts_sw";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
+			regulator-name = "+VDD_LED";
+			gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
 			enable-active-high;
-			regulator-boot-on;
-			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_LOW>;
+			vin-supply = <&vdd_mux>;
 		};
 
-		usb1_vbus_reg: regulator@6 {
+		vdd_5v0_ts: regulator@6 {
 			compatible = "regulator-fixed";
 			reg = <6>;
-			regulator-name = "usb1_vbus";
+			regulator-name = "+5V_VDD_TS_SW";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
 			regulator-boot-on;
+			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
 			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
-			gpio-open-drain;
+			vin-supply = <&vdd_5v0_sys>;
 		};
 
-		usb3_vbus_reg: regulator@7 {
+		vdd_usb1_vbus: regulator@7 {
 			compatible = "regulator-fixed";
 			reg = <7>;
-			regulator-name = "usb3_vbus";
+			regulator-name = "+5V_USB_HS";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
-			regulator-boot-on;
+			gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
 			gpio-open-drain;
+			vin-supply = <&vdd_5v0_sys>;
 		};
 
-		panel_3v3_reg: regulator@8 {
+		vdd_usb3_vbus: regulator@8 {
 			compatible = "regulator-fixed";
 			reg = <8>;
-			regulator-name = "panel_3v3";
+			regulator-name = "+5V_USB_SS";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			gpio-open-drain;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
+		vdd_3v3_panel: regulator@9 {
+			compatible = "regulator-fixed";
+			reg = <9>;
+			regulator-name = "+3.3V_PANEL";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
-			enable-active-high;
 			gpio = <&as3722 4 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_run>;
+		};
+
+		vdd_3v3_lp0: regulator@10 {
+			compatible = "regulator-fixed";
+			reg = <10>;
+			regulator-name = "+3.3V_LP0";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			/*
+			 * TODO: find a way to wire this up with the USB EHCI
+			 * controllers so that it can be enabled on demand.
+			 */
+			regulator-always-on;
+			gpio = <&as3722 2 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
 		};
 	};
 
-- 
1.8.4.2
