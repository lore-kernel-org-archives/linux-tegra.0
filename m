From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 6/8] clk: tegra20: Turn EMC clock gate into divider
Date: Sun, 21 Oct 2018 21:30:50 +0300
Message-ID: <20181021183052.32023-7-digetx@gmail.com>
References: <20181021183052.32023-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181021183052.32023-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Kernel should never gate the EMC clock as it causes immediate lockup, so
removing clk-gate functionality doesn't affect anything. Turning EMC clk
gate into divider allows to implement glitch-less EMC scaling, avoiding
reparenting to a backup clock.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/tegra/clk-tegra20.c | 36 ++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index cfde3745a0db..d3df56b6f2d1 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -584,7 +584,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_afi] = { .dt_id = TEGRA20_CLK_AFI, .present = true },
 	[tegra_clk_fuse] = { .dt_id = TEGRA20_CLK_FUSE, .present = true },
 	[tegra_clk_kfuse] = { .dt_id = TEGRA20_CLK_KFUSE, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA20_CLK_EMC, .present = true },
 };
 
 static unsigned long tegra20_clk_measure_input_freq(void)
@@ -805,6 +804,31 @@ static struct tegra_periph_init_data tegra_periph_nodiv_clk_list[] = {
 	TEGRA_INIT_DATA_NODIV("disp2",	mux_pllpdc_clkm, CLK_SOURCE_DISP2, 30, 2, 26,  0, TEGRA20_CLK_DISP2),
 };
 
+static void __init tegra20_emc_clk_init(void)
+{
+	struct clk *clk;
+
+	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
+			       ARRAY_SIZE(mux_pllmcp_clkm),
+			       CLK_SET_RATE_NO_REPARENT,
+			       clk_base + CLK_SOURCE_EMC,
+			       30, 2, 0, &emc_lock);
+
+	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
+				    &emc_lock);
+	clks[TEGRA20_CLK_MC] = clk;
+
+	/*
+	 * Note that 'emc_mux' source and 'emc' rate shouldn't be changed at
+	 * the same time due to a HW bug, this won't happen because we're
+	 * defining 'emc_mux' and 'emc' as distinct clocks.
+	 */
+	clk = tegra_clk_register_divider("emc", "emc_mux",
+				clk_base + CLK_SOURCE_EMC, CLK_IS_CRITICAL,
+				TEGRA_DIVIDER_INT, 0, 8, 1, &emc_lock);
+	clks[TEGRA20_CLK_EMC] = clk;
+}
+
 static void __init tegra20_periph_clk_init(void)
 {
 	struct tegra_periph_init_data *data;
@@ -818,15 +842,7 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_AC97] = clk;
 
 	/* emc */
-	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm),
-			       CLK_SET_RATE_NO_REPARENT,
-			       clk_base + CLK_SOURCE_EMC,
-			       30, 2, 0, &emc_lock);
-
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
-	clks[TEGRA20_CLK_MC] = clk;
+	tegra20_emc_clk_init();
 
 	/* dsi */
 	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-- 
2.19.0
