From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] tegra: ventana: display and backlight DT entries
Date: Tue, 13 Nov 2012 19:23:24 +0900
Message-ID: <1352802204-1740-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable internal panel:
- add EDID file
- add power sequence to control backlight and panel (panel is currently
  controlled by the backlight sequence, this will need to be fixed once
  the panel framework has power sequences support)

Also enable HDMI output.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-ventana.dts  | 114 +++++++++++++++++++++++++++++++--
 arch/arm/boot/dts/tegra20-ventana.edid | Bin 0 -> 128 bytes
 2 files changed, 109 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-ventana.edid

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index adc4754..849a374 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -318,11 +318,30 @@
 		};
 	};
 
-	i2c@7000c400 {
+	hdmiddc: i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <400000>;
 	};
 
+	host1x {
+                dc@54200000 {
+			rgb {
+				status = "okay";
+				nvidia,edid = /incbin/("tegra20-ventana.edid");
+			};
+		};
+
+		hdmi {
+			status = "okay";
+
+			vdd-supply = <&avddhdmi>;
+			pll-supply = <&avddhdmipll>;
+
+			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
+			nvidia,ddc-i2c-bus = <&hdmiddc>;
+		};
+	};
+
 	i2cmux {
 		compatible = "i2c-mux-pinctrl";
 		#address-cells = <1>;
@@ -446,13 +465,13 @@
 					regulator-max-microvolt = <1800000>;
 				};
 
-				ldo7 {
+				avddhdmi: ldo7 {
 					regulator-name = "vdd_ldo7,avdd_hdmi,vdd_fuse";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 				};
 
-				ldo8 {
+				avddhdmipll: ldo8 {
 					regulator-name = "vdd_ldo8,avdd_hdmi_pll";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
@@ -516,6 +535,91 @@
 		bus-width = <8>;
 	};
 
+	backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240 255>;
+		default-brightness-level = <12>;
+
+		/* resources used by the power sequences */
+		pwms = <&pwm 2 5000000>;
+		pwm-names = "backlight";
+		power-supply = <&vdd_bl_reg>;
+		panel-supply = <&vdd_panel_reg>;
+
+		power-sequences {
+			power-on {
+				/*
+				 * Panel power and LDVS enable.
+				 * TODO: move into the panel device as soon as
+				 * panel framework supports power sequences.
+				 */
+				step0 {
+					type = "regulator";
+					id = "panel";
+					enable;
+				};
+				step1 {
+					type = "gpio";
+					gpio = <&gpio 10 0>;
+					value = <1>;
+				};
+				/* Backlight sequence. This belongs here. */
+				step2 {
+					type = "regulator";
+					id = "power";
+					enable;
+				};
+				step3 {
+					type = "delay";
+					delay = <10000>;
+				};
+				step4 {
+					type = "pwm";
+					id = "backlight";
+					enable;
+				};
+				step5 {
+					type = "gpio";
+					gpio = <&gpio 28 0>;
+					value = <1>;
+				};
+			};
+
+			power-off {
+				step0 {
+					type = "gpio";
+					gpio = <&gpio 28 0>;
+					value = <0>;
+				};
+				step1 {
+					type = "pwm";
+					id = "backlight";
+					disable;
+				};
+				step2 {
+					type = "delay";
+					delay = <10000>;
+				};
+				step3 {
+					type = "regulator";
+					id = "power";
+					disable;
+				};
+				/* This also belongs to the panel sequence */
+				step4 {
+					type = "gpio";
+					gpio = <&gpio 10 0>;
+					value = <0>;
+				};
+				step5 {
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
@@ -549,7 +653,7 @@
 			enable-active-high;
 		};
 
-		regulator@3 {
+		vdd_panel_reg: regulator@3 {
 			compatible = "regulator-fixed";
 			reg = <3>;
 			regulator-name = "vdd_pnl";
@@ -559,7 +663,7 @@
 			enable-active-high;
 		};
 
-		regulator@4 {
+		vdd_bl_reg: regulator@4 {
 			compatible = "regulator-fixed";
 			reg = <4>;
 			regulator-name = "vdd_bl";
diff --git a/arch/arm/boot/dts/tegra20-ventana.edid b/arch/arm/boot/dts/tegra20-ventana.edid
new file mode 100644
index 0000000000000000000000000000000000000000..a96ab0e895515cc1f7b9e7b4f3cda359f4b6a285
GIT binary patch
literal 128
zcmZSh4+ac;BCRqEKp-o^$lM^tQ^D0#J2TvWrkYGZ2vC#}4OGa69SUGjGq6^VWVlxg
tR3Hh&{0s_Eu;4$F5m12PAA@s12p3FL0V3k#=xAtQ8186b=%~Q39sq-e8vy_S

literal 0
HcmV?d00001

-- 
1.8.0
