From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/9] ARM: tegra: Enable DSI support on Dalmore
Date: Mon,  7 Oct 2013 13:48:46 +0200
Message-ID: <1381146528-18069-8-git-send-email-treding@nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Dalmore has a 10.1" WUXGA panel connected to one of the DSI outputs of
the Tegra114.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- rename vdd-supply property to power-supply to comply with binding
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 59 +++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 871aff5..d8e54ab 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -11,6 +11,14 @@
 		reg = <0x80000000 0x40000000>;
 	};
 
+	host1x@50000000 {
+		dsi@54300000 {
+			status = "okay";
+
+			nvidia,panel = <&panel>;
+		};
+	};
+
 	pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -718,6 +726,10 @@
 		status = "okay";
 	};
 
+	pwm {
+		status = "okay";
+	};
+
 	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <100000>;
@@ -798,7 +810,7 @@
 					regulator-boot-on;
 				};
 
-				fet1 {
+				vdd_bl_reg: fet1 {
 					regulator-name = "vdd-lcd-bl";
 				};
 
@@ -806,7 +818,7 @@
 					regulator-name = "vdd-modem-3v3";
 				};
 
-				fet4 {
+				avdd_lcd_reg: fet4 {
 					regulator-name = "avdd-lcd";
 				};
 
@@ -1076,6 +1088,19 @@
 		vbus-supply = <&usb3_vbus_reg>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_bl_reg>;
+		pwms = <&pwm 1 1000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+
+		backlight-boot-off;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -1118,6 +1143,12 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "panasonic,vvx10f004b00";
+		power-supply = <&avdd_lcd_reg>;
+		backlight = <&backlight>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -1142,19 +1173,9 @@
 			gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
 		};
 
-		lcd_bl_en_reg: regulator@2 {
+		usb1_vbus_reg: regulator@2 {
 			compatible = "regulator-fixed";
 			reg = <2>;
-			regulator-name = "lcd_bl_en";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-		};
-
-		usb1_vbus_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
 			regulator-name = "usb1_vbus";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
@@ -1164,9 +1185,9 @@
 			vin-supply = <&tps65090_dcdc1_reg>;
 		};
 
-		usb3_vbus_reg: regulator@4 {
+		usb3_vbus_reg: regulator@3 {
 			compatible = "regulator-fixed";
-			reg = <4>;
+			reg = <3>;
 			regulator-name = "usb2_vbus";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
@@ -1176,9 +1197,9 @@
 			vin-supply = <&tps65090_dcdc1_reg>;
 		};
 
-		vdd_hdmi_reg: regulator@5 {
+		vdd_hdmi_reg: regulator@4 {
 			compatible = "regulator-fixed";
-			reg = <5>;
+			reg = <4>;
 			regulator-name = "vdd_hdmi_5v0";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
@@ -1187,9 +1208,9 @@
 			vin-supply = <&tps65090_dcdc1_reg>;
 		};
 
-		vdd_cam_1v8_reg: regulator@6 {
+		vdd_cam_1v8_reg: regulator@5 {
 			compatible = "regulator-fixed";
-			reg = <6>;
+			reg = <5>;
 			regulator-name = "vdd_cam_1v8_reg";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
-- 
1.8.4
