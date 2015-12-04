From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] clk: tegra-super: Fix sparse warnings for functions not declared as static
Date: Fri, 4 Dec 2015 17:04:25 +0000
Message-ID: <1449248665-22343-3-git-send-email-jonathanh@nvidia.com>
References: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Sparse reports the following warnings for structures and functions that
should be declared static:

drivers/clk/tegra/clk-tegra-super-gen4.c:70:35: warning: symbol
 'tegra_super_gen_info_gen4' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra-super-gen4.c:96:35: warning: symbol
 'tegra_super_gen_info_gen5' was not declared. Should it be static?
drivers/clk/tegra/clk-tegra-super-gen4.c:174:13: warning: symbol
 'tegra_super_clk_init' was not declared. Should it be static?

Fix this by making the above static.

Fixes: 88467d220119 ("clk: tegra: Add Super Gen5 Logic")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-super-gen4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index 4559a20e3af6..474de0f0c26d 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -67,7 +67,7 @@ static const char *cclk_lp_parents[] = { "clk_m", "pll_c", "clk_32k", "pll_m",
 					 "pll_p", "pll_p_out4", "unused",
 					 "unused", "pll_x", "pll_x_out0" };
 
-const struct tegra_super_gen_info tegra_super_gen_info_gen4 = {
+static const struct tegra_super_gen_info tegra_super_gen_info_gen4 = {
 	.gen = gen4,
 	.sclk_parents = sclk_parents,
 	.cclk_g_parents = cclk_g_parents,
@@ -93,7 +93,7 @@ static const char *cclk_lp_parents_gen5[] = { "clk_m", "unused", "clk_32k", "unu
 					"unused", "unused", "unused", "unused",
 					"dfllCPU_out" };
 
-const struct tegra_super_gen_info tegra_super_gen_info_gen5 = {
+static const struct tegra_super_gen_info tegra_super_gen_info_gen5 = {
 	.gen = gen5,
 	.sclk_parents = sclk_parents_gen5,
 	.cclk_g_parents = cclk_g_parents_gen5,
@@ -171,7 +171,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 	*dt_clk = clk;
 }
 
-void __init tegra_super_clk_init(void __iomem *clk_base,
+static void __init tegra_super_clk_init(void __iomem *clk_base,
 				void __iomem *pmc_base,
 				struct tegra_clk *tegra_clks,
 				struct tegra_clk_pll_params *params,
-- 
2.1.4

