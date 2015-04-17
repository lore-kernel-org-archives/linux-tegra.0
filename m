From: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: tegra: Use labels for overriding nodes in Tegra114 boards
Date: Fri, 17 Apr 2015 22:03:45 +0900
Message-ID: <1429275825-3008-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1429275825-3008-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429275825-3008-1-git-send-email-k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Usage of labels instead of full paths reduces possible mistakes when
overriding nodes.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 2210 ++++++++++++++++----------------
 arch/arm/boot/dts/tegra114-roth.dts    | 1945 ++++++++++++++--------------
 arch/arm/boot/dts/tegra114-tn7.dts     |  459 ++++---
 3 files changed, 2307 insertions(+), 2307 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 8b7aa0dcdc6e..c85129897472 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -22,1111 +22,6 @@
 		reg = <0x80000000 0x40000000>;
 	};
 
-	host1x@50000000 {
-		hdmi@54280000 {
-			status = "okay";
-
-			hdmi-supply = <&vdd_5v0_hdmi>;
-			vdd-supply = <&vdd_hdmi_reg>;
-			pll-supply = <&palmas_smps3_reg>;
-
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-			nvidia,hpd-gpio =
-				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-		};
-
-		dsi@54300000 {
-			status = "okay";
-
-			avdd-dsi-csi-supply = <&avdd_1v2_reg>;
-
-			panel@0 {
-				compatible = "panasonic,vvx10f004b00",
-					     "simple-panel";
-				reg = <0>;
-
-				power-supply = <&avdd_lcd_reg>;
-				backlight = <&backlight>;
-			};
-		};
-	};
-
-	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
-		state_default: pinmux {
-			clk1_out_pw4 {
-				nvidia,pins = "clk1_out_pw4";
-				nvidia,function = "extperiph1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			dap1_din_pn1 {
-				nvidia,pins = "dap1_din_pn1";
-				nvidia,function = "i2s0";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap1_dout_pn2 {
-				nvidia,pins = "dap1_dout_pn2",
-						"dap1_fs_pn0",
-						"dap1_sclk_pn3";
-				nvidia,function = "i2s0";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap2_din_pa4 {
-				nvidia,pins = "dap2_din_pa4";
-				nvidia,function = "i2s1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap2_dout_pa5 {
-				nvidia,pins = "dap2_dout_pa5",
-						"dap2_fs_pa2",
-						"dap2_sclk_pa3";
-				nvidia,function = "i2s1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap4_din_pp5 {
-				nvidia,pins = "dap4_din_pp5",
-						"dap4_dout_pp6",
-						"dap4_fs_pp4",
-						"dap4_sclk_pp7";
-				nvidia,function = "i2s3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dvfs_pwm_px0 {
-				nvidia,pins = "dvfs_pwm_px0",
-						"dvfs_clk_px2";
-				nvidia,function = "cldvfs";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			ulpi_clk_py0 {
-				nvidia,pins = "ulpi_clk_py0",
-						"ulpi_data0_po1",
-						"ulpi_data1_po2",
-						"ulpi_data2_po3",
-						"ulpi_data3_po4",
-						"ulpi_data4_po5",
-						"ulpi_data5_po6",
-						"ulpi_data6_po7",
-						"ulpi_data7_po0";
-				nvidia,function = "ulpi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			ulpi_dir_py1 {
-				nvidia,pins = "ulpi_dir_py1",
-						"ulpi_nxt_py2";
-				nvidia,function = "ulpi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			ulpi_stp_py3 {
-				nvidia,pins = "ulpi_stp_py3";
-				nvidia,function = "ulpi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			cam_i2c_scl_pbb1 {
-				nvidia,pins = "cam_i2c_scl_pbb1",
-						"cam_i2c_sda_pbb2";
-				nvidia,function = "i2c3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			cam_mclk_pcc0 {
-				nvidia,pins = "cam_mclk_pcc0",
-						"pbb0";
-				nvidia,function = "vi_alt3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-			};
-			gen2_i2c_scl_pt5 {
-				nvidia,pins = "gen2_i2c_scl_pt5",
-						"gen2_i2c_sda_pt6";
-				nvidia,function = "i2c2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_a16_pj7 {
-				nvidia,pins = "gmi_a16_pj7";
-				nvidia,function = "uartd";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_a17_pb0 {
-				nvidia,pins = "gmi_a17_pb0",
-						"gmi_a18_pb1";
-				nvidia,function = "uartd";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_a19_pk7 {
-				nvidia,pins = "gmi_a19_pk7";
-				nvidia,function = "uartd";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad5_pg5 {
-				nvidia,pins = "gmi_ad5_pg5",
-						"gmi_cs6_n_pi3",
-						"gmi_wr_n_pi0";
-				nvidia,function = "spi4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad6_pg6 {
-				nvidia,pins = "gmi_ad6_pg6",
-						"gmi_ad7_pg7";
-				nvidia,function = "spi4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad12_ph4 {
-				nvidia,pins = "gmi_ad12_ph4";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad9_ph1 {
-				nvidia,pins = "gmi_ad9_ph1";
-				nvidia,function = "pwm1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_cs1_n_pj2 {
-				nvidia,pins = "gmi_cs1_n_pj2",
-						"gmi_oe_n_pi1";
-				nvidia,function = "soc";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			clk2_out_pw5 {
-				nvidia,pins = "clk2_out_pw5";
-				nvidia,function = "extperiph2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			sdmmc1_clk_pz0 {
-				nvidia,pins = "sdmmc1_clk_pz0";
-				nvidia,function = "sdmmc1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc1_cmd_pz1 {
-				nvidia,pins = "sdmmc1_cmd_pz1",
-						"sdmmc1_dat0_py7",
-						"sdmmc1_dat1_py6",
-						"sdmmc1_dat2_py5",
-						"sdmmc1_dat3_py4";
-				nvidia,function = "sdmmc1";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc1_wp_n_pv3 {
-				nvidia,pins = "sdmmc1_wp_n_pv3";
-				nvidia,function = "spi4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			sdmmc3_clk_pa6 {
-				nvidia,pins = "sdmmc3_clk_pa6";
-				nvidia,function = "sdmmc3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc3_cmd_pa7 {
-				nvidia,pins = "sdmmc3_cmd_pa7",
-						"sdmmc3_dat0_pb7",
-						"sdmmc3_dat1_pb6",
-						"sdmmc3_dat2_pb5",
-						"sdmmc3_dat3_pb4",
-						"kb_col4_pq4",
-						"sdmmc3_clk_lb_out_pee4",
-						"sdmmc3_clk_lb_in_pee5";
-				nvidia,function = "sdmmc3";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc4_clk_pcc4 {
-				nvidia,pins = "sdmmc4_clk_pcc4";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc4_cmd_pt7 {
-				nvidia,pins = "sdmmc4_cmd_pt7",
-						"sdmmc4_dat0_paa0",
-						"sdmmc4_dat1_paa1",
-						"sdmmc4_dat2_paa2",
-						"sdmmc4_dat3_paa3",
-						"sdmmc4_dat4_paa4",
-						"sdmmc4_dat5_paa5",
-						"sdmmc4_dat6_paa6",
-						"sdmmc4_dat7_paa7";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			clk_32k_out_pa0 {
-				nvidia,pins = "clk_32k_out_pa0";
-				nvidia,function = "blink";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_col0_pq0 {
-				nvidia,pins = "kb_col0_pq0",
-						"kb_col1_pq1",
-						"kb_col2_pq2",
-						"kb_row0_pr0",
-						"kb_row1_pr1",
-						"kb_row2_pr2";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap3_din_pp1 {
-				nvidia,pins = "dap3_din_pp1",
-						"dap3_sclk_pp3";
-				nvidia,function = "displayb";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pv0 {
-				nvidia,pins = "pv0";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_row7_pr7 {
-				nvidia,pins = "kb_row7_pr7";
-				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_row10_ps2 {
-				nvidia,pins = "kb_row10_ps2";
-				nvidia,function = "uarta";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_row9_ps1 {
-				nvidia,pins = "kb_row9_ps1";
-				nvidia,function = "uarta";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pwr_i2c_scl_pz6 {
-				nvidia,pins = "pwr_i2c_scl_pz6",
-						"pwr_i2c_sda_pz7";
-				nvidia,function = "i2cpwr";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			sys_clk_req_pz5 {
-				nvidia,pins = "sys_clk_req_pz5";
-				nvidia,function = "sysclk";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			core_pwr_req {
-				nvidia,pins = "core_pwr_req";
-				nvidia,function = "pwron";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			cpu_pwr_req {
-				nvidia,pins = "cpu_pwr_req";
-				nvidia,function = "cpu";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pwr_int_n {
-				nvidia,pins = "pwr_int_n";
-				nvidia,function = "pmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			reset_out_n {
-				nvidia,pins = "reset_out_n";
-				nvidia,function = "reset_out_n";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			clk3_out_pee0 {
-				nvidia,pins = "clk3_out_pee0";
-				nvidia,function = "extperiph3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gen1_i2c_scl_pc4 {
-				nvidia,pins = "gen1_i2c_scl_pc4",
-						"gen1_i2c_sda_pc5";
-				nvidia,function = "i2c1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			uart2_cts_n_pj5 {
-				nvidia,pins = "uart2_cts_n_pj5";
-				nvidia,function = "uartb";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			uart2_rts_n_pj6 {
-				nvidia,pins = "uart2_rts_n_pj6";
-				nvidia,function = "uartb";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			uart2_rxd_pc3 {
-				nvidia,pins = "uart2_rxd_pc3";
-				nvidia,function = "irda";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			uart2_txd_pc2 {
-				nvidia,pins = "uart2_txd_pc2";
-				nvidia,function = "irda";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			uart3_cts_n_pa1 {
-				nvidia,pins = "uart3_cts_n_pa1",
-						"uart3_rxd_pw7";
-				nvidia,function = "uartc";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			uart3_rts_n_pc0 {
-				nvidia,pins = "uart3_rts_n_pc0",
-						"uart3_txd_pw6";
-				nvidia,function = "uartc";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			owr {
-				nvidia,pins = "owr";
-				nvidia,function = "owr";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			hdmi_cec_pee3 {
-				nvidia,pins = "hdmi_cec_pee3";
-				nvidia,function = "cec";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			ddc_scl_pv4 {
-				nvidia,pins = "ddc_scl_pv4",
-						"ddc_sda_pv5";
-				nvidia,function = "i2c4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,rcv-sel = <TEGRA_PIN_ENABLE>;
-			};
-			spdif_in_pk6 {
-				nvidia,pins = "spdif_in_pk6";
-				nvidia,function = "usb";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-			};
-			usb_vbus_en0_pn4 {
-				nvidia,pins = "usb_vbus_en0_pn4";
-				nvidia,function = "usb";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x6_aud_px6 {
-				nvidia,pins = "gpio_x6_aud_px6";
-				nvidia,function = "spi6";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x4_aud_px4 {
-				nvidia,pins = "gpio_x4_aud_px4",
-						"gpio_x7_aud_px7";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gpio_x5_aud_px5 {
-				nvidia,pins = "gpio_x5_aud_px5";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_w2_aud_pw2 {
-				nvidia,pins = "gpio_w2_aud_pw2";
-				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_w3_aud_pw3 {
-				nvidia,pins = "gpio_w3_aud_pw3";
-				nvidia,function = "spi6";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x1_aud_px1 {
-				nvidia,pins = "gpio_x1_aud_px1";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x3_aud_px3 {
-				nvidia,pins = "gpio_x3_aud_px3";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap3_fs_pp0 {
-				nvidia,pins = "dap3_fs_pp0";
-				nvidia,function = "i2s2";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			dap3_dout_pp2 {
-				nvidia,pins = "dap3_dout_pp2";
-				nvidia,function = "i2s2";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pv1 {
-				nvidia,pins = "pv1";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			pbb3 {
-				nvidia,pins = "pbb3",
-						"pbb5",
-						"pbb6",
-						"pbb7";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pcc1 {
-				nvidia,pins = "pcc1",
-						"pcc2";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad0_pg0 {
-				nvidia,pins = "gmi_ad0_pg0",
-						"gmi_ad1_pg1";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad10_ph2 {
-				nvidia,pins = "gmi_ad10_ph2",
-						"gmi_ad11_ph3",
-						"gmi_ad13_ph5",
-						"gmi_ad8_ph0",
-						"gmi_clk_pk1";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad2_pg2 {
-				nvidia,pins = "gmi_ad2_pg2",
-						"gmi_ad3_pg3";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_adv_n_pk0 {
-				nvidia,pins = "gmi_adv_n_pk0",
-						"gmi_cs0_n_pj0",
-						"gmi_cs2_n_pk3",
-						"gmi_cs4_n_pk2",
-						"gmi_cs7_n_pi6",
-						"gmi_dqs_p_pj3",
-						"gmi_iordy_pi5",
-						"gmi_wp_n_pc7";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_cs3_n_pk4 {
-				nvidia,pins = "gmi_cs3_n_pk4";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			clk2_req_pcc5 {
-				nvidia,pins = "clk2_req_pcc5";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_col3_pq3 {
-				nvidia,pins = "kb_col3_pq3",
-						"kb_col6_pq6",
-						"kb_col7_pq7";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_col5_pq5 {
-				nvidia,pins = "kb_col5_pq5";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_row3_pr3 {
-				nvidia,pins = "kb_row3_pr3",
-						"kb_row4_pr4",
-						"kb_row6_pr6",
-						"kb_row8_ps0";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			clk3_req_pee1 {
-				nvidia,pins = "clk3_req_pee1";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pu4 {
-				nvidia,pins = "pu4";
-				nvidia,function = "displayb";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pu5 {
-				nvidia,pins = "pu5",
-						"pu6";
-				nvidia,function = "displayb";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			hdmi_int_pn7 {
-				nvidia,pins = "hdmi_int_pn7";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			clk1_req_pee2 {
-				nvidia,pins = "clk1_req_pee2",
-						"usb_vbus_en1_pn5";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-
-			drive_sdio1 {
-				nvidia,pins = "drive_sdio1";
-				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
-				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,pull-down-strength = <36>;
-				nvidia,pull-up-strength = <20>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOW>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOW>;
-			};
-			drive_sdio3 {
-				nvidia,pins = "drive_sdio3";
-				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
-				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,pull-down-strength = <22>;
-				nvidia,pull-up-strength = <36>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-			};
-			drive_gma {
-				nvidia,pins = "drive_gma";
-				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
-				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,pull-down-strength = <2>;
-				nvidia,pull-up-strength = <1>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-			};
-		};
-	};
-
-	serial@70006300 {
-		status = "okay";
-	};
-
-	pwm@7000a000 {
-		status = "okay";
-	};
-
-	i2c@7000c000 {
-		status = "okay";
-		clock-frequency = <100000>;
-
-		battery: smart-battery@b {
-			compatible = "ti,bq20z45", "sbs,sbs-battery";
-			reg = <0xb>;
-			battery-name = "battery";
-			sbs,i2c-retry-count = <2>;
-			sbs,poll-retry-count = <100>;
-			power-supplies = <&charger>;
-		};
-
-		rt5640: rt5640@1c {
-			compatible = "realtek,rt5640";
-			reg = <0x1c>;
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(W, 3) GPIO_ACTIVE_HIGH>;
-			realtek,ldo1-en-gpios =
-				<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
-		};
-
-		temperature-sensor@4c {
-			compatible = "onnn,nct1008";
-			reg = <0x4c>;
-			vcc-supply = <&palmas_ldo6_reg>;
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
-
-	hdmi_ddc: i2c@7000c700 {
-		status = "okay";
-	};
-
-	i2c@7000d000 {
-		status = "okay";
-		clock-frequency = <400000>;
-
-		tps51632@43 {
-			compatible = "ti,tps51632";
-			reg = <0x43>;
-			regulator-name = "vdd-cpu";
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1520000>;
-			regulator-boot-on;
-			regulator-always-on;
-		};
-
-		tps65090@48 {
-			compatible = "ti,tps65090";
-			reg = <0x48>;
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(J, 0) IRQ_TYPE_LEVEL_HIGH>;
-
-			vsys1-supply = <&vdd_ac_bat_reg>;
-			vsys2-supply = <&vdd_ac_bat_reg>;
-			vsys3-supply = <&vdd_ac_bat_reg>;
-			infet1-supply = <&vdd_ac_bat_reg>;
-			infet2-supply = <&vdd_ac_bat_reg>;
-			infet3-supply = <&tps65090_dcdc2_reg>;
-			infet4-supply = <&tps65090_dcdc2_reg>;
-			infet5-supply = <&tps65090_dcdc2_reg>;
-			infet6-supply = <&tps65090_dcdc2_reg>;
-			infet7-supply = <&tps65090_dcdc2_reg>;
-			vsys-l1-supply = <&vdd_ac_bat_reg>;
-			vsys-l2-supply = <&vdd_ac_bat_reg>;
-
-			charger: charger {
-				compatible = "ti,tps65090-charger";
-				ti,enable-low-current-chrg;
-			};
-
-			regulators {
-				tps65090_dcdc1_reg: dcdc1 {
-					regulator-name = "vdd-sys-5v0";
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				tps65090_dcdc2_reg: dcdc2 {
-					regulator-name = "vdd-sys-3v3";
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				tps65090_dcdc3_reg: dcdc3 {
-					regulator-name = "vdd-ao";
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				vdd_bl_reg: fet1 {
-					regulator-name = "vdd-lcd-bl";
-				};
-
-				fet3 {
-					regulator-name = "vdd-modem-3v3";
-				};
-
-				avdd_lcd_reg: fet4 {
-					regulator-name = "avdd-lcd";
-				};
-
-				fet5 {
-					regulator-name = "vdd-lvds";
-				};
-
-				fet6 {
-					regulator-name = "vdd-sd-slot";
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				fet7 {
-					regulator-name = "vdd-com-3v3";
-				};
-
-				ldo1 {
-					regulator-name = "vdd-sby-5v0";
-					regulator-always-on;
-					regulator-boot-on;
-				};
-
-				ldo2 {
-					regulator-name = "vdd-sby-3v3";
-					regulator-always-on;
-					regulator-boot-on;
-				};
-			};
-		};
-
-		palmas: tps65913@58 {
-			compatible = "ti,palmas";
-			reg = <0x58>;
-			interrupts = <0 86 IRQ_TYPE_LEVEL_LOW>;
-
-			#interrupt-cells = <2>;
-			interrupt-controller;
-
-			ti,system-power-controller;
-
-			palmas_gpio: gpio {
-				compatible = "ti,palmas-gpio";
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			pmic {
-				compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
-				smps1-in-supply = <&tps65090_dcdc3_reg>;
-				smps3-in-supply = <&tps65090_dcdc3_reg>;
-				smps4-in-supply = <&tps65090_dcdc2_reg>;
-				smps7-in-supply = <&tps65090_dcdc2_reg>;
-				smps8-in-supply = <&tps65090_dcdc2_reg>;
-				smps9-in-supply = <&tps65090_dcdc2_reg>;
-				ldo1-in-supply = <&tps65090_dcdc2_reg>;
-				ldo2-in-supply = <&tps65090_dcdc2_reg>;
-				ldo3-in-supply = <&palmas_smps3_reg>;
-				ldo4-in-supply = <&tps65090_dcdc2_reg>;
-				ldo5-in-supply = <&vdd_ac_bat_reg>;
-				ldo6-in-supply = <&tps65090_dcdc2_reg>;
-				ldo7-in-supply = <&tps65090_dcdc2_reg>;
-				ldo8-in-supply = <&tps65090_dcdc3_reg>;
-				ldo9-in-supply = <&palmas_smps9_reg>;
-				ldoln-in-supply = <&tps65090_dcdc1_reg>;
-				ldousb-in-supply = <&tps65090_dcdc1_reg>;
-
-				regulators {
-					smps12 {
-						regulator-name = "vddio-ddr";
-						regulator-min-microvolt = <1350000>;
-						regulator-max-microvolt = <1350000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					palmas_smps3_reg: smps3 {
-						regulator-name = "vddio-1v8";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <1800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps45 {
-						regulator-name = "vdd-core";
-						regulator-min-microvolt = <900000>;
-						regulator-max-microvolt = <1400000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps457 {
-						regulator-name = "vdd-core";
-						regulator-min-microvolt = <900000>;
-						regulator-max-microvolt = <1400000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps8 {
-						regulator-name = "avdd-pll";
-						regulator-min-microvolt = <1050000>;
-						regulator-max-microvolt = <1050000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					palmas_smps9_reg: smps9 {
-						regulator-name = "sdhci-vdd-sd-slot";
-						regulator-min-microvolt = <2800000>;
-						regulator-max-microvolt = <2800000>;
-						regulator-always-on;
-					};
-
-					ldo1 {
-						regulator-name = "avdd-cam1";
-						regulator-min-microvolt = <2800000>;
-						regulator-max-microvolt = <2800000>;
-					};
-
-					ldo2 {
-						regulator-name = "avdd-cam2";
-						regulator-min-microvolt = <2800000>;
-						regulator-max-microvolt = <2800000>;
-					};
-
-					avdd_1v2_reg: ldo3 {
-						regulator-name = "avdd-dsi-csi";
-						regulator-min-microvolt = <1200000>;
-						regulator-max-microvolt = <1200000>;
-					};
-
-					ldo4 {
-						regulator-name = "vpp-fuse";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <1800000>;
-					};
-
-					palmas_ldo6_reg: ldo6 {
-						regulator-name = "vdd-sensor-2v85";
-						regulator-min-microvolt = <2850000>;
-						regulator-max-microvolt = <2850000>;
-					};
-
-					ldo7 {
-						regulator-name = "vdd-af-cam1";
-						regulator-min-microvolt = <2800000>;
-						regulator-max-microvolt = <2800000>;
-					};
-
-					ldo8 {
-						regulator-name = "vdd-rtc";
-						regulator-min-microvolt = <900000>;
-						regulator-max-microvolt = <900000>;
-						regulator-always-on;
-						regulator-boot-on;
-						ti,enable-ldo8-tracking;
-					};
-
-					ldo9 {
-						regulator-name = "vddio-sdmmc-2";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldoln {
-						regulator-name = "hvdd-usb";
-						regulator-min-microvolt = <3300000>;
-						regulator-max-microvolt = <3300000>;
-					};
-
-					ldousb {
-						regulator-name = "avdd-usb";
-						regulator-min-microvolt = <3300000>;
-						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					regen1 {
-						regulator-name = "rail-3v3";
-						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					regen2 {
-						regulator-name = "rail-5v0";
-						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-				};
-			};
-
-			rtc {
-				compatible = "ti,palmas-rtc";
-				interrupt-parent = <&palmas>;
-				interrupts = <8 0>;
-			};
-
-			pinmux {
-				compatible = "ti,tps65913-pinctrl";
-				pinctrl-names = "default";
-				pinctrl-0 = <&palmas_default>;
-
-				palmas_default: pinmux {
-					pin_gpio6 {
-						pins = "gpio6";
-						function = "gpio";
-					};
-				};
-			};
-		};
-	};
-
-	spi@7000da00 {
-		status = "okay";
-		spi-max-frequency = <25000000>;
-		spi-flash@0 {
-			compatible = "winbond,w25q32dw";
-			reg = <0>;
-			spi-max-frequency = <20000000>;
-		};
-	};
-
-	pmc@7000e400 {
-		nvidia,invert-interrupt;
-		nvidia,suspend-mode = <1>;
-		nvidia,cpu-pwr-good-time = <500>;
-		nvidia,cpu-pwr-off-time = <300>;
-		nvidia,core-pwr-good-time = <641 3845>;
-		nvidia,core-pwr-off-time = <61036>;
-		nvidia,core-power-req-active-high;
-		nvidia,sys-clock-req-active-high;
-	};
-
-	ahub@70080000 {
-		i2s@70080400 {
-			status = "okay";
-		};
-	};
-
-	sdhci@78000400 {
-		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
-		wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
-		bus-width = <4>;
-		status = "okay";
-	};
-
-	sdhci@78000600 {
-		bus-width = <8>;
-		status = "okay";
-		non-removable;
-	};
-
-	usb@7d008000 {
-		status = "okay";
-	};
-
-	usb-phy@7d008000 {
-		status = "okay";
-		vbus-supply = <&usb3_vbus_reg>;
-	};
-
 	backlight: backlight {
 		compatible = "pwm-backlight";
 
@@ -1285,3 +180,1108 @@
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
+
+&ahub {
+	i2s@70080400 {
+		status = "okay";
+	};
+};
+
+&host1x {
+	hdmi@54280000 {
+		status = "okay";
+
+		hdmi-supply = <&vdd_5v0_hdmi>;
+		vdd-supply = <&vdd_hdmi_reg>;
+		pll-supply = <&palmas_smps3_reg>;
+
+		nvidia,ddc-i2c-bus = <&i2c4>;
+		nvidia,hpd-gpio =
+			<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+	};
+
+	dsi@54300000 {
+		status = "okay";
+
+		avdd-dsi-csi-supply = <&avdd_1v2_reg>;
+
+		panel@0 {
+			compatible = "panasonic,vvx10f004b00",
+				     "simple-panel";
+			reg = <0>;
+
+			power-supply = <&avdd_lcd_reg>;
+			backlight = <&backlight>;
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	battery: smart-battery@b {
+		compatible = "ti,bq20z45", "sbs,sbs-battery";
+		reg = <0xb>;
+		battery-name = "battery";
+		sbs,i2c-retry-count = <2>;
+		sbs,poll-retry-count = <100>;
+		power-supplies = <&charger>;
+	};
+
+	rt5640: rt5640@1c {
+		compatible = "realtek,rt5640";
+		reg = <0x1c>;
+		interrupt-parent = <&gpio>;
+		interrupts = <TEGRA_GPIO(W, 3) GPIO_ACTIVE_HIGH>;
+		realtek,ldo1-en-gpios =
+			<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+	};
+
+	temperature-sensor@4c {
+		compatible = "onnn,nct1008";
+		reg = <0x4c>;
+		vcc-supply = <&palmas_ldo6_reg>;
+		interrupt-parent = <&gpio>;
+		interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tps51632@43 {
+		compatible = "ti,tps51632";
+		reg = <0x43>;
+		regulator-name = "vdd-cpu";
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <1520000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	tps65090@48 {
+		compatible = "ti,tps65090";
+		reg = <0x48>;
+		interrupt-parent = <&gpio>;
+		interrupts = <TEGRA_GPIO(J, 0) IRQ_TYPE_LEVEL_HIGH>;
+
+		vsys1-supply = <&vdd_ac_bat_reg>;
+		vsys2-supply = <&vdd_ac_bat_reg>;
+		vsys3-supply = <&vdd_ac_bat_reg>;
+		infet1-supply = <&vdd_ac_bat_reg>;
+		infet2-supply = <&vdd_ac_bat_reg>;
+		infet3-supply = <&tps65090_dcdc2_reg>;
+		infet4-supply = <&tps65090_dcdc2_reg>;
+		infet5-supply = <&tps65090_dcdc2_reg>;
+		infet6-supply = <&tps65090_dcdc2_reg>;
+		infet7-supply = <&tps65090_dcdc2_reg>;
+		vsys-l1-supply = <&vdd_ac_bat_reg>;
+		vsys-l2-supply = <&vdd_ac_bat_reg>;
+
+		charger: charger {
+			compatible = "ti,tps65090-charger";
+			ti,enable-low-current-chrg;
+		};
+
+		regulators {
+			tps65090_dcdc1_reg: dcdc1 {
+				regulator-name = "vdd-sys-5v0";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			tps65090_dcdc2_reg: dcdc2 {
+				regulator-name = "vdd-sys-3v3";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			tps65090_dcdc3_reg: dcdc3 {
+				regulator-name = "vdd-ao";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			vdd_bl_reg: fet1 {
+				regulator-name = "vdd-lcd-bl";
+			};
+
+			fet3 {
+				regulator-name = "vdd-modem-3v3";
+			};
+
+			avdd_lcd_reg: fet4 {
+				regulator-name = "avdd-lcd";
+			};
+
+			fet5 {
+				regulator-name = "vdd-lvds";
+			};
+
+			fet6 {
+				regulator-name = "vdd-sd-slot";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			fet7 {
+				regulator-name = "vdd-com-3v3";
+			};
+
+			ldo1 {
+				regulator-name = "vdd-sby-5v0";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			ldo2 {
+				regulator-name = "vdd-sby-3v3";
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+
+	palmas: tps65913@58 {
+		compatible = "ti,palmas";
+		reg = <0x58>;
+		interrupts = <0 86 IRQ_TYPE_LEVEL_LOW>;
+
+		#interrupt-cells = <2>;
+		interrupt-controller;
+
+		ti,system-power-controller;
+
+		palmas_gpio: gpio {
+			compatible = "ti,palmas-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		pmic {
+			compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
+			smps1-in-supply = <&tps65090_dcdc3_reg>;
+			smps3-in-supply = <&tps65090_dcdc3_reg>;
+			smps4-in-supply = <&tps65090_dcdc2_reg>;
+			smps7-in-supply = <&tps65090_dcdc2_reg>;
+			smps8-in-supply = <&tps65090_dcdc2_reg>;
+			smps9-in-supply = <&tps65090_dcdc2_reg>;
+			ldo1-in-supply = <&tps65090_dcdc2_reg>;
+			ldo2-in-supply = <&tps65090_dcdc2_reg>;
+			ldo3-in-supply = <&palmas_smps3_reg>;
+			ldo4-in-supply = <&tps65090_dcdc2_reg>;
+			ldo5-in-supply = <&vdd_ac_bat_reg>;
+			ldo6-in-supply = <&tps65090_dcdc2_reg>;
+			ldo7-in-supply = <&tps65090_dcdc2_reg>;
+			ldo8-in-supply = <&tps65090_dcdc3_reg>;
+			ldo9-in-supply = <&palmas_smps9_reg>;
+			ldoln-in-supply = <&tps65090_dcdc1_reg>;
+			ldousb-in-supply = <&tps65090_dcdc1_reg>;
+
+			regulators {
+				smps12 {
+					regulator-name = "vddio-ddr";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				palmas_smps3_reg: smps3 {
+					regulator-name = "vddio-1v8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps45 {
+					regulator-name = "vdd-core";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps457 {
+					regulator-name = "vdd-core";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps8 {
+					regulator-name = "avdd-pll";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				palmas_smps9_reg: smps9 {
+					regulator-name = "sdhci-vdd-sd-slot";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+				};
+
+				ldo1 {
+					regulator-name = "avdd-cam1";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				ldo2 {
+					regulator-name = "avdd-cam2";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				avdd_1v2_reg: ldo3 {
+					regulator-name = "avdd-dsi-csi";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo4 {
+					regulator-name = "vpp-fuse";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				palmas_ldo6_reg: ldo6 {
+					regulator-name = "vdd-sensor-2v85";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				ldo7 {
+					regulator-name = "vdd-af-cam1";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+				};
+
+				ldo8 {
+					regulator-name = "vdd-rtc";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt = <900000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ti,enable-ldo8-tracking;
+				};
+
+				ldo9 {
+					regulator-name = "vddio-sdmmc-2";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldoln {
+					regulator-name = "hvdd-usb";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldousb {
+					regulator-name = "avdd-usb";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				regen1 {
+					regulator-name = "rail-3v3";
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				regen2 {
+					regulator-name = "rail-5v0";
+					regulator-max-microvolt = <5000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
+		};
+
+		rtc {
+			compatible = "ti,palmas-rtc";
+			interrupt-parent = <&palmas>;
+			interrupts = <8 0>;
+		};
+
+		pinmux {
+			compatible = "ti,tps65913-pinctrl";
+			pinctrl-names = "default";
+			pinctrl-0 = <&palmas_default>;
+
+			palmas_default: pinmux {
+				pin_gpio6 {
+					pins = "gpio6";
+					function = "gpio";
+				};
+			};
+		};
+	};
+};
+
+&phy3 {
+	status = "okay";
+	vbus-supply = <&usb3_vbus_reg>;
+};
+
+&pinmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&state_default>;
+
+	state_default: pinmux {
+		clk1_out_pw4 {
+			nvidia,pins = "clk1_out_pw4";
+			nvidia,function = "extperiph1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		dap1_din_pn1 {
+			nvidia,pins = "dap1_din_pn1";
+			nvidia,function = "i2s0";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap1_dout_pn2 {
+			nvidia,pins = "dap1_dout_pn2",
+					"dap1_fs_pn0",
+					"dap1_sclk_pn3";
+			nvidia,function = "i2s0";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap2_din_pa4 {
+			nvidia,pins = "dap2_din_pa4";
+			nvidia,function = "i2s1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap2_dout_pa5 {
+			nvidia,pins = "dap2_dout_pa5",
+					"dap2_fs_pa2",
+					"dap2_sclk_pa3";
+			nvidia,function = "i2s1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap4_din_pp5 {
+			nvidia,pins = "dap4_din_pp5",
+					"dap4_dout_pp6",
+					"dap4_fs_pp4",
+					"dap4_sclk_pp7";
+			nvidia,function = "i2s3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dvfs_pwm_px0 {
+			nvidia,pins = "dvfs_pwm_px0",
+					"dvfs_clk_px2";
+			nvidia,function = "cldvfs";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		ulpi_clk_py0 {
+			nvidia,pins = "ulpi_clk_py0",
+					"ulpi_data0_po1",
+					"ulpi_data1_po2",
+					"ulpi_data2_po3",
+					"ulpi_data3_po4",
+					"ulpi_data4_po5",
+					"ulpi_data5_po6",
+					"ulpi_data6_po7",
+					"ulpi_data7_po0";
+			nvidia,function = "ulpi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		ulpi_dir_py1 {
+			nvidia,pins = "ulpi_dir_py1",
+					"ulpi_nxt_py2";
+			nvidia,function = "ulpi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		ulpi_stp_py3 {
+			nvidia,pins = "ulpi_stp_py3";
+			nvidia,function = "ulpi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		cam_i2c_scl_pbb1 {
+			nvidia,pins = "cam_i2c_scl_pbb1",
+					"cam_i2c_sda_pbb2";
+			nvidia,function = "i2c3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		cam_mclk_pcc0 {
+			nvidia,pins = "cam_mclk_pcc0",
+					"pbb0";
+			nvidia,function = "vi_alt3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+		};
+		gen2_i2c_scl_pt5 {
+			nvidia,pins = "gen2_i2c_scl_pt5",
+					"gen2_i2c_sda_pt6";
+			nvidia,function = "i2c2";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_a16_pj7 {
+			nvidia,pins = "gmi_a16_pj7";
+			nvidia,function = "uartd";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_a17_pb0 {
+			nvidia,pins = "gmi_a17_pb0",
+					"gmi_a18_pb1";
+			nvidia,function = "uartd";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_a19_pk7 {
+			nvidia,pins = "gmi_a19_pk7";
+			nvidia,function = "uartd";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad5_pg5 {
+			nvidia,pins = "gmi_ad5_pg5",
+					"gmi_cs6_n_pi3",
+					"gmi_wr_n_pi0";
+			nvidia,function = "spi4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad6_pg6 {
+			nvidia,pins = "gmi_ad6_pg6",
+					"gmi_ad7_pg7";
+			nvidia,function = "spi4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad12_ph4 {
+			nvidia,pins = "gmi_ad12_ph4";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad9_ph1 {
+			nvidia,pins = "gmi_ad9_ph1";
+			nvidia,function = "pwm1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_cs1_n_pj2 {
+			nvidia,pins = "gmi_cs1_n_pj2",
+					"gmi_oe_n_pi1";
+			nvidia,function = "soc";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		clk2_out_pw5 {
+			nvidia,pins = "clk2_out_pw5";
+			nvidia,function = "extperiph2";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		sdmmc1_clk_pz0 {
+			nvidia,pins = "sdmmc1_clk_pz0";
+			nvidia,function = "sdmmc1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc1_cmd_pz1 {
+			nvidia,pins = "sdmmc1_cmd_pz1",
+					"sdmmc1_dat0_py7",
+					"sdmmc1_dat1_py6",
+					"sdmmc1_dat2_py5",
+					"sdmmc1_dat3_py4";
+			nvidia,function = "sdmmc1";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc1_wp_n_pv3 {
+			nvidia,pins = "sdmmc1_wp_n_pv3";
+			nvidia,function = "spi4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		sdmmc3_clk_pa6 {
+			nvidia,pins = "sdmmc3_clk_pa6";
+			nvidia,function = "sdmmc3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc3_cmd_pa7 {
+			nvidia,pins = "sdmmc3_cmd_pa7",
+					"sdmmc3_dat0_pb7",
+					"sdmmc3_dat1_pb6",
+					"sdmmc3_dat2_pb5",
+					"sdmmc3_dat3_pb4",
+					"kb_col4_pq4",
+					"sdmmc3_clk_lb_out_pee4",
+					"sdmmc3_clk_lb_in_pee5";
+			nvidia,function = "sdmmc3";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc4_clk_pcc4 {
+			nvidia,pins = "sdmmc4_clk_pcc4";
+			nvidia,function = "sdmmc4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc4_cmd_pt7 {
+			nvidia,pins = "sdmmc4_cmd_pt7",
+					"sdmmc4_dat0_paa0",
+					"sdmmc4_dat1_paa1",
+					"sdmmc4_dat2_paa2",
+					"sdmmc4_dat3_paa3",
+					"sdmmc4_dat4_paa4",
+					"sdmmc4_dat5_paa5",
+					"sdmmc4_dat6_paa6",
+					"sdmmc4_dat7_paa7";
+			nvidia,function = "sdmmc4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		clk_32k_out_pa0 {
+			nvidia,pins = "clk_32k_out_pa0";
+			nvidia,function = "blink";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_col0_pq0 {
+			nvidia,pins = "kb_col0_pq0",
+					"kb_col1_pq1",
+					"kb_col2_pq2",
+					"kb_row0_pr0",
+					"kb_row1_pr1",
+					"kb_row2_pr2";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap3_din_pp1 {
+			nvidia,pins = "dap3_din_pp1",
+					"dap3_sclk_pp3";
+			nvidia,function = "displayb";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pv0 {
+			nvidia,pins = "pv0";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_row7_pr7 {
+			nvidia,pins = "kb_row7_pr7";
+			nvidia,function = "rsvd2";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_row10_ps2 {
+			nvidia,pins = "kb_row10_ps2";
+			nvidia,function = "uarta";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_row9_ps1 {
+			nvidia,pins = "kb_row9_ps1";
+			nvidia,function = "uarta";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pwr_i2c_scl_pz6 {
+			nvidia,pins = "pwr_i2c_scl_pz6",
+					"pwr_i2c_sda_pz7";
+			nvidia,function = "i2cpwr";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		sys_clk_req_pz5 {
+			nvidia,pins = "sys_clk_req_pz5";
+			nvidia,function = "sysclk";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		core_pwr_req {
+			nvidia,pins = "core_pwr_req";
+			nvidia,function = "pwron";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		cpu_pwr_req {
+			nvidia,pins = "cpu_pwr_req";
+			nvidia,function = "cpu";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pwr_int_n {
+			nvidia,pins = "pwr_int_n";
+			nvidia,function = "pmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		reset_out_n {
+			nvidia,pins = "reset_out_n";
+			nvidia,function = "reset_out_n";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		clk3_out_pee0 {
+			nvidia,pins = "clk3_out_pee0";
+			nvidia,function = "extperiph3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gen1_i2c_scl_pc4 {
+			nvidia,pins = "gen1_i2c_scl_pc4",
+					"gen1_i2c_sda_pc5";
+			nvidia,function = "i2c1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		uart2_cts_n_pj5 {
+			nvidia,pins = "uart2_cts_n_pj5";
+			nvidia,function = "uartb";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		uart2_rts_n_pj6 {
+			nvidia,pins = "uart2_rts_n_pj6";
+			nvidia,function = "uartb";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		uart2_rxd_pc3 {
+			nvidia,pins = "uart2_rxd_pc3";
+			nvidia,function = "irda";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		uart2_txd_pc2 {
+			nvidia,pins = "uart2_txd_pc2";
+			nvidia,function = "irda";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		uart3_cts_n_pa1 {
+			nvidia,pins = "uart3_cts_n_pa1",
+					"uart3_rxd_pw7";
+			nvidia,function = "uartc";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		uart3_rts_n_pc0 {
+			nvidia,pins = "uart3_rts_n_pc0",
+					"uart3_txd_pw6";
+			nvidia,function = "uartc";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		owr {
+			nvidia,pins = "owr";
+			nvidia,function = "owr";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		hdmi_cec_pee3 {
+			nvidia,pins = "hdmi_cec_pee3";
+			nvidia,function = "cec";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		ddc_scl_pv4 {
+			nvidia,pins = "ddc_scl_pv4",
+					"ddc_sda_pv5";
+			nvidia,function = "i2c4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,rcv-sel = <TEGRA_PIN_ENABLE>;
+		};
+		spdif_in_pk6 {
+			nvidia,pins = "spdif_in_pk6";
+			nvidia,function = "usb";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+		};
+		usb_vbus_en0_pn4 {
+			nvidia,pins = "usb_vbus_en0_pn4";
+			nvidia,function = "usb";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x6_aud_px6 {
+			nvidia,pins = "gpio_x6_aud_px6";
+			nvidia,function = "spi6";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x4_aud_px4 {
+			nvidia,pins = "gpio_x4_aud_px4",
+					"gpio_x7_aud_px7";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gpio_x5_aud_px5 {
+			nvidia,pins = "gpio_x5_aud_px5";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_w2_aud_pw2 {
+			nvidia,pins = "gpio_w2_aud_pw2";
+			nvidia,function = "rsvd2";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_w3_aud_pw3 {
+			nvidia,pins = "gpio_w3_aud_pw3";
+			nvidia,function = "spi6";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x1_aud_px1 {
+			nvidia,pins = "gpio_x1_aud_px1";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x3_aud_px3 {
+			nvidia,pins = "gpio_x3_aud_px3";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap3_fs_pp0 {
+			nvidia,pins = "dap3_fs_pp0";
+			nvidia,function = "i2s2";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		dap3_dout_pp2 {
+			nvidia,pins = "dap3_dout_pp2";
+			nvidia,function = "i2s2";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pv1 {
+			nvidia,pins = "pv1";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		pbb3 {
+			nvidia,pins = "pbb3",
+					"pbb5",
+					"pbb6",
+					"pbb7";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pcc1 {
+			nvidia,pins = "pcc1",
+					"pcc2";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad0_pg0 {
+			nvidia,pins = "gmi_ad0_pg0",
+					"gmi_ad1_pg1";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad10_ph2 {
+			nvidia,pins = "gmi_ad10_ph2",
+					"gmi_ad11_ph3",
+					"gmi_ad13_ph5",
+					"gmi_ad8_ph0",
+					"gmi_clk_pk1";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad2_pg2 {
+			nvidia,pins = "gmi_ad2_pg2",
+					"gmi_ad3_pg3";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_adv_n_pk0 {
+			nvidia,pins = "gmi_adv_n_pk0",
+					"gmi_cs0_n_pj0",
+					"gmi_cs2_n_pk3",
+					"gmi_cs4_n_pk2",
+					"gmi_cs7_n_pi6",
+					"gmi_dqs_p_pj3",
+					"gmi_iordy_pi5",
+					"gmi_wp_n_pc7";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_cs3_n_pk4 {
+			nvidia,pins = "gmi_cs3_n_pk4";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		clk2_req_pcc5 {
+			nvidia,pins = "clk2_req_pcc5";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_col3_pq3 {
+			nvidia,pins = "kb_col3_pq3",
+					"kb_col6_pq6",
+					"kb_col7_pq7";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_col5_pq5 {
+			nvidia,pins = "kb_col5_pq5";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_row3_pr3 {
+			nvidia,pins = "kb_row3_pr3",
+					"kb_row4_pr4",
+					"kb_row6_pr6",
+					"kb_row8_ps0";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		clk3_req_pee1 {
+			nvidia,pins = "clk3_req_pee1";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pu4 {
+			nvidia,pins = "pu4";
+			nvidia,function = "displayb";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pu5 {
+			nvidia,pins = "pu5",
+					"pu6";
+			nvidia,function = "displayb";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		hdmi_int_pn7 {
+			nvidia,pins = "hdmi_int_pn7";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		clk1_req_pee2 {
+			nvidia,pins = "clk1_req_pee2",
+					"usb_vbus_en1_pn5";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+
+		drive_sdio1 {
+			nvidia,pins = "drive_sdio1";
+			nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+			nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+			nvidia,pull-down-strength = <36>;
+			nvidia,pull-up-strength = <20>;
+			nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOW>;
+			nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOW>;
+		};
+		drive_sdio3 {
+			nvidia,pins = "drive_sdio3";
+			nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+			nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+			nvidia,pull-down-strength = <22>;
+			nvidia,pull-up-strength = <36>;
+			nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+		};
+		drive_gma {
+			nvidia,pins = "drive_gma";
+			nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+			nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+			nvidia,pull-down-strength = <2>;
+			nvidia,pull-up-strength = <1>;
+			nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+		};
+	};
+};
+
+&pmc {
+	nvidia,invert-interrupt;
+	nvidia,suspend-mode = <1>;
+	nvidia,cpu-pwr-good-time = <500>;
+	nvidia,cpu-pwr-off-time = <300>;
+	nvidia,core-pwr-good-time = <641 3845>;
+	nvidia,core-pwr-off-time = <61036>;
+	nvidia,core-power-req-active-high;
+	nvidia,sys-clock-req-active-high;
+};
+
+&pwm {
+	status = "okay";
+};
+
+&sdhci3 {
+	cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&sdhci4 {
+	bus-width = <8>;
+	status = "okay";
+	non-removable;
+};
+
+&spi4 {
+	status = "okay";
+	spi-max-frequency = <25000000>;
+	spi-flash@0 {
+		compatible = "winbond,w25q32dw";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&uartd {
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 38acf78d7815..7a6f5fc9ee55 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -32,978 +32,6 @@
 		reg = <0x80000000 0x79600000>;
 	};
 
-	host1x@50000000 {
-		dsi@54300000 {
-			status = "okay";
-
-			vdd-supply = <&vdd_1v2_ap>;
-
-			panel@0 {
-				compatible = "lg,lh500wx1-sd03";
-				reg = <0>;
-
-				power-supply = <&vdd_lcd>;
-				backlight = <&backlight>;
-			};
-		};
-	};
-
-	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
-		state_default: pinmux {
-			clk1_out_pw4 {
-				nvidia,pins = "clk1_out_pw4";
-				nvidia,function = "extperiph1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			dap1_din_pn1 {
-				nvidia,pins = "dap1_din_pn1";
-				nvidia,function = "i2s0";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap1_dout_pn2 {
-				nvidia,pins = "dap1_dout_pn2",
-						"dap1_fs_pn0",
-						"dap1_sclk_pn3";
-				nvidia,function = "i2s0";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap2_din_pa4 {
-				nvidia,pins = "dap2_din_pa4";
-				nvidia,function = "i2s1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap2_dout_pa5 {
-				nvidia,pins = "dap2_dout_pa5",
-						"dap2_fs_pa2",
-						"dap2_sclk_pa3";
-				nvidia,function = "i2s1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap4_din_pp5 {
-				nvidia,pins = "dap4_din_pp5",
-						"dap4_dout_pp6",
-						"dap4_fs_pp4",
-						"dap4_sclk_pp7";
-				nvidia,function = "i2s3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dvfs_pwm_px0 {
-				nvidia,pins = "dvfs_pwm_px0",
-						"dvfs_clk_px2";
-				nvidia,function = "cldvfs";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			ulpi_clk_py0 {
-				nvidia,pins = "ulpi_clk_py0",
-						"ulpi_data0_po1",
-						"ulpi_data1_po2",
-						"ulpi_data2_po3",
-						"ulpi_data3_po4",
-						"ulpi_data4_po5",
-						"ulpi_data5_po6",
-						"ulpi_data6_po7",
-						"ulpi_data7_po0";
-				nvidia,function = "ulpi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			ulpi_dir_py1 {
-				nvidia,pins = "ulpi_dir_py1",
-						"ulpi_nxt_py2";
-				nvidia,function = "ulpi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			ulpi_stp_py3 {
-				nvidia,pins = "ulpi_stp_py3";
-				nvidia,function = "ulpi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			cam_i2c_scl_pbb1 {
-				nvidia,pins = "cam_i2c_scl_pbb1",
-						"cam_i2c_sda_pbb2";
-				nvidia,function = "i2c3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			cam_mclk_pcc0 {
-				nvidia,pins = "cam_mclk_pcc0",
-						"pbb0";
-				nvidia,function = "vi_alt3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-			};
-			pbb4 {
-				nvidia,pins = "pbb4";
-				nvidia,function = "vgp4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-			};
-			gen2_i2c_scl_pt5 {
-				nvidia,pins = "gen2_i2c_scl_pt5",
-						"gen2_i2c_sda_pt6";
-				nvidia,function = "i2c2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_a16_pj7 {
-				nvidia,pins = "gmi_a16_pj7",
-						"gmi_a19_pk7";
-				nvidia,function = "uartd";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_a17_pb0 {
-				nvidia,pins = "gmi_a17_pb0",
-						"gmi_a18_pb1";
-				nvidia,function = "uartd";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad5_pg5 {
-				nvidia,pins = "gmi_ad5_pg5",
-						"gmi_wr_n_pi0";
-				nvidia,function = "spi4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad6_pg6 {
-				nvidia,pins = "gmi_ad6_pg6",
-						"gmi_ad7_pg7";
-				nvidia,function = "spi4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad12_ph4 {
-				nvidia,pins = "gmi_ad12_ph4";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_cs6_n_pi13 {
-				nvidia,pins = "gmi_cs6_n_pi3";
-				nvidia,function = "nand";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad9_ph1 {
-				nvidia,pins = "gmi_ad9_ph1";
-				nvidia,function = "pwm1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_cs1_n_pj2 {
-				nvidia,pins = "gmi_cs1_n_pj2",
-						"gmi_oe_n_pi1";
-				nvidia,function = "soc";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_rst_n_pi4 {
-				nvidia,pins = "gmi_rst_n_pi4";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_iordy_pi5 {
-				nvidia,pins = "gmi_iordy_pi5";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			clk2_out_pw5 {
-				nvidia,pins = "clk2_out_pw5";
-				nvidia,function = "extperiph2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc1_clk_pz0 {
-				nvidia,pins = "sdmmc1_clk_pz0";
-				nvidia,function = "sdmmc1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc1_cmd_pz1 {
-				nvidia,pins = "sdmmc1_cmd_pz1",
-						"sdmmc1_dat0_py7",
-						"sdmmc1_dat1_py6",
-						"sdmmc1_dat2_py5",
-						"sdmmc1_dat3_py4";
-				nvidia,function = "sdmmc1";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc3_clk_pa6 {
-				nvidia,pins = "sdmmc3_clk_pa6";
-				nvidia,function = "sdmmc3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc3_cmd_pa7 {
-				nvidia,pins = "sdmmc3_cmd_pa7",
-						"sdmmc3_dat0_pb7",
-						"sdmmc3_dat1_pb6",
-						"sdmmc3_dat2_pb5",
-						"sdmmc3_dat3_pb4",
-						"sdmmc3_cd_n_pv2",
-						"sdmmc3_clk_lb_out_pee4",
-						"sdmmc3_clk_lb_in_pee5";
-				nvidia,function = "sdmmc3";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_col4_pq4 {
-				nvidia,pins = "kb_col4_pq4";
-				nvidia,function = "sdmmc3";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc4_clk_pcc4 {
-				nvidia,pins = "sdmmc4_clk_pcc4";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc4_cmd_pt7 {
-				nvidia,pins = "sdmmc4_cmd_pt7",
-						"sdmmc4_dat0_paa0",
-						"sdmmc4_dat1_paa1",
-						"sdmmc4_dat2_paa2",
-						"sdmmc4_dat3_paa3",
-						"sdmmc4_dat4_paa4",
-						"sdmmc4_dat5_paa5",
-						"sdmmc4_dat6_paa6",
-						"sdmmc4_dat7_paa7";
-				nvidia,function = "sdmmc4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			clk_32k_out_pa0 {
-				nvidia,pins = "clk_32k_out_pa0";
-				nvidia,function = "blink";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_col0_pq0 {
-				nvidia,pins = "kb_col0_pq0",
-						"kb_col1_pq1",
-						"kb_col2_pq2",
-						"kb_row0_pr0",
-						"kb_row1_pr1",
-						"kb_row2_pr2",
-						"kb_row8_ps0";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_row7_pr7 {
-				nvidia,pins = "kb_row7_pr7";
-				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_row10_ps2 {
-				nvidia,pins = "kb_row10_ps2";
-				nvidia,function = "uarta";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_row9_ps1 {
-				nvidia,pins = "kb_row9_ps1";
-				nvidia,function = "uarta";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pwr_i2c_scl_pz6 {
-				nvidia,pins = "pwr_i2c_scl_pz6",
-						"pwr_i2c_sda_pz7";
-				nvidia,function = "i2cpwr";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			sys_clk_req_pz5 {
-				nvidia,pins = "sys_clk_req_pz5";
-				nvidia,function = "sysclk";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			core_pwr_req {
-				nvidia,pins = "core_pwr_req";
-				nvidia,function = "pwron";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			cpu_pwr_req {
-				nvidia,pins = "cpu_pwr_req";
-				nvidia,function = "cpu";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pwr_int_n {
-				nvidia,pins = "pwr_int_n";
-				nvidia,function = "pmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			reset_out_n {
-				nvidia,pins = "reset_out_n";
-				nvidia,function = "reset_out_n";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			clk3_out_pee0 {
-				nvidia,pins = "clk3_out_pee0";
-				nvidia,function = "extperiph3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gen1_i2c_scl_pc4 {
-				nvidia,pins = "gen1_i2c_scl_pc4",
-						"gen1_i2c_sda_pc5";
-				nvidia,function = "i2c1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			uart2_cts_n_pj5 {
-				nvidia,pins = "uart2_cts_n_pj5";
-				nvidia,function = "uartb";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			uart2_rts_n_pj6 {
-				nvidia,pins = "uart2_rts_n_pj6";
-				nvidia,function = "uartb";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			uart2_rxd_pc3 {
-				nvidia,pins = "uart2_rxd_pc3";
-				nvidia,function = "irda";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			uart2_txd_pc2 {
-				nvidia,pins = "uart2_txd_pc2";
-				nvidia,function = "irda";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			uart3_cts_n_pa1 {
-				nvidia,pins = "uart3_cts_n_pa1",
-						"uart3_rxd_pw7";
-				nvidia,function = "uartc";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			uart3_rts_n_pc0 {
-				nvidia,pins = "uart3_rts_n_pc0",
-						"uart3_txd_pw6";
-				nvidia,function = "uartc";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			owr {
-				nvidia,pins = "owr";
-				nvidia,function = "owr";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			hdmi_cec_pee3 {
-				nvidia,pins = "hdmi_cec_pee3";
-				nvidia,function = "cec";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
-			};
-			ddc_scl_pv4 {
-				nvidia,pins = "ddc_scl_pv4",
-						"ddc_sda_pv5";
-				nvidia,function = "i2c4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,rcv-sel = <TEGRA_PIN_ENABLE>;
-			};
-			spdif_in_pk6 {
-				nvidia,pins = "spdif_in_pk6";
-				nvidia,function = "usb";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-			};
-			usb_vbus_en0_pn4 {
-				nvidia,pins = "usb_vbus_en0_pn4";
-				nvidia,function = "usb";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-				nvidia,lock = <TEGRA_PIN_DISABLE>;
-				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x6_aud_px6 {
-				nvidia,pins = "gpio_x6_aud_px6";
-				nvidia,function = "spi6";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x1_aud_px1 {
-				nvidia,pins = "gpio_x1_aud_px1";
-				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x7_aud_px7 {
-				nvidia,pins = "gpio_x7_aud_px7";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_adv_n_pk0 {
-				nvidia,pins = "gmi_adv_n_pk0";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_cs0_n_pj0 {
-				nvidia,pins = "gmi_cs0_n_pj0";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			pu3 {
-				nvidia,pins = "pu3";
-				nvidia,function = "pwm0";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gpio_x4_aud_px4 {
-				nvidia,pins = "gpio_x4_aud_px4",
-						"gpio_x5_aud_px5";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_x3_aud_px3 {
-				nvidia,pins = "gpio_x3_aud_px3";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_w2_aud_pw2 {
-				nvidia,pins = "gpio_w2_aud_pw2";
-				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gpio_w3_aud_pw3 {
-				nvidia,pins = "gpio_w3_aud_pw3";
-				nvidia,function = "spi6";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			dap3_fs_pp0 {
-				nvidia,pins = "dap3_fs_pp0",
-						"dap3_din_pp1",
-						"dap3_dout_pp2",
-						"dap3_sclk_pp3";
-				nvidia,function = "i2s2";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pv0 {
-				nvidia,pins = "pv0";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			pv1 {
-				nvidia,pins = "pv1";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			pbb3 {
-				nvidia,pins = "pbb3",
-						"pbb5",
-						"pbb6",
-						"pbb7";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pcc1 {
-				nvidia,pins = "pcc1",
-						"pcc2";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad0_pg0 {
-				nvidia,pins = "gmi_ad0_pg0",
-						"gmi_ad1_pg1";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad10_ph2 {
-				nvidia,pins = "gmi_ad10_ph2",
-						"gmi_ad12_ph4",
-						"gmi_ad15_ph7",
-						"gmi_cs3_n_pk4";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad11_ph3 {
-				nvidia,pins = "gmi_ad11_ph3",
-						"gmi_ad13_ph5",
-						"gmi_ad8_ph0",
-						"gmi_clk_pk1",
-						"gmi_cs2_n_pk3";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			gmi_ad14_ph6 {
-				nvidia,pins = "gmi_ad14_ph6",
-						"gmi_cs0_n_pj0",
-						"gmi_cs4_n_pk2",
-						"gmi_cs7_n_pi6",
-						"gmi_dqs_p_pj3",
-						"gmi_wp_n_pc7";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			gmi_ad2_pg2 {
-				nvidia,pins = "gmi_ad2_pg2",
-						"gmi_ad3_pg3";
-				nvidia,function = "gmi";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			sdmmc1_wp_n_pv3 {
-				nvidia,pins = "sdmmc1_wp_n_pv3";
-				nvidia,function = "spi4";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			clk2_req_pcc5 {
-				nvidia,pins = "clk2_req_pcc5";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_col3_pq3 {
-				nvidia,pins = "kb_col3_pq3";
-				nvidia,function = "pwm2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_col5_pq5 {
-				nvidia,pins = "kb_col5_pq5";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			kb_col6_pq6 {
-				nvidia,pins = "kb_col6_pq6",
-						"kb_col7_pq7";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			kb_row3_pr3 {
-				nvidia,pins = "kb_row3_pr3",
-						"kb_row4_pr4",
-						"kb_row6_pr6";
-				nvidia,function = "kbc";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			clk3_req_pee1 {
-				nvidia,pins = "clk3_req_pee1";
-				nvidia,function = "rsvd4";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-			};
-			pu2 {
-				nvidia,pins = "pu2";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_UP>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-			hdmi_int_pn7 {
-				nvidia,pins = "hdmi_int_pn7";
-				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-
-			drive_sdio1 {
-				nvidia,pins = "drive_sdio1";
-				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
-				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,pull-down-strength = <36>;
-				nvidia,pull-up-strength = <20>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOW>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOW>;
-			};
-			drive_sdio3 {
-				nvidia,pins = "drive_sdio3";
-				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
-				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,pull-down-strength = <36>;
-				nvidia,pull-up-strength = <20>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-			};
-			drive_gma {
-				nvidia,pins = "drive_gma";
-				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
-				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-				nvidia,pull-down-strength = <2>;
-				nvidia,pull-up-strength = <2>;
-				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
-			};
-		};
-	};
-
-	/* Usable on reworked devices only */
-	serial@70006300 {
-		status = "okay";
-	};
-
-	pwm@7000a000 {
-		status = "okay";
-	};
-
-	i2c@7000d000 {
-		status = "okay";
-		clock-frequency = <400000>;
-
-		regulator@43 {
-			compatible = "ti,tps51632";
-			reg = <0x43>;
-			regulator-name = "vdd-cpu";
-			regulator-min-microvolt = <500000>;
-			regulator-max-microvolt = <1520000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		palmas: pmic@58 {
-			compatible = "ti,palmas";
-			reg = <0x58>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
-
-			#interrupt-cells = <2>;
-			interrupt-controller;
-
-			ti,system-power-controller;
-
-			palmas_gpio: gpio {
-				compatible = "ti,palmas-gpio";
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			pmic {
-				compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
-
-				regulators {
-					smps12 {
-						regulator-name = "vdd-ddr";
-						regulator-min-microvolt = <1200000>;
-						regulator-max-microvolt = <1500000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_1v8: smps3 {
-						regulator-name = "vdd-1v8";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <1800000>;
-						regulator-boot-on;
-					};
-
-					smps457 {
-						regulator-name = "vdd-soc";
-						regulator-min-microvolt = <900000>;
-						regulator-max-microvolt = <1400000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps8 {
-						regulator-name = "avdd-pll-1v05";
-						regulator-min-microvolt = <1050000>;
-						regulator-max-microvolt = <1050000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps9 {
-						regulator-name = "vdd-2v85-emmc";
-						regulator-min-microvolt = <2800000>;
-						regulator-max-microvolt = <2800000>;
-						regulator-always-on;
-					};
-
-					smps10_out1 {
-						regulator-name = "vdd-fan";
-						regulator-min-microvolt = <5000000>;
-						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps10_out2 {
-						regulator-name = "vdd-5v0-sys";
-						regulator-min-microvolt = <5000000>;
-						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo2 {
-						regulator-name = "vdd-2v8-display";
-						regulator-min-microvolt = <2800000>;
-						regulator-max-microvolt = <2800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_1v2_ap: ldo3 {
-						regulator-name = "avdd-1v2";
-						regulator-min-microvolt = <1200000>;
-						regulator-max-microvolt = <1200000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo4 {
-						regulator-name = "vpp-fuse";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <1800000>;
-					};
-
-					ldo5 {
-						regulator-name = "avdd-hdmi-pll";
-						regulator-min-microvolt = <1200000>;
-						regulator-max-microvolt = <1200000>;
-					};
-
-					ldo6 {
-						regulator-name = "vdd-sensor-2v8";
-						regulator-min-microvolt = <2850000>;
-						regulator-max-microvolt = <2850000>;
-					};
-
-					ldo8 {
-						regulator-name = "vdd-rtc";
-						regulator-min-microvolt = <1100000>;
-						regulator-max-microvolt = <1100000>;
-						regulator-always-on;
-						regulator-boot-on;
-						ti,enable-ldo8-tracking;
-					};
-
-					vddio_sdmmc3: ldo9 {
-						regulator-name = "vddio-sdmmc3";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <3300000>;
-					};
-
-					ldousb {
-						regulator-name = "avdd-usb-hdmi";
-						regulator-min-microvolt = <3300000>;
-						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_3v3_sys: regen1 {
-						regulator-name = "rail-3v3";
-						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					regen2 {
-						regulator-name = "rail-5v0";
-						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-				};
-			};
-
-			rtc {
-				compatible = "ti,palmas-rtc";
-				interrupt-parent = <&palmas>;
-				interrupts = <8 0>;
-			};
-
-		};
-	};
-
-	pmc@7000e400 {
-		nvidia,invert-interrupt;
-	};
-
-	/* SD card */
-	sdhci@78000400 {
-		status = "okay";
-		bus-width = <4>;
-		vqmmc-supply = <&vddio_sdmmc3>;
-		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
-		power-gpios = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
-	};
-
-	/* eMMC */
-	sdhci@78000600 {
-		status = "okay";
-		bus-width = <8>;
-		non-removable;
-	};
-
-	/* External USB port (must be powered) */
-	usb@7d000000 {
-		status = "okay";
-	};
-
-	usb-phy@7d000000 {
-		status = "okay";
-		nvidia,xcvr-setup = <7>;
-		nvidia,xcvr-lsfslew = <2>;
-		nvidia,xcvr-lsrslew = <2>;
-		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-		/* Should be changed to "otg" once we have vbus_supply */
-		/* As of now, USB devices need to be powered externally */
-		dr_mode = "host";
-	};
-
-	/* SHIELD controller */
-	usb@7d008000 {
-		status = "okay";
-	};
-
-	usb-phy@7d008000 {
-		status = "okay";
-		nvidia,xcvr-setup = <7>;
-		nvidia,xcvr-lsfslew = <2>;
-		nvidia,xcvr-lsrslew = <2>;
-	};
-
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm 1 40000>;
@@ -1124,3 +152,976 @@
 		};
 	};
 };
+
+&host1x {
+	dsi@54300000 {
+		status = "okay";
+
+		vdd-supply = <&vdd_1v2_ap>;
+
+		panel@0 {
+			compatible = "lg,lh500wx1-sd03";
+			reg = <0>;
+
+			power-supply = <&vdd_lcd>;
+			backlight = <&backlight>;
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	regulator@43 {
+		compatible = "ti,tps51632";
+		reg = <0x43>;
+		regulator-name = "vdd-cpu";
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <1520000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	palmas: pmic@58 {
+		compatible = "ti,palmas";
+		reg = <0x58>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+
+		#interrupt-cells = <2>;
+		interrupt-controller;
+
+		ti,system-power-controller;
+
+		palmas_gpio: gpio {
+			compatible = "ti,palmas-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		pmic {
+			compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
+
+			regulators {
+				smps12 {
+					regulator-name = "vdd-ddr";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1500000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v8: smps3 {
+					regulator-name = "vdd-1v8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-boot-on;
+				};
+
+				smps457 {
+					regulator-name = "vdd-soc";
+					regulator-min-microvolt = <900000>;
+					regulator-max-microvolt = <1400000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps8 {
+					regulator-name = "avdd-pll-1v05";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps9 {
+					regulator-name = "vdd-2v85-emmc";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+				};
+
+				smps10_out1 {
+					regulator-name = "vdd-fan";
+					regulator-min-microvolt = <5000000>;
+					regulator-max-microvolt = <5000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps10_out2 {
+					regulator-name = "vdd-5v0-sys";
+					regulator-min-microvolt = <5000000>;
+					regulator-max-microvolt = <5000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo2 {
+					regulator-name = "vdd-2v8-display";
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <2800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v2_ap: ldo3 {
+					regulator-name = "avdd-1v2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo4 {
+					regulator-name = "vpp-fuse";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				ldo5 {
+					regulator-name = "avdd-hdmi-pll";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+				};
+
+				ldo6 {
+					regulator-name = "vdd-sensor-2v8";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				ldo8 {
+					regulator-name = "vdd-rtc";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ti,enable-ldo8-tracking;
+				};
+
+				vddio_sdmmc3: ldo9 {
+					regulator-name = "vddio-sdmmc3";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+				};
+
+				ldousb {
+					regulator-name = "avdd-usb-hdmi";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_3v3_sys: regen1 {
+					regulator-name = "rail-3v3";
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				regen2 {
+					regulator-name = "rail-5v0";
+					regulator-max-microvolt = <5000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+			};
+		};
+
+		rtc {
+			compatible = "ti,palmas-rtc";
+			interrupt-parent = <&palmas>;
+			interrupts = <8 0>;
+		};
+
+	};
+};
+
+&phy1 {
+	status = "okay";
+	nvidia,xcvr-setup = <7>;
+	nvidia,xcvr-lsfslew = <2>;
+	nvidia,xcvr-lsrslew = <2>;
+	interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+	/* Should be changed to "otg" once we have vbus_supply */
+	/* As of now, USB devices need to be powered externally */
+	dr_mode = "host";
+};
+
+&phy3 {
+	status = "okay";
+	nvidia,xcvr-setup = <7>;
+	nvidia,xcvr-lsfslew = <2>;
+	nvidia,xcvr-lsrslew = <2>;
+};
+
+&pinmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&state_default>;
+
+	state_default: pinmux {
+		clk1_out_pw4 {
+			nvidia,pins = "clk1_out_pw4";
+			nvidia,function = "extperiph1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		dap1_din_pn1 {
+			nvidia,pins = "dap1_din_pn1";
+			nvidia,function = "i2s0";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap1_dout_pn2 {
+			nvidia,pins = "dap1_dout_pn2",
+					"dap1_fs_pn0",
+					"dap1_sclk_pn3";
+			nvidia,function = "i2s0";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap2_din_pa4 {
+			nvidia,pins = "dap2_din_pa4";
+			nvidia,function = "i2s1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap2_dout_pa5 {
+			nvidia,pins = "dap2_dout_pa5",
+					"dap2_fs_pa2",
+					"dap2_sclk_pa3";
+			nvidia,function = "i2s1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap4_din_pp5 {
+			nvidia,pins = "dap4_din_pp5",
+					"dap4_dout_pp6",
+					"dap4_fs_pp4",
+					"dap4_sclk_pp7";
+			nvidia,function = "i2s3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dvfs_pwm_px0 {
+			nvidia,pins = "dvfs_pwm_px0",
+					"dvfs_clk_px2";
+			nvidia,function = "cldvfs";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		ulpi_clk_py0 {
+			nvidia,pins = "ulpi_clk_py0",
+					"ulpi_data0_po1",
+					"ulpi_data1_po2",
+					"ulpi_data2_po3",
+					"ulpi_data3_po4",
+					"ulpi_data4_po5",
+					"ulpi_data5_po6",
+					"ulpi_data6_po7",
+					"ulpi_data7_po0";
+			nvidia,function = "ulpi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		ulpi_dir_py1 {
+			nvidia,pins = "ulpi_dir_py1",
+					"ulpi_nxt_py2";
+			nvidia,function = "ulpi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		ulpi_stp_py3 {
+			nvidia,pins = "ulpi_stp_py3";
+			nvidia,function = "ulpi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		cam_i2c_scl_pbb1 {
+			nvidia,pins = "cam_i2c_scl_pbb1",
+					"cam_i2c_sda_pbb2";
+			nvidia,function = "i2c3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		cam_mclk_pcc0 {
+			nvidia,pins = "cam_mclk_pcc0",
+					"pbb0";
+			nvidia,function = "vi_alt3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+		};
+		pbb4 {
+			nvidia,pins = "pbb4";
+			nvidia,function = "vgp4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+		};
+		gen2_i2c_scl_pt5 {
+			nvidia,pins = "gen2_i2c_scl_pt5",
+					"gen2_i2c_sda_pt6";
+			nvidia,function = "i2c2";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_a16_pj7 {
+			nvidia,pins = "gmi_a16_pj7",
+					"gmi_a19_pk7";
+			nvidia,function = "uartd";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_a17_pb0 {
+			nvidia,pins = "gmi_a17_pb0",
+					"gmi_a18_pb1";
+			nvidia,function = "uartd";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad5_pg5 {
+			nvidia,pins = "gmi_ad5_pg5",
+					"gmi_wr_n_pi0";
+			nvidia,function = "spi4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad6_pg6 {
+			nvidia,pins = "gmi_ad6_pg6",
+					"gmi_ad7_pg7";
+			nvidia,function = "spi4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad12_ph4 {
+			nvidia,pins = "gmi_ad12_ph4";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_cs6_n_pi13 {
+			nvidia,pins = "gmi_cs6_n_pi3";
+			nvidia,function = "nand";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad9_ph1 {
+			nvidia,pins = "gmi_ad9_ph1";
+			nvidia,function = "pwm1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_cs1_n_pj2 {
+			nvidia,pins = "gmi_cs1_n_pj2",
+					"gmi_oe_n_pi1";
+			nvidia,function = "soc";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_rst_n_pi4 {
+			nvidia,pins = "gmi_rst_n_pi4";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_iordy_pi5 {
+			nvidia,pins = "gmi_iordy_pi5";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		clk2_out_pw5 {
+			nvidia,pins = "clk2_out_pw5";
+			nvidia,function = "extperiph2";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc1_clk_pz0 {
+			nvidia,pins = "sdmmc1_clk_pz0";
+			nvidia,function = "sdmmc1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc1_cmd_pz1 {
+			nvidia,pins = "sdmmc1_cmd_pz1",
+					"sdmmc1_dat0_py7",
+					"sdmmc1_dat1_py6",
+					"sdmmc1_dat2_py5",
+					"sdmmc1_dat3_py4";
+			nvidia,function = "sdmmc1";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc3_clk_pa6 {
+			nvidia,pins = "sdmmc3_clk_pa6";
+			nvidia,function = "sdmmc3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc3_cmd_pa7 {
+			nvidia,pins = "sdmmc3_cmd_pa7",
+					"sdmmc3_dat0_pb7",
+					"sdmmc3_dat1_pb6",
+					"sdmmc3_dat2_pb5",
+					"sdmmc3_dat3_pb4",
+					"sdmmc3_cd_n_pv2",
+					"sdmmc3_clk_lb_out_pee4",
+					"sdmmc3_clk_lb_in_pee5";
+			nvidia,function = "sdmmc3";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_col4_pq4 {
+			nvidia,pins = "kb_col4_pq4";
+			nvidia,function = "sdmmc3";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc4_clk_pcc4 {
+			nvidia,pins = "sdmmc4_clk_pcc4";
+			nvidia,function = "sdmmc4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc4_cmd_pt7 {
+			nvidia,pins = "sdmmc4_cmd_pt7",
+					"sdmmc4_dat0_paa0",
+					"sdmmc4_dat1_paa1",
+					"sdmmc4_dat2_paa2",
+					"sdmmc4_dat3_paa3",
+					"sdmmc4_dat4_paa4",
+					"sdmmc4_dat5_paa5",
+					"sdmmc4_dat6_paa6",
+					"sdmmc4_dat7_paa7";
+			nvidia,function = "sdmmc4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		clk_32k_out_pa0 {
+			nvidia,pins = "clk_32k_out_pa0";
+			nvidia,function = "blink";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_col0_pq0 {
+			nvidia,pins = "kb_col0_pq0",
+					"kb_col1_pq1",
+					"kb_col2_pq2",
+					"kb_row0_pr0",
+					"kb_row1_pr1",
+					"kb_row2_pr2",
+					"kb_row8_ps0";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_row7_pr7 {
+			nvidia,pins = "kb_row7_pr7";
+			nvidia,function = "rsvd2";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_row10_ps2 {
+			nvidia,pins = "kb_row10_ps2";
+			nvidia,function = "uarta";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_row9_ps1 {
+			nvidia,pins = "kb_row9_ps1";
+			nvidia,function = "uarta";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pwr_i2c_scl_pz6 {
+			nvidia,pins = "pwr_i2c_scl_pz6",
+					"pwr_i2c_sda_pz7";
+			nvidia,function = "i2cpwr";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		sys_clk_req_pz5 {
+			nvidia,pins = "sys_clk_req_pz5";
+			nvidia,function = "sysclk";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		core_pwr_req {
+			nvidia,pins = "core_pwr_req";
+			nvidia,function = "pwron";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		cpu_pwr_req {
+			nvidia,pins = "cpu_pwr_req";
+			nvidia,function = "cpu";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pwr_int_n {
+			nvidia,pins = "pwr_int_n";
+			nvidia,function = "pmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		reset_out_n {
+			nvidia,pins = "reset_out_n";
+			nvidia,function = "reset_out_n";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		clk3_out_pee0 {
+			nvidia,pins = "clk3_out_pee0";
+			nvidia,function = "extperiph3";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gen1_i2c_scl_pc4 {
+			nvidia,pins = "gen1_i2c_scl_pc4",
+					"gen1_i2c_sda_pc5";
+			nvidia,function = "i2c1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		uart2_cts_n_pj5 {
+			nvidia,pins = "uart2_cts_n_pj5";
+			nvidia,function = "uartb";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		uart2_rts_n_pj6 {
+			nvidia,pins = "uart2_rts_n_pj6";
+			nvidia,function = "uartb";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		uart2_rxd_pc3 {
+			nvidia,pins = "uart2_rxd_pc3";
+			nvidia,function = "irda";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		uart2_txd_pc2 {
+			nvidia,pins = "uart2_txd_pc2";
+			nvidia,function = "irda";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		uart3_cts_n_pa1 {
+			nvidia,pins = "uart3_cts_n_pa1",
+					"uart3_rxd_pw7";
+			nvidia,function = "uartc";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		uart3_rts_n_pc0 {
+			nvidia,pins = "uart3_rts_n_pc0",
+					"uart3_txd_pw6";
+			nvidia,function = "uartc";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		owr {
+			nvidia,pins = "owr";
+			nvidia,function = "owr";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		hdmi_cec_pee3 {
+			nvidia,pins = "hdmi_cec_pee3";
+			nvidia,function = "cec";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+		};
+		ddc_scl_pv4 {
+			nvidia,pins = "ddc_scl_pv4",
+					"ddc_sda_pv5";
+			nvidia,function = "i2c4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,rcv-sel = <TEGRA_PIN_ENABLE>;
+		};
+		spdif_in_pk6 {
+			nvidia,pins = "spdif_in_pk6";
+			nvidia,function = "usb";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+		};
+		usb_vbus_en0_pn4 {
+			nvidia,pins = "usb_vbus_en0_pn4";
+			nvidia,function = "usb";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			nvidia,lock = <TEGRA_PIN_DISABLE>;
+			nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x6_aud_px6 {
+			nvidia,pins = "gpio_x6_aud_px6";
+			nvidia,function = "spi6";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x1_aud_px1 {
+			nvidia,pins = "gpio_x1_aud_px1";
+			nvidia,function = "rsvd2";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x7_aud_px7 {
+			nvidia,pins = "gpio_x7_aud_px7";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_adv_n_pk0 {
+			nvidia,pins = "gmi_adv_n_pk0";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_cs0_n_pj0 {
+			nvidia,pins = "gmi_cs0_n_pj0";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		pu3 {
+			nvidia,pins = "pu3";
+			nvidia,function = "pwm0";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gpio_x4_aud_px4 {
+			nvidia,pins = "gpio_x4_aud_px4",
+					"gpio_x5_aud_px5";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_x3_aud_px3 {
+			nvidia,pins = "gpio_x3_aud_px3";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_w2_aud_pw2 {
+			nvidia,pins = "gpio_w2_aud_pw2";
+			nvidia,function = "rsvd2";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gpio_w3_aud_pw3 {
+			nvidia,pins = "gpio_w3_aud_pw3";
+			nvidia,function = "spi6";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		dap3_fs_pp0 {
+			nvidia,pins = "dap3_fs_pp0",
+					"dap3_din_pp1",
+					"dap3_dout_pp2",
+					"dap3_sclk_pp3";
+			nvidia,function = "i2s2";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pv0 {
+			nvidia,pins = "pv0";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		pv1 {
+			nvidia,pins = "pv1";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		pbb3 {
+			nvidia,pins = "pbb3",
+					"pbb5",
+					"pbb6",
+					"pbb7";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pcc1 {
+			nvidia,pins = "pcc1",
+					"pcc2";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad0_pg0 {
+			nvidia,pins = "gmi_ad0_pg0",
+					"gmi_ad1_pg1";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad10_ph2 {
+			nvidia,pins = "gmi_ad10_ph2",
+					"gmi_ad12_ph4",
+					"gmi_ad15_ph7",
+					"gmi_cs3_n_pk4";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad11_ph3 {
+			nvidia,pins = "gmi_ad11_ph3",
+					"gmi_ad13_ph5",
+					"gmi_ad8_ph0",
+					"gmi_clk_pk1",
+					"gmi_cs2_n_pk3";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		gmi_ad14_ph6 {
+			nvidia,pins = "gmi_ad14_ph6",
+					"gmi_cs0_n_pj0",
+					"gmi_cs4_n_pk2",
+					"gmi_cs7_n_pi6",
+					"gmi_dqs_p_pj3",
+					"gmi_wp_n_pc7";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		gmi_ad2_pg2 {
+			nvidia,pins = "gmi_ad2_pg2",
+					"gmi_ad3_pg3";
+			nvidia,function = "gmi";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		sdmmc1_wp_n_pv3 {
+			nvidia,pins = "sdmmc1_wp_n_pv3";
+			nvidia,function = "spi4";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		clk2_req_pcc5 {
+			nvidia,pins = "clk2_req_pcc5";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_col3_pq3 {
+			nvidia,pins = "kb_col3_pq3";
+			nvidia,function = "pwm2";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_col5_pq5 {
+			nvidia,pins = "kb_col5_pq5";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		kb_col6_pq6 {
+			nvidia,pins = "kb_col6_pq6",
+					"kb_col7_pq7";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		kb_row3_pr3 {
+			nvidia,pins = "kb_row3_pr3",
+					"kb_row4_pr4",
+					"kb_row6_pr6";
+			nvidia,function = "kbc";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		clk3_req_pee1 {
+			nvidia,pins = "clk3_req_pee1";
+			nvidia,function = "rsvd4";
+			nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+		};
+		pu2 {
+			nvidia,pins = "pu2";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_UP>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+		hdmi_int_pn7 {
+			nvidia,pins = "hdmi_int_pn7";
+			nvidia,function = "rsvd1";
+			nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+			nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+		};
+
+		drive_sdio1 {
+			nvidia,pins = "drive_sdio1";
+			nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+			nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+			nvidia,pull-down-strength = <36>;
+			nvidia,pull-up-strength = <20>;
+			nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOW>;
+			nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOW>;
+		};
+		drive_sdio3 {
+			nvidia,pins = "drive_sdio3";
+			nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+			nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+			nvidia,pull-down-strength = <36>;
+			nvidia,pull-up-strength = <20>;
+			nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+		};
+		drive_gma {
+			nvidia,pins = "drive_gma";
+			nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+			nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+			nvidia,pull-down-strength = <2>;
+			nvidia,pull-up-strength = <2>;
+			nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+		};
+	};
+};
+
+&pmc {
+	nvidia,invert-interrupt;
+};
+
+&pwm {
+	status = "okay";
+};
+
+/* SD card */
+&sdhci3 {
+	status = "okay";
+	bus-width = <4>;
+	vqmmc-supply = <&vddio_sdmmc3>;
+	cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+	power-gpios = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+};
+
+/* eMMC */
+&sdhci4 {
+	status = "okay";
+	bus-width = <8>;
+	non-removable;
+};
+
+
+/* Usable on reworked devices only */
+&uartd {
+	status = "okay";
+};
+
+/* External USB port (must be powered) */
+&usb1 {
+	status = "okay";
+};
+
+/* SHIELD controller */
+&usb3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index f91c2c9b2f94..da1881ac1a45 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -32,236 +32,6 @@
 		reg = <0x80000000 0x37e00000>;
 	};
 
-	host1x@50000000 {
-		dsi@54300000 {
-			status = "okay";
-
-			vdd-supply = <&vdd_1v2_ap>;
-
-			panel@0 {
-				compatible = "lg,ld070wx3-sl01";
-				reg = <0>;
-
-				power-supply = <&vdd_lcd>;
-				backlight = <&backlight>;
-			};
-		};
-	};
-
-	serial@70006300 {
-		status = "okay";
-	};
-
-	pwm@7000a000 {
-		status = "okay";
-	};
-
-	i2c@7000d000 {
-		status = "okay";
-		clock-frequency = <400000>;
-
-		palmas: pmic@58 {
-			compatible = "ti,palmas";
-			reg = <0x58>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
-
-			#interrupt-cells = <2>;
-			interrupt-controller;
-
-			ti,system-power-controller;
-
-			palmas_gpio: gpio {
-				compatible = "ti,palmas-gpio";
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-
-			pmic {
-				compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
-
-				ldoln-in-supply = <&vdd_smps10_out2>;
-
-				regulators {
-					smps123 {
-						regulator-name = "vd-cpu";
-						regulator-min-microvolt = <1000000>;
-						regulator-max-microvolt = <1000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps45 {
-						regulator-name = "vd-soc";
-						regulator-min-microvolt = <1100000>;
-						regulator-max-microvolt = <1100000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps6 {
-						regulator-name = "va-lcd-hv";
-						regulator-min-microvolt = <3000000>;
-						regulator-max-microvolt = <3000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					smps7 {
-						regulator-name = "vd-ddr";
-						regulator-min-microvolt = <1350000>;
-						regulator-max-microvolt = <1350000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_1v8: smps8 {
-						regulator-name = "vs-pmu-1v8";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <1800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_2v9_sys: smps9 {
-						regulator-name = "vs-sys-2v9";
-						regulator-min-microvolt = <2900000>;
-						regulator-max-microvolt = <2900000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_smps10_out1: smps10_out1 {
-						regulator-name = "vd-smps10-out1";
-						regulator-min-microvolt = <5000000>;
-						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_smps10_out2: smps10_out2 {
-						regulator-name = "vd-smps10-out2";
-						regulator-min-microvolt = <5000000>;
-						regulator-max-microvolt = <5000000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo1 {
-						regulator-name = "va-pllx";
-						regulator-min-microvolt = <1050000>;
-						regulator-max-microvolt = <1050000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					vdd_1v2_ap: ldo2 {
-						regulator-name = "va-ap-1v2";
-						regulator-min-microvolt = <1200000>;
-						regulator-max-microvolt = <1200000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo3 {
-						regulator-name = "vd-fuse";
-						regulator-min-microvolt = <1800000>;
-						regulator-max-microvolt = <1800000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo4 {
-						regulator-name = "vd-ts-hv";
-						regulator-min-microvolt = <3200000>;
-						regulator-max-microvolt = <3200000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo5 {
-						regulator-name = "va-cam2-hv";
-						regulator-min-microvolt = <2700000>;
-						regulator-max-microvolt = <2700000>;
-					};
-
-					ldo6 {
-						regulator-name = "va-sns-hv";
-						regulator-min-microvolt = <2850000>;
-						regulator-max-microvolt = <2850000>;
-					};
-
-					ldo7 {
-						regulator-name = "va-cam1-hv";
-						regulator-min-microvolt = <2700000>;
-						regulator-max-microvolt = <2700000>;
-					};
-
-					ldo8 {
-						regulator-name = "va-ap-rtc";
-						regulator-min-microvolt = <1100000>;
-						regulator-max-microvolt = <1100000>;
-						ti,enable-ldo8-tracking;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldo9 {
-						regulator-name = "vi-sdcard";
-						regulator-min-microvolt = <2900000>;
-						regulator-max-microvolt = <2900000>;
-					};
-
-					ldousb {
-						regulator-name = "avdd-usb";
-						regulator-min-microvolt = <3300000>;
-						regulator-max-microvolt = <3300000>;
-						regulator-always-on;
-						regulator-boot-on;
-					};
-
-					ldoln {
-						regulator-name = "va-hdmi";
-						regulator-min-microvolt = <3300000>;
-						regulator-max-microvolt = <3300000>;
-					};
-				};
-			};
-
-			rtc {
-				compatible = "ti,palmas-rtc";
-				interrupt-parent = <&palmas>;
-				interrupts = <8 0>;
-			};
-
-		};
-	};
-
-	pmc@7000e400 {
-		nvidia,invert-interrupt;
-	};
-
-	/* eMMC */
-	sdhci@78000600 {
-		status = "okay";
-		bus-width = <8>;
-		non-removable;
-	};
-
-	usb@7d000000 {
-		status = "okay";
-	};
-
-	usb-phy@7d000000 {
-		status = "okay";
-		nvidia,xcvr-setup = <7>;
-		nvidia,xcvr-lsfslew = <2>;
-		nvidia,xcvr-lsrslew = <2>;
-		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-		/* Should be changed to "otg" once we have vbus_supply */
-		/* As of now, USB devices need to be powered externally */
-		dr_mode = "host";
-	};
-
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm 1 40000>;
@@ -349,3 +119,232 @@
 		};
 	};
 };
+
+&host1x {
+	dsi@54300000 {
+		status = "okay";
+
+		vdd-supply = <&vdd_1v2_ap>;
+
+		panel@0 {
+			compatible = "lg,ld070wx3-sl01";
+			reg = <0>;
+
+			power-supply = <&vdd_lcd>;
+			backlight = <&backlight>;
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	palmas: pmic@58 {
+		compatible = "ti,palmas";
+		reg = <0x58>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+
+		#interrupt-cells = <2>;
+		interrupt-controller;
+
+		ti,system-power-controller;
+
+		palmas_gpio: gpio {
+			compatible = "ti,palmas-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		pmic {
+			compatible = "ti,tps65913-pmic", "ti,palmas-pmic";
+
+			ldoln-in-supply = <&vdd_smps10_out2>;
+
+			regulators {
+				smps123 {
+					regulator-name = "vd-cpu";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps45 {
+					regulator-name = "vd-soc";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps6 {
+					regulator-name = "va-lcd-hv";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				smps7 {
+					regulator-name = "vd-ddr";
+					regulator-min-microvolt = <1350000>;
+					regulator-max-microvolt = <1350000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v8: smps8 {
+					regulator-name = "vs-pmu-1v8";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_2v9_sys: smps9 {
+					regulator-name = "vs-sys-2v9";
+					regulator-min-microvolt = <2900000>;
+					regulator-max-microvolt = <2900000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_smps10_out1: smps10_out1 {
+					regulator-name = "vd-smps10-out1";
+					regulator-min-microvolt = <5000000>;
+					regulator-max-microvolt = <5000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_smps10_out2: smps10_out2 {
+					regulator-name = "vd-smps10-out2";
+					regulator-min-microvolt = <5000000>;
+					regulator-max-microvolt = <5000000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo1 {
+					regulator-name = "va-pllx";
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				vdd_1v2_ap: ldo2 {
+					regulator-name = "va-ap-1v2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo3 {
+					regulator-name = "vd-fuse";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo4 {
+					regulator-name = "vd-ts-hv";
+					regulator-min-microvolt = <3200000>;
+					regulator-max-microvolt = <3200000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo5 {
+					regulator-name = "va-cam2-hv";
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <2700000>;
+				};
+
+				ldo6 {
+					regulator-name = "va-sns-hv";
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+				};
+
+				ldo7 {
+					regulator-name = "va-cam1-hv";
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <2700000>;
+				};
+
+				ldo8 {
+					regulator-name = "va-ap-rtc";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					ti,enable-ldo8-tracking;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldo9 {
+					regulator-name = "vi-sdcard";
+					regulator-min-microvolt = <2900000>;
+					regulator-max-microvolt = <2900000>;
+				};
+
+				ldousb {
+					regulator-name = "avdd-usb";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+
+				ldoln {
+					regulator-name = "va-hdmi";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+			};
+		};
+
+		rtc {
+			compatible = "ti,palmas-rtc";
+			interrupt-parent = <&palmas>;
+			interrupts = <8 0>;
+		};
+
+	};
+};
+
+&phy1 {
+	status = "okay";
+	nvidia,xcvr-setup = <7>;
+	nvidia,xcvr-lsfslew = <2>;
+	nvidia,xcvr-lsrslew = <2>;
+	interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+	/* Should be changed to "otg" once we have vbus_supply */
+	/* As of now, USB devices need to be powered externally */
+	dr_mode = "host";
+};
+
+&pmc {
+	nvidia,invert-interrupt;
+};
+
+&pwm {
+	status = "okay";
+};
+
+&sdhci4 {
+	status = "okay";
+	bus-width = <8>;
+	non-removable;
+};
+
+&uartd {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
2.1.0
