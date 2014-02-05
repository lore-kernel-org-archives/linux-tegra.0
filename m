From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 2/2] ARM: tegra: enable LCD panel on Ventana
Date: Wed,  5 Feb 2014 11:20:10 -0700
Message-ID: <1391624410-28632-2-git-send-email-swarren@wwwdotorg.org>
References: <1391624410-28632-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391624410-28632-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Ventana uses a CLAA101WA01A LCD panel. Enable the relevant display
controller, backlight, and regulators.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
* s/chungwa/chunghwa/
* Use the correct PWM instance
---
 arch/arm/boot/dts/tegra20-ventana.dts | 39 ++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 571d12e6ac2d..ca8484cccddc 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -17,6 +17,14 @@
 	};
 
 	host1x@50000000 {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+
+				nvidia,panel = <&panel>;
+			};
+		};
+
 		hdmi@54280000 {
 			status = "okay";
 
@@ -309,6 +317,10 @@
 		status = "okay";
 	};
 
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
 	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -359,7 +371,7 @@
 			#size-cells = <0>;
 		};
 
-		i2c@1 {
+		lvds_ddc: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -557,6 +569,17 @@
 		non-removable;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_bl_reg>;
+		pwms = <&pwm 2 5000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -581,6 +604,16 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "chunghwa,claa101wa01a", "simple-panel";
+
+		power-supply = <&vdd_pnl_reg>;
+		enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
+
+		backlight = <&backlight>;
+		ddc-i2c-bus = <&lvds_ddc>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -614,7 +647,7 @@
 			enable-active-high;
 		};
 
-		regulator@3 {
+		vdd_pnl_reg: regulator@3 {
 			compatible = "regulator-fixed";
 			reg = <3>;
 			regulator-name = "vdd_pnl";
@@ -624,7 +657,7 @@
 			enable-active-high;
 		};
 
-		regulator@4 {
+		vdd_bl_reg: regulator@4 {
 			compatible = "regulator-fixed";
 			reg = <4>;
 			regulator-name = "vdd_bl";
-- 
1.8.1.5
