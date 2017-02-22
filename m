From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 4/7] clk: tegra: remove non-existing pll_m_out1 clock
Date: Wed, 22 Feb 2017 17:13:59 +0200
Message-ID: <1487776444-4701-5-git-send-email-pdeschrijver@nvidia.com>
References: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 7bda8ba..b7ef8a7 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2115,7 +2115,6 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	[tegra_clk_pll_c2] = { .dt_id = TEGRA210_CLK_PLL_C2, .present = true },
 	[tegra_clk_pll_c3] = { .dt_id = TEGRA210_CLK_PLL_C3, .present = true },
 	[tegra_clk_pll_m] = { .dt_id = TEGRA210_CLK_PLL_M, .present = true },
-	[tegra_clk_pll_m_out1] = { .dt_id = TEGRA210_CLK_PLL_M_OUT1, .present = true },
 	[tegra_clk_pll_p] = { .dt_id = TEGRA210_CLK_PLL_P, .present = true },
 	[tegra_clk_pll_p_out1] = { .dt_id = TEGRA210_CLK_PLL_P_OUT1, .present = true },
 	[tegra_clk_pll_p_out3] = { .dt_id = TEGRA210_CLK_PLL_P_OUT3, .present = true },
@@ -2229,7 +2228,6 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	{ .con_id = "pll_p_out3", .dt_id = TEGRA210_CLK_PLL_P_OUT3 },
 	{ .con_id = "pll_p_out4", .dt_id = TEGRA210_CLK_PLL_P_OUT4 },
 	{ .con_id = "pll_m", .dt_id = TEGRA210_CLK_PLL_M },
-	{ .con_id = "pll_m_out1", .dt_id = TEGRA210_CLK_PLL_M_OUT1 },
 	{ .con_id = "pll_x", .dt_id = TEGRA210_CLK_PLL_X },
 	{ .con_id = "pll_x_out0", .dt_id = TEGRA210_CLK_PLL_X_OUT0 },
 	{ .con_id = "pll_u", .dt_id = TEGRA210_CLK_PLL_U },
@@ -2404,9 +2402,6 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clk_register_clkdev(clk, "pll_mb", NULL);
 	clks[TEGRA210_CLK_PLL_MB] = clk;
 
-	clk_register_clkdev(clk, "pll_m_out1", NULL);
-	clks[TEGRA210_CLK_PLL_M_OUT1] = clk;
-
 	/* PLLM_UD */
 	clk = clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
 					CLK_SET_RATE_PARENT, 1, 1);
-- 
1.9.1
