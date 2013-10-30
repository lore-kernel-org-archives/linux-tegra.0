From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: use pll_ref as the pll_e parent
Date: Wed, 30 Oct 2013 02:41:29 +0200
Message-ID: <1383093707-10312-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use pll_ref instead of pll_re_vco as the pll_e parent on Tegra114 and
Tegra124. Also add a pll_ref table entry for pll_e for Tegra114.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c      |    7 ++++---
 drivers/clk/tegra/clk-tegra114.c |    3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 7d775a9..193457b 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1712,11 +1712,12 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 	val_aux = pll_readl(pll_params->aux_reg, pll);
 
 	if (val & PLL_BASE_ENABLE) {
-		if (!(val_aux & PLLE_AUX_PLLRE_SEL))
+		if ((val_aux & PLLE_AUX_PLLRE_SEL) || (val_aux & val_aux))
 			WARN(1, "pll_e enabled with unsupported parent %s\n",
-			  (val & PLLE_AUX_PLLP_SEL) ? "pllp_out0" : "pll_ref");
+			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
+					"pll_re_vco");
 	} else {
-		val_aux |= PLLE_AUX_PLLRE_SEL;
+		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
 		pll_writel(val, pll_params->aux_reg, pll);
 	}
 
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index e365b35..5cfcd3e 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -560,6 +560,7 @@ static struct tegra_clk_pll_freq_table pll_e_freq_table[] = {
 	/* PLLE special case: use cpcon field to store cml divider value */
 	{336000000, 100000000, 100, 21, 16, 11},
 	{312000000, 100000000, 200, 26, 24, 13},
+	{12000000, 100000000, 200,  1,  24, 13},
 	{0, 0, 0, 0, 0, 0},
 };
 
@@ -1178,7 +1179,7 @@ static void __init tegra114_pll_init(void __iomem *clk_base,
 	clks[TEGRA114_CLK_PLL_RE_OUT] = clk;
 
 	/* PLLE */
-	clk = tegra_clk_register_plle_tegra114("pll_e_out0", "pll_re_vco",
+	clk = tegra_clk_register_plle_tegra114("pll_e_out0", "pll_ref",
 				      clk_base, 0, &pll_e_params, NULL);
 	clks[TEGRA114_CLK_PLL_E_OUT0] = clk;
 }
-- 
1.7.7.rc0.72.g4b5ea.dirty
