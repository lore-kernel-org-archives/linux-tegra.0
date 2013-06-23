From: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Sun, 23 Jun 2013 15:38:05 +0200
Message-ID: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


Signed-off-by: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-carma.dts |  461 +++++++++++++++++++++++++++++++++++
 1 file changed, 461 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-carma.dts

diff --git a/arch/arm/boot/dts/tegra30-carma.dts b/arch/arm/boot/dts/tegra30-carma.dts
new file mode 100644
index 0000000..e88134e
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-carma.dts
@@ -0,0 +1,461 @@
+/dts-v1/;
+#include "tegra30.dtsi"
+
+/**
+ * This file contains common DT entry for Carma
+ */
+
+/ {
+	model = "NVIDIA Tegra30 Carma evaluation board";
+	compatible = "nvidia,carma", "nvidia,tegra30";
+
+	pcie-controller {
+		status = "okay";
+		pex-clk-supply = <&pex_hvdd_3v3_reg>;
+		vdd-supply = <&ldo1_reg>;
+		avdd-supply = <&ldo2_reg>;
+
+		pci@1,0 {
+			nvidia,num-lanes = <4>;
+		};
+
+		pci@2,0 {
+			nvidia,num-lanes = <1>;
+		};
+
+		pci@3,0 {
+			status = "okay";
+			nvidia,num-lanes = <1>;
+		};
+	};
+
+	memory {
+		reg = <0x80000000 0x40000000>;
+	};
+
+	pinmux {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			sdmmc1_clk_pz0 {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc1_cmd_pz1 {
+				nvidia,pins =	"sdmmc1_cmd_pz1",
+						"sdmmc1_dat0_py7",
+						"sdmmc1_dat1_py6",
+						"sdmmc1_dat2_py5",
+						"sdmmc1_dat3_py4";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <2>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc3_clk_pa6 {
+				nvidia,pins = "sdmmc3_clk_pa6";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc3_cmd_pa7 {
+				nvidia,pins =	"sdmmc3_cmd_pa7",
+						"sdmmc3_dat0_pb7",
+						"sdmmc3_dat1_pb6",
+						"sdmmc3_dat2_pb5",
+						"sdmmc3_dat3_pb4";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <2>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc4_clk_pcc4 {
+				nvidia,pins =	"sdmmc4_clk_pcc4",
+						"sdmmc4_rst_n_pcc3";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc4_dat0_paa0 {
+				nvidia,pins =	"sdmmc4_dat0_paa0",
+						"sdmmc4_dat1_paa1",
+						"sdmmc4_dat2_paa2",
+						"sdmmc4_dat3_paa3",
+						"sdmmc4_dat4_paa4",
+						"sdmmc4_dat5_paa5",
+						"sdmmc4_dat6_paa6",
+						"sdmmc4_dat7_paa7";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <2>;
+				nvidia,tristate = <0>;
+			};
+			dap2_fs_pa2 {
+				nvidia,pins =	"dap2_fs_pa2",
+						"dap2_sclk_pa3",
+						"dap2_din_pa4",
+						"dap2_dout_pa5";
+				nvidia,function = "i2s1";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+			sdio3 {
+				nvidia,pins = "drive_sdio3";
+				nvidia,high-speed-mode = <0>;
+				nvidia,schmitt = <0>;
+				nvidia,pull-down-strength = <46>;
+				nvidia,pull-up-strength = <42>;
+				nvidia,slew-rate-rising = <1>;
+				nvidia,slew-rate-falling = <1>;
+			};
+			uart3_txd_pw6 {
+				nvidia,pins =	"uart3_txd_pw6",
+						"uart3_cts_n_pa1",
+						"uart3_rts_n_pc0",
+						"uart3_rxd_pw7";
+				nvidia,function = "uartc";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+		};
+	};
+
+	serial@70006200 {
+		compatible = "ns16550";
+		status = "okay";
+	};
+
+	rgbddc: i2c@7000c000 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000c400 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	hdmiddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000d000 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		tps62361 {
+			compatible = "ti,tps62361";
+			reg = <0x60>;
+
+			regulator-name = "tps62361-vout";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-boot-on;
+			regulator-always-on;
+			ti,vsel0-state-high;
+			ti,vsel1-state-high;
+		};
+
+		pmic: tps65911@2d {
+			compatible = "ti,tps65911";
+			reg = <0x2d>;
+
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+
+			ti,system-power-controller;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			vcc1-supply = <&vdd_ac_bat_reg>;
+			vcc2-supply = <&vdd_ac_bat_reg>;
+			vcc3-supply = <&vio_reg>;
+			vcc4-supply = <&vdd_5v0_reg>;
+			vcc5-supply = <&vdd_ac_bat_reg>;
+			vcc6-supply = <&vdd2_reg>;
+			vcc7-supply = <&vdd_ac_bat_reg>;
+			vccio-supply = <&vdd_ac_bat_reg>;
+
+			regulators {
+				vdd1_reg: vdd1 {
+					regulator-name = "vddio_ddr_1v2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				vdd2_reg: vdd2 {
+					regulator-name = "vdd_1v5_gen";
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+				};
+
+				vddctrl_reg: vddctrl {
+					regulator-name = "vdd_cpu,vdd_sys";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+
+				vio_reg: vio {
+					regulator-name = "vdd_1v8_gen";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo1_reg: ldo1 {
+					regulator-name = "vdd_pexa,vdd_pexb";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+				};
+
+				ldo2_reg: ldo2 {
+					regulator-name = "vdd_sata,avdd_plle";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+				};
+
+				/* LDO3 is not connected to anything */
+
+				ldo4_reg: ldo4 {
+					regulator-name = "vdd_rtc";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo5_reg: ldo5 {
+					regulator-name = "vddio_sdmmc,avdd_vdac";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo6_reg: ldo6 {
+					regulator-name = "avdd_dsi_csi,pwrdet_mipi";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo7_reg: ldo7 {
+					regulator-name = "vdd_pllm,x,u,a_p_c_s";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo8_reg: ldo8 {
+					regulator-name = "vdd_ddr_hs";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+				};
+			};
+		};
+	};
+
+	spi@7000da00 {
+		status = "okay";
+		spi-max-frequency = <25000000>;
+		spi-flash@1 {
+			compatible = "winbond,w25q32";
+			reg = <1>;
+			spi-max-frequency = <20000000>;
+		};
+	};
+
+	ahub {
+		i2s@70080400 {
+			status = "okay";
+		};
+	};
+
+	pmc {
+		status = "okay";
+		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <2>;
+		nvidia,cpu-pwr-good-time = <2000>;
+		nvidia,cpu-pwr-off-time = <200>;
+		nvidia,core-pwr-good-time = <3845 3845>;
+		nvidia,core-pwr-off-time = <0>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+	};
+
+	sdhci@78000000 {
+		status = "okay";
+		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
+		wp-gpios = <&gpio TEGRA_GPIO(T, 3) GPIO_ACTIVE_HIGH>;
+		power-gpios = <&gpio TEGRA_GPIO(D, 7) GPIO_ACTIVE_HIGH>;
+		bus-width = <4>;
+	};
+
+	sdhci@78000400 {
+		status = "okay";
+		power-gpios = <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
+		bus-width = <4>;
+		keep-power-in-suspend;
+	};
+
+	sdhci@78000600 {
+		status = "okay";
+		bus-width = <8>;
+		non-removable;
+	};
+
+	clocks {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		clk32k_in: clock {
+			compatible = "fixed-clock";
+			reg=<0>;
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdd_ac_bat_reg: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "vdd_ac_bat";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+		};
+
+
+		cp_5v_reg: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "cp_5v";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-boot-on;
+			regulator-always-on;
+			enable-active-high;
+			gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		modem_3v3_reg: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			regulator-name = "modem_3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			enable-active-high;
+			gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
+		};
+
+		pex_hvdd_3v3_reg: regulator@5 {
+			compatible = "regulator-fixed";
+			reg = <5>;
+			regulator-name = "pex_hvdd_3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			enable-active-high;
+			gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_ac_bat_reg>;
+		};
+
+		ddr_reg: regulator@100 {
+			compatible = "regulator-fixed";
+			regulator-name = "ddr";
+			reg = <100>;
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-always-on;
+			regulator-boot-on;
+			enable-active-high;
+			gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		sys_3v3_reg: regulator@101 {
+			compatible = "regulator-fixed";
+			reg = <101>;
+			regulator-name = "sys_3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+			enable-active-high;
+			gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		usb1_vbus_reg: regulator@102 {
+			compatible = "regulator-fixed";
+			reg = <102>;
+			regulator-name = "usb1_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			enable-active-high;
+			gpio = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
+			gpio-open-drain;
+			vin-supply = <&vdd_ac_bat_reg>;
+		};
+
+		usb3_vbus_reg: regulator@103 {
+			compatible = "regulator-fixed";
+			reg = <103>;
+			regulator-name = "usb3_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			enable-active-high;
+			gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
+			gpio-open-drain;
+			vin-supply = <&vdd_ac_bat_reg>;
+		};
+
+		vdd_5v0_reg: regulator@104 {
+			compatible = "regulator-fixed";
+			reg = <104>;
+			regulator-name = "5v0";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			enable-active-high;
+			gpio = <&pmic 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		vdd_bl_reg: regulator@105 {
+			compatible = "regulator-fixed";
+			reg = <105>;
+			regulator-name = "vdd_bl";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+			enable-active-high;
+			gpio = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
+		};
+
+		vdd_bl2_reg: regulator@106 {
+			compatible = "regulator-fixed";
+			reg = <106>;
+			regulator-name = "vdd_bl2";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+			enable-active-high;
+			gpio = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+
+};
-- 
1.7.10.4
