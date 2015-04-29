From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 04/19] clk: tegra: pll: simplify clk_enable_path
Date: Wed, 29 Apr 2015 13:21:34 -0400
Message-ID: <1430328109-537-5-git-send-email-rklein@nvidia.com>
References: <1430328109-537-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430328109-537-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Instead of having multiple similar wrapper functions for
_clk_pll_[enable|disable], we can simplify it to single
wrappers and use checks to avoid the logic we don't want to use.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v2:
  - Moved the iddq settings into _clk_pll_enable/disable. This is because
    some places in this file call directly into these internal functions,
    but still need the iddq/reset logic to happen.

 drivers/clk/tegra/clk-pll.c |   76 +++++++++++++------------------------------
 1 file changed, 22 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index b9a739ce4b98..1e1018dd466f 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -295,6 +295,13 @@ static void _clk_pll_enable(struct clk_hw *hw)
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	u32 val;
 
+	if (pll->params->iddq_reg) {
+		val = pll_readl(pll->params->iddq_reg, pll);
+		val &= ~BIT(pll->params->iddq_bit_idx);
+		pll_writel(val, pll->params->iddq_reg, pll);
+		udelay(2);
+	}
+
 	clk_pll_enable_lock(pll);
 
 	val = pll_readl_base(pll);
@@ -326,6 +333,13 @@ static void _clk_pll_disable(struct clk_hw *hw)
 		val &= ~PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE;
 		writel_relaxed(val, pll->pmc + PMC_PLLP_WB0_OVERRIDE);
 	}
+
+	if (pll->params->iddq_reg) {
+		val = pll_readl(pll->params->iddq_reg, pll);
+		val |= BIT(pll->params->iddq_bit_idx);
+		pll_writel(val, pll->params->iddq_reg, pll);
+		udelay(2);
+	}
 }
 
 static int clk_pll_enable(struct clk_hw *hw)
@@ -876,52 +890,6 @@ static int _setup_dynamic_ramp(struct tegra_clk_pll_params *pll_params,
 	return 0;
 }
 
-static int clk_pll_iddq_enable(struct clk_hw *hw)
-{
-	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	unsigned long flags = 0;
-
-	u32 val;
-	int ret;
-
-	if (pll->lock)
-		spin_lock_irqsave(pll->lock, flags);
-
-	val = pll_readl(pll->params->iddq_reg, pll);
-	val &= ~BIT(pll->params->iddq_bit_idx);
-	pll_writel(val, pll->params->iddq_reg, pll);
-	udelay(2);
-
-	_clk_pll_enable(hw);
-
-	ret = clk_pll_wait_for_lock(pll);
-
-	if (pll->lock)
-		spin_unlock_irqrestore(pll->lock, flags);
-
-	return 0;
-}
-
-static void clk_pll_iddq_disable(struct clk_hw *hw)
-{
-	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	unsigned long flags = 0;
-	u32 val;
-
-	if (pll->lock)
-		spin_lock_irqsave(pll->lock, flags);
-
-	_clk_pll_disable(hw);
-
-	val = pll_readl(pll->params->iddq_reg, pll);
-	val |= BIT(pll->params->iddq_bit_idx);
-	pll_writel(val, pll->params->iddq_reg, pll);
-	udelay(2);
-
-	if (pll->lock)
-		spin_unlock_irqrestore(pll->lock, flags);
-}
-
 static int _calc_dynamic_ramp_rate(struct clk_hw *hw,
 				struct tegra_clk_pll_freq_table *cfg,
 				unsigned long rate, unsigned long parent_rate)
@@ -1518,8 +1486,8 @@ struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
 	defined(CONFIG_ARCH_TEGRA_132_SOC)
 static const struct clk_ops tegra_clk_pllxc_ops = {
 	.is_enabled = clk_pll_is_enabled,
-	.enable = clk_pll_iddq_enable,
-	.disable = clk_pll_iddq_disable,
+	.enable = clk_pll_enable,
+	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
 	.round_rate = clk_pll_ramp_round_rate,
 	.set_rate = clk_pllxc_set_rate,
@@ -1527,8 +1495,8 @@ static const struct clk_ops tegra_clk_pllxc_ops = {
 
 static const struct clk_ops tegra_clk_pllm_ops = {
 	.is_enabled = clk_pll_is_enabled,
-	.enable = clk_pll_iddq_enable,
-	.disable = clk_pll_iddq_disable,
+	.enable = clk_pll_enable,
+	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
 	.round_rate = clk_pll_ramp_round_rate,
 	.set_rate = clk_pllm_set_rate,
@@ -1545,8 +1513,8 @@ static const struct clk_ops tegra_clk_pllc_ops = {
 
 static const struct clk_ops tegra_clk_pllre_ops = {
 	.is_enabled = clk_pll_is_enabled,
-	.enable = clk_pll_iddq_enable,
-	.disable = clk_pll_iddq_disable,
+	.enable = clk_pll_enable,
+	.disable = clk_pll_disable,
 	.recalc_rate = clk_pllre_recalc_rate,
 	.round_rate = clk_pllre_round_rate,
 	.set_rate = clk_pllre_set_rate,
@@ -1815,8 +1783,8 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
 static const struct clk_ops tegra_clk_pllss_ops = {
 	.is_enabled = clk_pll_is_enabled,
-	.enable = clk_pll_iddq_enable,
-	.disable = clk_pll_iddq_disable,
+	.enable = clk_pll_enable,
+	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
 	.round_rate = clk_pll_ramp_round_rate,
 	.set_rate = clk_pllxc_set_rate,
-- 
1.7.9.5
