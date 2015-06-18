From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 14/25] clk: tegra: pll: Add support for PLLMB for T210
Date: Thu, 18 Jun 2015 17:28:29 -0400
Message-ID: <1434662920-21469-15-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra210 SoC's have 2 PLLS for memory usage. Add plumbing to register
and handle PLLMB.

PLLMB is used to allow switching between 2 PLLM's without having to use
and intermediate backup PLL, as we need to lock the PLL before we can
switch to it.

Reviewed-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v3:
  - Flushed out comment more.

v2:
  - Fixed commit description as suggested.

 drivers/clk/tegra/clk-pll.c |   42 ++++++++++++++++++++++++++++++++++++++++--
 drivers/clk/tegra/clk.h     |    9 +++++++++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index e63f16268c16..1f70c356bdd7 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -562,7 +562,7 @@ static void _update_pll_mnp(struct tegra_clk_pll *pll,
 	struct tegra_clk_pll_params *params = pll->params;
 	struct div_nmp *div_nmp = params->div_nmp;
 
-	if ((params->flags & TEGRA_PLLM) &&
+	if ((params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
 		(pll_override_readl(PMC_PLLP_WB0_OVERRIDE, pll) &
 			PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)) {
 		val = pll_override_readl(params->pmc_divp_reg, pll);
@@ -599,7 +599,7 @@ static void _get_pll_mnp(struct tegra_clk_pll *pll,
 	struct tegra_clk_pll_params *params = pll->params;
 	struct div_nmp *div_nmp = params->div_nmp;
 
-	if ((params->flags & TEGRA_PLLM) &&
+	if ((params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
 		(pll_override_readl(PMC_PLLP_WB0_OVERRIDE, pll) &
 			PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)) {
 		val = pll_override_readl(params->pmc_divp_reg, pll);
@@ -2235,4 +2235,42 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 
 	return clk;
 }
+
+struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
+			  void __iomem *clk_base, void __iomem *pmc,
+			  unsigned long flags,
+			  struct tegra_clk_pll_params *pll_params,
+			  spinlock_t *lock)
+{
+	struct tegra_clk_pll *pll;
+	struct clk *clk, *parent;
+	unsigned long parent_rate;
+
+	if (!pll_params->pdiv_tohw)
+		return ERR_PTR(-EINVAL);
+
+	parent = __clk_lookup(parent_name);
+	if (!parent) {
+		WARN(1, "parent clk %s of %s must be registered first\n",
+			parent_name, name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	parent_rate = __clk_get_rate(parent);
+
+	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
+
+	pll_params->flags |= TEGRA_PLL_BYPASS;
+	pll_params->flags |= TEGRA_PLLMB;
+	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
+	if (IS_ERR(pll))
+		return ERR_CAST(pll);
+
+	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
+				      &tegra_clk_pll_ops);
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
 #endif
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 211c3463deba..6170fcef7c33 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -225,6 +225,8 @@ struct div_nmp {
  * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
  * TEGRA_MDIV_NEW - Switch to new method for calculating fixed mdiv
  *     it may be more accurate (especially if SDM present)
+ * TEGRA_PLLMB - PLLMB has should be treated similar to PLLM. This
+ *     flag indicated that it is PLLMB.
  */
 struct tegra_clk_pll_params {
 	unsigned long	input_min;
@@ -281,6 +283,7 @@ struct tegra_clk_pll_params {
 #define TEGRA_PLL_BYPASS BIT(9)
 #define TEGRA_PLL_HAS_LOCK_ENABLE BIT(10)
 #define TEGRA_MDIV_NEW BIT(11)
+#define TEGRA_PLLMB BIT(12)
 
 /**
  * struct tegra_clk_pll - Tegra PLL clock
@@ -387,6 +390,12 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 			   struct tegra_clk_pll_params *pll_params,
 			   spinlock_t *lock);
 
+struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
+			   void __iomem *clk_base, void __iomem *pmc,
+			   unsigned long flags,
+			   struct tegra_clk_pll_params *pll_params,
+			   spinlock_t *lock);
+
 /**
  * struct tegra_clk_pll_out - PLL divider down clock
  *
-- 
1.7.9.5
