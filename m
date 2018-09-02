From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 14/37] ARM: tegra: colibri_t20: pinmux clean-up
Date: Sun,  2 Sep 2018 12:08:43 +0200
Message-ID: <20180902100906.25792-15-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Just cosmetic pinmux clean-up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also replace underscores in node names with dashes.

 arch/arm/boot/dts/tegra20-colibri-iris.dts |  10 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi     | 287 ++++++++++++++++++++---------
 2 files changed, 202 insertions(+), 95 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 194f40646a83..e026478b58d0 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -29,23 +29,23 @@
 
 	pinmux@70000014 {
 		state_default: pinmux {
-			hdint {
+			ddc {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			i2cddc {
+			hotplug-detect {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			sdio4 {
+			mmc {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			uarta {
+			uart-a {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			uartd {
+			uart-b {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 		};
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index ba84184e09b8..dfe237cea14b 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -29,175 +29,282 @@
 		pinctrl-0 = <&state_default>;
 
 		state_default: pinmux {
-			audio_refclk {
+			/* Analogue Audio AC97 to WM9712 (On-module) */
+			audio-refclk {
 				nvidia,pins = "cdev1";
 				nvidia,function = "plla_out";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			crt {
-				nvidia,pins = "crtp";
-				nvidia,function = "crt";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-			};
 			dap3 {
 				nvidia,pins = "dap3";
 				nvidia,function = "dap3";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			displaya {
-				nvidia,pins = "ld0", "ld1", "ld2", "ld3",
-					"ld4", "ld5", "ld6", "ld7", "ld8",
-					"ld9", "ld10", "ld11", "ld12", "ld13",
-					"ld14", "ld15", "ld16", "ld17",
-					"lhs", "lpw0", "lpw2", "lsc0",
-					"lsc1", "lsck", "lsda", "lspi", "lvs";
-				nvidia,function = "displaya";
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_dte {
-				nvidia,pins = "dte";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-			};
-			gpio_gmi {
-				nvidia,pins = "ata", "atc", "atd", "ate",
-					"dap1", "dap2", "dap4", "gpu", "irrx",
-					"irtx", "spia", "spib", "spic";
-				nvidia,function = "gmi";
+
+			/*
+			 * AC97_RESET, ULPI_RESET, AC97_INT aka WM9712 GENIRQ
+			 * (All on-module), SODIMM Pin 45 Wakeup
+			 */
+			gpio-uac {
+				nvidia,pins = "uac";
+				nvidia,function = "rsvd2";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			gpio_pta {
+
+			/*
+			 * Buffer Enables for nPWE and RDnWR (On-module,
+			 * see GPIO hogging further down below)
+			 */
+			gpio-pta {
 				nvidia,pins = "pta";
 				nvidia,function = "rsvd4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			gpio_uac {
-				nvidia,pins = "uac";
-				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+
+			/*
+			 * CLK_32K_OUT, CORE_PWR_REQ, CPU_PWR_REQ, PWR_INT_N,
+			 * SYS_CLK_REQ (All on-module)
+			 */
+			pmc {
+				nvidia,pins = "pmc";
+				nvidia,function = "pwr_on";
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			hdint {
-				nvidia,pins = "hdint";
-				nvidia,function = "hdmi";
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+
+			/* Colibri Address/Data Bus (GMI) */
+			gpio-gmi {
+				nvidia,pins = "ata", "atc", "atd", "ate",
+					"dap1", "dap2", "dap4", "gpu", "irrx",
+					"irtx", "spia", "spib", "spic";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			i2c1 {
-				nvidia,pins = "rm";
-				nvidia,function = "i2c1";
+
+			/* Colibri BL_ON */
+			bl-on {
+				nvidia,pins = "dta";
+				nvidia,function = "vi";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			i2c3 {
-				nvidia,pins = "dtf";
-				nvidia,function = "i2c3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+
+			/* Colibri Backlight PWM<A>, PWM<B> */
+			pwm-a-b {
+				nvidia,pins = "sdc";
+				nvidia,function = "pwm";
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			i2cddc {
+
+			/* Colibri DDC */
+			ddc {
 				nvidia,pins = "ddc";
 				nvidia,function = "i2c2";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			i2cp {
-				nvidia,pins = "i2cp";
-				nvidia,function = "i2cp";
+
+			/*
+			 * Colibri EXT_IO*
+			 * Note: dtf optionally used for I2C3
+			 */
+			ext-io {
+				nvidia,pins = "dtf";
+				nvidia,function = "i2c3";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			irda {
-				nvidia,pins = "uad";
-				nvidia,function = "irda";
+
+			/*
+			 * Colibri Ethernet (On-module)
+			 * ULPI EHCI instance 1 USB2_DP/N -> AX88772B
+			 */
+			ulpi {
+				nvidia,pins = "uaa", "uab", "uda";
+				nvidia,function = "ulpi";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			nand {
-				nvidia,pins = "kbca", "kbcc", "kbcd",
-					"kbce", "kbcf";
-				nvidia,function = "nand";
+			ulpi-refclk {
+				nvidia,pins = "cdev2";
+				nvidia,function = "pllp_out4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			owc {
-				nvidia,pins = "owc";
-				nvidia,function = "owr";
+
+			/* Colibri HOTPLUG_DETECT (HDMI) */
+			hotplug-detect {
+				nvidia,pins = "hdint";
+				nvidia,function = "hdmi";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Colibri I2C */
+			i2c {
+				nvidia,pins = "rm";
+				nvidia,function = "i2c1";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			pmc {
-				nvidia,pins = "pmc";
-				nvidia,function = "pwr_on";
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+
+			/* Colibri LCD (L_* resp. LDD<*>) */
+			lcd {
+				nvidia,pins = "ld0", "ld1", "ld2", "ld3",
+					      "ld4", "ld5", "ld6", "ld7",
+					      "ld8", "ld9", "ld10", "ld11",
+					      "ld12", "ld13", "ld14", "ld15",
+					      "ld16", "ld17", "lhs", "lpw0",
+					      "lpw2", "lsc0", "lsc1", "lsck",
+					      "lsda", "lspi", "lvs";
+				nvidia,function = "displaya";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			pwm {
-				nvidia,pins = "sdb", "sdc", "sdd";
-				nvidia,function = "pwm";
+
+			/* Colibri MMC */
+			mmc {
+				nvidia,pins = "atb", "gma";
+				nvidia,function = "sdio4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			sdio4 {
-				nvidia,pins = "atb", "gma", "gme";
+
+			/* Colibri MMC (Optional 8-bit) */
+			mmc-8bit {
+				nvidia,pins = "gme";
 				nvidia,function = "sdio4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			spi1 {
-				nvidia,pins = "spid", "spie", "spif";
-				nvidia,function = "spi1";
+
+			/*
+			 * Colibri Parallel Camera (Optional)
+			 * pins multiplexed with others and therefore disabled
+			 * Note: dta used for BL_ON by default
+			 */
+			cif-mclk {
+				nvidia,pins = "csus";
+				nvidia,function = "vi_sensor_clk";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			cif {
+				nvidia,pins = "dtb", "dtc", "dtd";
+				nvidia,function = "vi";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			spi4 {
+
+			/* Colibri PWM<C>, PWM<D> */
+			pwm-c-d {
+				nvidia,pins = "sdb", "sdd";
+				nvidia,function = "pwm";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Colibri SSP */
+			ssp {
 				nvidia,pins = "slxa", "slxc", "slxd", "slxk";
 				nvidia,function = "spi4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			uarta {
+
+			/* Colibri UART-A */
+			uart-a {
 				nvidia,pins = "sdio1";
 				nvidia,function = "uarta";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			uartd {
+
+			/* Colibri UART-B */
+			uart-b {
 				nvidia,pins = "gmc";
 				nvidia,function = "uartd";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			ulpi {
-				nvidia,pins = "uaa", "uab", "uda";
-				nvidia,function = "ulpi";
+
+			/* Colibri UART-C */
+			uart-c {
+				nvidia,pins = "uad";
+				nvidia,function = "irda";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			ulpi_refclk {
-				nvidia,pins = "cdev2";
-				nvidia,function = "pllp_out4";
+
+			/* Colibri USBH_OC */
+			usbh-oc {
+				nvidia,pins = "spih";
+				nvidia,function = "spi2_alt";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			usb_gpio {
-				nvidia,pins = "spig", "spih";
+
+			/* Colibri USBH_PEN */
+			usbh-pen {
+				nvidia,pins = "spig";
 				nvidia,function = "spi2_alt";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			vi {
-				nvidia,pins = "dta", "dtb", "dtc", "dtd";
-				nvidia,function = "vi";
+
+			/* Colibri VGA not supported */
+			vga {
+				nvidia,pins = "crtp";
+				nvidia,function = "crt";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-			vi_sc {
-				nvidia,pins = "csus";
-				nvidia,function = "vi_sensor_clk";
+
+			/*
+			 * LAN_V_BUS, VDD_FAULT, BATT_FAULT, WM9712 PENDOWN
+			 * (All On-module); Colibri CAN_INT
+			 */
+			gpio-dte {
+				nvidia,pins = "dte";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* NAND (On-module) */
+			nand {
+				nvidia,pins = "kbca", "kbcc", "kbcd",
+					      "kbce", "kbcf";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* Onewire (Optional) */
+			owr {
+				nvidia,pins = "owc";
+				nvidia,function = "owr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* Power I2C (On-module) */
+			i2cp {
+				nvidia,pins = "i2cp";
+				nvidia,function = "i2cp";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			/*
+			 * SPI1 (Optional)
+			 * Note: spid and spie used for Colibri Address/Data
+			 *       Bus (GMI)
+			 */
+			spi1 {
+				nvidia,pins = "spid", "spie", "spif";
+				nvidia,function = "spi1";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
-- 
2.14.4
