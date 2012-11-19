From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v5] ARM: tegra: paz00: enable backlight
Date: Mon, 19 Nov 2012 23:28:22 +0100
Message-ID: <ddcc6b35e30ed9913b1bad0ea2b8824ae3b3854d.1353363930.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This enables backlight using power sequences.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
V5:	- kill W0 gpio as it is not used on paz00
	- use regulator for vdd_panel

 arch/arm/boot/dts/tegra20-paz00.dts |   75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 8a14e1d..5e9fcb1 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -15,6 +15,10 @@
 			rgb {
 				status = "okay";
 				nvidia,ddc-i2c-bus = <&lvds_ddc>;
+
+				display {
+					nvidia,backlight = <&backlight>;
+				};
 			};
 		};
 	};
@@ -461,6 +465,67 @@
 		};
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240 255>;
+		default-brightness-level = <12>;
+
+		/* resources used by the power sequences */
+		pwms = <&pwm 0 5000000>;
+		pwm-names = "backlight";
+		panel-supply = <&vdd_panel_reg>;
+
+		power-sequences {
+			power-on {
+				step0 {
+					type = "regulator";
+					id = "panel";
+					enable;
+				};
+				step1 {
+					/* LVDS_SHDN */
+					type = "gpio";
+					gpio = <&gpio 102 0>;
+					value = <1>;
+				};
+				step2 {
+					type = "pwm";
+					id = "backlight";
+					enable;
+				};
+				step3 {
+					/* BL_EN */
+					type = "gpio";
+					gpio = <&gpio 164 0>;
+					value = <1>;
+				};
+			};
+
+			power-off {
+				step0 {
+					type = "gpio";
+					gpio = <&gpio 164 0>;
+					value = <0>;
+				};
+				step1 {
+					type = "pwm";
+					id = "backlight";
+					disable;
+				};
+				step2 {
+					type = "gpio";
+					gpio = <&gpio 102 0>;
+					value = <0>;
+				};
+				step3 {
+					type = "regulator";
+					id = "panel";
+					disable;
+				};
+			};
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -474,6 +539,16 @@
 			regulator-max-microvolt = <5000000>;
 			regulator-always-on;
 		};
+
+		vdd_panel_reg: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "+3VS,vdd_pnl";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio 4 0>; /* gpio PA4 */
+			enable-active-high;
+		};
 	};
 
 	sound {
-- 
1.7.9.5
