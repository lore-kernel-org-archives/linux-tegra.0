From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/11] clk: tegra: Model oscillator as clock
Date: Mon, 30 Mar 2015 14:31:11 +0200
Message-ID: <1427718673-32011-10-git-send-email-thierry.reding@gmail.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Currently the Tegra clock driver simplifies the clock tree somewhat by
taking advantage of the fact that clk_m runs at the same frequency as
the oscillator. While that's true on all currently supported SoCs, it
does not apply to Tegra210 anymore. On Tegra210 clk_m is typically
divided down from the oscillator frequency. To support that setup, add
a separate clock for the oscillator that both clk_m and pll_ref derive
from.

Modify the tegra_osc_clk_init() function to take an additional divider
parameter for clk_m. Existing SoCs always pass in 1, whereas Tegra210
will read the divider from a register in the clock & reset controller.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-fixed.c | 24 +++++++++++++-----------
 drivers/clk/tegra/clk-tegra124.c    |  3 ++-
 drivers/clk/tegra/clk-tegra30.c     |  3 ++-
 drivers/clk/tegra/clk.h             |  8 ++++----
 4 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index f3b773833429..605676d368eb 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -30,13 +30,12 @@
 #define OSC_CTRL_OSC_FREQ_SHIFT		28
 #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
 
-int __init tegra_osc_clk_init(void __iomem *clk_base,
-				struct tegra_clk *tegra_clks,
-				unsigned long *input_freqs, int num,
-				unsigned long *osc_freq,
-				unsigned long *pll_ref_freq)
+int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
+			      unsigned long *input_freqs, unsigned int num,
+			      unsigned int clk_m_div, unsigned long *osc_freq,
+			      unsigned long *pll_ref_freq)
 {
-	struct clk *clk;
+	struct clk *clk, *osc;
 	struct clk **dt_clk;
 	u32 val, pll_ref_div;
 	unsigned osc_idx;
@@ -54,22 +53,25 @@ int __init tegra_osc_clk_init(void __iomem *clk_base,
 		return -EINVAL;
 	}
 
-	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m, tegra_clks);
+	osc = clk_register_fixed_rate(NULL, "osc", NULL, CLK_IS_ROOT,
+				      *osc_freq);
+
+	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m, clks);
 	if (!dt_clk)
 		return 0;
 
-	clk = clk_register_fixed_rate(NULL, "clk_m", NULL, CLK_IS_ROOT,
-				      *osc_freq);
+	clk = clk_register_fixed_factor(NULL, "clk_m", "osc",
+					0, 1, clk_m_div);
 	*dt_clk = clk;
 
 	/* pll_ref */
 	val = (val >> OSC_CTRL_PLL_REF_DIV_SHIFT) & 3;
 	pll_ref_div = 1 << val;
-	dt_clk = tegra_lookup_dt_id(tegra_clk_pll_ref, tegra_clks);
+	dt_clk = tegra_lookup_dt_id(tegra_clk_pll_ref, clks);
 	if (!dt_clk)
 		return 0;
 
-	clk = clk_register_fixed_factor(NULL, "pll_ref", "clk_m",
+	clk = clk_register_fixed_factor(NULL, "pll_ref", "osc",
 					0, 1, pll_ref_div);
 	*dt_clk = clk;
 
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 29b39c8c3151..f1fa29ec7951 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1480,7 +1480,8 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
 		return;
 
 	if (tegra_osc_clk_init(clk_base, tegra124_clks, tegra124_input_freq,
-		ARRAY_SIZE(tegra124_input_freq), &osc_freq, &pll_ref_freq) < 0)
+			       ARRAY_SIZE(tegra124_input_freq), 1, &osc_freq,
+			       &pll_ref_freq) < 0)
 		return;
 
 	tegra_fixed_clk_init(tegra124_clks);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 0659db79d1c5..4b26509fc218 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1434,7 +1434,8 @@ static void __init tegra30_clock_init(struct device_node *np)
 		return;
 
 	if (tegra_osc_clk_init(clk_base, tegra30_clks, tegra30_input_freq,
-		ARRAY_SIZE(tegra30_input_freq), &input_freq, NULL) < 0)
+			       ARRAY_SIZE(tegra30_input_freq), 1, &input_freq,
+			       NULL) < 0)
 		return;
 
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 48cb1c13ede5..d6ac00647faf 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -615,10 +615,10 @@ void tegra_periph_clk_init(void __iomem *clk_base, void __iomem *pmc_base,
 
 void tegra_pmc_clk_init(void __iomem *pmc_base, struct tegra_clk *tegra_clks);
 void tegra_fixed_clk_init(struct tegra_clk *tegra_clks);
-int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *tegra_clks,
-				unsigned long *input_freqs, int num,
-				unsigned long *osc_freq,
-				unsigned long *pll_ref_freq);
+int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
+		       unsigned long *input_freqs, unsigned int num,
+		       unsigned int clk_m_div, unsigned long *osc_freq,
+		       unsigned long *pll_ref_freq);
 void tegra_super_clk_gen4_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
-- 
2.3.2
