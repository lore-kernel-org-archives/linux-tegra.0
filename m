From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 10/34] ARM: tegra: colibri_t30: pinmux clean-up
Date: Sat,  1 Sep 2018 10:12:24 +0200
Message-ID: <20180901081248.22639-11-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Clean-up pinmuxing:
- white-space clean-up
- explicitly disable LCD_M1 in favour of LCD_DE on L_BIAS
- explicitly disable multiplexed SSPFRM and SSPTXD
- get rid of nvidia,lock property
- add missing eMMC sdmmc4_cmd_pt7 and explicitly enable input
- explicitly disable lcd_dc1_pd2 (e.g. LM95245 I2C address pin)
- annotate TOUCH_PEN_INT# being on-module
- As underscores in node names are not recommended replace them all
  where possible with dashes.
- Replace underscores in UART annotations (e.g. UART_A) with dashes
  (e.g. UART-A) to be more in-line with our Colibri standard.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also replace underscores in node names with dashes.
- Also replace underscores in UART annotations with dashes.

 arch/arm/boot/dts/tegra30-colibri.dtsi | 72 ++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index a9b9db0a87f8..6bedb69be553 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -30,18 +30,18 @@
 
 		state_default: pinmux {
 			/* Analogue Audio (On-module) */
-			clk1_out_pw4 {
+			clk1-out-pw4 {
 				nvidia,pins = "clk1_out_pw4";
 				nvidia,function = "extperiph1";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
-			dap3_fs_pp0 {
-				nvidia,pins =	"dap3_fs_pp0",
-						"dap3_sclk_pp3",
-						"dap3_din_pp1",
-						"dap3_dout_pp2";
+			dap3-fs-pp0 {
+				nvidia,pins = "dap3_fs_pp0",
+					      "dap3_sclk_pp3",
+					      "dap3_din_pp1",
+					      "dap3_dout_pp2";
 				nvidia,function = "i2s2";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
@@ -56,7 +56,7 @@
 			};
 
 			/* Colibri Backlight PWM<A> */
-			sdmmc3_dat3_pb4 {
+			sdmmc3-dat3-pb4 {
 				nvidia,pins = "sdmmc3_dat3_pb4";
 				nvidia,function = "pwm0";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
@@ -64,7 +64,7 @@
 			};
 
 			/* Colibri CAN_INT */
-			kb_row8_ps0 {
+			kb-row8-ps0 {
 				nvidia,pins = "kb_row8_ps0";
 				nvidia,function = "kbc";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
@@ -74,24 +74,24 @@
 
 			/*
 			 * Colibri L_BIAS, LCD_M1 is muxed with LCD_DE
-			 * todays display need DE, disable LCD_M1
+			 * today's display need DE, disable LCD_M1
 			 */
-			lcd_m1_pw1 {
+			lcd-m1-pw1 {
 				nvidia,pins = "lcd_m1_pw1";
 				nvidia,function = "rsvd3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 
 			/* Colibri MMC */
-			kb_row10_ps2 {
+			kb-row10-ps2 {
 				nvidia,pins = "kb_row10_ps2";
 				nvidia,function = "sdmmc2";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			kb_row11_ps3 {
+			kb-row11-ps3 {
 				nvidia,pins = "kb_row11_ps3",
 					      "kb_row12_ps4",
 					      "kb_row13_ps5",
@@ -103,7 +103,7 @@
 			};
 
 			/* Colibri SSP */
-			ulpi_clk_py0 {
+			ulpi-clk-py0 {
 				nvidia,pins = "ulpi_clk_py0",
 					      "ulpi_dir_py1",
 					      "ulpi_nxt_py2",
@@ -112,16 +112,18 @@
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			sdmmc3_dat6_pd3 {
+			/* Multiplexed SSPFRM, SSPTXD and therefore disabled */
+			sdmmc3-dat6-pd3 {
 				nvidia,pins = "sdmmc3_dat6_pd3",
 					      "sdmmc3_dat7_pd4";
 				nvidia,function = "spdif";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* Colibri UART_A */
-			ulpi_data0 {
+			/* Colibri UART-A */
+			ulpi-data0 {
 				nvidia,pins = "ulpi_data0_po1",
 					      "ulpi_data1_po2",
 					      "ulpi_data2_po3",
@@ -135,8 +137,8 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* Colibri UART_B */
-			gmi_a16_pj7 {
+			/* Colibri UART-B */
+			gmi-a16-pj7 {
 				nvidia,pins = "gmi_a16_pj7",
 					      "gmi_a17_pb0",
 					      "gmi_a18_pb1",
@@ -146,8 +148,8 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* Colibri UART_C */
-			uart2_rxd {
+			/* Colibri UART-C */
+			uart2-rxd {
 				nvidia,pins = "uart2_rxd_pc3",
 					      "uart2_txd_pc2";
 				nvidia,function = "uartb";
@@ -155,15 +157,17 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* eMMC */
-			sdmmc4_clk_pcc4 {
+			/* eMMC (On-module) */
+			sdmmc4-clk-pcc4 {
 				nvidia,pins = "sdmmc4_clk_pcc4",
+					      "sdmmc4_cmd_pt7",
 					      "sdmmc4_rst_n_pcc3";
 				nvidia,function = "sdmmc4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
-			sdmmc4_dat0_paa0 {
+			sdmmc4-dat0-paa0 {
 				nvidia,pins = "sdmmc4_dat0_paa0",
 					      "sdmmc4_dat1_paa1",
 					      "sdmmc4_dat2_paa2",
@@ -175,17 +179,17 @@
 				nvidia,function = "sdmmc4";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
 			/* Power I2C (On-module) */
-			pwr_i2c_scl_pz6 {
+			pwr-i2c-scl-pz6 {
 				nvidia,pins = "pwr_i2c_scl_pz6",
 					      "pwr_i2c_sda_pz7";
 				nvidia,function = "i2cpwr";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
 				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
 			};
 
@@ -194,15 +198,15 @@
 			 * temperature sensor therefore requires disabling for
 			 * now
 			 */
-			lcd_dc1_pd2 {
+			lcd-dc1-pd2 {
 				nvidia,pins = "lcd_dc1_pd2";
 				nvidia,function = "rsvd3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* TOUCH_PEN_INT# */
+			/* TOUCH_PEN_INT# (On-module) */
 			pv0 {
 				nvidia,pins = "pv0";
 				nvidia,function = "rsvd1";
-- 
2.14.4
