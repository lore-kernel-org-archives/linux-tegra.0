From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v3 2/2] ARM: tegra: paz00: enable backlight
Date: Fri, 16 Nov 2012 23:59:04 +0100
Message-ID: <bb3770acf5a4aa0645f67c0a6939cda92a376fbb.1353106697.git.marvin24@gmx.de>
References: <0a45efce28b667f334b682a6b8b056e4c7a5d486.1353106697.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0a45efce28b667f334b682a6b8b056e4c7a5d486.1353106697.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <0a45efce28b667f334b682a6b8b056e4c7a5d486.1353106697.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <0a45efce28b667f334b682a6b8b056e4c7a5d486.1353106697.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This enables backlight using power sequences.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts |   72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 6cc6215..57c740a 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -19,6 +19,10 @@
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
@@ -493,6 +497,74 @@
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
+
+		power-sequences {
+			power-on {
+				step0 {
+					type = "pwm";
+					id = "backlight";
+					enable;
+				};
+				step1 {
+					type = "gpio";
+					gpio = <&gpio 4 0>;   /* gpio PA4, en_vdd_pnl  */
+					value = <1>;
+				};
+				step2 {
+					type = "gpio";
+					gpio = <&gpio 176 0>; /* gpio PW0, bl_vdd */
+					value = <1>;
+				};
+				step3 {
+					type = "gpio";
+					gpio = <&gpio 102 0>; /* gpio PM6, lvds_shdn */
+					value = <1>;
+				};
+				step4 {
+					type = "gpio";
+					gpio = <&gpio 164 0>; /* gpio PU4, bl_enb */
+					value = <1>;
+				};
+			};
+
+			power-off {
+				step4 {
+					type = "gpio";
+					gpio = <&gpio 164 0>; /* gpio PU4, bl_enb */
+					value = <0>;
+				};
+				step0 {
+					type = "gpio";
+					gpio = <&gpio 102 0>; /* gpio PM6, lvds_shdn */
+					value = <0>;
+				};
+				step1 {
+					type = "gpio";
+					gpio = <&gpio 176 0>; /* gpio PW0, bl_vdd */
+					value = <0>;
+				};
+				step2 {
+					type = "gpio";
+					gpio = <&gpio 4 0>;   /* gpio PA4, en_vdd_pnl  */
+					value = <0>;
+				};
+				step3 {
+					type = "pwm";
+					id = "backlight";
+					disable;
+				};
+			};
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.7.9.5
