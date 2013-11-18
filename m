From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] clk: tegra: rework sor0 clock for Tegra124
Date: Mon, 18 Nov 2013 16:11:39 +0100
Message-ID: <1384787499-26994-5-git-send-email-treding@nvidia.com>
References: <1384787499-26994-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384787499-26994-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Rework the sor0 clock as 2 clocks: sor0, which comprises the 2nd level
mux and the gate and sor0_lvds which comprises the 1st level mux and the
fractional divider.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-id.h               |  1 +
 drivers/clk/tegra/clk-tegra-periph.c     | 10 +++++++++-
 drivers/clk/tegra/clk-tegra124.c         |  1 +
 include/dt-bindings/clock/tegra124-car.h |  3 ++-
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index 836b0545fd17..0273ef43ff6c 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -186,6 +186,7 @@ enum clk_id {
 	tegra_clk_se,
 	tegra_clk_soc_therm,
 	tegra_clk_sor0,
+	tegra_clk_sor0_lvds,
 	tegra_clk_spdif,
 	tegra_clk_spdif_2x,
 	tegra_clk_spdif_in,
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index d3978e734ad6..4e81df1a0f2a 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -231,6 +231,7 @@
 static DEFINE_SPINLOCK(PLLP_OUTA_lock);
 static DEFINE_SPINLOCK(PLLP_OUTB_lock);
 static DEFINE_SPINLOCK(PLLP_OUTC_lock);
+static DEFINE_SPINLOCK(sor0_lock);
 
 #define MUX_I2S_SPDIF(_id)						\
 static const char *mux_pllaout0_##_id##_2x_pllp_clkm[] = { "pll_a_out0", \
@@ -371,6 +372,12 @@ static u32 mux_pllm_pllc_pllp_plla_pllc2_c3_clkm_idx[] = {
 	[0] = 0, [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 6,
 };
 
+static const char *mux_clkm_plldp_sor0lvds[] = {
+	"clk_m", "pll_dp", "sor0_lvds",
+};
+
+#define mux_clkm_plldp_sor0lvds_idx NULL
+
 static struct tegra_periph_init_data periph_clks[] = {
 	AUDIO("d_audio", CLK_SOURCE_D_AUDIO, 106, TEGRA_PERIPH_ON_APB, tegra_clk_d_audio),
 	AUDIO("dam0", CLK_SOURCE_DAM0, 108, TEGRA_PERIPH_ON_APB, tegra_clk_dam0),
@@ -466,10 +473,11 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("entropy", mux_pllp_clkm1, CLK_SOURCE_ENTROPY, 149,  0, tegra_clk_entropy),
 	MUX8("hdmi_audio", mux_pllp3_pllc_clkm, CLK_SOURCE_HDMI_AUDIO, 176, TEGRA_PERIPH_NO_RESET, tegra_clk_hdmi_audio),
 	MUX8("clk72mhz", mux_pllp3_pllc_clkm, CLK_SOURCE_CLK72MHZ, 177, TEGRA_PERIPH_NO_RESET, tegra_clk_clk72Mhz),
-	MUX8("sor0", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, 182, 0, tegra_clk_sor0),
+	MUX8_NOGATE_LOCK("sor0_lvds", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, tegra_clk_sor0_lvds, &sor0_lock),
 	MUX_FLAGS("csite", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite, CLK_IGNORE_UNUSED),
 	NODIV("disp1", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1, NULL),
 	NODIV("disp2", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2, NULL),
+	NODIV("sor0", mux_clkm_plldp_sor0lvds, CLK_SOURCE_SOR0, 14, 3, 182, 0, tegra_clk_sor0, &sor0_lock),
 	UART("uarta", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTA, 6, tegra_clk_uarta),
 	UART("uartb", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTB, 7, tegra_clk_uartb),
 	UART("uartc", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTC, 55, tegra_clk_uartc),
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 266e80b51d38..97e1eef8c1c7 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -857,6 +857,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_adx1] = { .dt_id = TEGRA124_CLK_ADX1, .present = true },
 	[tegra_clk_dpaux] = { .dt_id = TEGRA124_CLK_DPAUX, .present = true },
 	[tegra_clk_sor0] = { .dt_id = TEGRA124_CLK_SOR0, .present = true },
+	[tegra_clk_sor0_lvds] = { .dt_id = TEGRA124_CLK_SOR0_LVDS, .present = true },
 	[tegra_clk_gpu] = { .dt_id = TEGRA124_CLK_GPU, .present = true },
 	[tegra_clk_amx1] = { .dt_id = TEGRA124_CLK_AMX1, .present = true },
 	[tegra_clk_uartb] = { .dt_id = TEGRA124_CLK_UARTB, .present = true },
diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
index 855d94d18506..a1116a3b54ef 100644
--- a/include/dt-bindings/clock/tegra124-car.h
+++ b/include/dt-bindings/clock/tegra124-car.h
@@ -335,6 +335,7 @@
 #define TEGRA124_CLK_CLK_OUT_3_MUX 308
 #define TEGRA124_CLK_DSIA_MUX 309
 #define TEGRA124_CLK_DSIB_MUX 310
-#define TEGRA124_CLK_CLK_MAX 311
+#define TEGRA124_CLK_SOR0_LVDS 311
+#define TEGRA124_CLK_CLK_MAX 312
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA124_CAR_H */
-- 
1.8.4.2
