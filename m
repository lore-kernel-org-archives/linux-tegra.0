From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 10/21] clk: tegra: pll: Add logic for out-of-table rates for T210
Date: Tue, 12 May 2015 13:23:53 -0400
Message-ID: <1431451444-23155-12-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431451444-23155-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For Tegra210, the logic to calculate out-of-table rates is different
from previous generations. Add callbacks that can be overridden to
allow for different ways of calculating rates. Default to
_cal_rate when not specified.

This patch also includes a new flag which is used to set which method
of fixed_mdiv calculation is used. The new method for calculating the
fixed divider value for M can be more accurate especially when
fractional dividers are in play. This allows for older chipsets to use
the existing logic and new generations to use a newer version which
may work better for them.

Based on original work by Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v5:
  - Updated description to include mentioning the NEW_MDIV flag
  - Added kerneldoc info for new members

 drivers/clk/tegra/clk-pll.c |   24 ++++++++++++++++++++++--
 drivers/clk/tegra/clk.h     |   13 +++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 8b27cb6fe992..95ad0669291f 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -678,7 +678,7 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	if (_get_table_rate(hw, &cfg, rate, parent_rate) &&
-	    _calc_rate(hw, &cfg, rate, parent_rate)) {
+	    pll->params->calc_rate(hw, &cfg, rate, parent_rate)) {
 		pr_err("%s: Failed to set %s rate %lu\n", __func__,
 		       __clk_get_name(hw->clk), rate);
 		WARN_ON(1);
@@ -713,7 +713,7 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		return __clk_get_rate(hw->clk);
 
 	if (_get_table_rate(hw, &cfg, rate, *prate) &&
-	    _calc_rate(hw, &cfg, rate, *prate))
+	    pll->params->calc_rate(hw, &cfg, rate, *prate))
 		return -EINVAL;
 
 	return cfg.output_rate;
@@ -903,12 +903,28 @@ const struct clk_ops tegra_clk_plle_ops = {
 static int _pll_fixed_mdiv(struct tegra_clk_pll_params *pll_params,
 			   unsigned long parent_rate)
 {
+	u16 mdiv = parent_rate / pll_params->cf_min;
+
+	if (pll_params->flags & TEGRA_MDIV_NEW)
+		return (!pll_params->mdiv_default ? mdiv :
+			min(mdiv, pll_params->mdiv_default));
+
+	if (pll_params->mdiv_default)
+		return pll_params->mdiv_default;
+
 	if (parent_rate > pll_params->cf_max)
 		return 2;
 	else
 		return 1;
 }
 
+u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+
+	return (u16)_pll_fixed_mdiv(pll->params, input_rate);
+}
+
 static unsigned long _clip_vco_min(unsigned long vco_min,
 				   unsigned long parent_rate)
 {
@@ -1483,6 +1499,10 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
 	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
 
+	/* Default to _calc_rate if unspecified */
+	if (!pll->params->calc_rate)
+		pll->params->calc_rate = _calc_rate;
+
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	pll->hw.init = &init;
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index e78133822233..35ce2a382792 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -194,8 +194,12 @@ struct div_nmp {
  * @div_nmp:			offsets and widths on n, m and p fields
  * @freq_table:			array of frequencies supported by PLL
  * @fixed_rate:			PLL rate if it is fixed
+ * @mdiv_default:		Default value for fixed mdiv for this PLL
+ * @round_p_to_pdiv:		Callback used to round p to the closed pdiv
  * @set_gain:			Callback to adjust N div for SDM enabled
  *				PLL's based on fractional divider value.
+ * @calc_rate:			Callback used to change how out of table
+ *				rates (dividers and multipler) are calculated.
  *
  * Flags:
  * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
@@ -217,6 +221,8 @@ struct div_nmp {
  *     base register.
  * TEGRA_PLL_BYPASS - PLL has bypass bit
  * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
+ * TEGRA_MDIV_NEW - Switch to new method for calculating fixed mdiv
+ *     it may be more accurate (especially if SDM present)
  */
 struct tegra_clk_pll_params {
 	unsigned long	input_min;
@@ -251,7 +257,12 @@ struct tegra_clk_pll_params {
 	struct div_nmp	*div_nmp;
 	struct tegra_clk_pll_freq_table	*freq_table;
 	unsigned long	fixed_rate;
+	u16		mdiv_default;
+	u32	(*round_p_to_pdiv)(u32 p, u32 *pdiv);
 	void	(*set_gain)(struct tegra_clk_pll_freq_table *cfg);
+	int	(*calc_rate)(struct clk_hw *hw,
+			struct tegra_clk_pll_freq_table *cfg,
+			unsigned long rate, unsigned long parent_rate);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
@@ -265,6 +276,7 @@ struct tegra_clk_pll_params {
 #define TEGRA_PLL_LOCK_MISC BIT(8)
 #define TEGRA_PLL_BYPASS BIT(9)
 #define TEGRA_PLL_HAS_LOCK_ENABLE BIT(10)
+#define TEGRA_MDIV_NEW BIT(11)
 
 /**
  * struct tegra_clk_pll - Tegra PLL clock
@@ -675,5 +687,6 @@ void tegra114_clock_deassert_dfll_dvco_reset(void);
 typedef void (*tegra_clk_apply_init_table_func)(void);
 extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
 int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll);
+u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
 
 #endif /* TEGRA_CLK_H */
-- 
1.7.9.5
