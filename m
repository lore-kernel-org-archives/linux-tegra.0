From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/4] clk: tegra20: Turn EMC clock gate into divider
Date: Wed, 30 May 2018 18:06:45 +0300
Message-ID: <20180530150646.19030-4-digetx@gmail.com>
References: <20180530150646.19030-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530150646.19030-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Kernel should never gate the EMC clock as it causes immediate lockup, so
removing clk-gate functionality doesn't affect anything. Turning EMC clk
gate into divider allows to implement glitch-less EMC scaling, avoiding
reparenting to a backup clock.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 39 ++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index cc857d4d4a86..189dbc86ab71 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -578,7 +578,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_afi] = { .dt_id = TEGRA20_CLK_AFI, .present = true },
 	[tegra_clk_fuse] = { .dt_id = TEGRA20_CLK_FUSE, .present = true },
 	[tegra_clk_kfuse] = { .dt_id = TEGRA20_CLK_KFUSE, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA20_CLK_EMC, .present = true },
 };
 
 static unsigned long tegra20_clk_measure_input_freq(void)
@@ -799,19 +798,18 @@ static struct tegra_periph_init_data tegra_periph_nodiv_clk_list[] = {
 	TEGRA_INIT_DATA_NODIV("disp2",	mux_pllpdc_clkm, CLK_SOURCE_DISP2, 30, 2, 26,  0, TEGRA20_CLK_DISP2),
 };
 
-static void __init tegra20_periph_clk_init(void)
+static void __init tegra20_emc_clk_init(void)
 {
-	struct tegra_periph_init_data *data;
+	u32 emc_reg = readl_relaxed(clk_base + CLK_SOURCE_EMC);
+	u32 use_pllm_ud = BIT(29);
 	struct clk *clk;
-	unsigned int i;
 
-	/* ac97 */
-	clk = tegra_clk_register_periph_gate("ac97", "pll_a_out0",
-				    TEGRA_PERIPH_ON_APB,
-				    clk_base, 0, 3, periph_clk_enb_refcnt);
-	clks[TEGRA20_CLK_AC97] = clk;
+	if (emc_reg & use_pllm_ud) {
+		pr_err("%s: un-divided PllM_out0 used as clock source\n",
+		       __func__);
+		return;
+	}
 
-	/* emc */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
 			       CLK_SET_RATE_NO_REPARENT,
@@ -822,6 +820,27 @@ static void __init tegra20_periph_clk_init(void)
 				    &emc_lock);
 	clks[TEGRA20_CLK_MC] = clk;
 
+	clk = clk_register_divider(NULL, "emc", "emc_mux", CLK_IS_CRITICAL,
+				   clk_base + CLK_SOURCE_EMC, 0, 7,
+				   0, &emc_lock);
+	clks[TEGRA20_CLK_EMC] = clk;
+}
+
+static void __init tegra20_periph_clk_init(void)
+{
+	struct tegra_periph_init_data *data;
+	struct clk *clk;
+	unsigned int i;
+
+	/* ac97 */
+	clk = tegra_clk_register_periph_gate("ac97", "pll_a_out0",
+				    TEGRA_PERIPH_ON_APB,
+				    clk_base, 0, 3, periph_clk_enb_refcnt);
+	clks[TEGRA20_CLK_AC97] = clk;
+
+	/* emc */
+	tegra20_emc_clk_init();
+
 	/* dsi */
 	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
 				    48, periph_clk_enb_refcnt);
-- 
2.17.0
