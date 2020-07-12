From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] arm64: tegra: Add support for Jetson Xavier NX
Date: Sun, 12 Jul 2020 11:25:04 +0100
Message-ID: <20200712102506.23686-2-jonathanh@nvidia.com>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712102506.23686-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add the device-tree source files for the Tegra194 Jetson Xavier NX
Developer Kit. The Xavier NX Developer Kit consists of a small form
factor system-on-module (SOM) board (part number p3668-0000) and a
carrier board (part number p3509-0000).

The Xavier NX Developer Kit SOM features a micro-SD card slot,
however, there is also a variant of the SOM available that features a
16GB eMMC. Given that the carrier board can be used with the different
SOM variants, that have different part numbers, both the compatible
string and file name of the device-tree source file for the Developer
Kit is a concatenation of the SOM and carrier board part numbers.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 343 ++++++++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 296 +++++++++++++++
 3 files changed, 640 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index bcd018c3162b..2273fc5db19c 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -8,3 +8,4 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-smaug.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
 dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
new file mode 100644
index 000000000000..5b3dde25f6f8
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+#include "tegra194-p3668-0000.dtsi"
+
+/ {
+	model = "NVIDIA Jetson Xavier NX Developer Kit";
+	compatible = "nvidia,p3509-0000+p3668-0000", "nvidia,tegra194";
+
+	bus@0 {
+		aconnect@2900000 {
+			status = "okay";
+
+			dma-controller@2930000 {
+				status = "okay";
+			};
+
+			interrupt-controller@2a40000 {
+				status = "okay";
+			};
+		};
+
+		ddc: i2c@3190000 {
+			status = "okay";
+		};
+
+		hda@3510000 {
+			nvidia,model = "jetson-xaviernx-hda";
+			status = "okay";
+		};
+
+		padctl@3520000 {
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-1 {
+							status = "okay";
+						};
+
+						usb2-2 {
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-2 {
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-2 {
+					mode = "host";
+					vbus-supply = <&vdd_5v0_sys>;
+					status = "okay";
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <1>;
+					vbus-supply = <&vdd_5v0_sys>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-1", "usb2-2", "usb3-2";
+		};
+
+		pwm@32d0000 {
+			status = "okay";
+		};
+
+		host1x@13e00000 {
+			display-hub@15200000 {
+				status = "okay";
+			};
+
+			dpaux@155c0000 {
+				status = "okay";
+			};
+
+			dpaux@155d0000 {
+				status = "okay";
+			};
+
+			/* DP0 */
+			sor@15b00000 {
+				status = "okay";
+
+				avdd-io-hdmi-dp-supply = <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply = <&vdd_1v8hs>;
+
+				nvidia,dpaux = <&dpaux0>;
+			};
+
+			/* HDMI */
+			sor@15b40000 {
+				status = "okay";
+
+				avdd-io-hdmi-dp-supply = <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply = <&vdd_1v8hs>;
+				hdmi-supply = <&vdd_hdmi>;
+
+				nvidia,ddc-i2c-bus = <&ddc>;
+				nvidia,hpd-gpio = <&gpio TEGRA194_MAIN_GPIO(M, 1)
+							 GPIO_ACTIVE_LOW>;
+			};
+		};
+	};
+
+	pcie@14160000 {
+		status = "okay";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		phys = <&p2u_hsio_11>;
+		phy-names = "p2u-0";
+	};
+
+	pcie@141a0000 {
+		status = "okay";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+
+		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+			    "p2u-5", "p2u-6", "p2u-7";
+	};
+
+	pcie_ep@141a0000 {
+		status = "disabled";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		reset-gpios = <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
+
+		nvidia,refclk-select-gpios = <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
+					      GPIO_ACTIVE_HIGH>;
+
+		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+
+		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+			    "p2u-5", "p2u-6", "p2u-7";
+	};
+
+	fan: fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm6 0 45334>;
+
+		cooling-levels = <0 64 128 255>;
+		#cooling-cells = <2>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		force-recovery {
+			label = "Force Recovery";
+			gpios = <&gpio TEGRA194_MAIN_GPIO(G, 0)
+				       GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_SLEEP>;
+			debounce-interval = <10>;
+		};
+
+		power {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
+					   GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	regulators {
+		vdd_5v0_sys: regulator@100 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_5V_SYS";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_3v3_sys: regulator@101 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_3V3_SYS";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_3v3_ao: regulator@102 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_3V3_AO";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_1v8: regulator@103 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_1V8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_hdmi: regulator@104 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+
+			regulator-name = "VDD_5V0_HDMI_CON";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	thermal-zones {
+		cpu {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				cpu_trip_critical: critical {
+					temperature = <96500>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+
+				cpu_trip_hot: hot {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_trip_active: active {
+					temperature = <50000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				cpu_trip_passive: passive {
+					temperature = <30000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				cpu-critical {
+					cooling-device = <&fan 3 3>;
+					trip = <&cpu_trip_critical>;
+				};
+
+				cpu-hot {
+					cooling-device = <&fan 2 2>;
+					trip = <&cpu_trip_hot>;
+				};
+
+				cpu-active {
+					cooling-device = <&fan 1 1>;
+					trip = <&cpu_trip_active>;
+				};
+
+				cpu-passive {
+					cooling-device = <&fan 0 0>;
+					trip = <&cpu_trip_passive>;
+				};
+			};
+		};
+
+		gpu {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				gpu_alert0: critical {
+					temperature = <99000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aux {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				aux_alert0: critical {
+					temperature = <90000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
new file mode 100644
index 000000000000..2e7495be9930
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "tegra194.dtsi"
+
+#include <dt-bindings/mfd/max77620.h>
+
+/ {
+	model = "NVIDIA Jetson Xavier NX";
+	compatible = "nvidia,p3668", "nvidia,tegra194";
+
+	aliases {
+		ethernet0 = "/cbb@0/ethernet@2490000";
+		i2c0 = "/bpmp/i2c";
+		i2c1 = "/cbb@0/i2c@3160000";
+		i2c2 = "/cbb@0/i2c@c240000";
+		i2c3 = "/cbb@0/i2c@3180000";
+		i2c4 = "/cbb@0/i2c@3190000";
+		i2c5 = "/cbb@0/i2c@31c0000";
+		i2c6 = "/cbb@0/i2c@c250000";
+		i2c7 = "/cbb@0/i2c@31e0000";
+		rtc0 = "/bpmp/i2c/pmic@3c";
+		rtc1 = "/rtc@c2a0000";
+		mmc0 = "/cbb@0/mmc@3460000";
+		serial0 = &tcu;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	bus@0 {
+		ethernet@2490000 {
+			status = "okay";
+
+			phy-reset-gpios = <&gpio TEGRA194_MAIN_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+			phy-handle = <&phy>;
+			phy-mode = "rgmii-id";
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				phy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0x0>;
+					interrupt-parent = <&gpio>;
+					interrupts = <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
+				};
+			};
+		};
+
+		memory-controller@2c00000 {
+			status = "okay";
+		};
+
+		serial@c280000 {
+			status = "okay";
+		};
+
+		/* SDMMC1 (SD/MMC) */
+		mmc@3400000 {
+			status = "okay";
+			disable-wp;
+			bus-width = <4>;
+			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
+			vmmc-supply = <&vdd_3v3_sd>;
+		};
+
+		padctl@3520000 {
+			avdd-usb-supply = <&vdd_usb_3v3>;
+			vclamp-usb-supply = <&vdd_1v8ao>;
+
+			ports {
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb3-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb3-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+
+		rtc@c2a0000 {
+			status = "okay";
+		};
+
+		pmc@c360000 {
+			nvidia,invert-interrupt;
+		};
+	};
+
+	bpmp {
+		i2c {
+			status = "okay";
+
+			pmic: pmic@3c {
+				compatible = "maxim,max20024";
+				reg = <0x3c>;
+
+				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&max20024_default>;
+
+				max20024_default: pinmux {
+					gpio0 {
+						pins = "gpio0";
+						function = "gpio";
+					};
+
+					gpio1 {
+						pins = "gpio1";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio2 {
+						pins = "gpio2";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio3 {
+						pins = "gpio3";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio4 {
+						pins = "gpio4";
+						function = "32k-out1";
+						drive-push-pull = <1>;
+					};
+
+					gpio6 {
+						pins = "gpio6";
+						function = "gpio";
+						drive-push-pull = <1>;
+					};
+
+					gpio7 {
+						pins = "gpio7";
+						function = "gpio";
+						drive-push-pull = <0>;
+					};
+				};
+
+				fps {
+					fps0 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us = <640>;
+					};
+
+					fps1 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN1>;
+						maxim,shutdown-fps-time-period-us = <640>;
+						maxim,device-state-on-disabled-event = <MAX77620_FPS_INACTIVE_STATE_SLEEP>;
+					};
+
+					fps2 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us = <640>;
+					};
+				};
+
+				regulators {
+					in-sd0-supply = <&vdd_5v0_sys>;
+					in-sd1-supply = <&vdd_5v0_sys>;
+					in-sd2-supply = <&vdd_5v0_sys>;
+					in-sd3-supply = <&vdd_5v0_sys>;
+					in-sd4-supply = <&vdd_5v0_sys>;
+
+					in-ldo0-1-supply = <&vdd_5v0_sys>;
+					in-ldo2-supply = <&vdd_5v0_sys>;
+					in-ldo3-5-supply = <&vdd_5v0_sys>;
+					in-ldo4-6-supply = <&vdd_5v0_sys>;
+					in-ldo7-8-supply = <&vdd_1v8ls>;
+
+					vdd_1v0: sd0 {
+						regulator-name = "VDDIO_SYS_1V0";
+						regulator-min-microvolt = <1000000>;
+						regulator-max-microvolt = <1000000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8hs: sd1 {
+						regulator-name = "VDDIO_SYS_1V8HS";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8ls: sd2 {
+						regulator-name = "VDDIO_SYS_1V8LS";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8ao: sd3 {
+						regulator-name = "VDDIO_AO_1V8";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					sd4 {
+						regulator-name = "VDD_DDR_1V1";
+						regulator-min-microvolt = <1100000>;
+						regulator-max-microvolt = <1100000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo0 {
+						regulator-name = "VDD_RTC";
+						regulator-min-microvolt = <800000>;
+						regulator-max-microvolt = <800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo2 {
+						regulator-name = "VDDIO_AO_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo3 {
+						regulator-name = "VDD_EMMC_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					vdd_usb_3v3: ldo5 {
+						regulator-name = "VDD_USB_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo6 {
+						regulator-name = "VDD_SDIO_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					ldo7 {
+						regulator-name = "AVDD_CSI_1V2";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+					};
+				};
+			};
+		};
+	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdd_3v3_sd: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+
+			regulator-name = "VDD_3V3_SD";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio TEGRA194_MAIN_GPIO(G, 2) GPIO_ACTIVE_HIGH>;
+			regulator-boot-on;
+			enable-active-high;
+		};
+	};
+};
-- 
2.17.1
