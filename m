From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v3 4/4] clk: tegra: make sdmmc2 and sdmmc4 as sdmmc clocks
Date: Mon, 9 Jul 2018 15:17:40 +0300
Message-ID: <1531138660-9071-4-git-send-email-avienamo@nvidia.com>
References: <1531138660-9071-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531138660-9071-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Aapo Vienamo <avienamo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Peter De-Schrijver <pdeschrijver@nvidia.com>

These clocks have low jitter paths to certain parents. To model these
correctly, use the sdmmc mux divider clock type.

Signed-off-by: Peter De-Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-id.h           |  2 --
 drivers/clk/tegra/clk-tegra-periph.c | 11 -----------
 drivers/clk/tegra/clk-tegra210.c     | 14 ++++++++++++--
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/tegra/clk-id.h b/drivers/clk/tegra/clk-id.h
index b616e33..de466b4 100644
--- a/drivers/clk/tegra/clk-id.h
+++ b/drivers/clk/tegra/clk-id.h
@@ -227,13 +227,11 @@ enum clk_id {
 	tegra_clk_sdmmc1_9,
 	tegra_clk_sdmmc2,
 	tegra_clk_sdmmc2_8,
-	tegra_clk_sdmmc2_9,
 	tegra_clk_sdmmc3,
 	tegra_clk_sdmmc3_8,
 	tegra_clk_sdmmc3_9,
 	tegra_clk_sdmmc4,
 	tegra_clk_sdmmc4_8,
-	tegra_clk_sdmmc4_9,
 	tegra_clk_se,
 	tegra_clk_soc_therm,
 	tegra_clk_soc_therm_8,
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 2acba29..38c4eb2 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -451,15 +451,6 @@ static u32 mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0_idx[] = {
 	[0] = 0, [1] = 3, [2] = 4, [3] = 6, [4] = 7,
 };
 
-static const char *mux_pllp_clkm_pllc4_out2_out1_out0_lj[] = {
-	"pll_p",
-	"pll_c4_out2", "pll_c4_out0",	/* LJ input */
-	"pll_c4_out2", "pll_c4_out1",
-	"pll_c4_out1",			/* LJ input */
-	"clk_m", "pll_c4_out0"
-};
-#define mux_pllp_clkm_pllc4_out2_out1_out0_lj_idx NULL
-
 static const char *mux_pllp_pllc2_c_c3_clkm[] = {
 	"pll_p", "pll_c2", "pll_c", "pll_c3", "clk_m"
 };
@@ -686,9 +677,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("sdmmc3", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3),
 	MUX("sdmmc4", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC4, 15, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc4),
 	MUX8("sdmmc1", mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1_9),
-	MUX8("sdmmc2", mux_pllp_clkm_pllc4_out2_out1_out0_lj, CLK_SOURCE_SDMMC2, 9, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc2_9),
 	MUX8("sdmmc3", mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3_9),
-	MUX8("sdmmc4", mux_pllp_clkm_pllc4_out2_out1_out0_lj, CLK_SOURCE_SDMMC4, 15, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc4_9),
 	MUX("la", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_LA, 76, TEGRA_PERIPH_ON_APB, tegra_clk_la),
 	MUX("trace", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_TRACE, 77, TEGRA_PERIPH_ON_APB, tegra_clk_trace),
 	MUX("owr", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_OWR, 71, TEGRA_PERIPH_ON_APB, tegra_clk_owr),
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 5435d01..9eb1cb1 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -44,6 +44,8 @@
 #define CLK_SOURCE_EMC 0x19c
 #define CLK_SOURCE_SOR1 0x410
 #define CLK_SOURCE_LA 0x1f8
+#define CLK_SOURCE_SDMMC2 0x154
+#define CLK_SOURCE_SDMMC4 0x164
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -2286,11 +2288,9 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA210_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA210_CLK_TIMER, .present = true },
 	[tegra_clk_uarta_8] = { .dt_id = TEGRA210_CLK_UARTA, .present = true },
-	[tegra_clk_sdmmc2_9] = { .dt_id = TEGRA210_CLK_SDMMC2, .present = true },
 	[tegra_clk_i2s1] = { .dt_id = TEGRA210_CLK_I2S1, .present = true },
 	[tegra_clk_i2c1] = { .dt_id = TEGRA210_CLK_I2C1, .present = true },
 	[tegra_clk_sdmmc1_9] = { .dt_id = TEGRA210_CLK_SDMMC1, .present = true },
-	[tegra_clk_sdmmc4_9] = { .dt_id = TEGRA210_CLK_SDMMC4, .present = true },
 	[tegra_clk_pwm] = { .dt_id = TEGRA210_CLK_PWM, .present = true },
 	[tegra_clk_i2s2] = { .dt_id = TEGRA210_CLK_I2S2, .present = true },
 	[tegra_clk_usbd] = { .dt_id = TEGRA210_CLK_USBD, .present = true },
@@ -3030,6 +3030,16 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 				0, NULL);
 	clks[TEGRA210_CLK_ACLK] = clk;
 
+	clk = tegra_clk_register_sdmmc_mux_div("sdmmc2", clk_base,
+					    CLK_SOURCE_SDMMC2, 9,
+					    TEGRA_DIVIDER_ROUND_UP, 0, NULL);
+	clks[TEGRA210_CLK_SDMMC2] = clk;
+
+	clk = tegra_clk_register_sdmmc_mux_div("sdmmc4", clk_base,
+					    CLK_SOURCE_SDMMC4, 15,
+					    TEGRA_DIVIDER_ROUND_UP, 0, NULL);
+	clks[TEGRA210_CLK_SDMMC4] = clk;
+
 	for (i = 0; i < ARRAY_SIZE(tegra210_periph); i++) {
 		struct tegra_periph_init_data *init = &tegra210_periph[i];
 		struct clk **clkp;
-- 
2.7.4
