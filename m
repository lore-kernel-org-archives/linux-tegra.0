From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] clk: tegra: Properly setup PWM clock on Tegra30
Date: Tue, 29 Oct 2013 16:51:12 +0100
Message-ID: <1383061872-27899-3-git-send-email-treding@nvidia.com>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383061872-27899-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The clock for the PWM controller is slightly different from other
peripheral clocks on Tegra30. The clock source mux field start at
bit position 28 rather than 30.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra30.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 24ce357..51c093c 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -104,6 +104,7 @@
 #define PMC_CLK_OUT_CNTRL 0x1a8
 
 #define CLK_SOURCE_SPDIF_OUT 0x108
+#define CLK_SOURCE_PWM 0x110
 #define CLK_SOURCE_D_AUDIO 0x3d0
 #define CLK_SOURCE_DAM0 0x3d8
 #define CLK_SOURCE_DAM1 0x3dc
@@ -836,7 +837,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_extern1] = { .dt_id = TEGRA30_CLK_EXTERN1, .present = true },
 	[tegra_clk_extern2] = { .dt_id = TEGRA30_CLK_EXTERN2, .present = true },
 	[tegra_clk_extern3] = { .dt_id = TEGRA30_CLK_EXTERN3, .present = true },
-	[tegra_clk_pwm] = { .dt_id = TEGRA30_CLK_PWM, .present = true },
 	[tegra_clk_disp1] = { .dt_id = TEGRA30_CLK_DISP1, .present = true },
 	[tegra_clk_disp2] = { .dt_id = TEGRA30_CLK_DISP2, .present = true },
 	[tegra_clk_apbdma] = { .dt_id = TEGRA30_CLK_APBDMA, .present = true },
@@ -1120,6 +1120,7 @@ static const char *mux_pllpmdacd2_clkm[] = { "pll_p", "pll_m", "pll_d_out0",
 					     "pll_d2_out0", "clk_m" };
 static const char *mux_plld_out0_plld2_out0[] = { "pll_d_out0",
 						  "pll_d2_out0" };
+static const char *pwm_parents[] = { "pll_p", "pll_c", "clk_32k", "clk_m" };
 
 static struct tegra_periph_init_data tegra_periph_clk_list[] = {
 	TEGRA_INIT_DATA_MUX("spdif_out", spdif_out_parents, CLK_SOURCE_SPDIF_OUT, 10, TEGRA_PERIPH_ON_APB, TEGRA30_CLK_SPDIF_OUT),
@@ -1130,6 +1131,7 @@ static struct tegra_periph_init_data tegra_periph_clk_list[] = {
 	TEGRA_INIT_DATA_INT("3d2", mux_pllmcpa, CLK_SOURCE_3D2, 98, TEGRA_PERIPH_MANUAL_RESET, TEGRA30_CLK_GR3D2),
 	TEGRA_INIT_DATA_INT("se", mux_pllpcm_clkm, CLK_SOURCE_SE, 127, 0, TEGRA30_CLK_SE),
 	TEGRA_INIT_DATA_MUX8("hdmi", mux_pllpmdacd2_clkm, CLK_SOURCE_HDMI, 51, 0, TEGRA30_CLK_HDMI),
+	TEGRA_INIT_DATA("pwm", NULL, NULL, pwm_parents, CLK_SOURCE_PWM, 28, 2, 0, 0, 8, 1, 0, 17, TEGRA_PERIPH_ON_APB, TEGRA30_CLK_PWM),
 };
 
 static struct tegra_periph_init_data tegra_periph_nodiv_clk_list[] = {
-- 
1.8.4
