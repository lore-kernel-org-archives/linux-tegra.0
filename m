From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: paz00: Add host1x support
Date: Fri, 16 Nov 2012 23:20:55 +0100
Message-ID: <ae44d3c1f4ceecb0f6a486d569608eec3c892ba1.1353104179.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds host1x support which includes HDMI and LVDS support.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts |   27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index e884fa5..3f7f5a2 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -244,7 +244,7 @@
 		clock-frequency = <216000000>;
 	};
 
-	i2c@7000c000 {
+	lvds_ddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
@@ -256,9 +256,9 @@
 		};
 	};
 
-	i2c@7000c400 {
+	hdmi_ddc: i2c@7000c400 {
 		status = "okay";
-		clock-frequency = <400000>;
+		clock-frequency = <100000>;
 	};
 
 	nvec {
@@ -399,13 +399,13 @@
 					regulator-max-microvolt = <1800000>;
 				};
 
-				ldo7 {
+				hdmi_vdd_reg: ldo7 {
 					regulator-name = "+3.3vs_ldo7,avdd_hdmi";
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 				};
 
-				ldo8 {
+				hdmi_pll_reg: ldo8 {
 					regulator-name = "+1.8vs_ldo8,avdd_hdmi_pll";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
@@ -499,6 +499,23 @@
 		};
 	};
 
+	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+				nvidia,ddc-i2c-bus = <&lvds_ddc>;
+			};
+		};
+
+		hdmi {
+			status = "okay";
+			vdd-supply = <&hdmi_vdd_reg>;
+			pll-supply = <&hdmi_pll_reg>;
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio = <&gpio 111 0>; /* PN7 */
+		};
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-alc5632-paz00",
 			"nvidia,tegra-audio-alc5632";
-- 
1.7.9.5
