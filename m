From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: ventana: enable internal display
Date: Fri, 16 Nov 2012 16:44:51 +0900
Message-ID: <1353051891-26725-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable host1x and add the rgb output, providing EDID as a binary blob.

Also add the power sequence that controls the backlight and panel. The
sequence strictly follows the order and timings of the panel
specification.

Currently the backlight device controls both backlight and panel, this
needs to be fixed once the panel framework supports power sequences.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-ventana.dts  | 107 ++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/tegra20-ventana.edid | Bin 0 -> 128 bytes
 2 files changed, 105 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-ventana.edid

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 3e5952f..fd6c814 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -10,6 +10,16 @@
 		reg = <0x00000000 0x40000000>;
 	};
 
+	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+				nvidia,edid = /incbin/("tegra20-ventana.edid");
+				backlight = <&backlight>;
+			};
+		};
+	};
+
 	pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -469,6 +479,99 @@
 		bus-width = <8>;
 	};
 
+	backlight: backlight {
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
+				 * Panel power and LVDS enable.
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
+				step2 {
+					type = "delay";
+					delay = <200000>;
+				};
+				/* Backlight sequence. This belongs here. */
+				step3 {
+					type = "regulator";
+					id = "power";
+					enable;
+				};
+				step4 {
+					type = "delay";
+					delay = <10000>;
+				};
+				step5 {
+					type = "pwm";
+					id = "backlight";
+					enable;
+				};
+				step6 {
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
+					type = "delay";
+					delay = <200000>;
+				};
+				step5 {
+					type = "gpio";
+					gpio = <&gpio 10 0>;
+					value = <0>;
+				};
+				step6 {
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
@@ -502,7 +605,7 @@
 			enable-active-high;
 		};
 
-		regulator@3 {
+		vdd_panel_reg: regulator@3 {
 			compatible = "regulator-fixed";
 			reg = <3>;
 			regulator-name = "vdd_pnl";
@@ -512,7 +615,7 @@
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
