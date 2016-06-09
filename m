From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM64: boot: dts: Add regulators for Tegra210 Smaug
Date: Thu, 9 Jun 2016 13:38:43 -0400
Message-ID: <1465493923-23313-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add regulators to the Tegra210 Smaug DTS file including
support for the max77620 PMIC.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
 - Updated reg properties to match current binding

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 323 ++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 4d89f4e02d98..b2d16b7c6809 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/max77620.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 
 #include "tegra210.dtsi"
@@ -1327,6 +1328,242 @@
 		};
 	};
 
+	i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <1000000>;
+
+		max77620: max77620@3c {
+			compatible = "maxim,max77620";
+			reg = <0x3c>;
+			interrupts = <0 86 IRQ_TYPE_NONE>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&max77620_default>;
+
+			max77620_default: pinmux@0 {
+				pin_gpio {
+					pins = "gpio0", "gpio1", "gpio2", "gpio7";
+					function = "gpio";
+				};
+
+				/*
+				 * GPIO3 is used to en_pp3300, and it is part of power
+				 * sequence, So it must be sequenced up (automatically
+				 * set by OTP) and down properly.
+				 */
+				pin_gpio3 {
+					pins = "gpio3";
+					function = "fps-out";
+					drive-open-drain = <1>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+					maxim,active-fps-power-up-slot = <4>;
+					maxim,active-fps-power-down-slot = <2>;
+				};
+
+				pin_gpio5_6 {
+					pins = "gpio5", "gpio6";
+					function = "gpio";
+					drive-push-pull = <1>;
+				};
+
+				pin_32k {
+					pins = "gpio4";
+					function = "32k-out1";
+				};
+			};
+
+			fps {
+				fps0 {
+					maxim,shutdown-fps-time-period-us = <5120>;
+					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+				};
+
+				fps1 {
+					maxim,shutdown-fps-time-period-us = <5120>;
+					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN1>;
+					maxim,enable-sleep;
+				};
+
+				fps2 {
+					maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+				};
+			};
+
+			regulators {
+				in-ldo0-1-supply = <&pp1350>;
+				in-ldo2-supply = <&pp3300>;
+				in-ldo3-5-supply = <&pp3300>;
+				in-ldo7-8-supply = <&pp1350>;
+
+				ppvar_soc: sd0 {
+					regulator-name = "PPVAR_SOC";
+					regulator-min-microvolt = <825000>;
+					regulator-max-microvolt = <1125000>;
+					regulator-enable-ramp-delay = <146>;
+					regulator-always-on;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <27500>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
+					maxim,active-fps-power-up-slot = <1>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				pp1100_sd1: sd1 {
+					regulator-name = "PP1100";
+					regulator-min-microvolt = <1125000>;
+					regulator-max-microvolt = <1125000>;
+					regulator-enable-ramp-delay = <130>;
+					regulator-always-on;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <27500>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+					maxim,active-fps-power-up-slot = <5>;
+					maxim,active-fps-power-down-slot = <1>;
+				};
+
+				pp1350: sd2 {
+					regulator-name = "PP1350";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-enable-ramp-delay = <176>;
+					regulator-always-on;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <27500>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <2>;
+					maxim,active-fps-power-down-slot = <5>;
+				};
+
+				pp1800: sd3 {
+					regulator-name = "PP1800";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-enable-ramp-delay = <242>;
+					regulator-always-on;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <27500>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+					maxim,active-fps-power-up-slot = <3>;
+					maxim,active-fps-power-down-slot = <3>;
+				};
+
+				pp1200_avdd: ldo0 {
+					regulator-name = "PP1200_AVDD";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-enable-ramp-delay = <26>;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <0>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				pp1200_rcam: ldo1 {
+					regulator-name = "PP1200_RCAM";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-enable-ramp-delay = <22>;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <0>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				pp_ldo2: ldo2 {
+					regulator-name = "PP_LDO2";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-enable-ramp-delay = <62>;
+					regulator-always-on;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <0>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				pp2800l_rcam: ldo3 {
+					regulator-name = "PP2800L_RCAM";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-enable-ramp-delay = <50>;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <0>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				pp100_soc_rtc: ldo4 {
+					regulator-name = "PP1100_SOC_RTC";
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <850000>;
+					regulator-enable-ramp-delay = <22>;
+					regulator-always-on; /* Check this */
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+					maxim,active-fps-power-up-slot = <1>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				pp2800l_fcam: ldo5 {
+					regulator-name = "PP2800L_FCAM";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-enable-ramp-delay = <62>;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <0>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				ldo6 {
+					/* Unused. */
+					regulator-name = "PP_LDO6";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-enable-ramp-delay = <36>;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <0>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+
+				pp1050_avdd: ldo7 {
+					regulator-name = "PP1050_AVDD";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-enable-ramp-delay = <24>;
+					regulator-always-on;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
+					maxim,active-fps-power-up-slot = <3>;
+					maxim,active-fps-power-down-slot = <4>;
+				};
+
+				avddio_1v05: ldo8 {
+					regulator-name = "AVDDIO_1V05";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-enable-ramp-delay = <22>;
+					regulator-boot-on;
+					maxim,ramp-rate-setting = <100000>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
+					maxim,active-fps-power-up-slot = <0>;
+					maxim,active-fps-power-down-slot = <7>;
+				};
+			};
+		};
+	};
+
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <0>;
@@ -1421,4 +1658,90 @@
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
+
+	regulators {
+		compatible = "simple-bus";
+		device_type = "fixed-regulators";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ppvar_sys: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "PPVAR_SYS";
+			regulator-min-microvolt = <4400000>;
+			regulator-max-microvolt = <4400000>;
+			regulator-always-on;
+		};
+
+		pplcd_vdd: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "PPLCD_VDD";
+			regulator-min-microvolt = <4400000>;
+			regulator-max-microvolt = <4400000>;
+			gpio = <&gpio TEGRA_GPIO(V, 4) 0>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+
+		pp3000_always: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "PP3000_ALWAYS";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-always-on;
+		};
+
+		pp3300: regulator@3 {
+			compatible = "regulator-fixed";
+			reg = <3>;
+			regulator-name = "PP3300";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-boot-on;
+			regulator-always-on;
+			gpio = <&max77620 3 0>;
+			enable-active-high;
+		};
+
+		pp5000: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			regulator-name = "PP5000";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+		};
+
+		pp1800_lcdio: regulator@5 {
+			compatible = "regulator-fixed";
+			reg = <5>;
+			regulator-name = "PP1800_LCDIO";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpio TEGRA_GPIO(V, 3) 0>;
+			enable-active-high;
+			regulator-boot-on;
+		};
+
+		pp1800_cam: regulator@6 {
+			compatible = "regulator-fixed";
+			reg= <6>;
+			regulator-name = "PP1800_CAM";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpio TEGRA_GPIO(K, 3) 0>;
+			enable-active-high;
+		};
+
+		usbc_vbus: regulator@7 {
+			compatible = "regulator-fixed";
+			reg = <7>;
+			regulator-name = "USBC_VBUS";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+		};
+	};
 };
-- 
1.9.1
