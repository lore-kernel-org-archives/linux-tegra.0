From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 04/11] clk: tegra30: Mark certain clks as critical
Date: Fri, 27 May 2016 16:38:07 -0400
Message-ID: <1464381494-27096-5-git-send-email-rklein@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Mark the required clks as critical so the core will enable them during
registration and therefore they will stay on.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra30.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 9396f4930da7..fc91460ab892 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -948,8 +948,8 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLM */
 	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, pmc_base,
-			    CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
-			    &pll_m_params, NULL);
+			    CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE |
+			    CLK_IS_CRITICAL, &pll_m_params, NULL);
 	clks[TEGRA30_CLK_PLL_M] = clk;
 
 	/* PLLM_OUT1 */
@@ -1104,7 +1104,8 @@ static void __init tegra30_super_clk_init(void)
 
 	/* twd */
 	clk = clk_register_fixed_factor(NULL, "twd", "cclk_g",
-					CLK_SET_RATE_PARENT, 1, 2);
+					CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+					1, 2);
 	clks[TEGRA30_CLK_TWD] = clk;
 
 	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra30_clks, NULL);
@@ -1164,11 +1165,12 @@ static void __init tegra30_periph_clk_init(void)
 	/* emc */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
-			       CLK_SET_RATE_NO_REPARENT,
+			       CLK_SET_RATE_NO_REPARENT | CLK_IS_CRITICAL,
 			       clk_base + CLK_SOURCE_EMC,
 			       30, 2, 0, &emc_lock);
-	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base, 0,
-				    57, periph_clk_enb_refcnt);
+	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base,
+				    CLK_IS_CRITICAL, 57,
+				    periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_EMC] = clk;
 
 	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-- 
1.9.1
