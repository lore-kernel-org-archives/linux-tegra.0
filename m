From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 16/25] clk: tegra: pll: Add Set_default logic
Date: Thu, 18 Jun 2015 17:28:31 -0400
Message-ID: <1434662920-21469-17-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

Add logic which (if specified for a pll) can verify that a PLL is set
to the proper default value and if not can set it. This can be
specified per PLL as each will have different default values.

Based on original work by Aleksandr Frid <afrid@nvidia.com>

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v6:
  - Added kerneldoc

v2:
  - Remove MACRO for PLL_MISC_CHECK_DEFAULT as suggested, and instead
    the tegra210 driver will include an inline version of this function.

 drivers/clk/tegra/clk-pll.c |   39 ++++++++++++++++++++++++++++-----------
 drivers/clk/tegra/clk.h     |   11 +++++++++++
 2 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 3c348c96f9da..f878bc879df2 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -653,13 +653,19 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 			unsigned long rate)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	struct tegra_clk_pll_freq_table old_cfg;
 	int state, ret = 0;
 
 	state = clk_pll_is_enabled(hw);
 
+	_get_pll_mnp(pll, &old_cfg);
+
 	if (state)
 		_clk_pll_disable(hw);
 
+	if (!pll->params->defaults_set && pll->params->set_defaults)
+		pll->params->set_defaults(pll);
+
 	_update_pll_mnp(pll, cfg);
 
 	if (pll->params->flags & TEGRA_PLL_HAS_CPCON)
@@ -1485,6 +1491,9 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
 	if (!pll->params->calc_rate)
 		pll->params->calc_rate = _calc_rate;
 
+	if (pll->params->set_defaults)
+		pll->params->set_defaults(pll);
+
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	pll->hw.init = &init;
 
@@ -1595,7 +1604,6 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 	struct tegra_clk_pll *pll;
 	struct clk *clk, *parent;
 	unsigned long parent_rate;
-	int err;
 	u32 val, val_iddq;
 
 	parent = __clk_lookup(parent_name);
@@ -1616,18 +1624,27 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 		pll_params->vco_min = pll_params->adjust_vco(pll_params,
 							     parent_rate);
 
-	err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
-	if (err)
-		return ERR_PTR(err);
+	/*
+	 * If the pll has a set_defaults callback, it will take care of
+	 * configuring dynamic ramping and setting IDDQ in that path.
+	 */
+	if (!pll_params->set_defaults) {
+		int err;
+
+		err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
+		if (err)
+			return ERR_PTR(err);
 
-	val = readl_relaxed(clk_base + pll_params->base_reg);
-	val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
+		val = readl_relaxed(clk_base + pll_params->base_reg);
+		val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
 
-	if (val & PLL_BASE_ENABLE)
-		WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
-	else {
-		val_iddq |= BIT(pll_params->iddq_bit_idx);
-		writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
+		if (val & PLL_BASE_ENABLE)
+			WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
+		else {
+			val_iddq |= BIT(pll_params->iddq_bit_idx);
+			writel_relaxed(val_iddq,
+				       clk_base + pll_params->iddq_reg);
+		}
 	}
 
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 72bf25525bd6..ae42e3e6a116 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -160,6 +160,8 @@ struct div_nmp {
 
 #define MAX_PLL_MISC_REG_COUNT	6
 
+struct tegra_clk_pll;
+
 /**
  * struct tegra_clk_pll_params - PLL parameters
  *
@@ -192,6 +194,7 @@ struct div_nmp {
  * @stepb_shift:		Dynamic ramp step B field shift
  * @lock_delay:			Delay in us if PLL lock is not used
  * @max_p:			maximum value for the p divider
+ * @defaults_set:		Boolean signaling all reg defaults for PLL set.
  * @pdiv_tohw:			mapping of p divider to register values
  * @div_nmp:			offsets and widths on n, m and p fields
  * @freq_table:			array of frequencies supported by PLL
@@ -204,6 +207,12 @@ struct div_nmp {
  *				rates (dividers and multipler) are calculated.
  * @adjust_vco:			Callback to adjust the programming range of the
  *				divider range (if SDM is present)
+ * @set_defaults:		Callback which will try to initialize PLL
+ *				registers to sane default values. This is first
+ *				tried during PLL registration, but if the PLL
+ *				is already enabled, it will be done the first
+ *				time the rate is changed while the PLL is
+ *				disabled.
  *
  * Flags:
  * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
@@ -261,6 +270,7 @@ struct tegra_clk_pll_params {
 	int		stepb_shift;
 	int		lock_delay;
 	int		max_p;
+	bool		defaults_set;
 	struct pdiv_map *pdiv_tohw;
 	struct div_nmp	*div_nmp;
 	struct tegra_clk_pll_freq_table	*freq_table;
@@ -273,6 +283,7 @@ struct tegra_clk_pll_params {
 			unsigned long rate, unsigned long parent_rate);
 	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
 				unsigned long parent_rate);
+	void	(*set_defaults)(struct tegra_clk_pll *pll);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
