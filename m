From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] pinctrl: tegra: Whitespace fixes for Tegra124
Date: Fri,  6 Dec 2013 12:53:59 +0100
Message-ID: <1386330839-30559-2-git-send-email-treding@nvidia.com>
References: <52A10C7B.8070406@wwwdotorg.org>
 <1386330839-30559-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386330839-30559-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This removes some inconsistencies in the formatting of tables and macros
and makes the code match that of the Tegra114 driver more closely.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra124.c | 604 ++++++++++++++++++-------------------
 1 file changed, 302 insertions(+), 302 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c
index 632e076115d5..ee35d8895b0d 100644
--- a/drivers/pinctrl/pinctrl-tegra124.c
+++ b/drivers/pinctrl/pinctrl-tegra124.c
@@ -2782,321 +2782,321 @@ static const struct tegra_function tegra124_functions[] = {
 #define DRV_PINGROUP_REG_A	0x868	/* bank 0 */
 #define PINGROUP_REG_A		0x3000	/* bank 1 */
 
-#define PINGROUP_REG_Y(r) ((r) - PINGROUP_REG_A)
-#define PINGROUP_REG_N(r) -1
+#define PINGROUP_REG_Y(r)	((r) - PINGROUP_REG_A)
+#define PINGROUP_REG_N(r)	-1
 
 #define PINGROUP(pg_name, f0, f1, f2, f3, f_safe, r, od, ior, rcv_sel)	\
-	{							\
-		.name = #pg_name,				\
-		.pins = pg_name##_pins,				\
-		.npins = ARRAY_SIZE(pg_name##_pins),		\
-		.funcs = {					\
-			TEGRA_MUX_ ## f0,			\
-			TEGRA_MUX_ ## f1,			\
-			TEGRA_MUX_ ## f2,			\
-			TEGRA_MUX_ ## f3,			\
-		},						\
-		.func_safe = TEGRA_MUX_ ## f_safe,		\
-		.mux_reg = PINGROUP_REG_Y(r),			\
-		.mux_bank = 1,					\
-		.mux_bit = 0,					\
-		.pupd_reg = PINGROUP_REG_Y(r),			\
-		.pupd_bank = 1,					\
-		.pupd_bit = 2,					\
-		.tri_reg = PINGROUP_REG_Y(r),			\
-		.tri_bank = 1,					\
-		.tri_bit = 4,					\
-		.einput_reg = PINGROUP_REG_Y(r),		\
-		.einput_bank = 1,				\
-		.einput_bit = 5,				\
-		.odrain_reg = PINGROUP_REG_##od(r),		\
-		.odrain_bank = 1,				\
-		.odrain_bit = 6,				\
-		.lock_reg = PINGROUP_REG_Y(r),			\
-		.lock_bank = 1,					\
-		.lock_bit = 7,					\
-		.ioreset_reg = PINGROUP_REG_##ior(r),		\
-		.ioreset_bank = 1,				\
-		.ioreset_bit = 8,				\
-		.rcv_sel_reg = PINGROUP_REG_##rcv_sel(r),	\
-		.rcv_sel_bank = 1,				\
-		.rcv_sel_bit = 9,				\
-		.drv_reg = -1,					\
-		.drvtype_reg = -1,				\
+	{								\
+		.name = #pg_name,					\
+		.pins = pg_name##_pins,					\
+		.npins = ARRAY_SIZE(pg_name##_pins),			\
+		.funcs = {						\
+			TEGRA_MUX_ ## f0,				\
+			TEGRA_MUX_ ## f1,				\
+			TEGRA_MUX_ ## f2,				\
+			TEGRA_MUX_ ## f3,				\
+		},							\
+		.func_safe = TEGRA_MUX_ ## f_safe,			\
+		.mux_reg = PINGROUP_REG_Y(r),				\
+		.mux_bank = 1,						\
+		.mux_bit = 0,						\
+		.pupd_reg = PINGROUP_REG_Y(r),				\
+		.pupd_bank = 1,						\
+		.pupd_bit = 2,						\
+		.tri_reg = PINGROUP_REG_Y(r),				\
+		.tri_bank = 1,						\
+		.tri_bit = 4,						\
+		.einput_reg = PINGROUP_REG_Y(r),			\
+		.einput_bank = 1,					\
+		.einput_bit = 5,					\
+		.odrain_reg = PINGROUP_REG_##od(r),			\
+		.odrain_bank = 1,					\
+		.odrain_bit = 6,					\
+		.lock_reg = PINGROUP_REG_Y(r),				\
+		.lock_bank = 1,						\
+		.lock_bit = 7,						\
+		.ioreset_reg = PINGROUP_REG_##ior(r),			\
+		.ioreset_bank = 1,					\
+		.ioreset_bit = 8,					\
+		.rcv_sel_reg = PINGROUP_REG_##rcv_sel(r),		\
+		.rcv_sel_bank = 1,					\
+		.rcv_sel_bit = 9,					\
+		.drv_reg = -1,						\
+		.drvtype_reg = -1,					\
 	}
 
 #define DRV_PINGROUP_DVRTYPE_Y(r) ((r) - DRV_PINGROUP_REG_A)
 #define DRV_PINGROUP_DVRTYPE_N(r) -1
 
-#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b,	\
-		     drvdn_b, drvdn_w, drvup_b, drvup_w,	\
-		     slwr_b, slwr_w, slwf_b, slwf_w,		\
-		     drvtype)					\
-	{							\
-		.name = "drive_" #pg_name,			\
-		.pins = drive_##pg_name##_pins,			\
-		.npins = ARRAY_SIZE(drive_##pg_name##_pins),	\
-		.mux_reg = -1,					\
-		.pupd_reg = -1,					\
-		.tri_reg = -1,					\
-		.einput_reg = -1,				\
-		.odrain_reg = -1,				\
-		.lock_reg = -1,					\
-		.ioreset_reg = -1,				\
-		.rcv_sel_reg = -1,				\
-		.drv_reg = DRV_PINGROUP_DVRTYPE_Y(r),		\
-		.drv_bank = 0,					\
-		.hsm_bit = hsm_b,				\
-		.schmitt_bit = schmitt_b,			\
-		.lpmd_bit = lpmd_b,				\
-		.drvdn_bit = drvdn_b,				\
-		.drvdn_width = drvdn_w,				\
-		.drvup_bit = drvup_b,				\
-		.drvup_width = drvup_w,				\
-		.slwr_bit = slwr_b,				\
-		.slwr_width = slwr_w,				\
-		.slwf_bit = slwf_b,				\
-		.slwf_width = slwf_w,				\
+#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b,		\
+		     drvdn_b, drvdn_w, drvup_b, drvup_w,		\
+		     slwr_b, slwr_w, slwf_b, slwf_w,			\
+		     drvtype)						\
+	{								\
+		.name = "drive_" #pg_name,				\
+		.pins = drive_##pg_name##_pins,				\
+		.npins = ARRAY_SIZE(drive_##pg_name##_pins),		\
+		.mux_reg = -1,						\
+		.pupd_reg = -1,						\
+		.tri_reg = -1,						\
+		.einput_reg = -1,					\
+		.odrain_reg = -1,					\
+		.lock_reg = -1,						\
+		.ioreset_reg = -1,					\
+		.rcv_sel_reg = -1,					\
+		.drv_reg = DRV_PINGROUP_DVRTYPE_Y(r),			\
+		.drv_bank = 0,						\
+		.hsm_bit = hsm_b,					\
+		.schmitt_bit = schmitt_b,				\
+		.lpmd_bit = lpmd_b,					\
+		.drvdn_bit = drvdn_b,					\
+		.drvdn_width = drvdn_w,					\
+		.drvup_bit = drvup_b,					\
+		.drvup_width = drvup_w,					\
+		.slwr_bit = slwr_b,					\
+		.slwr_width = slwr_w,					\
+		.slwf_bit = slwf_b,					\
+		.slwf_width = slwf_w,					\
 		.drvtype_reg = DRV_PINGROUP_DVRTYPE_##drvtype(r),	\
-		.drvtype_bank = 0,				\
-		.drvtype_bit = 6,				\
+		.drvtype_bank = 0,					\
+		.drvtype_bit = 6,					\
 	}
 
 static const struct tegra_pingroup tegra124_groups[] = {
-	/*       pg_name,                f0,         f1,         f2,           f3,          safe,     r,      od, ior, rcv_sel */
-	PINGROUP(ulpi_data0_po1,	SPI3,		HSI,		UARTA,		ULPI,		SPI3,		0x3000,  N,  N,  N),
-	PINGROUP(ulpi_data1_po2,	SPI3,		HSI,		UARTA,		ULPI,		SPI3,		0x3004,  N,  N,  N),
-	PINGROUP(ulpi_data2_po3,	SPI3,		HSI,		UARTA,		ULPI,		SPI3,		0x3008,  N,  N,  N),
-	PINGROUP(ulpi_data3_po4,	SPI3,		HSI,		UARTA,		ULPI,		SPI3,		0x300c,  N,  N,  N),
-	PINGROUP(ulpi_data4_po5,	SPI2,		HSI,		UARTA,		ULPI,		SPI2,		0x3010,  N,  N,  N),
-	PINGROUP(ulpi_data5_po6,	SPI2,		HSI,		UARTA,		ULPI,		SPI2,		0x3014,  N,  N,  N),
-	PINGROUP(ulpi_data6_po7,	SPI2,		HSI,		UARTA,		ULPI,		SPI2,		0x3018,  N,  N,  N),
-	PINGROUP(ulpi_data7_po0,	SPI2,		HSI,		UARTA,		ULPI,		SPI2,		0x301c,  N,  N,  N),
-	PINGROUP(ulpi_clk_py0,		SPI1,		SPI5,		UARTD,		ULPI,		SPI1,		0x3020,  N,  N,  N),
-	PINGROUP(ulpi_dir_py1,		SPI1,		SPI5,		UARTD,		ULPI,		SPI1,		0x3024,  N,  N,  N),
-	PINGROUP(ulpi_nxt_py2,		SPI1,		SPI5,		UARTD,		ULPI,		SPI1,		0x3028,  N,  N,  N),
-	PINGROUP(ulpi_stp_py3,		SPI1,		SPI5,		UARTD,		ULPI,		SPI1,		0x302c,  N,  N,  N),
-	PINGROUP(dap3_fs_pp0,		I2S2,		SPI5,		DISPLAYA,	DISPLAYB,	I2S2,		0x3030,  N,  N,  N),
-	PINGROUP(dap3_din_pp1,		I2S2,		SPI5,		DISPLAYA,	DISPLAYB,	I2S2,		0x3034,  N,  N,  N),
-	PINGROUP(dap3_dout_pp2,		I2S2,		SPI5,		DISPLAYA,	RSVD4,		I2S2,		0x3038,  N,  N,  N),
-	PINGROUP(dap3_sclk_pp3,		I2S2,		SPI5,		RSVD3,		DISPLAYB,	I2S2,		0x303c,  N,  N,  N),
-	PINGROUP(pv0,			RSVD1,		RSVD2,		RSVD3,		RSVD4,		RSVD1,		0x3040,  N,  N,  N),
-	PINGROUP(pv1,			RSVD1,		RSVD2,		RSVD3,		RSVD4,		RSVD1,		0x3044,  N,  N,  N),
-	PINGROUP(sdmmc1_clk_pz0,	SDMMC1,		CLK12,		RSVD3,		RSVD4,		RSVD3,		0x3048,  N,  N,  N),
-	PINGROUP(sdmmc1_cmd_pz1,	SDMMC1,		SPDIF,		SPI4,		UARTA,		SDMMC1,		0x304c,  N,  N,  N),
-	PINGROUP(sdmmc1_dat3_py4,	SDMMC1,		SPDIF,		SPI4,		UARTA,		SDMMC1,		0x3050,  N,  N,  N),
-	PINGROUP(sdmmc1_dat2_py5,	SDMMC1,		PWM0,		SPI4,		UARTA,		SDMMC1,		0x3054,  N,  N,  N),
-	PINGROUP(sdmmc1_dat1_py6,	SDMMC1,		PWM1,		SPI4,		UARTA,		SDMMC1,		0x3058,  N,  N,  N),
-	PINGROUP(sdmmc1_dat0_py7,	SDMMC1,		RSVD2,		SPI4,		UARTA,		SDMMC1,		0x305c,  N,  N,  N),
-	PINGROUP(clk2_out_pw5,		EXTPERIPH2,	RSVD2,		RSVD3,		RSVD4,		EXTPERIPH2,	0x3068,  N,  N,  N),
-	PINGROUP(clk2_req_pcc5,		DAP,		RSVD2,		RSVD3,		RSVD4,		DAP,		0x306c,  N,  N,  N),
-	PINGROUP(hdmi_int_pn7,		RSVD1,		RSVD2,		RSVD3,		RSVD4,		RSVD1,		0x3110,  N,  N,  Y),
-	PINGROUP(ddc_scl_pv4,		I2C4,		RSVD2,		RSVD3,		RSVD4,		I2C4,		0x3114,  N,  N,  Y),
-	PINGROUP(ddc_sda_pv5,		I2C4,		RSVD2,		RSVD3,		RSVD4,		I2C4,		0x3118,  N,  N,  Y),
-	PINGROUP(uart2_rxd_pc3,		IRDA,		SPDIF,		UARTA,		SPI4,		IRDA,		0x3164,  N,  N,  N),
-	PINGROUP(uart2_txd_pc2,		IRDA,		SPDIF,		UARTA,		SPI4,		IRDA,		0x3168,  N,  N,  N),
-	PINGROUP(uart2_rts_n_pj6,	UARTA,		UARTB,		GMI,		SPI4,		UARTA,		0x316c,  N,  N,  N),
-	PINGROUP(uart2_cts_n_pj5,	UARTA,		UARTB,		GMI,		SPI4,		UARTA,		0x3170,  N,  N,  N),
-	PINGROUP(uart3_txd_pw6,		UARTC,		RSVD2,		GMI,		SPI4,		UARTC,		0x3174,  N,  N,  N),
-	PINGROUP(uart3_rxd_pw7,		UARTC,		RSVD2,		GMI,		SPI4,		UARTC,		0x3178,  N,  N,  N),
-	PINGROUP(uart3_cts_n_pa1,	UARTC,		SDMMC1,		DTV,		GMI,		UARTC,		0x317c,  N,  N,  N),
-	PINGROUP(uart3_rts_n_pc0,	UARTC,		PWM0,		DTV,		GMI,		UARTC,		0x3180,  N,  N,  N),
-	PINGROUP(pu0,			OWR,		UARTA,		GMI,		RSVD4,		RSVD4,		0x3184,  N,  N,  N),
-	PINGROUP(pu1,			RSVD1,		UARTA,		GMI,		RSVD4,		RSVD4,		0x3188,  N,  N,  N),
-	PINGROUP(pu2,			RSVD1,		UARTA,		GMI,		RSVD4,		RSVD4,		0x318c,  N,  N,  N),
-	PINGROUP(pu3,			PWM0,		UARTA,		GMI,		DISPLAYB,	PWM0,		0x3190,  N,  N,  N),
-	PINGROUP(pu4,			PWM1,		UARTA,		GMI,		DISPLAYB,	PWM1,		0x3194,  N,  N,  N),
-	PINGROUP(pu5,			PWM2,		UARTA,		GMI,		DISPLAYB,	PWM2,		0x3198,  N,  N,  N),
-	PINGROUP(pu6,			PWM3,		UARTA,		RSVD3,		GMI,		RSVD3,		0x319c,  N,  N,  N),
-	PINGROUP(gen1_i2c_scl_pc4,	I2C1,		RSVD2,		RSVD3,		RSVD4,		I2C1,		0x31a0,  Y,  N,  N),
-	PINGROUP(gen1_i2c_sda_pc5,	I2C1,		RSVD2,		RSVD3,		RSVD4,		I2C1,		0x31a4,  Y,  N,  N),
-	PINGROUP(dap4_fs_pp4,		I2S3,		GMI,		DTV,		RSVD4,		I2S3,		0x31a8,  N,  N,  N),
-	PINGROUP(dap4_din_pp5,		I2S3,		GMI,		RSVD3,		RSVD4,		I2S3,		0x31ac,  N,  N,  N),
-	PINGROUP(dap4_dout_pp6,		I2S3,		GMI,		DTV,		RSVD4,		I2S3,		0x31b0,  N,  N,  N),
-	PINGROUP(dap4_sclk_pp7,		I2S3,		GMI,		RSVD3,		RSVD4,		I2S3,		0x31b4,  N,  N,  N),
-	PINGROUP(clk3_out_pee0,		EXTPERIPH3,	RSVD2,		RSVD3,		RSVD4,		RSVD3,		0x31b8,  N,  N,  N),
-	PINGROUP(clk3_req_pee1,		DEV3,		RSVD2,		RSVD3,		RSVD4,		RSVD4,		0x31bc,  N,  N,  N),
-	PINGROUP(pc7,			RSVD1,		RSVD2,		GMI,		GMI_ALT,	RSVD1,		0x31c0,  N,  N,  N),
-	PINGROUP(pi5,			SDMMC2,		RSVD2,		GMI,		RSVD4,		GMI,		0x31c4,  N,  N,  N),
-	PINGROUP(pi7,			RSVD1,		TRACE,		GMI,		DTV,		RSVD1,		0x31c8,  N,  N,  N),
-	PINGROUP(pk0,			RSVD1,		SDMMC3,		GMI,		SOC,		RSVD1,		0x31cc,  N,  N,  N),
-	PINGROUP(pk1,			SDMMC2,		TRACE,		GMI,		RSVD4,		GMI,		0x31d0,  N,  N,  N),
-	PINGROUP(pj0,			RSVD1,		RSVD2,		GMI,		USB,		RSVD1,		0x31d4,  N,  N,  N),
-	PINGROUP(pj2,			RSVD1,		RSVD2,		GMI,		SOC,		RSVD1,		0x31d8,  N,  N,  N),
-	PINGROUP(pk3,			SDMMC2,		TRACE,		GMI,		CCLA,		GMI,		0x31dc,  N,  N,  N),
-	PINGROUP(pk4,			SDMMC2,		RSVD2,		GMI,		GMI_ALT,	GMI,		0x31e0,  N,  N,  N),
-	PINGROUP(pk2,			RSVD1,		RSVD2,		GMI,		RSVD4,		RSVD4,		0x31e4,  N,  N,  N),
-	PINGROUP(pi3,			RSVD1,		RSVD2,		GMI,		SPI4,		RSVD1,		0x31e8,  N,  N,  N),
-	PINGROUP(pi6,			RSVD1,		RSVD2,		GMI,		SDMMC2,		RSVD1,		0x31ec,  N,  N,  N),
-	PINGROUP(pg0,			RSVD1,		RSVD2,		GMI,		RSVD4,		RSVD4,		0x31f0,  N,  N,  N),
-	PINGROUP(pg1,			RSVD1,		RSVD2,		GMI,		RSVD4,		RSVD4,		0x31f4,  N,  N,  N),
-	PINGROUP(pg2,			RSVD1,		TRACE,		GMI,		RSVD4,		RSVD4,		0x31f8,  N,  N,  N),
-	PINGROUP(pg3,			RSVD1,		TRACE,		GMI,		RSVD4,		RSVD4,		0x31fc,  N,  N,  N),
-	PINGROUP(pg4,			RSVD1,		TMDS,		GMI,		SPI4,		RSVD1,		0x3200,  N,  N,  N),
-	PINGROUP(pg5,			RSVD1,		RSVD2,		GMI,		SPI4,		RSVD1,		0x3204,  N,  N,  N),
-	PINGROUP(pg6,			RSVD1,		RSVD2,		GMI,		SPI4,		RSVD1,		0x3208,  N,  N,  N),
-	PINGROUP(pg7,			RSVD1,		RSVD2,		GMI,		SPI4,		RSVD1,		0x320c,  N,  N,  N),
-	PINGROUP(ph0,			PWM0,		TRACE,		GMI,		DTV,		GMI,		0x3210,  N,  N,  N),
-	PINGROUP(ph1,			PWM1,		TMDS,		GMI,		DISPLAYA,	GMI,		0x3214,  N,  N,  N),
-	PINGROUP(ph2,			PWM2,		TMDS,		GMI,		CLDVFS,		GMI,		0x3218,  N,  N,  N),
-	PINGROUP(ph3,			PWM3,		SPI4,		GMI,		CLDVFS,		GMI,		0x321c,  N,  N,  N),
-	PINGROUP(ph4,			SDMMC2,		RSVD2,		GMI,		RSVD4,		GMI,		0x3220,  N,  N,  N),
-	PINGROUP(ph5,			SDMMC2,		RSVD2,		GMI,		RSVD4,		GMI,		0x3224,  N,  N,  N),
-	PINGROUP(ph6,			SDMMC2,		TRACE,		GMI,		DTV,		GMI,		0x3228,  N,  N,  N),
-	PINGROUP(ph7,			SDMMC2,		TRACE,		GMI,		DTV,		GMI,		0x322c,  N,  N,  N),
-	PINGROUP(pj7,			UARTD,		RSVD2,		GMI,		GMI_ALT,	RSVD2,		0x3230,  N,  N,  N),
-	PINGROUP(pb0,			UARTD,		RSVD2,		GMI,		RSVD4,		RSVD2,		0x3234,  N,  N,  N),
-	PINGROUP(pb1,			UARTD,		RSVD2,		GMI,		RSVD4,		RSVD2,		0x3238,  N,  N,  N),
-	PINGROUP(pk7,			UARTD,		RSVD2,		GMI,		RSVD4,		RSVD2,		0x323c,  N,  N,  N),
-	PINGROUP(pi0,			RSVD1,		RSVD2,		GMI,		RSVD4,		RSVD4,		0x3240,  N,  N,  N),
-	PINGROUP(pi1,			RSVD1,		RSVD2,		GMI,		RSVD4,		RSVD1,		0x3244,  N,  N,  N),
-	PINGROUP(pi2,			SDMMC2,		TRACE,		GMI,		RSVD4,		GMI,		0x3248,  N,  N,  N),
-	PINGROUP(pi4,			SPI4,		TRACE,		GMI,		DISPLAYA,	GMI,		0x324c,  N,  N,  N),
-	PINGROUP(gen2_i2c_scl_pt5,	I2C2,		RSVD2,		GMI,		RSVD4,		RSVD2,		0x3250,  Y,  N,  N),
-	PINGROUP(gen2_i2c_sda_pt6,	I2C2,		RSVD2,		GMI,		RSVD4,		RSVD2,		0x3254,  Y,  N,  N),
-	PINGROUP(sdmmc4_clk_pcc4,	SDMMC4,		RSVD2,		GMI,		RSVD4,		RSVD2,		0x3258,  N,  Y,  N),
-	PINGROUP(sdmmc4_cmd_pt7,	SDMMC4,		RSVD2,		GMI,		RSVD4,		RSVD2,		0x325c,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat0_paa0,	SDMMC4,		SPI3,		GMI,		RSVD4,		SDMMC4,		0x3260,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat1_paa1,	SDMMC4,		SPI3,		GMI,		RSVD4,		SDMMC4,		0x3264,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat2_paa2,	SDMMC4,		SPI3,		GMI,		RSVD4,		SDMMC4,		0x3268,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat3_paa3,	SDMMC4,		SPI3,		GMI,		RSVD4,		SDMMC4,		0x326c,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat4_paa4,	SDMMC4,		SPI3,		GMI,		RSVD4,		SDMMC4,		0x3270,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat5_paa5,	SDMMC4,		SPI3,		RSVD3,		RSVD4,		SDMMC4,		0x3274,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat6_paa6,	SDMMC4,		SPI3,		GMI,		RSVD4,		SDMMC4,		0x3278,  N,  Y,  N),
-	PINGROUP(sdmmc4_dat7_paa7,	SDMMC4,		RSVD1,		GMI,		RSVD4,		SDMMC4,		0x327c,  N,  Y,  N),
-	PINGROUP(cam_mclk_pcc0,		VI,		VI_ALT1,	VI_ALT3,	SDMMC2,		VI,		0x3284,  N,  N,  N),
-	PINGROUP(pcc1,			I2S4,		RSVD1,		RSVD3,		SDMMC2,		I2S4,		0x3288,  N,  N,  N),
-	PINGROUP(pbb0,			VGP6,		VIMCLK2,	SDMMC2,		VIMCLK2_ALT,	VGP6,		0x328c,  N,  N,  N),
-	PINGROUP(cam_i2c_scl_pbb1,	VGP1,		I2C3,		RSVD3,		SDMMC2,		VGP1,		0x3290,  Y,  N,  N),
-	PINGROUP(cam_i2c_sda_pbb2,	VGP2,		I2C3,		RSVD3,		SDMMC2,		VGP2,		0x3294,  Y,  N,  N),
-	PINGROUP(pbb3,			VGP3,		DISPLAYA,	DISPLAYB,	SDMMC2,		VGP3,		0x3298,  N,  N,  N),
-	PINGROUP(pbb4,			VGP4,		DISPLAYA,	DISPLAYB,	SDMMC2,		VGP4,		0x329c,  N,  N,  N),
-	PINGROUP(pbb5,			VGP5,		DISPLAYA,	RSVD3,		SDMMC2,		VGP5,		0x32a0,  N,  N,  N),
-	PINGROUP(pbb6,			I2S4,		RSVD2,		DISPLAYB,	SDMMC2,		I2S4,		0x32a4,  N,  N,  N),
-	PINGROUP(pbb7,			I2S4,		RSVD2,		RSVD3,		SDMMC2,		I2S4,		0x32a8,  N,  N,  N),
-	PINGROUP(pcc2,			I2S4,		RSVD2,		SDMMC3,		SDMMC2,		I2S4,		0x32ac,  N,  N,  N),
-	PINGROUP(jtag_rtck,		RTCK,		RSVD2,		RSVD3,		RSVD4,		RTCK,		0x32b0,  N,  N,  N),
-	PINGROUP(pwr_i2c_scl_pz6,	I2CPWR,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x32b4,  Y,  N,  N),
-	PINGROUP(pwr_i2c_sda_pz7,	I2CPWR,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x32b8,  Y,  N,  N),
-	PINGROUP(kb_row0_pr0,		KBC,		RSVD2,		RSVD3,		RSVD4,		RSVD4,		0x32bc,  N,  N,  N),
-	PINGROUP(kb_row1_pr1,		KBC,		RSVD2,		RSVD3,		RSVD4,		RSVD4,		0x32c0,  N,  N,  N),
-	PINGROUP(kb_row2_pr2,		KBC,		RSVD2,		RSVD3,		RSVD4,		RSVD4,		0x32c4,  N,  N,  N),
-	PINGROUP(kb_row3_pr3,		KBC,		DISPLAYA,	SYS,		DISPLAYB,	KBC,		0x32c8,  N,  N,  N),
-	PINGROUP(kb_row4_pr4,		KBC,		DISPLAYA,	RSVD3,		DISPLAYB,	RSVD3,		0x32cc,  N,  N,  N),
-	PINGROUP(kb_row5_pr5,		KBC,		DISPLAYA,	RSVD3,		DISPLAYB,	RSVD3,		0x32d0,  N,  N,  N),
-	PINGROUP(kb_row6_pr6,		KBC,		DISPLAYA,	DISPLAYA_ALT,	DISPLAYB,	KBC,		0x32d4,  N,  N,  N),
-	PINGROUP(kb_row7_pr7,		KBC,		RSVD2,		CLDVFS,		UARTA,		RSVD2,		0x32d8,  N,  N,  N),
-	PINGROUP(kb_row8_ps0,		KBC,		RSVD2,		CLDVFS,		UARTA,		RSVD2,		0x32dc,  N,  N,  N),
-	PINGROUP(kb_row9_ps1,		KBC,		RSVD2,		RSVD3,		UARTA,		KBC,		0x32e0,  N,  N,  N),
-	PINGROUP(kb_row10_ps2,		KBC,		RSVD2,		RSVD3,		UARTA,		KBC,		0x32e4,  N,  N,  N),
-	PINGROUP(kb_row11_ps3,		KBC,		RSVD2,		RSVD3,		IRDA,		RSVD3,		0x32e8,  N,  N,  N),
-	PINGROUP(kb_row12_ps4,		KBC,		RSVD2,		RSVD3,		IRDA,		RSVD3,		0x32ec,  N,  N,  N),
-	PINGROUP(kb_row13_ps5,		KBC,		RSVD2,		SPI2,		RSVD4,		RSVD4,		0x32f0,  N,  N,  N),
-	PINGROUP(kb_row14_ps6,		KBC,		RSVD2,		SPI2,		RSVD4,		RSVD4,		0x32f4,  N,  N,  N),
-	PINGROUP(kb_row15_ps7,		KBC,		SOC,		RSVD3,		RSVD4,		KBC,		0x32f8,  N,  N,  N),
-	PINGROUP(kb_col0_pq0,		KBC,		RSVD2,		SPI2,		RSVD4,		RSVD4,		0x32fc,  N,  N,  N),
-	PINGROUP(kb_col1_pq1,		KBC,		RSVD2,		SPI2,		RSVD4,		RSVD4,		0x3300,  N,  N,  N),
-	PINGROUP(kb_col2_pq2,		KBC,		RSVD2,		SPI2,		RSVD4,		RSVD4,		0x3304,  N,  N,  N),
-	PINGROUP(kb_col3_pq3,		KBC,		DISPLAYA,	PWM2,		UARTA,		KBC,		0x3308,  N,  N,  N),
-	PINGROUP(kb_col4_pq4,		KBC,		OWR,		SDMMC3,		UARTA,		KBC,		0x330c,  N,  N,  N),
-	PINGROUP(kb_col5_pq5,		KBC,		RSVD2,		SDMMC3,		RSVD4,		RSVD4,		0x3310,  N,  N,  N),
-	PINGROUP(kb_col6_pq6,		KBC,		RSVD2,		SPI2,		UARTD,		RSVD2,		0x3314,  N,  N,  N),
-	PINGROUP(kb_col7_pq7,		KBC,		RSVD2,		SPI2,		UARTD,		RSVD2,		0x3318,  N,  N,  N),
-	PINGROUP(clk_32k_out_pa0,	BLINK,		SOC,		RSVD3,		RSVD4,		RSVD3,		0x331c,  N,  N,  N),
-	PINGROUP(core_pwr_req,		PWRON,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x3324,  N,  N,  N),
-	PINGROUP(cpu_pwr_req,		CPU,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x3328,  N,  N,  N),
-	PINGROUP(pwr_int_n,		PMI,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x332c,  N,  N,  N),
-	PINGROUP(clk_32k_in,		CLK,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x3330,  N,  N,  N),
-	PINGROUP(owr,			OWR,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x3334,  N,  N,  Y),
-	PINGROUP(dap1_fs_pn0,		I2S0,		HDA,		GMI,		RSVD4,		RSVD4,		0x3338,  N,  N,  N),
-	PINGROUP(dap1_din_pn1,		I2S0,		HDA,		GMI,		RSVD4,		RSVD4,		0x333c,  N,  N,  N),
-	PINGROUP(dap1_dout_pn2,		I2S0,		HDA,		GMI,		SATA,		I2S0,		0x3340,  N,  N,  N),
-	PINGROUP(dap1_sclk_pn3,		I2S0,		HDA,		GMI,		RSVD4,		I2S0,		0x3344,  N,  N,  N),
-	PINGROUP(dap_mclk1_req_pee2,	DAP,		DAP1,		SATA,		RSVD4,		DAP,		0x3348,  N,  N,  N),
-	PINGROUP(dap_mclk1_pw4,		EXTPERIPH1,	DAP2,		RSVD3,		RSVD4,		RSVD3,		0x334c,  N,  N,  N),
-	PINGROUP(spdif_in_pk6,		SPDIF,		RSVD2,		RSVD3,		I2C3,		RSVD3,		0x3350,  N,  N,  N),
-	PINGROUP(spdif_out_pk5,		SPDIF,		RSVD2,		RSVD3,		I2C3,		RSVD3,		0x3354,  N,  N,  N),
-	PINGROUP(dap2_fs_pa2,		I2S1,		HDA,		GMI,		RSVD4,		I2S1,		0x3358,  N,  N,  N),
-	PINGROUP(dap2_din_pa4,		I2S1,		HDA,		GMI,		RSVD4,		I2S1,		0x335c,  N,  N,  N),
-	PINGROUP(dap2_dout_pa5,		I2S1,		HDA,		GMI,		RSVD4,		I2S1,		0x3360,  N,  N,  N),
-	PINGROUP(dap2_sclk_pa3,		I2S1,		HDA,		GMI,		RSVD4,		I2S1,		0x3364,  N,  N,  N),
-	PINGROUP(dvfs_pwm_px0,		SPI6,		CLDVFS,		GMI,		RSVD4,		SPI6,		0x3368,  N,  N,  N),
-	PINGROUP(gpio_x1_aud_px1,	SPI6,		RSVD2,		GMI,		RSVD4,		SPI6,		0x336c,  N,  N,  N),
-	PINGROUP(gpio_x3_aud_px3,	SPI6,		SPI1,		GMI,		RSVD4,		SPI6,		0x3370,  N,  N,  N),
-	PINGROUP(dvfs_clk_px2,		SPI6,		CLDVFS,		GMI,		RSVD4,		SPI6,		0x3374,  N,  N,  N),
-	PINGROUP(gpio_x4_aud_px4,	GMI,		SPI1,		SPI2,		DAP2,		SPI1,		0x3378,  N,  N,  N),
-	PINGROUP(gpio_x5_aud_px5,	GMI,		SPI1,		SPI2,		RSVD4,		SPI1,		0x337c,  N,  N,  N),
-	PINGROUP(gpio_x6_aud_px6,	SPI6,		SPI1,		SPI2,		GMI,		SPI1,		0x3380,  N,  N,  N),
-	PINGROUP(gpio_x7_aud_px7,	RSVD1,		SPI1,		SPI2,		RSVD4,		SPI1,		0x3384,  N,  N,  N),
-	PINGROUP(sdmmc3_clk_pa6,	SDMMC3,		RSVD2,		RSVD3,		SPI3,		SDMMC3,		0x3390,  N,  N,  N),
-	PINGROUP(sdmmc3_cmd_pa7,	SDMMC3,		PWM3,		UARTA,		SPI3,		SDMMC3,		0x3394,  N,  N,  N),
-	PINGROUP(sdmmc3_dat0_pb7,	SDMMC3,		RSVD2,		RSVD3,		SPI3,		SDMMC3,		0x3398,  N,  N,  N),
-	PINGROUP(sdmmc3_dat1_pb6,	SDMMC3,		PWM2,		UARTA,		SPI3,		SDMMC3,		0x339c,  N,  N,  N),
-	PINGROUP(sdmmc3_dat2_pb5,	SDMMC3,		PWM1,		DISPLAYA,	SPI3,		SDMMC3,		0x33a0,  N,  N,  N),
-	PINGROUP(sdmmc3_dat3_pb4,	SDMMC3,		PWM0,		DISPLAYB,	SPI3,		SDMMC3,		0x33a4,  N,  N,  N),
-	PINGROUP(pex_l0_rst_n_pdd1,	PE0,		RSVD2,		RSVD3,		RSVD4,		PE0,		0x33bc,  N,  N,  N),
-	PINGROUP(pex_l0_clkreq_n_pdd2,	PE0,		RSVD2,		RSVD3,		RSVD4,		PE0,		0x33c0,  N,  N,  N),
-	PINGROUP(pex_wake_n_pdd3,	PE,		RSVD2,		RSVD3,		RSVD4,		PE,		0x33c4,  N,  N,  N),
-	PINGROUP(pex_l1_rst_n_pdd5,	PE1,		RSVD2,		RSVD3,		RSVD4,		PE1,		0x33cc,  N,  N,  N),
-	PINGROUP(pex_l1_clkreq_n_pdd6,	PE1,		RSVD2,		RSVD3,		RSVD4,		PE1,		0x33d0,  N,  N,  N),
-	PINGROUP(hdmi_cec_pee3,		CEC,		RSVD2,		RSVD3,		RSVD4,		CEC,		0x33e0,  Y,  N,  N),
-	PINGROUP(sdmmc1_wp_n_pv3,	SDMMC1,		CLK12,		SPI4,		UARTA,		SDMMC1,		0x33e4,  N,  N,  N),
-	PINGROUP(sdmmc3_cd_n_pv2,	SDMMC3,		OWR,		RSVD3,		RSVD4,		SDMMC3,		0x33e8,  N,  N,  N),
-	PINGROUP(gpio_w2_aud_pw2,	SPI6,		RSVD2,		SPI2,		I2C1,		RSVD2,		0x33ec,  N,  N,  N),
-	PINGROUP(gpio_w3_aud_pw3,	SPI6,		SPI1,		SPI2,		I2C1,		SPI1,		0x33f0,  N,  N,  N),
-	PINGROUP(usb_vbus_en0_pn4,	USB,		RSVD2,		RSVD3,		RSVD4,		USB,		0x33f4,  Y,  N,  N),
-	PINGROUP(usb_vbus_en1_pn5,	USB,		RSVD2,		RSVD3,		RSVD4,		USB,		0x33f8,  Y,  N,  N),
-	PINGROUP(sdmmc3_clk_lb_out_pee4,	SDMMC3,	RSVD2,		RSVD3,		RSVD4,		SDMMC3,		0x33fc,  N,  N,  N),
-	PINGROUP(sdmmc3_clk_lb_in_pee5,	SDMMC3,		RSVD2,		RSVD3,		RSVD4,		SDMMC3,		0x3400,  N,  N,  N),
-	PINGROUP(gmi_clk_lb,		SDMMC2,		RSVD2,		GMI,		RSVD4,		SDMMC2,		0x3404,  N,  N,  N),
-	PINGROUP(reset_out_n,		RSVD1,		RSVD2,		RSVD3,		RESET_OUT_N,	RSVD1,		0x3408,  N,  N,  N),
-	PINGROUP(kb_row16_pt0,		KBC,		RSVD2,		RSVD3,		UARTC,		KBC,		0x340c,  N,  N,  N),
-	PINGROUP(kb_row17_pt1,		KBC,		RSVD2,		RSVD3,		UARTC,		KBC,		0x3410,  N,  N,  N),
-	PINGROUP(usb_vbus_en2_pff1,	USB,		RSVD2,		RSVD3,		RSVD4,		USB,		0x3414,  Y,  N,  N),
-	PINGROUP(pff2,			SATA,		RSVD2,		RSVD3,		RSVD4,		RSVD2,		0x3418,  Y,  N,  N),
-	PINGROUP(dp_hpd_pff0,		DP,		RSVD2,		RSVD3,		RSVD4,		DP,		0x3430,  N,  N,  N),
+	/*       pg_name,                f0,         f1,         f2,           f3,          safe,       r,      od, ior, rcv_sel */
+	PINGROUP(ulpi_data0_po1,         SPI3,       HSI,        UARTA,        ULPI,        SPI3,       0x3000,  N,  N,  N),
+	PINGROUP(ulpi_data1_po2,         SPI3,       HSI,        UARTA,        ULPI,        SPI3,       0x3004,  N,  N,  N),
+	PINGROUP(ulpi_data2_po3,         SPI3,       HSI,        UARTA,        ULPI,        SPI3,       0x3008,  N,  N,  N),
+	PINGROUP(ulpi_data3_po4,         SPI3,       HSI,        UARTA,        ULPI,        SPI3,       0x300c,  N,  N,  N),
+	PINGROUP(ulpi_data4_po5,         SPI2,       HSI,        UARTA,        ULPI,        SPI2,       0x3010,  N,  N,  N),
+	PINGROUP(ulpi_data5_po6,         SPI2,       HSI,        UARTA,        ULPI,        SPI2,       0x3014,  N,  N,  N),
+	PINGROUP(ulpi_data6_po7,         SPI2,       HSI,        UARTA,        ULPI,        SPI2,       0x3018,  N,  N,  N),
+	PINGROUP(ulpi_data7_po0,         SPI2,       HSI,        UARTA,        ULPI,        SPI2,       0x301c,  N,  N,  N),
+	PINGROUP(ulpi_clk_py0,           SPI1,       SPI5,       UARTD,        ULPI,        SPI1,       0x3020,  N,  N,  N),
+	PINGROUP(ulpi_dir_py1,           SPI1,       SPI5,       UARTD,        ULPI,        SPI1,       0x3024,  N,  N,  N),
+	PINGROUP(ulpi_nxt_py2,           SPI1,       SPI5,       UARTD,        ULPI,        SPI1,       0x3028,  N,  N,  N),
+	PINGROUP(ulpi_stp_py3,           SPI1,       SPI5,       UARTD,        ULPI,        SPI1,       0x302c,  N,  N,  N),
+	PINGROUP(dap3_fs_pp0,            I2S2,       SPI5,       DISPLAYA,     DISPLAYB,    I2S2,       0x3030,  N,  N,  N),
+	PINGROUP(dap3_din_pp1,           I2S2,       SPI5,       DISPLAYA,     DISPLAYB,    I2S2,       0x3034,  N,  N,  N),
+	PINGROUP(dap3_dout_pp2,          I2S2,       SPI5,       DISPLAYA,     RSVD4,       I2S2,       0x3038,  N,  N,  N),
+	PINGROUP(dap3_sclk_pp3,          I2S2,       SPI5,       RSVD3,        DISPLAYB,    I2S2,       0x303c,  N,  N,  N),
+	PINGROUP(pv0,                    RSVD1,      RSVD2,      RSVD3,        RSVD4,       RSVD1,      0x3040,  N,  N,  N),
+	PINGROUP(pv1,                    RSVD1,      RSVD2,      RSVD3,        RSVD4,       RSVD1,      0x3044,  N,  N,  N),
+	PINGROUP(sdmmc1_clk_pz0,         SDMMC1,     CLK12,      RSVD3,        RSVD4,       RSVD3,      0x3048,  N,  N,  N),
+	PINGROUP(sdmmc1_cmd_pz1,         SDMMC1,     SPDIF,      SPI4,         UARTA,       SDMMC1,     0x304c,  N,  N,  N),
+	PINGROUP(sdmmc1_dat3_py4,        SDMMC1,     SPDIF,      SPI4,         UARTA,       SDMMC1,     0x3050,  N,  N,  N),
+	PINGROUP(sdmmc1_dat2_py5,        SDMMC1,     PWM0,       SPI4,         UARTA,       SDMMC1,     0x3054,  N,  N,  N),
+	PINGROUP(sdmmc1_dat1_py6,        SDMMC1,     PWM1,       SPI4,         UARTA,       SDMMC1,     0x3058,  N,  N,  N),
+	PINGROUP(sdmmc1_dat0_py7,        SDMMC1,     RSVD2,      SPI4,         UARTA,       SDMMC1,     0x305c,  N,  N,  N),
+	PINGROUP(clk2_out_pw5,           EXTPERIPH2, RSVD2,      RSVD3,        RSVD4,       EXTPERIPH2, 0x3068,  N,  N,  N),
+	PINGROUP(clk2_req_pcc5,          DAP,        RSVD2,      RSVD3,        RSVD4,       DAP,        0x306c,  N,  N,  N),
+	PINGROUP(hdmi_int_pn7,           RSVD1,      RSVD2,      RSVD3,        RSVD4,       RSVD1,      0x3110,  N,  N,  Y),
+	PINGROUP(ddc_scl_pv4,            I2C4,       RSVD2,      RSVD3,        RSVD4,       I2C4,       0x3114,  N,  N,  Y),
+	PINGROUP(ddc_sda_pv5,            I2C4,       RSVD2,      RSVD3,        RSVD4,       I2C4,       0x3118,  N,  N,  Y),
+	PINGROUP(uart2_rxd_pc3,          IRDA,       SPDIF,      UARTA,        SPI4,        IRDA,       0x3164,  N,  N,  N),
+	PINGROUP(uart2_txd_pc2,          IRDA,       SPDIF,      UARTA,        SPI4,        IRDA,       0x3168,  N,  N,  N),
+	PINGROUP(uart2_rts_n_pj6,        UARTA,      UARTB,      GMI,          SPI4,        UARTA,      0x316c,  N,  N,  N),
+	PINGROUP(uart2_cts_n_pj5,        UARTA,      UARTB,      GMI,          SPI4,        UARTA,      0x3170,  N,  N,  N),
+	PINGROUP(uart3_txd_pw6,          UARTC,      RSVD2,      GMI,          SPI4,        UARTC,      0x3174,  N,  N,  N),
+	PINGROUP(uart3_rxd_pw7,          UARTC,      RSVD2,      GMI,          SPI4,        UARTC,      0x3178,  N,  N,  N),
+	PINGROUP(uart3_cts_n_pa1,        UARTC,      SDMMC1,     DTV,          GMI,         UARTC,      0x317c,  N,  N,  N),
+	PINGROUP(uart3_rts_n_pc0,        UARTC,      PWM0,       DTV,          GMI,         UARTC,      0x3180,  N,  N,  N),
+	PINGROUP(pu0,                    OWR,        UARTA,      GMI,          RSVD4,       RSVD4,      0x3184,  N,  N,  N),
+	PINGROUP(pu1,                    RSVD1,      UARTA,      GMI,          RSVD4,       RSVD4,      0x3188,  N,  N,  N),
+	PINGROUP(pu2,                    RSVD1,      UARTA,      GMI,          RSVD4,       RSVD4,      0x318c,  N,  N,  N),
+	PINGROUP(pu3,                    PWM0,       UARTA,      GMI,          DISPLAYB,    PWM0,       0x3190,  N,  N,  N),
+	PINGROUP(pu4,                    PWM1,       UARTA,      GMI,          DISPLAYB,    PWM1,       0x3194,  N,  N,  N),
+	PINGROUP(pu5,                    PWM2,       UARTA,      GMI,          DISPLAYB,    PWM2,       0x3198,  N,  N,  N),
+	PINGROUP(pu6,                    PWM3,       UARTA,      RSVD3,        GMI,         RSVD3,      0x319c,  N,  N,  N),
+	PINGROUP(gen1_i2c_scl_pc4,       I2C1,       RSVD2,      RSVD3,        RSVD4,       I2C1,       0x31a0,  Y,  N,  N),
+	PINGROUP(gen1_i2c_sda_pc5,       I2C1,       RSVD2,      RSVD3,        RSVD4,       I2C1,       0x31a4,  Y,  N,  N),
+	PINGROUP(dap4_fs_pp4,            I2S3,       GMI,        DTV,          RSVD4,       I2S3,       0x31a8,  N,  N,  N),
+	PINGROUP(dap4_din_pp5,           I2S3,       GMI,        RSVD3,        RSVD4,       I2S3,       0x31ac,  N,  N,  N),
+	PINGROUP(dap4_dout_pp6,          I2S3,       GMI,        DTV,          RSVD4,       I2S3,       0x31b0,  N,  N,  N),
+	PINGROUP(dap4_sclk_pp7,          I2S3,       GMI,        RSVD3,        RSVD4,       I2S3,       0x31b4,  N,  N,  N),
+	PINGROUP(clk3_out_pee0,          EXTPERIPH3, RSVD2,      RSVD3,        RSVD4,       RSVD3,      0x31b8,  N,  N,  N),
+	PINGROUP(clk3_req_pee1,          DEV3,       RSVD2,      RSVD3,        RSVD4,       RSVD4,      0x31bc,  N,  N,  N),
+	PINGROUP(pc7,                    RSVD1,      RSVD2,      GMI,          GMI_ALT,     RSVD1,      0x31c0,  N,  N,  N),
+	PINGROUP(pi5,                    SDMMC2,     RSVD2,      GMI,          RSVD4,       GMI,        0x31c4,  N,  N,  N),
+	PINGROUP(pi7,                    RSVD1,      TRACE,      GMI,          DTV,         RSVD1,      0x31c8,  N,  N,  N),
+	PINGROUP(pk0,                    RSVD1,      SDMMC3,     GMI,          SOC,         RSVD1,      0x31cc,  N,  N,  N),
+	PINGROUP(pk1,                    SDMMC2,     TRACE,      GMI,          RSVD4,       GMI,        0x31d0,  N,  N,  N),
+	PINGROUP(pj0,                    RSVD1,      RSVD2,      GMI,          USB,         RSVD1,      0x31d4,  N,  N,  N),
+	PINGROUP(pj2,                    RSVD1,      RSVD2,      GMI,          SOC,         RSVD1,      0x31d8,  N,  N,  N),
+	PINGROUP(pk3,                    SDMMC2,     TRACE,      GMI,          CCLA,        GMI,        0x31dc,  N,  N,  N),
+	PINGROUP(pk4,                    SDMMC2,     RSVD2,      GMI,          GMI_ALT,     GMI,        0x31e0,  N,  N,  N),
+	PINGROUP(pk2,                    RSVD1,      RSVD2,      GMI,          RSVD4,       RSVD4,      0x31e4,  N,  N,  N),
+	PINGROUP(pi3,                    RSVD1,      RSVD2,      GMI,          SPI4,        RSVD1,      0x31e8,  N,  N,  N),
+	PINGROUP(pi6,                    RSVD1,      RSVD2,      GMI,          SDMMC2,      RSVD1,      0x31ec,  N,  N,  N),
+	PINGROUP(pg0,                    RSVD1,      RSVD2,      GMI,          RSVD4,       RSVD4,      0x31f0,  N,  N,  N),
+	PINGROUP(pg1,                    RSVD1,      RSVD2,      GMI,          RSVD4,       RSVD4,      0x31f4,  N,  N,  N),
+	PINGROUP(pg2,                    RSVD1,      TRACE,      GMI,          RSVD4,       RSVD4,      0x31f8,  N,  N,  N),
+	PINGROUP(pg3,                    RSVD1,      TRACE,      GMI,          RSVD4,       RSVD4,      0x31fc,  N,  N,  N),
+	PINGROUP(pg4,                    RSVD1,      TMDS,       GMI,          SPI4,        RSVD1,      0x3200,  N,  N,  N),
+	PINGROUP(pg5,                    RSVD1,      RSVD2,      GMI,          SPI4,        RSVD1,      0x3204,  N,  N,  N),
+	PINGROUP(pg6,                    RSVD1,      RSVD2,      GMI,          SPI4,        RSVD1,      0x3208,  N,  N,  N),
+	PINGROUP(pg7,                    RSVD1,      RSVD2,      GMI,          SPI4,        RSVD1,      0x320c,  N,  N,  N),
+	PINGROUP(ph0,                    PWM0,       TRACE,      GMI,          DTV,         GMI,        0x3210,  N,  N,  N),
+	PINGROUP(ph1,                    PWM1,       TMDS,       GMI,          DISPLAYA,    GMI,        0x3214,  N,  N,  N),
+	PINGROUP(ph2,                    PWM2,       TMDS,       GMI,          CLDVFS,      GMI,        0x3218,  N,  N,  N),
+	PINGROUP(ph3,                    PWM3,       SPI4,       GMI,          CLDVFS,      GMI,        0x321c,  N,  N,  N),
+	PINGROUP(ph4,                    SDMMC2,     RSVD2,      GMI,          RSVD4,       GMI,        0x3220,  N,  N,  N),
+	PINGROUP(ph5,                    SDMMC2,     RSVD2,      GMI,          RSVD4,       GMI,        0x3224,  N,  N,  N),
+	PINGROUP(ph6,                    SDMMC2,     TRACE,      GMI,          DTV,         GMI,        0x3228,  N,  N,  N),
+	PINGROUP(ph7,                    SDMMC2,     TRACE,      GMI,          DTV,         GMI,        0x322c,  N,  N,  N),
+	PINGROUP(pj7,                    UARTD,      RSVD2,      GMI,          GMI_ALT,     RSVD2,      0x3230,  N,  N,  N),
+	PINGROUP(pb0,                    UARTD,      RSVD2,      GMI,          RSVD4,       RSVD2,      0x3234,  N,  N,  N),
+	PINGROUP(pb1,                    UARTD,      RSVD2,      GMI,          RSVD4,       RSVD2,      0x3238,  N,  N,  N),
+	PINGROUP(pk7,                    UARTD,      RSVD2,      GMI,          RSVD4,       RSVD2,      0x323c,  N,  N,  N),
+	PINGROUP(pi0,                    RSVD1,      RSVD2,      GMI,          RSVD4,       RSVD4,      0x3240,  N,  N,  N),
+	PINGROUP(pi1,                    RSVD1,      RSVD2,      GMI,          RSVD4,       RSVD1,      0x3244,  N,  N,  N),
+	PINGROUP(pi2,                    SDMMC2,     TRACE,      GMI,          RSVD4,       GMI,        0x3248,  N,  N,  N),
+	PINGROUP(pi4,                    SPI4,       TRACE,      GMI,          DISPLAYA,    GMI,        0x324c,  N,  N,  N),
+	PINGROUP(gen2_i2c_scl_pt5,       I2C2,       RSVD2,      GMI,          RSVD4,       RSVD2,      0x3250,  Y,  N,  N),
+	PINGROUP(gen2_i2c_sda_pt6,       I2C2,       RSVD2,      GMI,          RSVD4,       RSVD2,      0x3254,  Y,  N,  N),
+	PINGROUP(sdmmc4_clk_pcc4,        SDMMC4,     RSVD2,      GMI,          RSVD4,       RSVD2,      0x3258,  N,  Y,  N),
+	PINGROUP(sdmmc4_cmd_pt7,         SDMMC4,     RSVD2,      GMI,          RSVD4,       RSVD2,      0x325c,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat0_paa0,       SDMMC4,     SPI3,       GMI,          RSVD4,       SDMMC4,     0x3260,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat1_paa1,       SDMMC4,     SPI3,       GMI,          RSVD4,       SDMMC4,     0x3264,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat2_paa2,       SDMMC4,     SPI3,       GMI,          RSVD4,       SDMMC4,     0x3268,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat3_paa3,       SDMMC4,     SPI3,       GMI,          RSVD4,       SDMMC4,     0x326c,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat4_paa4,       SDMMC4,     SPI3,       GMI,          RSVD4,       SDMMC4,     0x3270,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat5_paa5,       SDMMC4,     SPI3,       RSVD3,        RSVD4,       SDMMC4,     0x3274,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat6_paa6,       SDMMC4,     SPI3,       GMI,          RSVD4,       SDMMC4,     0x3278,  N,  Y,  N),
+	PINGROUP(sdmmc4_dat7_paa7,       SDMMC4,     RSVD1,      GMI,          RSVD4,       SDMMC4,     0x327c,  N,  Y,  N),
+	PINGROUP(cam_mclk_pcc0,          VI,         VI_ALT1,    VI_ALT3,      SDMMC2,      VI,         0x3284,  N,  N,  N),
+	PINGROUP(pcc1,                   I2S4,       RSVD1,      RSVD3,        SDMMC2,      I2S4,       0x3288,  N,  N,  N),
+	PINGROUP(pbb0,                   VGP6,       VIMCLK2,    SDMMC2,       VIMCLK2_ALT, VGP6,       0x328c,  N,  N,  N),
+	PINGROUP(cam_i2c_scl_pbb1,       VGP1,       I2C3,       RSVD3,        SDMMC2,      VGP1,       0x3290,  Y,  N,  N),
+	PINGROUP(cam_i2c_sda_pbb2,       VGP2,       I2C3,       RSVD3,        SDMMC2,      VGP2,       0x3294,  Y,  N,  N),
+	PINGROUP(pbb3,                   VGP3,       DISPLAYA,   DISPLAYB,     SDMMC2,      VGP3,       0x3298,  N,  N,  N),
+	PINGROUP(pbb4,                   VGP4,       DISPLAYA,   DISPLAYB,     SDMMC2,      VGP4,       0x329c,  N,  N,  N),
+	PINGROUP(pbb5,                   VGP5,       DISPLAYA,   RSVD3,        SDMMC2,      VGP5,       0x32a0,  N,  N,  N),
+	PINGROUP(pbb6,                   I2S4,       RSVD2,      DISPLAYB,     SDMMC2,      I2S4,       0x32a4,  N,  N,  N),
+	PINGROUP(pbb7,                   I2S4,       RSVD2,      RSVD3,        SDMMC2,      I2S4,       0x32a8,  N,  N,  N),
+	PINGROUP(pcc2,                   I2S4,       RSVD2,      SDMMC3,       SDMMC2,      I2S4,       0x32ac,  N,  N,  N),
+	PINGROUP(jtag_rtck,              RTCK,       RSVD2,      RSVD3,        RSVD4,       RTCK,       0x32b0,  N,  N,  N),
+	PINGROUP(pwr_i2c_scl_pz6,        I2CPWR,     RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x32b4,  Y,  N,  N),
+	PINGROUP(pwr_i2c_sda_pz7,        I2CPWR,     RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x32b8,  Y,  N,  N),
+	PINGROUP(kb_row0_pr0,            KBC,        RSVD2,      RSVD3,        RSVD4,       RSVD4,      0x32bc,  N,  N,  N),
+	PINGROUP(kb_row1_pr1,            KBC,        RSVD2,      RSVD3,        RSVD4,       RSVD4,      0x32c0,  N,  N,  N),
+	PINGROUP(kb_row2_pr2,            KBC,        RSVD2,      RSVD3,        RSVD4,       RSVD4,      0x32c4,  N,  N,  N),
+	PINGROUP(kb_row3_pr3,            KBC,        DISPLAYA,   SYS,          DISPLAYB,    KBC,        0x32c8,  N,  N,  N),
+	PINGROUP(kb_row4_pr4,            KBC,        DISPLAYA,   RSVD3,        DISPLAYB,    RSVD3,      0x32cc,  N,  N,  N),
+	PINGROUP(kb_row5_pr5,            KBC,        DISPLAYA,   RSVD3,        DISPLAYB,    RSVD3,      0x32d0,  N,  N,  N),
+	PINGROUP(kb_row6_pr6,            KBC,        DISPLAYA,   DISPLAYA_ALT, DISPLAYB,    KBC,        0x32d4,  N,  N,  N),
+	PINGROUP(kb_row7_pr7,            KBC,        RSVD2,      CLDVFS,       UARTA,       RSVD2,      0x32d8,  N,  N,  N),
+	PINGROUP(kb_row8_ps0,            KBC,        RSVD2,      CLDVFS,       UARTA,       RSVD2,      0x32dc,  N,  N,  N),
+	PINGROUP(kb_row9_ps1,            KBC,        RSVD2,      RSVD3,        UARTA,       KBC,        0x32e0,  N,  N,  N),
+	PINGROUP(kb_row10_ps2,           KBC,        RSVD2,      RSVD3,        UARTA,       KBC,        0x32e4,  N,  N,  N),
+	PINGROUP(kb_row11_ps3,           KBC,        RSVD2,      RSVD3,        IRDA,        RSVD3,      0x32e8,  N,  N,  N),
+	PINGROUP(kb_row12_ps4,           KBC,        RSVD2,      RSVD3,        IRDA,        RSVD3,      0x32ec,  N,  N,  N),
+	PINGROUP(kb_row13_ps5,           KBC,        RSVD2,      SPI2,         RSVD4,       RSVD4,      0x32f0,  N,  N,  N),
+	PINGROUP(kb_row14_ps6,           KBC,        RSVD2,      SPI2,         RSVD4,       RSVD4,      0x32f4,  N,  N,  N),
+	PINGROUP(kb_row15_ps7,           KBC,        SOC,        RSVD3,        RSVD4,       KBC,        0x32f8,  N,  N,  N),
+	PINGROUP(kb_col0_pq0,            KBC,        RSVD2,      SPI2,         RSVD4,       RSVD4,      0x32fc,  N,  N,  N),
+	PINGROUP(kb_col1_pq1,            KBC,        RSVD2,      SPI2,         RSVD4,       RSVD4,      0x3300,  N,  N,  N),
+	PINGROUP(kb_col2_pq2,            KBC,        RSVD2,      SPI2,         RSVD4,       RSVD4,      0x3304,  N,  N,  N),
+	PINGROUP(kb_col3_pq3,            KBC,        DISPLAYA,   PWM2,         UARTA,       KBC,        0x3308,  N,  N,  N),
+	PINGROUP(kb_col4_pq4,            KBC,        OWR,        SDMMC3,       UARTA,       KBC,        0x330c,  N,  N,  N),
+	PINGROUP(kb_col5_pq5,            KBC,        RSVD2,      SDMMC3,       RSVD4,       RSVD4,      0x3310,  N,  N,  N),
+	PINGROUP(kb_col6_pq6,            KBC,        RSVD2,      SPI2,         UARTD,       RSVD2,      0x3314,  N,  N,  N),
+	PINGROUP(kb_col7_pq7,            KBC,        RSVD2,      SPI2,         UARTD,       RSVD2,      0x3318,  N,  N,  N),
+	PINGROUP(clk_32k_out_pa0,        BLINK,      SOC,        RSVD3,        RSVD4,       RSVD3,      0x331c,  N,  N,  N),
+	PINGROUP(core_pwr_req,           PWRON,      RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x3324,  N,  N,  N),
+	PINGROUP(cpu_pwr_req,            CPU,        RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x3328,  N,  N,  N),
+	PINGROUP(pwr_int_n,              PMI,        RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x332c,  N,  N,  N),
+	PINGROUP(clk_32k_in,             CLK,        RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x3330,  N,  N,  N),
+	PINGROUP(owr,                    OWR,        RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x3334,  N,  N,  Y),
+	PINGROUP(dap1_fs_pn0,            I2S0,       HDA,        GMI,          RSVD4,       RSVD4,      0x3338,  N,  N,  N),
+	PINGROUP(dap1_din_pn1,           I2S0,       HDA,        GMI,          RSVD4,       RSVD4,      0x333c,  N,  N,  N),
+	PINGROUP(dap1_dout_pn2,          I2S0,       HDA,        GMI,          SATA,        I2S0,       0x3340,  N,  N,  N),
+	PINGROUP(dap1_sclk_pn3,          I2S0,       HDA,        GMI,          RSVD4,       I2S0,       0x3344,  N,  N,  N),
+	PINGROUP(dap_mclk1_req_pee2,     DAP,        DAP1,       SATA,         RSVD4,       DAP,        0x3348,  N,  N,  N),
+	PINGROUP(dap_mclk1_pw4,          EXTPERIPH1, DAP2,       RSVD3,        RSVD4,       RSVD3,      0x334c,  N,  N,  N),
+	PINGROUP(spdif_in_pk6,           SPDIF,      RSVD2,      RSVD3,        I2C3,        RSVD3,      0x3350,  N,  N,  N),
+	PINGROUP(spdif_out_pk5,          SPDIF,      RSVD2,      RSVD3,        I2C3,        RSVD3,      0x3354,  N,  N,  N),
+	PINGROUP(dap2_fs_pa2,            I2S1,       HDA,        GMI,          RSVD4,       I2S1,       0x3358,  N,  N,  N),
+	PINGROUP(dap2_din_pa4,           I2S1,       HDA,        GMI,          RSVD4,       I2S1,       0x335c,  N,  N,  N),
+	PINGROUP(dap2_dout_pa5,          I2S1,       HDA,        GMI,          RSVD4,       I2S1,       0x3360,  N,  N,  N),
+	PINGROUP(dap2_sclk_pa3,          I2S1,       HDA,        GMI,          RSVD4,       I2S1,       0x3364,  N,  N,  N),
+	PINGROUP(dvfs_pwm_px0,           SPI6,       CLDVFS,     GMI,          RSVD4,       SPI6,       0x3368,  N,  N,  N),
+	PINGROUP(gpio_x1_aud_px1,        SPI6,       RSVD2,      GMI,          RSVD4,       SPI6,       0x336c,  N,  N,  N),
+	PINGROUP(gpio_x3_aud_px3,        SPI6,       SPI1,       GMI,          RSVD4,       SPI6,       0x3370,  N,  N,  N),
+	PINGROUP(dvfs_clk_px2,           SPI6,       CLDVFS,     GMI,          RSVD4,       SPI6,       0x3374,  N,  N,  N),
+	PINGROUP(gpio_x4_aud_px4,        GMI,        SPI1,       SPI2,         DAP2,        SPI1,       0x3378,  N,  N,  N),
+	PINGROUP(gpio_x5_aud_px5,        GMI,        SPI1,       SPI2,         RSVD4,       SPI1,       0x337c,  N,  N,  N),
+	PINGROUP(gpio_x6_aud_px6,        SPI6,       SPI1,       SPI2,         GMI,         SPI1,       0x3380,  N,  N,  N),
+	PINGROUP(gpio_x7_aud_px7,        RSVD1,      SPI1,       SPI2,         RSVD4,       SPI1,       0x3384,  N,  N,  N),
+	PINGROUP(sdmmc3_clk_pa6,         SDMMC3,     RSVD2,      RSVD3,        SPI3,        SDMMC3,     0x3390,  N,  N,  N),
+	PINGROUP(sdmmc3_cmd_pa7,         SDMMC3,     PWM3,       UARTA,        SPI3,        SDMMC3,     0x3394,  N,  N,  N),
+	PINGROUP(sdmmc3_dat0_pb7,        SDMMC3,     RSVD2,      RSVD3,        SPI3,        SDMMC3,     0x3398,  N,  N,  N),
+	PINGROUP(sdmmc3_dat1_pb6,        SDMMC3,     PWM2,       UARTA,        SPI3,        SDMMC3,     0x339c,  N,  N,  N),
+	PINGROUP(sdmmc3_dat2_pb5,        SDMMC3,     PWM1,       DISPLAYA,     SPI3,        SDMMC3,     0x33a0,  N,  N,  N),
+	PINGROUP(sdmmc3_dat3_pb4,        SDMMC3,     PWM0,       DISPLAYB,     SPI3,        SDMMC3,     0x33a4,  N,  N,  N),
+	PINGROUP(pex_l0_rst_n_pdd1,      PE0,        RSVD2,      RSVD3,        RSVD4,       PE0,        0x33bc,  N,  N,  N),
+	PINGROUP(pex_l0_clkreq_n_pdd2,   PE0,        RSVD2,      RSVD3,        RSVD4,       PE0,        0x33c0,  N,  N,  N),
+	PINGROUP(pex_wake_n_pdd3,        PE,         RSVD2,      RSVD3,        RSVD4,       PE,         0x33c4,  N,  N,  N),
+	PINGROUP(pex_l1_rst_n_pdd5,      PE1,        RSVD2,      RSVD3,        RSVD4,       PE1,        0x33cc,  N,  N,  N),
+	PINGROUP(pex_l1_clkreq_n_pdd6,   PE1,        RSVD2,      RSVD3,        RSVD4,       PE1,        0x33d0,  N,  N,  N),
+	PINGROUP(hdmi_cec_pee3,          CEC,        RSVD2,      RSVD3,        RSVD4,       CEC,        0x33e0,  Y,  N,  N),
+	PINGROUP(sdmmc1_wp_n_pv3,        SDMMC1,     CLK12,      SPI4,         UARTA,       SDMMC1,     0x33e4,  N,  N,  N),
+	PINGROUP(sdmmc3_cd_n_pv2,        SDMMC3,     OWR,        RSVD3,        RSVD4,       SDMMC3,     0x33e8,  N,  N,  N),
+	PINGROUP(gpio_w2_aud_pw2,        SPI6,       RSVD2,      SPI2,         I2C1,        RSVD2,      0x33ec,  N,  N,  N),
+	PINGROUP(gpio_w3_aud_pw3,        SPI6,       SPI1,       SPI2,         I2C1,        SPI1,       0x33f0,  N,  N,  N),
+	PINGROUP(usb_vbus_en0_pn4,       USB,        RSVD2,      RSVD3,        RSVD4,       USB,        0x33f4,  Y,  N,  N),
+	PINGROUP(usb_vbus_en1_pn5,       USB,        RSVD2,      RSVD3,        RSVD4,       USB,        0x33f8,  Y,  N,  N),
+	PINGROUP(sdmmc3_clk_lb_out_pee4, SDMMC3,     RSVD2,      RSVD3,        RSVD4,       SDMMC3,     0x33fc,  N,  N,  N),
+	PINGROUP(sdmmc3_clk_lb_in_pee5,  SDMMC3,     RSVD2,      RSVD3,        RSVD4,       SDMMC3,     0x3400,  N,  N,  N),
+	PINGROUP(gmi_clk_lb,             SDMMC2,     RSVD2,      GMI,          RSVD4,       SDMMC2,     0x3404,  N,  N,  N),
+	PINGROUP(reset_out_n,            RSVD1,      RSVD2,      RSVD3,        RESET_OUT_N, RSVD1,      0x3408,  N,  N,  N),
+	PINGROUP(kb_row16_pt0,           KBC,        RSVD2,      RSVD3,        UARTC,       KBC,        0x340c,  N,  N,  N),
+	PINGROUP(kb_row17_pt1,           KBC,        RSVD2,      RSVD3,        UARTC,       KBC,        0x3410,  N,  N,  N),
+	PINGROUP(usb_vbus_en2_pff1,      USB,        RSVD2,      RSVD3,        RSVD4,       USB,        0x3414,  Y,  N,  N),
+	PINGROUP(pff2,                   SATA,       RSVD2,      RSVD3,        RSVD4,       RSVD2,      0x3418,  Y,  N,  N),
+	PINGROUP(dp_hpd_pff0,            DP,         RSVD2,      RSVD3,        RSVD4,       DP,         0x3430,  N,  N,  N),
 
 	/* pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w, drvtype */
-	DRV_PINGROUP(ao1,   0x868,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(ao2,   0x86c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(at1,   0x870,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
-	DRV_PINGROUP(at2,   0x874,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
-	DRV_PINGROUP(at3,   0x878,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
-	DRV_PINGROUP(at4,   0x87c,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
-	DRV_PINGROUP(at5,   0x880,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(cdev1, 0x884,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(cdev2, 0x888,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(dap1,  0x890,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(dap2,  0x894,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(dap3,  0x898,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(dap4,  0x89c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(dbg,   0x8a0,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(sdio3, 0x8b0,  2,  3, -1,  12,  7,  20,  7,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(spi,   0x8b4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(uaa,   0x8b8,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(uab,   0x8bc,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(uart2, 0x8c0,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(uart3, 0x8c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(sdio1, 0x8ec,  2,  3, -1,  12,  7,  20,  7,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(ddc,   0x8fc,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(gma,   0x900,  2,  3,  4,  14,  5,  20,  5,  28,  2,  30,  2,  Y),
-	DRV_PINGROUP(gme,   0x910,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(gmf,   0x914,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(gmg,   0x918,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(gmh,   0x91c,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(owr,   0x920,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(uda,   0x924,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(gpv,   0x928,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(dev3,  0x92c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(cec,   0x938,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(at6,   0x994,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
-	DRV_PINGROUP(dap5,  0x998,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(usb_vbus_en,  0x99c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(ao3,   0x9a8,  2,  3,  4,  12,  5,  -1,  -1,  28,  2,  -1,  -1,  N),
-	DRV_PINGROUP(ao0,   0x9b0,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(hv0,   0x9b4,  2,  3,  4,  12,  5,  -1,  -1,  28,  2,  -1,  -1,  N),
-	DRV_PINGROUP(sdio4, 0x9c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
-	DRV_PINGROUP(ao4,   0x9c8,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+	DRV_PINGROUP(ao1,         0x868,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(ao2,         0x86c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(at1,         0x870,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+	DRV_PINGROUP(at2,         0x874,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+	DRV_PINGROUP(at3,         0x878,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+	DRV_PINGROUP(at4,         0x87c,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+	DRV_PINGROUP(at5,         0x880,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(cdev1,       0x884,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(cdev2,       0x888,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(dap1,        0x890,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(dap2,        0x894,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(dap3,        0x898,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(dap4,        0x89c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(dbg,         0x8a0,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(sdio3,       0x8b0,  2,  3, -1,  12,  7,  20,  7,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(spi,         0x8b4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(uaa,         0x8b8,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(uab,         0x8bc,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(uart2,       0x8c0,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(uart3,       0x8c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(sdio1,       0x8ec,  2,  3, -1,  12,  7,  20,  7,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(ddc,         0x8fc,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(gma,         0x900,  2,  3,  4,  14,  5,  20,  5,  28,  2,  30,  2,  Y),
+	DRV_PINGROUP(gme,         0x910,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(gmf,         0x914,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(gmg,         0x918,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(gmh,         0x91c,  2,  3,  4,  14,  5,  19,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(owr,         0x920,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(uda,         0x924,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(gpv,         0x928,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(dev3,        0x92c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(cec,         0x938,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(at6,         0x994,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
+	DRV_PINGROUP(dap5,        0x998,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(usb_vbus_en, 0x99c,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(ao3,         0x9a8,  2,  3,  4,  12,  5,  -1, -1,  28,  2,  -1, -1,  N),
+	DRV_PINGROUP(ao0,         0x9b0,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(hv0,         0x9b4,  2,  3,  4,  12,  5,  -1, -1,  28,  2,  -1, -1,  N),
+	DRV_PINGROUP(sdio4,       0x9c4,  2,  3,  4,  12,  5,  20,  5,  28,  2,  30,  2,  N),
+	DRV_PINGROUP(ao4,         0x9c8,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
 };
 
 static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
-- 
1.8.4.2
