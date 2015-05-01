From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v3 12/20] clk: tegra: pll: Add specialized logic for T210
Date: Fri, 1 May 2015 14:53:59 -0400
Message-ID: <1430506447-29074-13-git-send-email-rklein@nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tegra210 SoC's, the logic to enable several of the plls is different
from previous generations. Therefore, add registeration functions specific
to Tegra210 which will handle them appropriately.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v2:
  - Fixed plle logic. PLLE on Tegra210 has had its enable bit moved, so
    we can't use the default _clk_pll_enable/disable routines. Instead,
    manually set/clear the correct bit for PLLE within its functions.

 drivers/clk/tegra/clk-pll.c |  348 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h     |   24 +++
 2 files changed, 370 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 3c40a8136136..c938bdc9415f 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -65,6 +65,7 @@
 #define PLLE_BASE_DIVN_WIDTH 8
 #define PLLE_BASE_DIVM_SHIFT 0
 #define PLLE_BASE_DIVM_WIDTH 8
+#define PLLE_BASE_ENABLE BIT(31)
 
 #define PLLE_MISC_SETUP_BASE_SHIFT 16
 #define PLLE_MISC_SETUP_BASE_MASK (0xffff << PLLE_MISC_SETUP_BASE_SHIFT)
@@ -919,7 +920,8 @@ const struct clk_ops tegra_clk_plle_ops = {
 
 #if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
 	defined(CONFIG_ARCH_TEGRA_124_SOC) || \
-	defined(CONFIG_ARCH_TEGRA_132_SOC)
+	defined(CONFIG_ARCH_TEGRA_132_SOC) || \
+	defined(CONFIG_ARCH_TEGRA_210_SOC)
 
 static int _pll_fixed_mdiv(struct tegra_clk_pll_params *pll_params,
 			   unsigned long parent_rate)
@@ -1588,7 +1590,8 @@ struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
 
 #if defined(CONFIG_ARCH_TEGRA_114_SOC) || \
 	defined(CONFIG_ARCH_TEGRA_124_SOC) || \
-	defined(CONFIG_ARCH_TEGRA_132_SOC)
+	defined(CONFIG_ARCH_TEGRA_132_SOC) || \
+	defined(CONFIG_ARCH_TEGRA_210_SOC)
 static const struct clk_ops tegra_clk_pllxc_ops = {
 	.is_enabled = clk_pll_is_enabled,
 	.enable = clk_pll_enable,
@@ -1967,3 +1970,344 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	return clk;
 }
 #endif
+
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+static int clk_plle_tegra210_enable(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	struct tegra_clk_pll_freq_table sel;
+	u32 val;
+	int ret;
+	unsigned long flags = 0;
+	unsigned long input_rate = clk_get_rate(clk_get_parent(hw->clk));
+
+	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
+		return -EINVAL;
+
+	if (pll->lock)
+		spin_lock_irqsave(pll->lock, flags);
+
+	val = pll_readl_base(pll);
+	val &= ~BIT(29); /* Disable lock override */
+	pll_writel_base(val, pll);
+
+	val = pll_readl(pll->params->aux_reg, pll);
+	val |= PLLE_AUX_ENABLE_SWCTL;
+	val &= ~PLLE_AUX_SEQ_ENABLE;
+	pll_writel(val, pll->params->aux_reg, pll);
+	udelay(1);
+
+	val = pll_readl_misc(pll);
+	val |= PLLE_MISC_LOCK_ENABLE;
+	val |= PLLE_MISC_IDDQ_SW_CTRL;
+	val &= ~PLLE_MISC_IDDQ_SW_VALUE;
+	val |= PLLE_MISC_PLLE_PTS;
+	val |= PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK;
+	pll_writel_misc(val, pll);
+	udelay(5);
+
+	val = pll_readl(PLLE_SS_CTRL, pll);
+	val |= PLLE_SS_DISABLE;
+	pll_writel(val, PLLE_SS_CTRL, pll);
+
+	val = pll_readl_base(pll);
+	val &= ~(divp_mask_shifted(pll) | divn_mask_shifted(pll) |
+		 divm_mask_shifted(pll));
+	val &= ~(PLLE_BASE_DIVCML_MASK << PLLE_BASE_DIVCML_SHIFT);
+	val |= sel.m << divm_shift(pll);
+	val |= sel.n << divn_shift(pll);
+	val |= sel.cpcon << PLLE_BASE_DIVCML_SHIFT;
+	pll_writel_base(val, pll);
+	udelay(1);
+
+	val = pll_readl_base(pll);
+	val |= PLLE_BASE_ENABLE;
+	pll_writel_base(val, pll);
+
+	ret = clk_pll_wait_for_lock(pll);
+
+	if (ret < 0)
+		goto out;
+
+	val = pll_readl(PLLE_SS_CTRL, pll);
+	val &= ~(PLLE_SS_CNTL_CENTER | PLLE_SS_CNTL_INVERT);
+	val &= ~PLLE_SS_COEFFICIENTS_MASK;
+	val |= PLLE_SS_COEFFICIENTS_VAL;
+	pll_writel(val, PLLE_SS_CTRL, pll);
+	val &= ~(PLLE_SS_CNTL_SSC_BYP | PLLE_SS_CNTL_BYPASS_SS);
+	pll_writel(val, PLLE_SS_CTRL, pll);
+	udelay(1);
+	val &= ~PLLE_SS_CNTL_INTERP_RESET;
+	pll_writel(val, PLLE_SS_CTRL, pll);
+	udelay(1);
+
+	/* Enable hw control of xusb brick pll */
+	val = pll_readl_misc(pll);
+	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
+	pll_writel_misc(val, pll);
+
+	val = pll_readl(pll->params->aux_reg, pll);
+	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SEQ_START_STATE);
+	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
+	pll_writel(val, pll->params->aux_reg, pll);
+	udelay(1);
+	val |= PLLE_AUX_SEQ_ENABLE;
+	pll_writel(val, pll->params->aux_reg, pll);
+
+	val = pll_readl(XUSBIO_PLL_CFG0, pll);
+	val |= (XUSBIO_PLL_CFG0_PADPLL_USE_LOCKDET |
+		XUSBIO_PLL_CFG0_SEQ_START_STATE);
+	val &= ~(XUSBIO_PLL_CFG0_CLK_ENABLE_SWCTL |
+		 XUSBIO_PLL_CFG0_PADPLL_RESET_SWCTL);
+	pll_writel(val, XUSBIO_PLL_CFG0, pll);
+	udelay(1);
+	val |= XUSBIO_PLL_CFG0_SEQ_ENABLE;
+	pll_writel(val, XUSBIO_PLL_CFG0, pll);
+
+	/* Enable hw control of SATA pll */
+	val = pll_readl(SATA_PLL_CFG0, pll);
+	val &= ~SATA_PLL_CFG0_PADPLL_RESET_SWCTL;
+	val |= SATA_PLL_CFG0_PADPLL_USE_LOCKDET;
+	val |= SATA_PLL_CFG0_SEQ_START_STATE;
+	pll_writel(val, SATA_PLL_CFG0, pll);
+
+	udelay(1);
+
+	val = pll_readl(SATA_PLL_CFG0, pll);
+	val |= SATA_PLL_CFG0_SEQ_ENABLE;
+	pll_writel(val, SATA_PLL_CFG0, pll);
+
+out:
+	if (pll->lock)
+		spin_unlock_irqrestore(pll->lock, flags);
+
+	return ret;
+}
+
+static void clk_plle_tegra210_disable(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	unsigned long flags = 0;
+	u32 val;
+
+	if (pll->lock)
+		spin_lock_irqsave(pll->lock, flags);
+
+	val = pll_readl_base(pll);
+	val &= ~PLLE_BASE_ENABLE;
+	pll_writel_base(val, pll);
+
+	val = pll_readl_misc(pll);
+	val |= PLLE_MISC_IDDQ_SW_CTRL | PLLE_MISC_IDDQ_SW_VALUE;
+	pll_writel_misc(val, pll);
+	udelay(1);
+
+	if (pll->lock)
+		spin_unlock_irqrestore(pll->lock, flags);
+}
+
+static void clk_plle_tegra210_is_enabled(struct struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	u32 val;
+
+	val = pll_readl_base(pll);
+
+	return val & PLLE_BASE_ENABLE ? 1 : 0;
+}
+
+static const struct clk_ops tegra_clk_plle_tegra210_ops = {
+	.is_enabled =  clk_plle_tegra210_is_enabled,
+	.enable = clk_plle_tegra210_enable,
+	.disable = clk_plle_tegra210_disable,
+	.recalc_rate = clk_pll_recalc_rate,
+};
+
+struct clk *tegra_clk_register_plle_tegra210(const char *name,
+				const char *parent_name,
+				void __iomem *clk_base, unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock)
+{
+	struct tegra_clk_pll *pll;
+	struct clk *clk;
+	u32 val, val_aux;
+
+	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	if (IS_ERR(pll))
+		return ERR_CAST(pll);
+
+	/* ensure parent is set to pll_re_vco */
+
+	val = pll_readl_base(pll);
+	val_aux = pll_readl(pll_params->aux_reg, pll);
+
+	if (val & PLLE_BASE_ENABLE) {
+		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
+			(val_aux & PLLE_AUX_PLLP_SEL))
+			WARN(1, "pll_e enabled with unsupported parent %s\n",
+			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
+					"pll_re_vco");
+	} else {
+		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
+		pll_writel(val_aux, pll_params->aux_reg, pll);
+	}
+
+	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
+				      &tegra_clk_plle_tegra210_ops);
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
+
+struct clk *tegra_clk_register_pllc_tegra210(const char *name,
+			const char *parent_name, void __iomem *clk_base,
+			void __iomem *pmc, unsigned long flags,
+			struct tegra_clk_pll_params *pll_params,
+			spinlock_t *lock)
+{
+	struct clk *parent, *clk;
+	struct pdiv_map *p_tohw = pll_params->pdiv_tohw;
+	struct tegra_clk_pll *pll;
+	unsigned long parent_rate;
+
+	if (!p_tohw)
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
+
+struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
+			const char *parent_name, void __iomem *clk_base,
+			void __iomem *pmc, unsigned long flags,
+			struct tegra_clk_pll_params *pll_params,
+			spinlock_t *lock)
+{
+	struct tegra_clk_pll *pll;
+	struct clk *clk, *parent;
+	unsigned long parent_rate;
+	u32 val, val_iddq;
+
+	parent = __clk_lookup(parent_name);
+	if (!parent) {
+		WARN(1, "parent clk %s of %s must be registered first\n",
+			name, parent_name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!pll_params->pdiv_tohw)
+		return ERR_PTR(-EINVAL);
+
+	parent_rate = __clk_get_rate(parent);
+
+	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
+
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
+
+struct clk *tegra_clk_register_pllss_tegra210(const char *name,
+				const char *parent_name, void __iomem *clk_base,
+				unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock)
+{
+	struct tegra_clk_pll *pll;
+	struct clk *clk, *parent;
+	struct tegra_clk_pll_freq_table cfg;
+	unsigned long parent_rate;
+	u32 val;
+	int i;
+
+	if (!pll_params->div_nmp)
+		return ERR_PTR(-EINVAL);
+
+	parent = __clk_lookup(parent_name);
+	if (!parent) {
+		WARN(1, "parent clk %s of %s must be registered first\n",
+			name, parent_name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	if (IS_ERR(pll))
+		return ERR_CAST(pll);
+
+	val = pll_readl_base(pll);
+	val &= ~PLLSS_REF_SRC_SEL_MASK;
+	pll_writel_base(val, pll);
+
+	parent_rate = __clk_get_rate(parent);
+
+	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
+
+	/* initialize PLL to minimum rate */
+
+	cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
+	cfg.n = cfg.m * pll_params->vco_min / parent_rate;
+
+	for (i = 0; pll_params->pdiv_tohw[i].pdiv; i++)
+		;
+	if (!i) {
+		kfree(pll);
+		return ERR_PTR(-EINVAL);
+	}
+
+	cfg.p = pll_params->pdiv_tohw[i-1].hw_val;
+
+	_update_pll_mnp(pll, &cfg);
+
+	pll_writel_misc(PLLSS_MISC_DEFAULT, pll);
+
+	val = pll_readl_base(pll);
+	if (val & PLL_BASE_ENABLE) {
+		if (val & BIT(pll_params->iddq_bit_idx)) {
+			WARN(1, "%s is on but IDDQ set\n", name);
+			kfree(pll);
+			return ERR_PTR(-EINVAL);
+		}
+	} else
+		val |= BIT(pll_params->iddq_bit_idx);
+
+	val &= ~PLLSS_LOCK_OVERRIDE;
+	pll_writel_base(val, pll);
+
+	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
+					&tegra_clk_pll_ops);
+
+	if (IS_ERR(clk))
+		kfree(pll);
+
+	return clk;
+}
+#endif
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 142999f1cd24..26e31580dc9e 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -313,6 +313,12 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 			    struct tegra_clk_pll_params *pll_params,
 			    spinlock_t *lock);
 
+struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
+			const char *parent_name, void __iomem *clk_base,
+			void __iomem *pmc, unsigned long flags,
+			struct tegra_clk_pll_params *pll_params,
+			spinlock_t *lock);
+
 struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 			   void __iomem *clk_base, void __iomem *pmc,
 			   unsigned long flags,
@@ -337,6 +343,24 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 				struct tegra_clk_pll_params *pll_params,
 				spinlock_t *lock);
 
+struct clk *tegra_clk_register_plle_tegra210(const char *name,
+				const char *parent_name,
+				void __iomem *clk_base, unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock);
+
+struct clk *tegra_clk_register_pllc_tegra210(const char *name,
+				const char *parent_name, void __iomem *clk_base,
+				void __iomem *pmc, unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock);
+
+struct clk *tegra_clk_register_pllss_tegra210(const char *name,
+				const char *parent_name, void __iomem *clk_base,
+				unsigned long flags,
+				struct tegra_clk_pll_params *pll_params,
+				spinlock_t *lock);
+
 struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 			   void __iomem *clk_base, unsigned long flags,
 			   struct tegra_clk_pll_params *pll_params,
-- 
1.7.9.5
