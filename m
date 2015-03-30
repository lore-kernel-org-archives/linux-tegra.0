From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/11] clk: tegra: Use generic tegra_osc_clk_init() on Tegra114
Date: Mon, 30 Mar 2015 14:31:12 +0200
Message-ID: <1427718673-32011-11-git-send-email-thierry.reding@gmail.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There is no reason why Tegra114 cannot use the same generic code to set
up the oscillator, clk_m and pll_ref clocks. The only effective change
that this causes is that the CLK_SET_PARENT_RATE flag is dropped, but
since these clocks are all fixed it is not needed anyway.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra114.c | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 75d8af6213e7..8237d16b4075 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -940,36 +940,6 @@ static struct clk **clks;
 static unsigned long osc_freq;
 static unsigned long pll_ref_freq;
 
-static int __init tegra114_osc_clk_init(void __iomem *clk_base)
-{
-	struct clk *clk;
-	u32 val, pll_ref_div;
-
-	val = readl_relaxed(clk_base + OSC_CTRL);
-
-	osc_freq = tegra114_input_freq[val >> OSC_CTRL_OSC_FREQ_SHIFT];
-	if (!osc_freq) {
-		WARN_ON(1);
-		return -EINVAL;
-	}
-
-	/* clk_m */
-	clk = clk_register_fixed_rate(NULL, "clk_m", NULL, CLK_IS_ROOT,
-				      osc_freq);
-	clks[TEGRA114_CLK_CLK_M] = clk;
-
-	/* pll_ref */
-	val = (val >> OSC_CTRL_PLL_REF_DIV_SHIFT) & 3;
-	pll_ref_div = 1 << val;
-	clk = clk_register_fixed_factor(NULL, "pll_ref", "clk_m",
-					CLK_SET_RATE_PARENT, 1, pll_ref_div);
-	clks[TEGRA114_CLK_PLL_REF] = clk;
-
-	pll_ref_freq = osc_freq / pll_ref_div;
-
-	return 0;
-}
-
 static void __init tegra114_fixed_clk_init(void __iomem *clk_base)
 {
 	struct clk *clk;
@@ -1505,7 +1475,9 @@ static void __init tegra114_clock_init(struct device_node *np)
 	if (!clks)
 		return;
 
-	if (tegra114_osc_clk_init(clk_base) < 0)
+	if (tegra_osc_clk_init(clk_base, tegra114_clks, tegra114_input_freq,
+			       ARRAY_SIZE(tegra114_input_freq), 1, &osc_freq,
+			       &pll_ref_freq) < 0)
 		return;
 
 	tegra114_fixed_clk_init(clk_base);
-- 
2.3.2
