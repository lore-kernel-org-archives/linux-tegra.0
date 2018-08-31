From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 17/34] ARM: tegra: apalis_t30: pinmux clean-up
Date: Fri, 31 Aug 2018 18:37:59 +0200
Message-ID: <20180831163817.23970-18-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Clean-up pinmuxing:
- white-space clean-up
- explicitly disable input of BKL1_ON, BKL1_PWM and BKL1_PWM_EN#
- annotate Apalis I2C3 usage for CAM
- get rid of nvidia,lock property
- add missing eMMC sdmmc4_cmd_pt7 and explicitly enable input
- explicitly disable lcd_dc1_pd2 (e.g. LM95245 I2C address pin)
- annotate TOUCH_PEN_INT# being on-module
- As underscores in node names are not recommended replace them all
  where possible with dashes.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also replace underscores in node names with dashes.
- Explicitly disable input of BKL1_ON as well.

 arch/arm/boot/dts/tegra30-apalis.dtsi | 88 ++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index e84feac9b992..cb587670a5af 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -63,18 +63,18 @@
 
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
@@ -86,25 +86,28 @@
 				nvidia,function = "rsvd4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 
 			/* Apalis BKL1_PWM */
-			uart3_rts_n_pc0 {
+			uart3-rts-n-pc0 {
 				nvidia,pins = "uart3_rts_n_pc0";
 				nvidia,function = "pwm0";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 			/* BKL1_PWM_EN#, disable TPS65911 PMIC PWM backlight */
-			uart3_cts_n_pa1 {
+			uart3-cts-n-pa1 {
 				nvidia,pins = "uart3_cts_n_pa1";
 				nvidia,function = "rsvd2";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 
 			/* Apalis CAN1 on SPI6 */
-			spi2_cs0_n_px3 {
+			spi2-cs0-n-px3 {
 				nvidia,pins = "spi2_cs0_n_px3",
 					      "spi2_miso_px1",
 					      "spi2_mosi_px0",
@@ -114,7 +117,7 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 			/* CAN_INT1 */
-			spi2_cs1_n_pw2 {
+			spi2-cs1-n-pw2 {
 				nvidia,pins = "spi2_cs1_n_pw2";
 				nvidia,function = "spi3";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
@@ -123,7 +126,7 @@
 			};
 
 			/* Apalis CAN2 on SPI4 */
-			gmi_a16_pj7 {
+			gmi-a16-pj7 {
 				nvidia,pins = "gmi_a16_pj7",
 					      "gmi_a17_pb0",
 					      "gmi_a18_pb1",
@@ -134,7 +137,7 @@
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 			/* CAN_INT2 */
-			spi2_cs2_n_pw3 {
+			spi2-cs2-n-pw3 {
 				nvidia,pins = "spi2_cs2_n_pw3";
 				nvidia,function = "spi3";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
@@ -143,20 +146,20 @@
 			};
 
 			/* Apalis Digital Audio */
-			clk1_req_pee2 {
+			clk1-req-pee2 {
 				nvidia,pins = "clk1_req_pee2";
 				nvidia,function = "hda";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			clk2_out_pw5 {
+			clk2-out-pw5 {
 				nvidia,pins = "clk2_out_pw5";
 				nvidia,function = "extperiph2";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
-			dap1_fs_pn0 {
+			dap1-fs-pn0 {
 				nvidia,pins = "dap1_fs_pn0",
 					      "dap1_din_pn1",
 					      "dap1_dout_pn2",
@@ -166,26 +169,25 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* Apalis I2C3 */
-			cam_i2c_scl_pbb1 {
+			/* Apalis I2C3 (CAM) */
+			cam-i2c-scl-pbb1 {
 				nvidia,pins = "cam_i2c_scl_pbb1",
 					      "cam_i2c_sda_pbb2";
 				nvidia,function = "i2c3";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
 				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
 			};
 
 			/* Apalis MMC1 */
-			sdmmc3_clk_pa6 {
+			sdmmc3-clk-pa6 {
 				nvidia,pins = "sdmmc3_clk_pa6";
 				nvidia,function = "sdmmc3";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			sdmmc3_dat0_pb7 {
+			sdmmc3-dat0-pb7 {
 				nvidia,pins = "sdmmc3_cmd_pa7",
 					      "sdmmc3_dat0_pb7",
 					      "sdmmc3_dat1_pb6",
@@ -241,7 +243,7 @@
 			};
 
 			/* Apalis RESET_MOCI# */
-			gmi_rst_n_pi4 {
+			gmi-rst-n-pi4 {
 				nvidia,pins = "gmi_rst_n_pi4";
 				nvidia,function = "gmi";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
@@ -249,13 +251,13 @@
 			};
 
 			/* Apalis SD1 */
-			sdmmc1_clk_pz0 {
+			sdmmc1-clk-pz0 {
 				nvidia,pins = "sdmmc1_clk_pz0";
 				nvidia,function = "sdmmc1";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
-			sdmmc1_cmd_pz1 {
+			sdmmc1-cmd-pz1 {
 				nvidia,pins = "sdmmc1_cmd_pz1",
 					      "sdmmc1_dat0_py7",
 					      "sdmmc1_dat1_py6",
@@ -266,7 +268,7 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 			/* Apalis SD1_CD# */
-			clk2_req_pcc5 {
+			clk2-req-pcc5 {
 				nvidia,pins = "clk2_req_pcc5";
 				nvidia,function = "rsvd2";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
@@ -275,7 +277,7 @@
 			};
 
 			/* Apalis SPI1 */
-			spi1_sck_px5 {
+			spi1-sck-px5 {
 				nvidia,pins = "spi1_sck_px5",
 					      "spi1_mosi_px4",
 					      "spi1_miso_px7",
@@ -286,7 +288,7 @@
 			};
 
 			/* Apalis SPI2 */
-			lcd_sck_pz4 {
+			lcd-sck-pz4 {
 				nvidia,pins = "lcd_sck_pz4",
 					      "lcd_sdout_pn5",
 					      "lcd_sdin_pz2",
@@ -297,7 +299,7 @@
 			};
 
 			/* Apalis UART1 */
-			ulpi_data0 {
+			ulpi-data0 {
 				nvidia,pins = "ulpi_data0_po1",
 					      "ulpi_data1_po2",
 					      "ulpi_data2_po3",
@@ -312,7 +314,7 @@
 			};
 
 			/* Apalis UART2 */
-			ulpi_clk_py0 {
+			ulpi-clk-py0 {
 				nvidia,pins = "ulpi_clk_py0",
 					      "ulpi_dir_py1",
 					      "ulpi_nxt_py2",
@@ -323,7 +325,7 @@
 			};
 
 			/* Apalis UART3 */
-			uart2_rxd_pc3 {
+			uart2-rxd-pc3 {
 				nvidia,pins = "uart2_rxd_pc3",
 					      "uart2_txd_pc2";
 				nvidia,function = "uartb";
@@ -332,7 +334,7 @@
 			};
 
 			/* Apalis UART4 */
-			uart3_rxd_pw7 {
+			uart3-rxd-pw7 {
 				nvidia,pins = "uart3_rxd_pw7",
 					      "uart3_txd_pw6";
 				nvidia,function = "uartc";
@@ -341,7 +343,7 @@
 			};
 
 			/* Apalis USBO1_EN */
-			gen2_i2c_scl_pt5 {
+			gen2-i2c-scl-pt5 {
 				nvidia,pins = "gen2_i2c_scl_pt5";
 				nvidia,function = "rsvd4";
 				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
@@ -350,7 +352,7 @@
 			};
 
 			/* Apalis USBO1_OC# */
-			gen2_i2c_sda_pt6 {
+			gen2-i2c-sda-pt6 {
 				nvidia,pins = "gen2_i2c_sda_pt6";
 				nvidia,function = "rsvd4";
 				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
@@ -369,14 +371,16 @@
 			};
 
 			/* eMMC (On-module) */
-			sdmmc4_clk_pcc4 {
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
@@ -388,6 +392,7 @@
 				nvidia,function = "sdmmc4";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
 			/* LVDS Transceiver Configuration */
@@ -400,7 +405,6 @@
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
 			};
 			pbb3 {
 				nvidia,pins = "pbb3",
@@ -411,18 +415,16 @@
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
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
 
@@ -431,15 +433,15 @@
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
