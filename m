From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/9] ARM: tegra: Enable LVDS output on Harmony
Date: Mon,  7 Oct 2013 13:48:41 +0200
Message-ID: <1381146528-18069-3-git-send-email-treding@nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add backlight and panel modes for the Harmony TFT LCD panel. Note that
currently the panel power supply is marked as boot-on/always-on because
otherwise regulator_enable() and regulator_disable() will become
unbalanced. That's something that needs to be fixed properly in the
panel driver.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-harmony.dts | 40 +++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index e156ab3..fa5660e 100644
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
@@ -483,6 +495,19 @@
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
+
+		backlight-boot-off;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -624,6 +649,15 @@
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
@@ -667,17 +701,19 @@
 			enable-active-high;
 		};
 
-		regulator@4 {
+		vdd_pnl_reg: regulator@4 {
 			compatible = "regulator-fixed";
 			reg = <4>;
 			regulator-name = "vdd_pnl";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
+			regulator-always-on;
+			regulator-boot-on;
 			gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
-		regulator@5 {
+		vdd_bl_reg: regulator@5 {
 			compatible = "regulator-fixed";
 			reg = <5>;
 			regulator-name = "vdd_bl";
-- 
1.8.4
