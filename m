From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/7] ARM: tegra: jetson-tk1 - Enable HDMI support
Date: Fri, 25 Apr 2014 17:44:47 +0200
Message-ID: <1398440691-23366-4-git-send-email-thierry.reding@gmail.com>
References: <1398440691-23366-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398440691-23366-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add HDMI +5V, VDD and PLL regulators and enable the DDC I2C controller.
Enable the HDMI device, provide the power supplies as well as the DDC
adapter and use pin the standard pin (PN7) for hotplug detection.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 39 +++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index dd3076d94727..e30a5778f675 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -16,6 +16,20 @@
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
 
+	host1x@0,50000000 {
+		hdmi@0,54280000 {
+			status = "okay";
+
+			hdmi-supply = <&vdd_5v0_hdmi>;
+			pll-supply = <&vdd_hdmi_pll>;
+			vdd-supply = <&vdd_3v3_hdmi>;
+
+			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpio =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	pinmux: pinmux@0,70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -1382,7 +1396,7 @@
 	};
 
 	/* HDMI DDC */
-	i2c@0,7000c700 {
+	hdmi_ddc: i2c@0,7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
 	};
@@ -1477,7 +1491,7 @@
 					regulator-boot-on;
 				};
 
-				sd4 {
+				vdd_1v05_run: sd4 {
 					regulator-name = "+1.05V_RUN";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
@@ -1765,6 +1779,27 @@
 			enable-active-high;
 			vin-supply = <&vdd_3v3_sys>;
 		};
+
+		vdd_hdmi_pll: regulator@11 {
+			compatible = "regulator-fixed";
+			reg = <11>;
+			regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+			vin-supply = <&vdd_1v05_run>;
+		};
+
+		vdd_5v0_hdmi: regulator@12 {
+			compatible = "regulator-fixed";
+			reg = <12>;
+			regulator-name = "+5V_HDMI_CON";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_5v0_sys>;
+		};
 	};
 
 	sound {
-- 
1.9.2
