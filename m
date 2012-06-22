From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/3] ARM: dt: tegra: ventana: add regulators
Date: Fri, 22 Jun 2012 17:14:01 -0600
Message-ID: <1340406842-27135-2-git-send-email-swarren@wwwdotorg.org>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340406842-27135-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Ventana uses a TPS6586x regulator. Instantiate this, and hook up a
couple of fixed GPIO-controlled regulators too.

The regulator configurations were all taken from NVIDIA's downstream
android-tegra-nv-3.1 kernel.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-ventana.dts |  173 +++++++++++++++++++++++++++++++++
 1 files changed, 173 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index be90544..330c212 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -289,6 +289,144 @@
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
+
+		pmic: tps6586x@34 {
+			compatible = "ti,tps6586x";
+			reg = <0x34>;
+			interrupts = <0 86 0x4>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			regulators {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				regulator@0 {
+					reg = <0>;
+					regulator-compatible = "sm0";
+					regulator-name = "vdd_sm0";
+					regulator-min-microvolt = < 725000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+				};
+
+				regulator@1 {
+					reg = <1>;
+					regulator-compatible = "sm1";
+					regulator-name = "vdd_sm1";
+					regulator-min-microvolt = < 725000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+				};
+
+				sm2_reg: regulator@2 {
+					reg = <2>;
+					regulator-compatible = "sm2";
+					regulator-name = "vdd_sm2";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <4550000>;
+					regulator-always-on;
+				};
+
+				regulator@3 {
+					reg = <3>;
+					regulator-compatible = "ldo0";
+					regulator-name = "vdd_ldo0";
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <3300000>;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@4 {
+					reg = <4>;
+					regulator-compatible = "ldo1";
+					regulator-name = "vdd_ldo1";
+					regulator-min-microvolt = < 725000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@5 {
+					reg = <5>;
+					regulator-compatible = "ldo2";
+					regulator-name = "vdd_ldo2";
+					regulator-min-microvolt = < 725000>;
+					regulator-max-microvolt = <1500000>;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@6 {
+					reg = <6>;
+					regulator-compatible = "ldo3";
+					regulator-name = "vdd_ldo3";
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <3300000>;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@7 {
+					reg = <7>;
+					regulator-compatible = "ldo4";
+					regulator-name = "vdd_ldo4";
+					regulator-min-microvolt = <1700000>;
+					regulator-max-microvolt = <2475000>;
+					regulator-always-on;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@8 {
+					reg = <8>;
+					regulator-compatible = "ldo5";
+					regulator-name = "vdd_ldo5";
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				regulator@9 {
+					reg = <9>;
+					regulator-compatible = "ldo6";
+					regulator-name = "vdd_ldo6";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@10 {
+					reg = <10>;
+					regulator-compatible = "ldo7";
+					regulator-name = "vdd_ldo7";
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <3300000>;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@11 {
+					reg = <11>;
+					regulator-compatible = "ldo8";
+					regulator-name = "vdd_ldo8";
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <3300000>;
+					vin-supply = <&sm2_reg>;
+				};
+
+				regulator@12 {
+					reg = <12>;
+					regulator-compatible = "ldo9";
+					regulator-name = "vdd_ldo9";
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					vin-supply = <&sm2_reg>;
+				};
+			};
+		};
+	};
+
+	pmc {
+		nvidia,invert-interrupt;
 	};
 
 	usb@c5000000 {
@@ -317,6 +455,41 @@
 		bus-width = <8>;
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "vdd_1v5";
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
+			gpio = <&pmic 0 0>;
+		};
+
+		regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "vdd_1v2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			gpio = <&pmic 1 0>;
+			enable-active-high;
+		};
+
+		regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "pnl_pwr";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			gpio = <&gpio 22 0>; /* gpio PC6 */
+			enable-active-high;
+		};
+	};
+
 	sound {
 		compatible = "nvidia,tegra-audio-wm8903-ventana",
 			     "nvidia,tegra-audio-wm8903";
-- 
1.7.0.4
