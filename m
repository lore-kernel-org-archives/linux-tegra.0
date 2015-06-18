From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 12/25] clk: tegra: Update PLLM handling
Date: Thu, 18 Jun 2015 17:28:27 -0400
Message-ID: <1434662920-21469-13-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

PLLM is fixed for Tegra30 up through Tegra114. Starting with Tegra124
PLLM can change rate. Mark PLLM as TEGRA_PLL_FIXED for the generations
where it should be. Modify the check in clk_pll_round_rate and
clk_pll_recalc_rate to allow for the non-fixed version to
return the correct rate.

Note that clk-tegra20 is not touched. This is because PLL_M is not
distinguished in that driver, and adding either the PLL_M or FIXED_RATE
flags will cause potential problems.

PLLM never supported dynamic ramping. On T20/T30, there is no dynamic
ramping al all, and on T114/T124/T132, only PLLX and PLLC support
dynamic ramping, so we can go ahead and remove the specialized pllm_ops.

Signed-off-by: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c      |   56 +++++---------------------------------
 drivers/clk/tegra/clk-tegra114.c |    3 +-
 drivers/clk/tegra/clk-tegra30.c  |    2 +-
 3 files changed, 10 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 54ebab2b85e5..ff67f6d77ca9 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -717,12 +717,12 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
 
-	if (pll->params->flags & TEGRA_PLL_FIXED)
+	if (pll->params->flags & TEGRA_PLL_FIXED) {
+		/* PLLM/MB are used for memory; we do not change rate */
+		if (pll->params->flags & (TEGRA_PLLM | TEGRA_PLLMB))
+			return __clk_get_rate(hw->clk);
 		return pll->params->fixed_rate;
-
-	/* PLLM is used for memory; we do not change rate */
-	if (pll->params->flags & TEGRA_PLLM)
-		return __clk_get_rate(hw->clk);
+	}
 
 	if (_get_table_rate(hw, &cfg, rate, *prate) &&
 	    pll->params->calc_rate(hw, &cfg, rate, *prate))
@@ -746,6 +746,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 		return parent_rate;
 
 	if ((pll->params->flags & TEGRA_PLL_FIXED) &&
+	    !(pll->params->flags & (TEGRA_PLLM | TEGRA_PLLMB)) &&
 			!(val & PLL_BASE_OVERRIDE)) {
 		struct tegra_clk_pll_freq_table sel;
 		if (_get_table_rate(hw, &sel, pll->params->fixed_rate,
@@ -1088,40 +1089,6 @@ static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
 	return output_rate;
 }
 
-static int clk_pllm_set_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long parent_rate)
-{
-	struct tegra_clk_pll_freq_table cfg;
-	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	unsigned long flags = 0;
-	int state, ret = 0;
-
-	if (pll->lock)
-		spin_lock_irqsave(pll->lock, flags);
-
-	state = clk_pll_is_enabled(hw);
-	if (state) {
-		if (rate != clk_get_rate(hw->clk)) {
-			pr_err("%s: Cannot change active PLLM\n", __func__);
-			ret = -EINVAL;
-			goto out;
-		}
-		goto out;
-	}
-
-	ret = _pll_ramp_calc_pll(hw, &cfg, rate, parent_rate);
-	if (ret < 0)
-		goto out;
-
-	_update_pll_mnp(pll, &cfg);
-
-out:
-	if (pll->lock)
-		spin_unlock_irqrestore(pll->lock, flags);
-
-	return ret;
-}
-
 static void _pllcx_strobe(struct tegra_clk_pll *pll)
 {
 	u32 val;
@@ -1589,15 +1556,6 @@ static const struct clk_ops tegra_clk_pllxc_ops = {
 	.set_rate = clk_pllxc_set_rate,
 };
 
-static const struct clk_ops tegra_clk_pllm_ops = {
-	.is_enabled = clk_pll_is_enabled,
-	.enable = clk_pll_enable,
-	.disable = clk_pll_disable,
-	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
-	.set_rate = clk_pllm_set_rate,
-};
-
 static const struct clk_ops tegra_clk_pllc_ops = {
 	.is_enabled = clk_pll_is_enabled,
 	.enable = clk_pllc_enable,
@@ -1751,7 +1709,7 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 		return ERR_CAST(pll);
 
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
-				      &tegra_clk_pllm_ops);
+				      &tegra_clk_pll_ops);
 	if (IS_ERR(clk))
 		kfree(pll);
 
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 2e8ed12a6889..7cbb63175896 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -353,7 +353,8 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.pmc_divnm_reg = PMC_PLLM_WB0_OVERRIDE,
 	.pmc_divp_reg = PMC_PLLM_WB0_OVERRIDE_2,
 	.freq_table = pll_m_freq_table,
-	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
+	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE |
+		 TEGRA_PLL_FIXED,
 };
 
 static struct div_nmp pllp_nmp = {
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 115ce6e18218..eadef0b802e4 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -457,7 +457,7 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.freq_table = pll_m_freq_table,
 	.flags = TEGRA_PLLM | TEGRA_PLL_HAS_CPCON |
 		 TEGRA_PLL_SET_DCCON | TEGRA_PLL_USE_LOCK |
-		 TEGRA_PLL_HAS_LOCK_ENABLE,
+		 TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLL_FIXED,
 };
 
 static struct tegra_clk_pll_params pll_p_params = {
-- 
1.7.9.5
