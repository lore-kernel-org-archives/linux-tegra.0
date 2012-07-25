From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: Add Avionic Design Medcom-Wide support
Date: Wed, 25 Jul 2012 17:06:14 +0200
Message-ID: <1343228775-1330-2-git-send-email-thierry.reding@avionic-design.de>
References: <1343228775-1330-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343228775-1330-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Medcom is a 16:9 15" terminal that is used for patient infotainment
in hospitals.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-medcom.dts | 486 +++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile.boot    |   1 +
 2 files changed, 487 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-medcom.dts

diff --git a/arch/arm/boot/dts/tegra20-medcom.dts b/arch/arm/boot/dts/tegra20-medcom.dts
new file mode 100644
index 0000000..cc7928d
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-medcom.dts
@@ -0,0 +1,486 @@
+/dts-v1/;
+
+/include/ "tegra20.dtsi"
+
+/ {
+	model = "Avionic Design Medcom-Wide board";
+	compatible = "ad,medcom-wide", "nvidia,tegra20";
+
+	memory {
+		reg = <0x00000000 0x20000000>;
+	};
+
+	pinmux {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			ata {
+				nvidia,pins = "ata";
+				nvidia,function = "ide";
+			};
+			atb {
+				nvidia,pins = "atb", "gma", "gme";
+				nvidia,function = "sdio4";
+			};
+			atc {
+				nvidia,pins = "atc";
+				nvidia,function = "nand";
+			};
+			atd {
+				nvidia,pins = "atd", "ate", "gmb", "gmd", "gpu",
+					"spia", "spib", "spic";
+				nvidia,function = "gmi";
+			};
+			cdev1 {
+				nvidia,pins = "cdev1";
+				nvidia,function = "plla_out";
+			};
+			cdev2 {
+				nvidia,pins = "cdev2";
+				nvidia,function = "pllp_out4";
+			};
+			crtp {
+				nvidia,pins = "crtp";
+				nvidia,function = "crt";
+			};
+			csus {
+				nvidia,pins = "csus";
+				nvidia,function = "vi_sensor_clk";
+			};
+			dap1 {
+				nvidia,pins = "dap1";
+				nvidia,function = "dap1";
+			};
+			dap2 {
+				nvidia,pins = "dap2";
+				nvidia,function = "dap2";
+			};
+			dap3 {
+				nvidia,pins = "dap3";
+				nvidia,function = "dap3";
+			};
+			dap4 {
+				nvidia,pins = "dap4";
+				nvidia,function = "dap4";
+			};
+			ddc {
+				nvidia,pins = "ddc";
+				nvidia,function = "i2c2";
+			};
+			dta {
+				nvidia,pins = "dta", "dtd";
+				nvidia,function = "sdio2";
+			};
+			dtb {
+				nvidia,pins = "dtb", "dtc", "dte";
+				nvidia,function = "rsvd1";
+			};
+			dtf {
+				nvidia,pins = "dtf";
+				nvidia,function = "i2c3";
+			};
+			gmc {
+				nvidia,pins = "gmc";
+				nvidia,function = "uartd";
+			};
+			gpu7 {
+				nvidia,pins = "gpu7";
+				nvidia,function = "rtck";
+			};
+			gpv {
+				nvidia,pins = "gpv", "slxa", "slxk";
+				nvidia,function = "pcie";
+			};
+			hdint {
+				nvidia,pins = "hdint", "pta";
+				nvidia,function = "hdmi";
+			};
+			i2cp {
+				nvidia,pins = "i2cp";
+				nvidia,function = "i2cp";
+			};
+			irrx {
+				nvidia,pins = "irrx", "irtx";
+				nvidia,function = "uarta";
+			};
+			kbca {
+				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
+					"kbce", "kbcf";
+				nvidia,function = "kbc";
+			};
+			lcsn {
+				nvidia,pins = "lcsn", "ld0", "ld1", "ld2",
+					"ld3", "ld4", "ld5", "ld6", "ld7",
+					"ld8", "ld9", "ld10", "ld11", "ld12",
+					"ld13", "ld14", "ld15", "ld16", "ld17",
+					"ldc", "ldi", "lhp0", "lhp1", "lhp2",
+					"lhs", "lm0", "lm1", "lpp", "lpw0",
+					"lpw1", "lpw2", "lsc0", "lsc1", "lsck",
+					"lsda", "lsdi", "lspi", "lvp0", "lvp1",
+					"lvs";
+				nvidia,function = "displaya";
+			};
+			owc {
+				nvidia,pins = "owc", "spdi", "spdo", "uac";
+				nvidia,function = "rsvd2";
+			};
+			pmc {
+				nvidia,pins = "pmc";
+				nvidia,function = "pwr_on";
+			};
+			rm {
+				nvidia,pins = "rm";
+				nvidia,function = "i2c1";
+			};
+			sdb {
+				nvidia,pins = "sdb", "sdc", "sdd";
+				nvidia,function = "pwm";
+			};
+			sdio1 {
+				nvidia,pins = "sdio1";
+				nvidia,function = "sdio1";
+			};
+			slxc {
+				nvidia,pins = "slxc", "slxd";
+				nvidia,function = "spdif";
+			};
+			spid {
+				nvidia,pins = "spid", "spie", "spif";
+				nvidia,function = "spi1";
+			};
+			spig {
+				nvidia,pins = "spig", "spih";
+				nvidia,function = "spi2_alt";
+			};
+			uaa {
+				nvidia,pins = "uaa", "uab", "uda";
+				nvidia,function = "ulpi";
+			};
+			uad {
+				nvidia,pins = "uad";
+				nvidia,function = "irda";
+			};
+			uca {
+				nvidia,pins = "uca", "ucb";
+				nvidia,function = "uartc";
+			};
+			conf_ata {
+				nvidia,pins = "ata", "atb", "atc", "atd", "ate",
+					"cdev1", "cdev2", "dap1", "dtb", "gma",
+					"gmb", "gmc", "gmd", "gme", "gpu7",
+					"gpv", "i2cp", "pta", "rm", "slxa",
+					"slxk", "spia", "spib", "uac";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+			conf_ck32 {
+				nvidia,pins = "ck32", "ddrc", "pmca", "pmcb",
+					"pmcc", "pmcd", "pmce", "xm2c", "xm2d";
+				nvidia,pull = <0>;
+			};
+			conf_csus {
+				nvidia,pins = "csus", "spid", "spif";
+				nvidia,pull = <1>;
+				nvidia,tristate = <1>;
+			};
+			conf_crtp {
+				nvidia,pins = "crtp", "dap2", "dap3", "dap4",
+					"dtc", "dte", "dtf", "gpu", "sdio1",
+					"slxc", "slxd", "spdi", "spdo", "spig",
+					"uda";
+				nvidia,pull = <0>;
+				nvidia,tristate = <1>;
+			};
+			conf_ddc {
+				nvidia,pins = "ddc", "dta", "dtd", "kbca",
+					"kbcb", "kbcc", "kbcd", "kbce", "kbcf",
+					"sdc";
+				nvidia,pull = <2>;
+				nvidia,tristate = <0>;
+			};
+			conf_hdint {
+				nvidia,pins = "hdint", "lcsn", "ldc", "lm1",
+					"lpw1", "lsc1", "lsck", "lsda", "lsdi",
+					"lvp0", "owc", "sdb";
+				nvidia,tristate = <1>;
+			};
+			conf_irrx {
+				nvidia,pins = "irrx", "irtx", "sdd", "spic",
+					"spie", "spih", "uaa", "uab", "uad",
+					"uca", "ucb";
+				nvidia,pull = <2>;
+				nvidia,tristate = <1>;
+			};
+			conf_lc {
+				nvidia,pins = "lc", "ls";
+				nvidia,pull = <2>;
+			};
+			conf_ld0 {
+				nvidia,pins = "ld0", "ld1", "ld2", "ld3", "ld4",
+					"ld5", "ld6", "ld7", "ld8", "ld9",
+					"ld10", "ld11", "ld12", "ld13", "ld14",
+					"ld15", "ld16", "ld17", "ldi", "lhp0",
+					"lhp1", "lhp2", "lhs", "lm0", "lpp",
+					"lpw0", "lpw2", "lsc0", "lspi", "lvp1",
+					"lvs", "pmc";
+				nvidia,tristate = <0>;
+			};
+			conf_ld17_0 {
+				nvidia,pins = "ld17_0", "ld19_18", "ld21_20",
+					"ld23_22";
+				nvidia,pull = <1>;
+			};
+		};
+	};
+
+	i2s@70002800 {
+		status = "okay";
+	};
+
+	serial@70006300 {
+		clock-frequency = <216000000>;
+		status = "okay";
+	};
+
+	i2c@7000c000 {
+		clock-frequency = <400000>;
+		status = "okay";
+
+		wm8903: wm8903@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+			interrupt-parent = <&gpio>;
+			interrupts = <187 0x04>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+			gpio-cfg = <0xffffffff
+				    0xffffffff
+				    0
+				    0xffffffff
+				    0xffffffff>;
+		};
+	};
+
+	i2c@7000d000 {
+		clock-frequency = <400000>;
+		status = "okay";
+
+		pmu: tps6586x@34 {
+			compatible = "ti,tps6586x";
+			reg = <0x34>;
+			interrupts = <0 86 0x4>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+
+			sm0-supply = <&vdd_sys_sm0>;
+			sm1-supply = <&vdd_sys_sm1>;
+			sm2-supply = <&vdd_sys_sm2>;
+			vinldo01-supply = <&sm2>;
+			vinldo23-supply = <&sm2>;
+			vinldo4-supply = <&sm2>;
+			vinldo678-supply = <&sm2>;
+			vinldo9-supply = <&sm2>;
+
+			regulators {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sm0: regulator@0 {
+					reg = <0>;
+					regulator-compatible = "sm0";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				sm1: regulator@1 {
+					reg = <1>;
+					regulator-compatible = "sm1";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				sm2: regulator@2 {
+					reg = <2>;
+					regulator-compatible = "sm2";
+					regulator-min-microvolt = <3700000>;
+					regulator-max-microvolt = <3700000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo0: regulator@3 {
+					reg = <3>;
+					regulator-compatible = "ldo0";
+					regulator-name = "PCIE CLK";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo1: regulator@4 {
+					reg = <4>;
+					regulator-compatible = "ldo1";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+				};
+
+				ldo2: regulator@5 {
+					reg = <5>;
+					regulator-compatible = "ldo2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+				};
+
+				ldo3: regulator@6 {
+					reg = <6>;
+					regulator-compatible = "ldo3";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				ldo4: regulator@7 {
+					reg = <7>;
+					regulator-compatible = "ldo4";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				ldo5: regulator@8 {
+					reg = <8>;
+					regulator-compatible = "ldo5";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				ldo6: regulator@9 {
+					reg = <9>;
+					regulator-compatible = "ldo6";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+
+				ldo7: regulator@10 {
+					reg = <10>;
+					regulator-compatible = "ldo7";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldo8: regulator@11 {
+					reg = <11>;
+					regulator-compatible = "ldo8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo9: regulator@12 {
+					reg = <12>;
+					regulator-compatible = "ldo9";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					regulator-always-on;
+				};
+			};
+		};
+	};
+
+	pmc {
+		nvidia,invert-interrupt;
+	};
+
+	usb@c5008000 {
+		status = "okay";
+	};
+
+	sdhci@c8000600 {
+		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
+		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
+		status = "okay";
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 5000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
+	regulators {
+		compatible = "simple-bus";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		vdd_sys_sm0: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0 1>;
+
+			regulator-name = "VDD_SYS_SM0";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_sys_sm1: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1 1>;
+
+			regulator-name = "VDD_SYS_SM1";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_sys_sm2: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2 1>;
+
+			regulator-name = "VDD_SYS_SM2";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	sound {
+		compatible = "nvidia,tegra-audio-wm8903-harmony",
+			     "nvidia,tegra-audio-wm8903";
+		nvidia,model = "Avionic Design Medcom-Wide";
+
+		nvidia,audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "ROP",
+			"Int Spk", "RON",
+			"Int Spk", "LOP",
+			"Int Spk", "LON",
+			"Mic Jack", "MICBIAS",
+			"IN1L", "Mic Jack";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 0>;
+		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
+		nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
+		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
+	};
+};
diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
index ad27d36..84757e0 100644
--- a/arch/arm/mach-tegra/Makefile.boot
+++ b/arch/arm/mach-tegra/Makefile.boot
@@ -9,4 +9,5 @@ dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-trimslice.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-ventana.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-whistler.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-plutux.dtb
+dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-medcom.dtb
 dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += tegra30-cardhu.dtb
-- 
1.7.11.2
