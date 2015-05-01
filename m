From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 02/20] clk: tegra: periph: add new periph clks and muxes for Tegra210
Date: Fri, 1 May 2015 14:53:49 -0400
Message-ID: <1430506447-29074-3-git-send-email-rklein@nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430506447-29074-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra210 has significant differences in muxes for peripheral clocks.
One of the most important changes is that pll_m isn't to be used
as a source for peripherals. Therefore, we need to define the new
muxes and new clocks to use those muxes for Tegra210 support.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h           |   57 +++++++-
 drivers/clk/tegra/clk-tegra-periph.c |  257 +++++++++++++++++++++++++++++++++-
 2 files changed, 312 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 60738cc954cb..ac6eaba5cc6e 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -13,6 +13,7 @@ enum clk_id {
 	tegra_clk_amx1,
 	tegra_clk_apbdma,
 	tegra_clk_apbif,
+	tegra_clk_ape,
 	tegra_clk_audio0,
 	tegra_clk_audio0_2x,
 	tegra_clk_audio0_mux,
@@ -38,6 +39,7 @@ enum clk_id {
 	tegra_clk_cile,
 	tegra_clk_clk_32k,
 	tegra_clk_clk72Mhz,
+	tegra_clk_clk72Mhz_8,
 	tegra_clk_clk_m,
 	tegra_clk_clk_m_div2,
 	tegra_clk_clk_m_div4,
@@ -51,17 +53,21 @@ enum clk_id {
 	tegra_clk_cml1,
 	tegra_clk_csi,
 	tegra_clk_csite,
+	tegra_clk_csite_8,
 	tegra_clk_csus,
 	tegra_clk_cve,
 	tegra_clk_dam0,
 	tegra_clk_dam1,
 	tegra_clk_dam2,
 	tegra_clk_d_audio,
+	tegra_clk_dbgapb,
 	tegra_clk_dds,
 	tegra_clk_dfll_ref,
 	tegra_clk_dfll_soc,
 	tegra_clk_disp1,
+	tegra_clk_disp1_8,
 	tegra_clk_disp2,
+	tegra_clk_disp2_8,
 	tegra_clk_dp2,
 	tegra_clk_dpaux,
 	tegra_clk_dsialp,
@@ -71,6 +77,7 @@ enum clk_id {
 	tegra_clk_dtv,
 	tegra_clk_emc,
 	tegra_clk_entropy,
+	tegra_clk_entropy_8,
 	tegra_clk_epp,
 	tegra_clk_epp_8,
 	tegra_clk_extern1,
@@ -85,12 +92,15 @@ enum clk_id {
 	tegra_clk_gr3d_8,
 	tegra_clk_hclk,
 	tegra_clk_hda,
+	tegra_clk_hda_8,
 	tegra_clk_hda2codec_2x,
+	tegra_clk_hda2codec_2x_8,
 	tegra_clk_hda2hdmi,
 	tegra_clk_hdmi,
 	tegra_clk_hdmi_audio,
 	tegra_clk_host1x,
 	tegra_clk_host1x_8,
+	tegra_clk_host1x_9,
 	tegra_clk_i2c1,
 	tegra_clk_i2c2,
 	tegra_clk_i2c3,
@@ -110,11 +120,14 @@ enum clk_id {
 	tegra_clk_i2s4_sync,
 	tegra_clk_isp,
 	tegra_clk_isp_8,
+	tegra_clk_isp_9,
 	tegra_clk_ispb,
 	tegra_clk_kbc,
 	tegra_clk_kfuse,
 	tegra_clk_la,
+	tegra_clk_maud,
 	tegra_clk_mipi,
+	tegra_clk_mipibif,
 	tegra_clk_mipi_cal,
 	tegra_clk_mpe,
 	tegra_clk_mselect,
@@ -124,11 +137,16 @@ enum clk_id {
 	tegra_clk_ndspeed,
 	tegra_clk_ndspeed_8,
 	tegra_clk_nor,
+	tegra_clk_nvdec,
+	tegra_clk_nvenc,
+	tegra_clk_nvjpg,
 	tegra_clk_owr,
+	tegra_clk_owr_8,
 	tegra_clk_pcie,
 	tegra_clk_pclk,
 	tegra_clk_pll_a,
 	tegra_clk_pll_a_out0,
+	tegra_clk_pll_a1,
 	tegra_clk_pll_c,
 	tegra_clk_pll_c2,
 	tegra_clk_pll_c3,
@@ -140,8 +158,10 @@ enum clk_id {
 	tegra_clk_pll_d_out0,
 	tegra_clk_pll_dp,
 	tegra_clk_pll_e_out0,
+	tegra_clk_pll_g_ref,
 	tegra_clk_pll_m,
 	tegra_clk_pll_m_out1,
+	tegra_clk_pll_mb,
 	tegra_clk_pll_p,
 	tegra_clk_pll_p_out1,
 	tegra_clk_pll_p_out2,
@@ -160,52 +180,77 @@ enum clk_id {
 	tegra_clk_pll_x,
 	tegra_clk_pll_x_out0,
 	tegra_clk_pwm,
+	tegra_clk_qspi,
 	tegra_clk_rtc,
 	tegra_clk_sata,
+	tegra_clk_sata_8,
 	tegra_clk_sata_cold,
 	tegra_clk_sata_oob,
+	tegra_clk_sata_oob_8,
 	tegra_clk_sbc1,
 	tegra_clk_sbc1_8,
+	tegra_clk_sbc1_9,
 	tegra_clk_sbc2,
 	tegra_clk_sbc2_8,
+	tegra_clk_sbc2_9,
 	tegra_clk_sbc3,
 	tegra_clk_sbc3_8,
+	tegra_clk_sbc3_9,
 	tegra_clk_sbc4,
 	tegra_clk_sbc4_8,
+	tegra_clk_sbc4_9,
 	tegra_clk_sbc5,
 	tegra_clk_sbc5_8,
 	tegra_clk_sbc6,
 	tegra_clk_sbc6_8,
 	tegra_clk_sclk,
+	tegra_clk_sdmmc_legacy,
 	tegra_clk_sdmmc1,
 	tegra_clk_sdmmc1_8,
+	tegra_clk_sdmmc1_9,
 	tegra_clk_sdmmc2,
 	tegra_clk_sdmmc2_8,
+	tegra_clk_sdmmc2_9,
 	tegra_clk_sdmmc3,
 	tegra_clk_sdmmc3_8,
+	tegra_clk_sdmmc3_9,
 	tegra_clk_sdmmc4,
 	tegra_clk_sdmmc4_8,
+	tegra_clk_sdmmc4_9,
 	tegra_clk_se,
 	tegra_clk_soc_therm,
+	tegra_clk_soc_therm_8,
 	tegra_clk_sor0,
 	tegra_clk_sor0_lvds,
+	tegra_clk_sor1,
+	tegra_clk_sor1_brick,
+	tegra_clk_sor1_src,
 	tegra_clk_spdif,
 	tegra_clk_spdif_2x,
 	tegra_clk_spdif_in,
+	tegra_clk_spdif_in_8,
 	tegra_clk_spdif_in_sync,
 	tegra_clk_spdif_mux,
 	tegra_clk_spdif_out,
 	tegra_clk_timer,
 	tegra_clk_trace,
 	tegra_clk_tsec,
+	tegra_clk_tsec_8,
+	tegra_clk_tsecb,
 	tegra_clk_tsensor,
 	tegra_clk_tvdac,
 	tegra_clk_tvo,
 	tegra_clk_uarta,
+	tegra_clk_uarta_8,
 	tegra_clk_uartb,
+	tegra_clk_uartb_8,
 	tegra_clk_uartc,
+	tegra_clk_uartc_8,
 	tegra_clk_uartd,
+	tegra_clk_uartd_8,
 	tegra_clk_uarte,
+	tegra_clk_uarte_8,
+	tegra_clk_uartape,
 	tegra_clk_usb2,
 	tegra_clk_usb3,
 	tegra_clk_usbd,
@@ -216,22 +261,32 @@ enum clk_id {
 	tegra_clk_vi,
 	tegra_clk_vi_8,
 	tegra_clk_vi_9,
+	tegra_clk_vi_10,
+	tegra_clk_vi_i2c,
 	tegra_clk_vic03,
+	tegra_clk_vic03_8,
 	tegra_clk_vim2_clk,
 	tegra_clk_vimclk_sync,
 	tegra_clk_vi_sensor,
-	tegra_clk_vi_sensor2,
 	tegra_clk_vi_sensor_8,
+	tegra_clk_vi_sensor_9,
+	tegra_clk_vi_sensor2,
+	tegra_clk_vi_sensor2_8,
 	tegra_clk_xusb_dev,
 	tegra_clk_xusb_dev_src,
+	tegra_clk_xusb_dev_src_8,
 	tegra_clk_xusb_falcon_src,
+	tegra_clk_xusb_falcon_src_8,
 	tegra_clk_xusb_fs_src,
 	tegra_clk_xusb_host,
 	tegra_clk_xusb_host_src,
+	tegra_clk_xusb_host_src_8,
 	tegra_clk_xusb_hs_src,
 	tegra_clk_xusb_ss,
 	tegra_clk_xusb_ss_src,
+	tegra_clk_xusb_ss_src_8,
 	tegra_clk_xusb_ss_div2,
+	tegra_clk_sclk_mux,
 	tegra_clk_max,
 };
 
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 46af9244ba74..bde7286bb16b 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -125,6 +125,19 @@
 #define CLK_SOURCE_HDMI_AUDIO 0x668
 #define CLK_SOURCE_VIC03 0x678
 #define CLK_SOURCE_CLK72MHZ 0x66c
+#define CLK_SOURCE_DBGAPB 0x718
+#define CLK_SOURCE_NVENC 0x6a0
+#define CLK_SOURCE_NVDEC 0x698
+#define CLK_SOURCE_NVJPG 0x69c
+#define CLK_SOURCE_APE 0x6c0
+#define CLK_SOURCE_SOR1 0x410
+#define CLK_SOURCE_SDMMC_LEGACY 0x694
+#define CLK_SOURCE_QSPI 0x6c4
+#define CLK_SOURCE_VI_I2C 0x6c8
+#define CLK_SOURCE_MIPIBIF 0x660
+#define CLK_SOURCE_UARTAPE 0x710
+#define CLK_SOURCE_TSECB 0x6d8
+#define CLK_SOURCE_MAUD 0x6d4
 
 #define MASK(x) (BIT(x) - 1)
 
@@ -183,6 +196,13 @@
 			TEGRA_DIVIDER_ROUND_UP, _clk_num, 0, _clk_id,\
 			_parents##_idx, 0, NULL)
 
+#define UART8(_name, _parents, _offset,\
+			     _clk_num, _clk_id)			\
+	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
+			29, MASK(3), 0, 0, 16, 1, TEGRA_DIVIDER_UART| \
+			TEGRA_DIVIDER_ROUND_UP, _clk_num, 0, _clk_id,\
+			_parents##_idx, 0, NULL)
+
 #define I2C(_name, _parents, _offset,\
 			     _clk_num, _clk_id)			\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
@@ -235,6 +255,7 @@ static DEFINE_SPINLOCK(PLLP_OUTA_lock);
 static DEFINE_SPINLOCK(PLLP_OUTB_lock);
 static DEFINE_SPINLOCK(PLLP_OUTC_lock);
 static DEFINE_SPINLOCK(sor0_lock);
+static DEFINE_SPINLOCK(sor1_lock);
 
 #define MUX_I2S_SPDIF(_id)						\
 static const char *mux_pllaout0_##_id##_2x_pllp_clkm[] = { "pll_a_out0", \
@@ -286,6 +307,68 @@ static u32 mux_pllp_clkm_idx[] = {
 	[0] = 0, [1] = 3,
 };
 
+static const char *mux_pllp_clkm_2[] = {
+	"pll_p", "clk_m"
+};
+static u32 mux_pllp_clkm_2_idx[] = {
+	[0] = 2, [1] = 6,
+};
+
+static const char *mux_pllc2_c_c3_pllp_plla1_clkm[] = {
+	"pll_c2", "pll_c", "pll_c3", "pll_p", "pll_a1", "clk_m"
+};
+static u32 mux_pllc2_c_c3_pllp_plla1_clkm_idx[] = {
+	[0] = 1, [1] = 2, [2] = 3, [3] = 4, [4] = 6, [5] = 7,
+};
+
+static const char *
+mux_pllc4_out1_pllc_pllc4_out2_pllp_clkm_plla_pllc4_out0[] = {
+	"pll_c4_out1", "pll_c", "pll_c4_out2", "pll_p", "clk_m",
+	"pll_a_out0", "pll_c4_out0"
+};
+static u32 mux_pllc4_out1_pllc_pllc4_out2_pllp_clkm_plla_pllc4_out0_idx[] = {
+	[0] = 0, [1] = 2, [2] = 3, [3] = 4, [4] = 5, [5] = 6, [6] = 7,
+};
+
+static const char *mux_pllc_pllp_plla[] = {
+	"pll_c", "pll_p", "pll_a_out0"
+};
+static u32 mux_pllc_pllp_plla_idx[] = {
+	[0] = 1, [1] = 2, [2] = 3,
+};
+
+static const char *mux_clkm_pllc_pllp_plla[] = {
+	"clk_m", "pll_c", "pll_p", "pll_a_out0"
+};
+#define mux_clkm_pllc_pllp_plla_idx NULL
+
+static const char *mux_pllc_pllp_plla1_pllc2_c3_clkm[] = {
+	"pll_c", "pll_p", "pll_a1", "pll_c2", "pll_c3", "clk_m"
+};
+static u32 mux_pllc_pllp_plla1_pllc2_c3_clkm_idx[] = {
+	[0] = 1, [1] = 2, [2] = 3, [3] = 4, [4] = 5, [5] = 6,
+};
+
+static const char *mux_pllc2_c_c3_pllp_clkm_plla1_pllc4[] = {
+	"pll_c2", "pll_c", "pll_c3", "pll_p", "clk_m", "pll_a1", "pll_c4_out0",
+};
+static u32 mux_pllc2_c_c3_pllp_clkm_plla1_pllc4_idx[] = {
+	[0] = 1, [1] = 2, [2] = 3, [3] = 4, [4] = 5, [5] = 6, [6] = 7,
+};
+
+static const char *mux_pllc_pllp_plla1_pllc2_c3_clkm_pllc4[] = {
+	"pll_c", "pll_p", "pll_a1", "pll_c2", "pll_c3", "clk_m", "pll_c4_out0",
+};
+#define mux_pllc_pllp_plla1_pllc2_c3_clkm_pllc4_idx \
+	mux_pllc2_c_c3_pllp_clkm_plla1_pllc4_idx
+
+static const char *
+mux_plla_pllc4_out0_pllc_pllc4_out1_pllp_pllc4_out2_clkm[] = {
+	"pll_a_out0", "pll_c4_out0", "pll_c", "pll_c4_out1", "pll_p",
+	"pll_c4_out2", "clk_m"
+};
+#define mux_plla_pllc4_out0_pllc_pllc4_out1_pllp_pllc4_out2_clkm_idx NULL
+
 static const char *mux_pllm_pllc2_c_c3_pllp_plla[] = {
 	"pll_m", "pll_c2", "pll_c", "pll_c3", "pll_p", "pll_a_out0"
 };
@@ -303,12 +386,93 @@ static const char *mux_pllm_pllc_pllp_plla[] = {
 #define mux_pllm_pllc_pllp_plla_idx mux_pllp_pllc_pllm_clkm_idx
 
 static const char *mux_pllp_pllc_clkm[] = {
-	"pll_p", "pll_c", "pll_m"
+	"pll_p", "pll_c", "clk_m"
 };
 static u32 mux_pllp_pllc_clkm_idx[] = {
 	[0] = 0, [1] = 1, [2] = 3,
 };
 
+static const char *mux_pllp_pllc_clkm_1[] = {
+	"pll_p", "pll_c", "clk_m"
+};
+static u32 mux_pllp_pllc_clkm_1_idx[] = {
+	[0] = 0, [1] = 2, [2] = 5,
+};
+
+static const char *mux_pllp_pllc_plla_clkm[] = {
+	"pll_p", "pll_c", "pll_a_out0", "clk_m"
+};
+static u32 mux_pllp_pllc_plla_clkm_idx[] = {
+	[0] = 0, [1] = 2, [2] = 4, [3] = 6,
+};
+
+static const char *mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2[] = {
+	"pll_p", "pll_c", "pll_c4_out0", "pll_c4_out1", "clk_m", "pll_c4_out2"
+};
+static u32 mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2_idx[] = {
+	[0] = 0, [1] = 2, [2] = 3, [3] = 5, [4] = 6, [5] = 7,
+};
+
+static const char *
+mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0[] = {
+	"pll_p", "pll_c_out1", "pll_c", "pll_c4_out2", "pll_c4_out1",
+	"clk_m", "pll_c4_out0"
+};
+static u32
+mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0_idx[] = {
+	[0] = 0, [1] = 1, [2] = 2, [3] = 4, [4] = 5, [5] = 6, [6] = 7,
+};
+
+static const char *mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0[] = {
+	"pll_p", "pll_c4_out2", "pll_c4_out1", "clk_m", "pll_c4_out0"
+};
+static u32 mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0_idx[] = {
+	[0] = 0, [1] = 3, [2] = 4, [3] = 6, [4] = 7,
+};
+
+static const char *mux_pllp_clkm_pllc4_out2_out1_out0_lj[] = {
+	"pll_p",
+	"pll_c4_out2", "pll_c4_out0",	/* LJ input */
+	"pll_c4_out2", "pll_c4_out1",
+	"pll_c4_out1",			/* LJ input */
+	"clk_m", "pll_c4_out0"
+};
+#define mux_pllp_clkm_pllc4_out2_out1_out0_lj_idx NULL
+
+static const char *mux_pllp_pllc2_c_c3_clkm[] = {
+	"pll_p", "pll_c2", "pll_c", "pll_c3", "clk_m"
+};
+static u32 mux_pllp_pllc2_c_c3_clkm_idx[] = {
+	[0] = 0, [1] = 1, [2] = 2, [3] = 3, [4] = 6,
+};
+
+static const char *mux_pllp_clkm_clk32_plle[] = {
+	"pll_p", "clk_m", "clk_32k", "pll_e"
+};
+static u32 mux_pllp_clkm_clk32_plle_idx[] = {
+	[0] = 0, [1] = 2, [2] = 4, [3] = 6,
+};
+
+static const char *mux_pllp_pllp_out3_clkm_clk32k_plla[] = {
+	"pll_p", "pll_p_out3", "clk_m", "clk_32k", "pll_a_out0"
+};
+#define mux_pllp_pllp_out3_clkm_clk32k_plla_idx NULL
+
+static const char *mux_pllp_out3_clkm_pllp_pllc4[] = {
+	"pll_p_out3", "clk_m", "pll_p", "pll_c4_out0", "pll_c4_out1",
+	"pll_c4_out2"
+};
+static u32 mux_pllp_out3_clkm_pllp_pllc4_idx[] = {
+	[0] = 0, [1] = 3, [2] = 4, [3] = 5, [4] = 6, [5] = 7,
+};
+
+static const char *mux_clkm_pllp_pllre[] = {
+	"clk_m", "pll_p_out_xusb", "pll_re_out"
+};
+static u32 mux_clkm_pllp_pllre_idx[] = {
+	[0] = 0, [1] = 1, [2] = 5,
+};
+
 static const char *mux_pllp_pllc_clkm_clk32[] = {
 	"pll_p", "pll_c", "clk_m", "clk_32k"
 };
@@ -333,6 +497,11 @@ static u32 mux_clkm_48M_pllp_480M_idx[] = {
 	[0] = 0, [1] = 2, [2] = 4, [3] = 6,
 };
 
+static const char *mux_clkm_pllre_clk32_480M[] = {
+	"clk_m", "pll_re_out", "clk_32k", "pll_u_480M"
+};
+#define mux_clkm_pllre_clk32_480M_idx NULL
+
 static const char *mux_clkm_pllre_clk32_480M_pllc_ref[] = {
 	"clk_m", "pll_re_out", "clk_32k", "pll_u_480M", "pll_c", "pll_ref"
 };
@@ -340,6 +509,13 @@ static u32 mux_clkm_pllre_clk32_480M_pllc_ref_idx[] = {
 	[0] = 0, [1] = 1, [2] = 3, [3] = 3, [4] = 4, [5] = 7,
 };
 
+static const char *mux_pllp_out3_pllp_pllc_clkm[] = {
+	"pll_p_out3", "pll_p", "pll_c", "clk_m"
+};
+static u32 mux_pllp_out3_pllp_pllc_clkm_idx[] = {
+	[0] = 0, [1] = 1, [2] = 2, [3] = 6,
+};
+
 static const char *mux_ss_60M[] = {
 	"xusb_ss_div2", "pll_u_60M"
 };
@@ -387,6 +563,32 @@ static u32 mux_pllm_pllc2_c_c3_pllp_plla_pllc4_idx[] = {
 	[0] = 0, [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 6, [6] = 7,
 };
 
+/* SOR1 mux'es */
+static const char *mux_pllp_plld_plld2_clkm[] = {
+	"pll_p", "pll_d_out0", "pll_d2", "clk_m"
+};
+static u32 mux_pllp_plld_plld2_clkm_idx[] = {
+	[0] = 0, [1] = 2, [2] = 5, [3] = 6
+};
+
+static const char *mux_plldp_sor1_src[] = {
+	"pll_dp", "clk_sor1_src"
+};
+#define mux_plldp_sor1_src_idx NULL
+
+static const char *mux_clkm_sor1_brick_sor1_src[] = {
+	"clk_m", "sor1_brick", "sor1_src", "sor1_brick"
+};
+#define mux_clkm_sor1_brick_sor1_src_idx NULL
+
+static const char *mux_pllp_pllre_clkm[] = {
+	"pll_p", "pll_re_out1", "clk_m"
+};
+
+static u32 mux_pllp_pllre_clkm_idx[] = {
+	[0] = 0, [1] = 2, [2] = 3,
+};
+
 static const char *mux_clkm_plldp_sor0lvds[] = {
 	"clk_m", "pll_dp", "sor0_lvds",
 };
@@ -402,6 +604,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	I2C("i2c3", mux_pllp_clkm, CLK_SOURCE_I2C3, 67, tegra_clk_i2c3),
 	I2C("i2c4", mux_pllp_clkm, CLK_SOURCE_I2C4, 103, tegra_clk_i2c4),
 	I2C("i2c5", mux_pllp_clkm, CLK_SOURCE_I2C5, 47, tegra_clk_i2c5),
+	I2C("i2c6", mux_pllp_clkm, CLK_SOURCE_I2C6, 166, tegra_clk_i2c6),
 	INT("vde", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde),
 	INT("vi", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi),
 	INT("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp),
@@ -412,14 +615,19 @@ static struct tegra_periph_init_data periph_clks[] = {
 	INT8("vde", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla_pllc4, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_9),
+	INT8("vi", mux_pllc2_c_c3_pllp_clkm_plla1_pllc4, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_10),
 	INT8("epp", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp_8),
 	INT8("msenc", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_MSENC, 91, TEGRA_PERIPH_WAR_1005168, tegra_clk_msenc),
 	INT8("tsec", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_TSEC, 83, 0, tegra_clk_tsec),
+	INT("tsec", mux_pllp_pllc_clkm, CLK_SOURCE_TSEC, 83, 0, tegra_clk_tsec_8),
 	INT8("host1x", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x_8),
+	INT8("host1x", mux_pllc4_out1_pllc_pllc4_out2_pllp_clkm_plla_pllc4_out0, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x_9),
 	INT8("se", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se),
+	INT8("se", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se),
 	INT8("2d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d_8),
 	INT8("3d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d_8),
 	INT8("vic03", mux_pllm_pllc_pllp_plla_pllc2_c3_clkm, CLK_SOURCE_VIC03, 178, 0, tegra_clk_vic03),
+	INT8("vic03", mux_pllc_pllp_plla1_pllc2_c3_clkm, CLK_SOURCE_VIC03, 178, 0, tegra_clk_vic03_8),
 	INT_FLAGS("mselect", mux_pllp_clkm, CLK_SOURCE_MSELECT, 99, 0, tegra_clk_mselect, CLK_IGNORE_UNUSED),
 	MUX("i2s0", mux_pllaout0_audio0_2x_pllp_clkm, CLK_SOURCE_I2S0, 30, TEGRA_PERIPH_ON_APB, tegra_clk_i2s0),
 	MUX("i2s1", mux_pllaout0_audio1_2x_pllp_clkm, CLK_SOURCE_I2S1, 11, TEGRA_PERIPH_ON_APB, tegra_clk_i2s1),
@@ -428,22 +636,31 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("i2s4", mux_pllaout0_audio4_2x_pllp_clkm, CLK_SOURCE_I2S4, 102, TEGRA_PERIPH_ON_APB, tegra_clk_i2s4),
 	MUX("spdif_out", mux_pllaout0_audio_2x_pllp_clkm, CLK_SOURCE_SPDIF_OUT, 10, TEGRA_PERIPH_ON_APB, tegra_clk_spdif_out),
 	MUX("spdif_in", mux_pllp_pllc_pllm, CLK_SOURCE_SPDIF_IN, 10, TEGRA_PERIPH_ON_APB, tegra_clk_spdif_in),
+	MUX8("spdif_in", mux_pllp_pllc_clkm_1, CLK_SOURCE_SPDIF_IN, 10, TEGRA_PERIPH_ON_APB, tegra_clk_spdif_in_8),
 	MUX("pwm", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_PWM, 17, TEGRA_PERIPH_ON_APB, tegra_clk_pwm),
 	MUX("adx", mux_plla_pllc_pllp_clkm, CLK_SOURCE_ADX, 154, TEGRA_PERIPH_ON_APB, tegra_clk_adx),
 	MUX("amx", mux_plla_pllc_pllp_clkm, CLK_SOURCE_AMX, 153, TEGRA_PERIPH_ON_APB, tegra_clk_amx),
 	MUX("hda", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_HDA, 125, TEGRA_PERIPH_ON_APB, tegra_clk_hda),
+	MUX("hda", mux_pllp_pllc_clkm, CLK_SOURCE_HDA, 125, TEGRA_PERIPH_ON_APB, tegra_clk_hda_8),
 	MUX("hda2codec_2x", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_HDA2CODEC_2X, 111, TEGRA_PERIPH_ON_APB, tegra_clk_hda2codec_2x),
+	MUX8("hda2codec_2x", mux_pllp_pllc_plla_clkm, CLK_SOURCE_HDA2CODEC_2X, 111, TEGRA_PERIPH_ON_APB, tegra_clk_hda2codec_2x_8),
 	MUX("vfir", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VFIR, 7, TEGRA_PERIPH_ON_APB, tegra_clk_vfir),
 	MUX("sdmmc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1),
 	MUX("sdmmc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC2, 9, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc2),
 	MUX("sdmmc3", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3),
 	MUX("sdmmc4", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC4, 15, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc4),
+	MUX8("sdmmc1", mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1_9),
+	MUX8("sdmmc2", mux_pllp_clkm_pllc4_out2_out1_out0_lj, CLK_SOURCE_SDMMC2, 9, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc2_9),
+	MUX8("sdmmc3", mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3_9),
+	MUX8("sdmmc4", mux_pllp_clkm_pllc4_out2_out1_out0_lj, CLK_SOURCE_SDMMC4, 15, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc4_9),
 	MUX("la", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_LA, 76, TEGRA_PERIPH_ON_APB, tegra_clk_la),
 	MUX("trace", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_TRACE, 77, TEGRA_PERIPH_ON_APB, tegra_clk_trace),
 	MUX("owr", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_OWR, 71, TEGRA_PERIPH_ON_APB, tegra_clk_owr),
+	MUX("owr", mux_pllp_pllc_clkm, CLK_SOURCE_OWR, 71, TEGRA_PERIPH_ON_APB, tegra_clk_owr_8),
 	MUX("nor", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NOR, 42, 0, tegra_clk_nor),
 	MUX("mipi", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_MIPI, 50, TEGRA_PERIPH_ON_APB, tegra_clk_mipi),
 	MUX("vi_sensor", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI_SENSOR, 20, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor),
+	MUX("vi_sensor", mux_pllc_pllp_plla, CLK_SOURCE_VI_SENSOR, 20, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor_9),
 	MUX("cilab", mux_pllp_pllc_clkm, CLK_SOURCE_CILAB, 144, 0, tegra_clk_cilab),
 	MUX("cilcd", mux_pllp_pllc_clkm, CLK_SOURCE_CILCD, 145, 0, tegra_clk_cilcd),
 	MUX("cile", mux_pllp_pllc_clkm, CLK_SOURCE_CILE, 146, 0, tegra_clk_cile),
@@ -466,10 +683,13 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("ndflash", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash),
 	MUX("ndspeed", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NDSPEED, 80, TEGRA_PERIPH_ON_APB, tegra_clk_ndspeed),
 	MUX("sata_oob", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SATA_OOB, 123, TEGRA_PERIPH_ON_APB, tegra_clk_sata_oob),
+	MUX("sata_oob", mux_pllp_pllc_clkm, CLK_SOURCE_SATA_OOB, 123, TEGRA_PERIPH_ON_APB, tegra_clk_sata_oob_8),
 	MUX("sata", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SATA, 124, TEGRA_PERIPH_ON_APB, tegra_clk_sata),
+	MUX("sata", mux_pllp_pllc_clkm, CLK_SOURCE_SATA, 124, TEGRA_PERIPH_ON_APB, tegra_clk_sata_8),
 	MUX("adx1", mux_plla_pllc_pllp_clkm, CLK_SOURCE_ADX1, 180, TEGRA_PERIPH_ON_APB, tegra_clk_adx1),
 	MUX("amx1", mux_plla_pllc_pllp_clkm, CLK_SOURCE_AMX1, 185, TEGRA_PERIPH_ON_APB, tegra_clk_amx1),
 	MUX("vi_sensor2", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR2, 165, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor2),
+	MUX("vi_sensor2", mux_pllc_pllp_plla, CLK_SOURCE_VI_SENSOR2, 165, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor2_8),
 	MUX8("sdmmc1", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1_8),
 	MUX8("sdmmc2", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SDMMC2, 9, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc2_8),
 	MUX8("sdmmc3", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3_8),
@@ -480,6 +700,10 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("sbc4", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SBC4, 68, TEGRA_PERIPH_ON_APB, tegra_clk_sbc4_8),
 	MUX8("sbc5", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SBC5, 104, TEGRA_PERIPH_ON_APB, tegra_clk_sbc5_8),
 	MUX8("sbc6", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SBC6, 105, TEGRA_PERIPH_ON_APB, tegra_clk_sbc6_8),
+	MUX("sbc1", mux_pllp_pllc_clkm, CLK_SOURCE_SBC1, 41, TEGRA_PERIPH_ON_APB, tegra_clk_sbc1_9),
+	MUX("sbc2", mux_pllp_pllc_clkm, CLK_SOURCE_SBC2, 44, TEGRA_PERIPH_ON_APB, tegra_clk_sbc2_9),
+	MUX("sbc3", mux_pllp_pllc_clkm, CLK_SOURCE_SBC3, 46, TEGRA_PERIPH_ON_APB, tegra_clk_sbc3_9),
+	MUX("sbc4", mux_pllp_pllc_clkm, CLK_SOURCE_SBC4, 68, TEGRA_PERIPH_ON_APB, tegra_clk_sbc4_9),
 	MUX8("ndflash", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash_8),
 	MUX8("ndspeed", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDSPEED, 80, TEGRA_PERIPH_ON_APB, tegra_clk_ndspeed_8),
 	MUX8("hdmi", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_HDMI, 51, 0, tegra_clk_hdmi),
@@ -487,27 +711,57 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("extern2", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN2, 121, 0, tegra_clk_extern2),
 	MUX8("extern3", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN3, 122, 0, tegra_clk_extern3),
 	MUX8("soc_therm", mux_pllm_pllc_pllp_plla, CLK_SOURCE_SOC_THERM, 78, TEGRA_PERIPH_ON_APB, tegra_clk_soc_therm),
+	MUX8("soc_therm", mux_clkm_pllc_pllp_plla, CLK_SOURCE_SOC_THERM, 78, TEGRA_PERIPH_ON_APB, tegra_clk_soc_therm_8),
 	MUX8("vi_sensor", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR, 164, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor_8),
 	MUX8("isp", mux_pllm_pllc_pllp_plla_clkm_pllc4, CLK_SOURCE_ISP, 23, TEGRA_PERIPH_ON_APB, tegra_clk_isp_8),
+	MUX8("isp", mux_pllc_pllp_plla1_pllc2_c3_clkm_pllc4, CLK_SOURCE_ISP, 23, TEGRA_PERIPH_ON_APB, tegra_clk_isp_9),
 	MUX8("entropy", mux_pllp_clkm1, CLK_SOURCE_ENTROPY, 149,  0, tegra_clk_entropy),
+	MUX8("entropy", mux_pllp_clkm_clk32_plle, CLK_SOURCE_ENTROPY, 149,  0, tegra_clk_entropy_8),
 	MUX8("hdmi_audio", mux_pllp3_pllc_clkm, CLK_SOURCE_HDMI_AUDIO, 176, TEGRA_PERIPH_NO_RESET, tegra_clk_hdmi_audio),
 	MUX8("clk72mhz", mux_pllp3_pllc_clkm, CLK_SOURCE_CLK72MHZ, 177, TEGRA_PERIPH_NO_RESET, tegra_clk_clk72Mhz),
+	MUX8("clk72mhz", mux_pllp_out3_pllp_pllc_clkm, CLK_SOURCE_CLK72MHZ, 177, TEGRA_PERIPH_NO_RESET, tegra_clk_clk72Mhz_8),
 	MUX8_NOGATE_LOCK("sor0_lvds", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_lvds, &sor0_lock),
 	MUX_FLAGS("csite", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite, CLK_IGNORE_UNUSED),
+	MUX_FLAGS("csite", mux_pllp_pllre_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite_8, CLK_IGNORE_UNUSED),
 	NODIV("disp1", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1, NULL),
+	NODIV("disp1", mux_pllp_plld_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1_8, NULL),
 	NODIV("disp2", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2, NULL),
+	NODIV("disp2", mux_pllp_plld_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2_8, NULL),
 	NODIV("sor0", mux_clkm_plldp_sor0lvds, CLK_SOURCE_SOR0, 14, 3, 182, 0, tegra_clk_sor0, &sor0_lock),
 	UART("uarta", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTA, 6, tegra_clk_uarta),
 	UART("uartb", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTB, 7, tegra_clk_uartb),
 	UART("uartc", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTC, 55, tegra_clk_uartc),
 	UART("uartd", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTD, 65, tegra_clk_uartd),
 	UART("uarte", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTE, 66, tegra_clk_uarte),
+	UART8("uarta", mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2, CLK_SOURCE_UARTA, 6, tegra_clk_uarta_8),
+	UART8("uartb", mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2, CLK_SOURCE_UARTB, 7, tegra_clk_uartb_8),
+	UART8("uartc", mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2, CLK_SOURCE_UARTC, 55, tegra_clk_uartc_8),
+	UART8("uartd", mux_pllp_pllc_pllc4_out0_pllc4_out1_clkm_pllc4_out2, CLK_SOURCE_UARTD, 65, tegra_clk_uartd_8),
 	XUSB("xusb_host_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_HOST_SRC, 143, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_host_src),
+	XUSB("xusb_host_src", mux_clkm_pllp_pllre, CLK_SOURCE_XUSB_HOST_SRC, 143, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_host_src_8),
 	XUSB("xusb_falcon_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_FALCON_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_falcon_src),
+	XUSB("xusb_falcon_src", mux_clkm_pllp_pllre, CLK_SOURCE_XUSB_FALCON_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_falcon_src_8),
 	XUSB("xusb_fs_src", mux_clkm_48M_pllp_480M, CLK_SOURCE_XUSB_FS_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_fs_src),
 	XUSB("xusb_ss_src", mux_clkm_pllre_clk32_480M_pllc_ref, CLK_SOURCE_XUSB_SS_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_ss_src),
+	XUSB("xusb_ss_src", mux_clkm_pllre_clk32_480M, CLK_SOURCE_XUSB_SS_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_ss_src_8),
 	NODIV("xusb_hs_src", mux_ss_60M, CLK_SOURCE_XUSB_SS_SRC, 25, MASK(1), 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_hs_src, NULL),
 	XUSB("xusb_dev_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_DEV_SRC, 95, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_dev_src),
+	XUSB("xusb_dev_src", mux_clkm_pllp_pllre, CLK_SOURCE_XUSB_DEV_SRC, 95, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_dev_src_8),
+	MUX8("dbgapb", mux_pllp_clkm_2, CLK_SOURCE_DBGAPB, 185, TEGRA_PERIPH_NO_RESET, tegra_clk_dbgapb),
+	MUX8("msenc", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVENC, 219, 0, tegra_clk_nvenc),
+	MUX8("nvdec", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVDEC, 194, 0, tegra_clk_nvdec),
+	MUX8("nvjpg", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVJPG, 195, 0, tegra_clk_nvjpg),
+	MUX8("ape", mux_plla_pllc4_out0_pllc_pllc4_out1_pllp_pllc4_out2_clkm, CLK_SOURCE_APE, 198, TEGRA_PERIPH_ON_APB, tegra_clk_ape),
+	MUX8_NOGATE_LOCK("sor1_src", mux_pllp_plld_plld2_clkm, CLK_SOURCE_SOR1, tegra_clk_sor1_src, &sor1_lock),
+	NODIV("sor1_brick", mux_plldp_sor1_src, CLK_SOURCE_SOR1, 14, MASK(1), 183, 0, tegra_clk_sor1_brick, &sor1_lock),
+	NODIV("sor1", mux_clkm_sor1_brick_sor1_src, CLK_SOURCE_SOR1, 15, MASK(1), 183, 0, tegra_clk_sor1, &sor1_lock),
+	MUX8("sdmmc_legacy", mux_pllp_out3_clkm_pllp_pllc4, CLK_SOURCE_SDMMC_LEGACY, 193, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_sdmmc_legacy),
+	MUX8("qspi", mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_QSPI, 211, TEGRA_PERIPH_ON_APB, tegra_clk_qspi),
+	MUX("vii2c", mux_pllp_pllc_clkm, CLK_SOURCE_VI_I2C, 208, TEGRA_PERIPH_ON_APB, tegra_clk_vi_i2c),
+	MUX("mipibif", mux_pllp_clkm, CLK_SOURCE_MIPIBIF, 173, TEGRA_PERIPH_ON_APB, tegra_clk_mipibif),
+	MUX("uartape", mux_pllp_pllc_clkm, CLK_SOURCE_UARTAPE, 212, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_uartape),
+	MUX8("tsecb", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_TSECB, 206, 0, tegra_clk_tsecb),
+	MUX8("maud", mux_pllp_pllp_out3_clkm_clk32k_plla, CLK_SOURCE_MAUD, 202, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_maud),
 };
 
 static struct tegra_periph_init_data gate_clks[] = {
@@ -544,6 +798,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("pcie", "clk_m", 70, 0, tegra_clk_pcie, 0),
 	GATE("dpaux", "clk_m", 181, 0, tegra_clk_dpaux, 0),
 	GATE("gpu", "pll_ref", 184, 0, tegra_clk_gpu, 0),
+	GATE("pllg_ref", "pll_ref", 189, 0, tegra_clk_pll_g_ref, 0),
 };
 
 struct pll_out_data {
-- 
1.7.9.5
