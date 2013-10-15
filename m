From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 03/13] ARM: tegra: Enable LVDS output on Harmony
Date: Tue, 15 Oct 2013 17:27:53 +0200
Message-ID: <1381850883-12722-4-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add backlight and panel modes for the Harmony TFT LCD panel.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- no longer set panel regulator always-on, fixed in driver
- update commit message
- remove backlight-boot-off property for now

 arch/arm/boot/dts/tegra20-harmony.dts | 36 +++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index e156ab3..a02e116 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -11,6 +11,14 @@
 	};
 
 	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+
+				nvidia,panel = <&panel>;
+			};
+		};
+
 		hdmi {
 			status = "okay";
 
@@ -255,6 +263,10 @@
 		status = "okay";
 	};
 
+	pwm {
+		status = "okay";
+	};
+
 	i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -483,6 +495,17 @@
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
@@ -624,6 +647,15 @@
 				0x1F0400D6>;	/* KEY_QUESTION */
 	};
 
+	panel: panel {
+		compatible = "auo,b101aw03";
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
@@ -667,7 +699,7 @@
 			enable-active-high;
 		};
 
-		regulator@4 {
+		vdd_pnl_reg: regulator@4 {
 			compatible = "regulator-fixed";
 			reg = <4>;
 			regulator-name = "vdd_pnl";
@@ -677,7 +709,7 @@
 			enable-active-high;
 		};
 
-		regulator@5 {
+		vdd_bl_reg: regulator@5 {
 			compatible = "regulator-fixed";
 			reg = <5>;
 			regulator-name = "vdd_bl";
-- 
1.8.4
