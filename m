From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/10] ARM: tegra: Enable eDP for Venice2
Date: Thu, 19 Dec 2013 17:06:17 +0100
Message-ID: <1387469182-14398-6-git-send-email-treding@nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Venice2 has a 12.9" (2560x1700) panel connected to the eDP output of the
Tegra124. The panel has an EDID to describe the video timings but needs
a few extra nodes to get the backlight to come up.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 7a4d5e23ddf4..b435cb5ec664 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -10,6 +10,20 @@
 		reg = <0x80000000 0x80000000>;
 	};
 
+	host1x@50000000 {
+		sor@54540000 {
+			status = "okay";
+
+			nvidia,dpaux = <&dpaux>;
+			nvidia,panel = <&panel>;
+		};
+
+		dpaux: dpaux@545c0000 {
+			vdd-supply = <&vdd_edp>;
+			status = "okay";
+		};
+	};
+
 	pinmux: pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinmux_default>;
@@ -594,6 +608,17 @@
 		};
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+
+		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		power-supply = <&vdd_led>;
+		pwms = <&pwm 1 1000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -607,6 +632,13 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "lg,lp129qe", "simple-panel";
+
+		backlight = <&backlight>;
+		ddc-i2c-bus = <&dpaux>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -617,6 +649,26 @@
 			reg = <0>;
 			regulator-name = "sys_5v";
 		};
+
+		vdd_edp: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "avdd_lcd";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&pmic 4 0 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+
+		vdd_led: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "vdd_led";
+			regulator-min-microvolt = <45000000>;
+			regulator-max-microvolt = <45000000>;
+			gpio = <&gpio TEGRA_GPIO(P, 2) 0 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
 	};
 
 	sound {
-- 
1.8.4.2
