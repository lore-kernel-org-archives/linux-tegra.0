From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: No 7.1 super clk dividers on Tegra20
Date: Fri, 8 Feb 2013 14:44:09 +0200
Message-ID: <1360327453-29242-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Unlike Tegra30, Tegra20 does not have a 7.1 divider for the CPU superclk.
Remove the clocks related to the divider.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra20.c |   36 ++----------------------------------
 1 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 4612b2e..90ae8f3 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -711,8 +711,8 @@ static void tegra20_pll_init(void)
 }
 
 static const char *cclk_parents[] = { "clk_m", "pll_c", "clk_32k", "pll_m",
-				      "pll_p_cclk", "pll_p_out4_cclk",
-				      "pll_p_out3_cclk", "clk_d", "pll_x" };
+				      "pll_p", "pll_p_out4",
+				      "pll_p_out3", "clk_d", "pll_x" };
 static const char *sclk_parents[] = { "clk_m", "pll_c_out1", "pll_p_out4",
 				      "pll_p_out3", "pll_p_out2", "clk_d",
 				      "clk_32k", "pll_m_out1" };
@@ -721,38 +721,6 @@ static void tegra20_super_clk_init(void)
 {
 	struct clk *clk;
 
-	/*
-	 * DIV_U71 dividers for CCLK, these dividers are used only
-	 * if parent clock is fixed rate.
-	 */
-
-	/*
-	 * Clock input to cclk divided from pll_p using
-	 * U71 divider of cclk.
-	 */
-	clk = tegra_clk_register_divider("pll_p_cclk", "pll_p",
-				clk_base + SUPER_CCLK_DIVIDER, 0,
-				TEGRA_DIVIDER_INT, 16, 8, 1, NULL);
-	clk_register_clkdev(clk, "pll_p_cclk", NULL);
-
-	/*
-	 * Clock input to cclk divided from pll_p_out3 using
-	 * U71 divider of cclk.
-	 */
-	clk = tegra_clk_register_divider("pll_p_out3_cclk", "pll_p_out3",
-				clk_base + SUPER_CCLK_DIVIDER, 0,
-				TEGRA_DIVIDER_INT, 16, 8, 1, NULL);
-	clk_register_clkdev(clk, "pll_p_out3_cclk", NULL);
-
-	/*
-	 * Clock input to cclk divided from pll_p_out4 using
-	 * U71 divider of cclk.
-	 */
-	clk = tegra_clk_register_divider("pll_p_out4_cclk", "pll_p_out4",
-				clk_base + SUPER_CCLK_DIVIDER, 0,
-				TEGRA_DIVIDER_INT, 16, 8, 1, NULL);
-	clk_register_clkdev(clk, "pll_p_out4_cclk", NULL);
-
 	/* CCLK */
 	clk = tegra_clk_register_super_mux("cclk", cclk_parents,
 			      ARRAY_SIZE(cclk_parents), CLK_SET_RATE_PARENT,
-- 
1.7.7.rc0.72.g4b5ea.dirty
