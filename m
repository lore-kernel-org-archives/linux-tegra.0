From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v3 08/20] clk: tegra: pll: Add logic for handling SDM data
Date: Fri, 1 May 2015 14:53:55 -0400
Message-ID: <1430506447-29074-9-git-send-email-rklein@nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This adds logic for taking SDM_DIN (Sigma Delta Modulator) setting into
the equation to calculate the effective N value for PLL which supports
fractional divider.

The effective N = NDIV + 1/2 + SDM_DIN/2^13, where NDIV is the integer
feedback divider.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c |   52 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h     |    9 +++++++-
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 13d86c5b234d..c64b75185d6b 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -187,17 +187,23 @@
 #define pll_readl_base(p) pll_readl(p->params->base_reg, p)
 #define pll_readl_misc(p) pll_readl(p->params->misc_reg, p)
 #define pll_override_readl(offset, p) readl_relaxed(p->pmc + offset)
+#define pll_readl_sdm_din(p) pll_readl(p->params->sdm_din_reg, p)
+#define pll_readl_sdm_ctrl(p) pll_readl(p->params->sdm_ctrl_reg, p)
 
 #define pll_writel(val, offset, p) writel_relaxed(val, p->clk_base + offset)
 #define pll_writel_base(val, p) pll_writel(val, p->params->base_reg, p)
 #define pll_writel_misc(val, p) pll_writel(val, p->params->misc_reg, p)
 #define pll_override_writel(val, offset, p) writel(val, p->pmc + offset)
+#define pll_writel_sdm_din(val, p) pll_writel(val, p->params->sdm_din_reg, p)
+#define pll_writel_sdm_ctrl(val, p) pll_writel(val, p->params->sdm_ctrl_reg, p)
 
 #define mask(w) ((1 << (w)) - 1)
 #define divm_mask(p) mask(p->params->div_nmp->divm_width)
 #define divn_mask(p) mask(p->params->div_nmp->divn_width)
 #define divp_mask(p) (p->params->flags & TEGRA_PLLU ? PLLU_POST_DIVP_MASK :\
 		      mask(p->params->div_nmp->divp_width))
+#define sdm_din_mask(p) p->params->sdm_din_mask
+#define sdm_en_mask(p) p->params->sdm_ctrl_en_mask
 
 #define divm_shift(p) (p)->params->div_nmp->divm_shift
 #define divn_shift(p) (p)->params->div_nmp->divn_shift
@@ -211,6 +217,9 @@
 #define divn_max(p) (divn_mask(p))
 #define divp_max(p) (1 << (divp_mask(p)))
 
+#define sdin_din_to_data(din)	((u16)((din) ? : 0xFFFFU))
+#define sdin_data_to_din(dat)	(((dat) == 0xFFFFU) ? 0 : (s16)dat)
+
 static struct div_nmp default_nmp = {
 	.divn_shift = PLL_BASE_DIVN_SHIFT,
 	.divn_width = PLL_BASE_DIVN_WIDTH,
@@ -429,6 +438,7 @@ static int _get_table_rate(struct clk_hw *hw,
 	cfg->n = sel->n;
 	cfg->p = sel->p;
 	cfg->cpcon = sel->cpcon;
+	cfg->sdm_data = sel->sdm_data;
 
 	return 0;
 }
@@ -495,6 +505,28 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	return 0;
 }
 
+static void clk_pll_set_sdm_data(struct clk_hw *hw,
+				 struct tegra_clk_pll_freq_table *cfg)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	u32 val;
+
+	if (!pll->params->sdm_din_reg)
+		return;
+
+	if (cfg->sdm_data) {
+		val = pll_readl_sdm_din(pll) & (~sdm_din_mask(pll));
+		val |= sdin_data_to_din(cfg->sdm_data) & sdm_din_mask(pll);
+		pll_writel_sdm_din(val, pll);
+	}
+
+	val = pll_readl_sdm_ctrl(pll);
+	if (!cfg->sdm_data != !(val & pll->params->sdm_ctrl_en_mask)) {
+		val ^= pll->params->sdm_ctrl_en_mask;
+		pll_writel_sdm_ctrl(val, pll);
+	}
+}
+
 static void _update_pll_mnp(struct tegra_clk_pll *pll,
 			    struct tegra_clk_pll_freq_table *cfg)
 {
@@ -527,6 +559,8 @@ static void _update_pll_mnp(struct tegra_clk_pll *pll,
 		       (cfg->p << divp_shift(pll));
 
 		pll_writel_base(val, pll);
+
+		clk_pll_set_sdm_data(&pll->hw, cfg);
 	}
 }
 
@@ -552,6 +586,14 @@ static void _get_pll_mnp(struct tegra_clk_pll *pll,
 		cfg->m = (val >> div_nmp->divm_shift) & divm_mask(pll);
 		cfg->n = (val >> div_nmp->divn_shift) & divn_mask(pll);
 		cfg->p = (val >> div_nmp->divp_shift) & divp_mask(pll);
+
+		if (pll->params->sdm_din_reg) {
+			if (sdm_en_mask(pll) & pll_readl_sdm_ctrl(pll)) {
+				val = pll_readl_sdm_din(pll);
+				cfg->sdm_data = val & sdm_din_mask(pll);
+				cfg->sdm_data = sdin_din_to_data(cfg->sdm_data);
+			}
+		}
 	}
 }
 
@@ -633,7 +675,8 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	_get_pll_mnp(pll, &old_cfg);
 
-	if (old_cfg.m != cfg.m || old_cfg.n != cfg.n || old_cfg.p != cfg.p)
+	if (old_cfg.m != cfg.m || old_cfg.n != cfg.n || old_cfg.p != cfg.p ||
+		old_cfg.sdm_data != cfg.sdm_data)
 		ret = _program_pll(hw, &cfg, rate);
 
 	if (pll->lock)
@@ -697,6 +740,9 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 		pdiv = 1;
 	}
 
+	if (pll->params->set_gain)
+		pll->params->set_gain(&cfg);
+
 	cfg.m *= pdiv;
 
 	rate *= cfg.n;
@@ -978,6 +1024,7 @@ static int clk_pllxc_set_rate(struct clk_hw *hw, unsigned long rate,
 static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *prate)
 {
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
 	int ret, p_div;
 	u64 output_rate = *prate;
@@ -990,6 +1037,9 @@ static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (p_div < 0)
 		return p_div;
 
+	if (pll->params->set_gain)
+		pll->params->set_gain(&cfg);
+
 	output_rate *= cfg.n;
 	do_div(output_rate, cfg.m * p_div);
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 03babba1c3b4..ef5754f64622 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -110,14 +110,16 @@ struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
  * @m:			input divider
  * @p:			post divider
  * @cpcon:		charge pump current
+ * @sdm_data:		fraction divider setting (0 = disabled)
  */
 struct tegra_clk_pll_freq_table {
 	unsigned long	input_rate;
 	unsigned long	output_rate;
-	u16		n;
+	u32		n;
 	u16		m;
 	u8		p;
 	u8		cpcon;
+	u16		sdm_data;
 };
 
 /**
@@ -213,6 +215,10 @@ struct tegra_clk_pll_params {
 	u32		lock_enable_bit_idx;
 	u32		iddq_reg;
 	u32		iddq_bit_idx;
+	u32		sdm_din_reg;
+	u32		sdm_din_mask;
+	u32		sdm_ctrl_reg;
+	u32		sdm_ctrl_en_mask;
 	u32		aux_reg;
 	u32		dyn_ramp_reg;
 	u32		ext_misc_reg[MAX_PLL_MISC_REG_COUNT];
@@ -227,6 +233,7 @@ struct tegra_clk_pll_params {
 	struct div_nmp	*div_nmp;
 	struct tegra_clk_pll_freq_table	*freq_table;
 	unsigned long	fixed_rate;
+	void	(*set_gain)(struct tegra_clk_pll_freq_table *cfg);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
