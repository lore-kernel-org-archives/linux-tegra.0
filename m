From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v3 13/20] clk: tegra: pll: Add support for PLLMB for T210
Date: Fri, 1 May 2015 14:54:00 -0400
Message-ID: <1430506447-29074-14-git-send-email-rklein@nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra210 SoC's have 2 PLLS for memory usage. Add plumbing to register
and handle PLLMB.

PLLMB is used to allow switching between 2 PLLM's without having to use
and intermediate backup PLL, as we need to lock the PLL before we can
switch to it.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v3:
  - Flushed out comment more.

v2:
  - Fixed commit description as suggested.

 drivers/clk/tegra/clk-pll.c |   46 +++++++++++++++++++++++++++++++++++++++----
 drivers/clk/tegra/clk.h     |    9 +++++++++
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c938bdc9415f..edc388f02a66 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -547,7 +547,7 @@ static void _update_pll_mnp(struct tegra_clk_pll *pll,
 	struct tegra_clk_pll_params *params = pll->params;
 	struct div_nmp *div_nmp = params->div_nmp;
 
-	if ((params->flags & TEGRA_PLLM) &&
+	if ((params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
 		(pll_override_readl(PMC_PLLP_WB0_OVERRIDE, pll) &
 			PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)) {
 		val = pll_override_readl(params->pmc_divp_reg, pll);
@@ -584,7 +584,7 @@ static void _get_pll_mnp(struct tegra_clk_pll *pll,
 	struct tegra_clk_pll_params *params = pll->params;
 	struct div_nmp *div_nmp = params->div_nmp;
 
-	if ((params->flags & TEGRA_PLLM) &&
+	if ((params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
 		(pll_override_readl(PMC_PLLP_WB0_OVERRIDE, pll) &
 			PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE)) {
 		val = pll_override_readl(params->pmc_divp_reg, pll);
@@ -730,8 +730,8 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (pll->params->flags & TEGRA_PLL_FIXED)
 		return pll->params->fixed_rate;
 
-	/* PLLM is used for memory; we do not change rate */
-	if (pll->params->flags & TEGRA_PLLM)
+	/* PLLM/MB are used for memory; we do not change rate */
+	if (pll->params->flags & (TEGRA_PLLM | TEGRA_PLLMB))
 		return __clk_get_rate(hw->clk);
 
 	if (_get_table_rate(hw, &cfg, rate, *prate) &&
@@ -2310,4 +2310,42 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 
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
+			name, parent_name);
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
+				      &tegra_clk_pllm_ops);
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
 #endif
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 26e31580dc9e..9e37defb063f 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -201,6 +201,8 @@ struct div_nmp {
  * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
  * TEGRA_MDIV_NEW - Switch to new method for calculating fixed mdiv
  *     it may be more accurate (especially if SDM present)
+ * TEGRA_PLLMB - PLLMB has should be treated similar to PLLM. This
+ *     flag indicated that it is PLLMB.
  */
 struct tegra_clk_pll_params {
 	unsigned long	input_min;
@@ -260,6 +262,7 @@ struct tegra_clk_pll_params {
 #define TEGRA_PLL_BYPASS BIT(9)
 #define TEGRA_PLL_HAS_LOCK_ENABLE BIT(10)
 #define TEGRA_MDIV_NEW BIT(11)
+#define TEGRA_PLLMB BIT(12)
 
 /**
  * struct tegra_clk_pll - Tegra PLL clock
@@ -366,6 +369,12 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
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
