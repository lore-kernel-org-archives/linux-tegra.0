From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 15/37] ARM: tegra: colibri_t20: add missing pinmux
Date: Sun,  2 Sep 2018 12:08:44 +0200
Message-ID: <20180902100906.25792-16-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Explicitly add pinmux' for all T20 SoC ball groups now:
- Colibri Address/Data Bus (GMI) further pins used as GPIOs
- Colibri BL_ON
- Colibri EXT_IO*
- Colibri L_BIAS, LCD_M1 is muxed with LCD_DE today's display need DE,
  disable LCD_M1
- more Colibri LCD pins (L_* resp. LDD<*>)
- Colibri LCD (Optional 24 BPP Support)
- Colibri MMCCD
- uart_a_dsr and uart_a_dcd as GPIOs
- Colibri USB_CDET
- I2C3 (Optional)
- JTAG_RTCK
- LAN_RESET, LAN_EXT_WAKEUP and LAN_PME (All On-module)
- more NAND pins
- RESET_OUT
- THERMD_ALERT# (On-module), unlatched I2C address pin of LM95245
  temperature sensor therefore requires disabling for now

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Replace underscores in node names with dashes.

 arch/arm/boot/dts/tegra20-colibri-iris.dts |  40 +++++++++
 arch/arm/boot/dts/tegra20-colibri.dtsi     | 134 +++++++++++++++++++++++++----
 2 files changed, 159 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index e026478b58d0..28386b89d910 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -29,6 +29,10 @@
 
 	pinmux@70000014 {
 		state_default: pinmux {
+			bl-on {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
 			ddc {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
@@ -37,10 +41,38 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
+			i2c {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			lcd {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			lm1 {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
 			mmc {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
+			mmccd {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			pwm-a-b {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			pwm-c-d {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			ssp {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
 			uart-a {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
@@ -48,6 +80,14 @@
 			uart-b {
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
+
+			uart-c {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
+			usbh-pen {
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index dfe237cea14b..aa2ca3dad32c 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -75,20 +75,36 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* Colibri Address/Data Bus (GMI) */
-			gpio-gmi {
-				nvidia,pins = "ata", "atc", "atd", "ate",
-					"dap1", "dap2", "dap4", "gpu", "irrx",
-					"irtx", "spia", "spib", "spic";
+			/*
+			 * Colibri Address/Data Bus (GMI)
+			 * Note: spid and spie optionally used for SPI1
+			 */
+			gmi {
+				nvidia,pins = "atc", "atd", "ate", "dap1",
+					      "dap2", "dap4", "gmd", "gpu",
+					      "irrx", "irtx", "spia", "spib",
+					      "spic", "spid", "spie", "uca",
+					      "ucb";
 				nvidia,function = "gmi";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			/* Further pins may be used as GPIOs */
+			gmi-gpio1 {
+				nvidia,pins = "lpw0", "lsc1", "lsck", "lsda";
+				nvidia,function = "hdmi";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			gmi-gpio2 {
+				nvidia,pins = "lcsn", "ldc", "lm0", "lsdi";
+				nvidia,function = "rsvd4";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 
 			/* Colibri BL_ON */
 			bl-on {
 				nvidia,pins = "dta";
-				nvidia,function = "vi";
+				nvidia,function = "rsvd1";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
@@ -113,8 +129,8 @@
 			 * Note: dtf optionally used for I2C3
 			 */
 			ext-io {
-				nvidia,pins = "dtf";
-				nvidia,function = "i2c3";
+				nvidia,pins = "dtf", "spdi";
+				nvidia,function = "rsvd2";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
@@ -151,15 +167,31 @@
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 
+			/*
+			 * Colibri L_BIAS, LCD_M1 is muxed with LCD_DE
+			 * today's display need DE, disable LCD_M1
+			 */
+			lm1 {
+				nvidia,pins = "lm1";
+				nvidia,function = "rsvd3";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
 			/* Colibri LCD (L_* resp. LDD<*>) */
 			lcd {
 				nvidia,pins = "ld0", "ld1", "ld2", "ld3",
 					      "ld4", "ld5", "ld6", "ld7",
 					      "ld8", "ld9", "ld10", "ld11",
 					      "ld12", "ld13", "ld14", "ld15",
-					      "ld16", "ld17", "lhs", "lpw0",
-					      "lpw2", "lsc0", "lsc1", "lsck",
-					      "lsda", "lspi", "lvs";
+					      "ld16", "ld17", "lhs", "lsc0",
+					      "lspi", "lvs";
+				nvidia,function = "displaya";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			/* Colibri LCD (Optional 24 BPP Support) */
+			lcd-24 {
+				nvidia,pins = "ldi", "lhp0", "lhp1", "lhp2",
+					      "lpp", "lvp1";
 				nvidia,function = "displaya";
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
@@ -172,6 +204,14 @@
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 
+			/* Colibri MMCCD */
+			mmccd {
+				nvidia,pins = "gmb";
+				nvidia,function = "gmi_int";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
 			/* Colibri MMC (Optional 8-bit) */
 			mmc-8bit {
 				nvidia,pins = "gme";
@@ -220,6 +260,16 @@
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
+			uart-a-dsr {
+				nvidia,pins = "lpw1";
+				nvidia,function = "rsvd3";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+			uart-a-dcd {
+				nvidia,pins = "lpw2";
+				nvidia,function = "hdmi";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
 
 			/* Colibri UART-B */
 			uart-b {
@@ -237,12 +287,20 @@
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 
+			/* Colibri USB_CDET */
+			usb-cdet {
+				nvidia,pins = "spdo";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
 			/* Colibri USBH_OC */
 			usbh-oc {
 				nvidia,pins = "spih";
 				nvidia,function = "spi2_alt";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 
 			/* Colibri USBH_PEN */
@@ -250,7 +308,7 @@
 				nvidia,pins = "spig";
 				nvidia,function = "spi2_alt";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 
 			/* Colibri VGA not supported */
@@ -261,6 +319,33 @@
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 
+			/* I2C3 (Optional) */
+			i2c3 {
+				nvidia,pins = "dtf";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* JTAG_RTCK */
+			jtag-rtck {
+				nvidia,pins = "gpu7";
+				nvidia,function = "rtck";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+
+			/*
+			 * LAN_RESET, LAN_EXT_WAKEUP and LAN_PME
+			 * (All On-module)
+			 */
+			gpio-gpv {
+				nvidia,pins = "gpv";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
 			/*
 			 * LAN_V_BUS, VDD_FAULT, BATT_FAULT, WM9712 PENDOWN
 			 * (All On-module); Colibri CAN_INT
@@ -274,7 +359,7 @@
 
 			/* NAND (On-module) */
 			nand {
-				nvidia,pins = "kbca", "kbcc", "kbcd",
+				nvidia,pins = "kbca", "kbcb", "kbcc", "kbcd",
 					      "kbce", "kbcf";
 				nvidia,function = "nand";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
@@ -297,6 +382,14 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
+			/* RESET_OUT */
+			reset-out {
+				nvidia,pins = "ata";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+
 			/*
 			 * SPI1 (Optional)
 			 * Note: spid and spie used for Colibri Address/Data
@@ -308,6 +401,17 @@
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
+
+			/*
+			 * THERMD_ALERT# (On-module), unlatched I2C address pin
+			 * of LM95245 temperature sensor therefore requires
+			 * disabling for now
+			 */
+			lvp0 {
+				nvidia,pins = "lvp0";
+				nvidia,function = "rsvd3";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
 		};
 	};
 
-- 
2.14.4
