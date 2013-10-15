From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 08/13] ARM: tegra: Enable DSI support on Dalmore
Date: Tue, 15 Oct 2013 17:27:58 +0200
Message-ID: <1381850883-12722-9-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Dalmore has a 10.1" WUXGA panel connected to one of the DSI outputs of
the Tegra114.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- remove backlight-boot-off property for now
- don't renumber all regulators

 arch/arm/boot/dts/tegra114-dalmore.dts | 43 ++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index cb5ec23..ad80ebd 100644
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
@@ -806,7 +818,7 @@
 					regulator-boot-on;
 				};
 
-				fet1 {
+				vdd_bl_reg: fet1 {
 					regulator-name = "vdd-lcd-bl";
 				};
 
@@ -814,7 +826,7 @@
 					regulator-name = "vdd-modem-3v3";
 				};
 
-				fet4 {
+				avdd_lcd_reg: fet4 {
 					regulator-name = "avdd-lcd";
 				};
 
@@ -1084,6 +1096,17 @@
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
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -1126,6 +1149,12 @@
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
@@ -1150,16 +1179,6 @@
 			gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
 		};
 
-		lcd_bl_en_reg: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "lcd_bl_en";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			enable-active-high;
-			gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-		};
-
 		usb1_vbus_reg: regulator@3 {
 			compatible = "regulator-fixed";
 			reg = <3>;
-- 
1.8.4
