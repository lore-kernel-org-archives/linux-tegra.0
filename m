From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 14/19] clk: tegra: pll: Adjust vco_min if SDM present
Date: Fri, 24 Apr 2015 12:47:54 -0400
Message-ID: <1429894079-25052-15-git-send-email-rklein@nvidia.com>
References: <1429894079-25052-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429894079-25052-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This code makes use of the SDM fractional divider if present to
contrain the allowable programming range of the PLL divider register
bitfields to take advantage of higher frequency granularity that can
be induced by the SDM divider.

Based on original work by Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c |   29 ++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h     |    2 ++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 4a248ee1861c..9acd858e0c5b 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1637,7 +1637,6 @@ static const struct clk_ops tegra_clk_plle_tegra114_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 };
 
-
 struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 			  void __iomem *clk_base, void __iomem *pmc,
 			  unsigned long flags,
@@ -1664,6 +1663,10 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
 	if (err)
 		return ERR_PTR(err);
@@ -1702,6 +1705,10 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -1758,6 +1765,10 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLM;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
@@ -2173,6 +2184,10 @@ struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
@@ -2211,6 +2226,10 @@ struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -2258,6 +2277,10 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	/* initialize PLL to minimum rate */
 
 	cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
@@ -2322,6 +2345,10 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLMB;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 9e37defb063f..27075a586e79 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -248,6 +248,8 @@ struct tegra_clk_pll_params {
 	int	(*calc_rate)(struct clk_hw *hw,
 			struct tegra_clk_pll_freq_table *cfg,
 			unsigned long rate, unsigned long parent_rate);
+	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
+				unsigned long parent_rate);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
