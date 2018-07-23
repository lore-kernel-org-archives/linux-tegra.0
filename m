From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 11/26] ARM: tegra: colibri_t30: pinmux clean-up
Date: Mon, 23 Jul 2018 14:36:42 +0200
Message-ID: <20180723123658.980-12-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
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

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index fedcd2f7912b..55dcd9d0dcce 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -38,10 +38,10 @@
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 			dap3_fs_pp0 {
-				nvidia,pins =	"dap3_fs_pp0",
-						"dap3_sclk_pp3",
-						"dap3_din_pp1",
-						"dap3_dout_pp2";
+				nvidia,pins = "dap3_fs_pp0",
+					      "dap3_sclk_pp3",
+					      "dap3_din_pp1",
+					      "dap3_dout_pp2";
 				nvidia,function = "i2s2";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
@@ -79,9 +79,9 @@
 			lcd_m1_pw1 {
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
@@ -112,12 +112,14 @@
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
+			/* Multiplexed SSPFRM, SSPTXD and therefore disabled */
 			sdmmc3_dat6_pd3 {
 				nvidia,pins = "sdmmc3_dat6_pd3",
 					      "sdmmc3_dat7_pd4";
 				nvidia,function = "spdif";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 
 			/* Colibri UART_A */
@@ -155,13 +157,15 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* eMMC */
+			/* eMMC (On-module) */
 			sdmmc4_clk_pcc4 {
 				nvidia,pins = "sdmmc4_clk_pcc4",
+					      "sdmmc4_cmd_pt7",
 					      "sdmmc4_rst_n_pcc3";
 				nvidia,function = "sdmmc4";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 			sdmmc4_dat0_paa0 {
 				nvidia,pins = "sdmmc4_dat0_paa0",
@@ -175,6 +179,7 @@
 				nvidia,function = "sdmmc4";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
 			/* Power I2C (On-module) */
@@ -185,7 +190,6 @@
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
 				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
 			};
 
@@ -197,12 +201,12 @@
 			lcd_dc1_pd2 {
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
