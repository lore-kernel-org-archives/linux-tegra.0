From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] clk: tegra: Fix sor1_out clock implementation
Date: Fri,  1 Sep 2017 16:53:43 +0200
Message-ID: <20170901145343.19890-4-thierry.reding@gmail.com>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901145343.19890-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This clock was previously called sor1_src and was modelled as an input
to the sor1 module clock. However, it's really an output clock that can
be fed either from the safe, the sor1_pad_clkout or the sor1 module
clocks. sor1 itself can take input from either of the display PLLs.

The same implementation for the sor1_out clock is used on Tegra186, so
this nicely lines up both SoC generations to deal with this clock in a
uniform way.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-periph.c | 16 ------------
 drivers/clk/tegra/clk-tegra210.c     | 47 ++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 090a5d792341..c7694205573f 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -129,7 +129,6 @@
 #define CLK_SOURCE_NVDEC 0x698
 #define CLK_SOURCE_NVJPG 0x69c
 #define CLK_SOURCE_APE 0x6c0
-#define CLK_SOURCE_SOR1 0x410
 #define CLK_SOURCE_SDMMC_LEGACY 0x694
 #define CLK_SOURCE_QSPI 0x6c4
 #define CLK_SOURCE_VI_I2C 0x6c8
@@ -278,7 +277,6 @@ static DEFINE_SPINLOCK(PLLP_OUTA_lock);
 static DEFINE_SPINLOCK(PLLP_OUTB_lock);
 static DEFINE_SPINLOCK(PLLP_OUTC_lock);
 static DEFINE_SPINLOCK(sor0_lock);
-static DEFINE_SPINLOCK(sor1_lock);
 
 #define MUX_I2S_SPDIF(_id)						\
 static const char *mux_pllaout0_##_id##_2x_pllp_clkm[] = { "pll_a_out0", \
@@ -604,18 +602,6 @@ static u32 mux_pllp_plld_plld2_clkm_idx[] = {
 	[0] = 0, [1] = 2, [2] = 5, [3] = 6
 };
 
-static const char *mux_sor_safe_sor1_brick_sor1_src[] = {
-	/*
-	 * Bit 0 of the mux selects sor1_brick, irrespective of bit 1, so the
-	 * sor1_brick parent appears twice in the list below. This is merely
-	 * to support clk_get_parent() if firmware happened to set these bits
-	 * to 0b11. While not an invalid setting, code should always set the
-	 * bits to 0b01 to select sor1_brick.
-	 */
-	"sor_safe", "sor1_brick", "sor1_src", "sor1_brick"
-};
-#define mux_sor_safe_sor1_brick_sor1_src_idx NULL
-
 static const char *mux_pllp_pllre_clkm[] = {
 	"pll_p", "pll_re_out1", "clk_m"
 };
@@ -804,8 +790,6 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("nvdec", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVDEC, 194, 0, tegra_clk_nvdec),
 	MUX8("nvjpg", mux_pllc2_c_c3_pllp_plla1_clkm, CLK_SOURCE_NVJPG, 195, 0, tegra_clk_nvjpg),
 	MUX8("ape", mux_plla_pllc4_out0_pllc_pllc4_out1_pllp_pllc4_out2_clkm, CLK_SOURCE_APE, 198, TEGRA_PERIPH_ON_APB, tegra_clk_ape),
-	MUX8_NOGATE_LOCK("sor1_src", mux_pllp_plld_plld2_clkm, CLK_SOURCE_SOR1, tegra_clk_sor1_src, &sor1_lock),
-	NODIV("sor1", mux_sor_safe_sor1_brick_sor1_src, CLK_SOURCE_SOR1, 14, MASK(2), 183, 0, tegra_clk_sor1, &sor1_lock),
 	MUX8("sdmmc_legacy", mux_pllp_out3_clkm_pllp_pllc4, CLK_SOURCE_SDMMC_LEGACY, 193, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_sdmmc_legacy),
 	MUX8("qspi", mux_pllp_pllc_pllc_out1_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_QSPI, 211, TEGRA_PERIPH_ON_APB, tegra_clk_qspi),
 	I2C("vii2c", mux_pllp_pllc_clkm, CLK_SOURCE_VI_I2C, 208, tegra_clk_vi_i2c),
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 6d7a613f2656..be7b736371f6 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -40,6 +40,7 @@
 
 #define CLK_SOURCE_CSITE 0x1d4
 #define CLK_SOURCE_EMC 0x19c
+#define CLK_SOURCE_SOR1 0x410
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -264,6 +265,7 @@ static DEFINE_SPINLOCK(pll_d_lock);
 static DEFINE_SPINLOCK(pll_e_lock);
 static DEFINE_SPINLOCK(pll_re_lock);
 static DEFINE_SPINLOCK(pll_u_lock);
+static DEFINE_SPINLOCK(sor1_lock);
 static DEFINE_SPINLOCK(emc_lock);
 
 /* possible OSC frequencies in Hz */
@@ -2628,10 +2630,35 @@ static int tegra210_init_pllu(void)
 	return 0;
 }
 
+static const char * const sor1_out_parents[] = {
+	/*
+	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
+	 * the sor1_pad_clkout parent appears twice in the list below. This is
+	 * merely to support clk_get_parent() if firmware happened to set
+	 * these bits to 0b11. While not an invalid setting, code should
+	 * always set the bits to 0b01 to select sor1_pad_clkout.
+	 */
+	"sor_safe", "sor1_pad_clkout", "sor1", "sor1_pad_clkout",
+};
+
+static const char * const sor1_parents[] = {
+	"pll_p", "pll_d_out0", "pll_d2_out0", "clk_m",
+};
+
+static u32 sor1_parents_idx[] = { 0, 2, 5, 6 };
+
+static struct tegra_periph_init_data tegra210_periph[] = {
+	TEGRA_INIT_DATA_TABLE("sor1", NULL, NULL, sor1_parents,
+			      CLK_SOURCE_SOR1, 29, 0x7, 0, 0, 8, 1,
+			      TEGRA_DIVIDER_ROUND_UP, 183, 0, tegra_clk_sor1,
+			      sor1_parents_idx, 0, &sor1_lock),
+};
+
 static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
 	struct clk *clk;
+	unsigned int i;
 
 	/* xusb_ss_div2 */
 	clk = clk_register_fixed_factor(NULL, "xusb_ss_div2", "xusb_ss_src", 0,
@@ -2650,6 +2677,12 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					      1, 17, 207);
 	clks[TEGRA210_CLK_DPAUX1] = clk;
 
+	clk = clk_register_mux_table(NULL, "sor1_out", sor1_out_parents,
+				     ARRAY_SIZE(sor1_out_parents), 0,
+				     clk_base + CLK_SOURCE_SOR1, 14, 0x3,
+				     0, NULL, &sor1_lock);
+	clks[TEGRA210_CLK_SOR1_OUT] = clk;
+
 	/* pll_d_dsi_out */
 	clk = clk_register_gate(NULL, "pll_d_dsi_out", "pll_d_out0", 0,
 				clk_base + PLLD_MISC0, 21, 0, &pll_d_lock);
@@ -2694,6 +2727,20 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 				0, NULL);
 	clks[TEGRA210_CLK_ACLK] = clk;
 
+	for (i = 0; i < ARRAY_SIZE(tegra210_periph); i++) {
+		struct tegra_periph_init_data *init = &tegra210_periph[i];
+		struct clk **clkp;
+
+		clkp = tegra_lookup_dt_id(init->clk_id, tegra210_clks);
+		if (!clkp) {
+			pr_warn("clock %u not found\n", init->clk_id);
+			continue;
+		}
+
+		clk = tegra_clk_register_periph_data(clk_base, init);
+		*clkp = clk;
+	}
+
 	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params);
 }
 
-- 
2.13.3
