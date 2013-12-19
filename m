From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/10] ARM: tegra: Enable LVDS on Harmony
Date: Thu, 19 Dec 2013 16:59:25 +0100
Message-ID: <1387468774-14216-2-git-send-email-treding@nvidia.com>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387468774-14216-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add backlight and panel nodes for the Harmony TFT LCD panel.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- no longer set panel regulator always-on, fixed in driver
- update commit message
- remove backlight-boot-off property for now

 arch/arm/boot/dts/tegra20-harmony.dts | 36 +++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 6145f26a0ec5..3fb1f50f6d46 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
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
 
@@ -261,6 +269,10 @@
 		status = "okay";
 	};
 
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
 	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -606,6 +618,17 @@
 		bus-width = <8>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_bl_reg>;
+		pwms = <&pwm 0 5000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -630,6 +653,15 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "auo,b101aw03", "simple-panel";
+
+		power-supply = <&vdd_pnl_reg>;
+		enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
+
+		backlight = <&backlight>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -673,7 +705,7 @@
 			enable-active-high;
 		};
 
-		regulator@4 {
+		vdd_pnl_reg: regulator@4 {
 			compatible = "regulator-fixed";
 			reg = <4>;
 			regulator-name = "vdd_pnl";
@@ -683,7 +715,7 @@
 			enable-active-high;
 		};
 
-		regulator@5 {
+		vdd_bl_reg: regulator@5 {
 			compatible = "regulator-fixed";
 			reg = <5>;
 			regulator-name = "vdd_bl";
-- 
1.8.4.2
