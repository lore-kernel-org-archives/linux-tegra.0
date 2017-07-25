From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 11/14] clk: tegra: Update T210 PLLSS (D2/DP) registration
Date: Tue, 25 Jul 2017 13:34:12 +0300
Message-ID: <1500978856-5981-12-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Frid <afrid@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Alex Frid <afrid@nvidia.com>

Remove from Tegra210 PLLSS registration code sections that
- attempt to set PLL minimum rate (unnecessary, and dangerous if PLL
  is already enabled on boot)
- apply pre-Tegra210 defaults settings
- check IDDQ setting (duplicated with Tegra210 PLLSS check defaults)

Replaced setting of reference clock with check that default oscillator
selection is not changed, and failed registration otherwise as validation
was only done with the oscillator as the reference clock.

Reordered registration, so that PLL initialization is called after
VCOmin adjustment.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 48 +++++++++------------------------------------
 1 file changed, 9 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 02f34e6..c6bce4a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2618,10 +2618,8 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 {
 	struct tegra_clk_pll *pll;
 	struct clk *clk, *parent;
-	struct tegra_clk_pll_freq_table cfg;
 	unsigned long parent_rate;
 	u32 val;
-	int i;
 
 	if (!pll_params->div_nmp)
 		return ERR_PTR(-EINVAL);
@@ -2633,13 +2631,11 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 		return ERR_PTR(-EINVAL);
 	}
 
-	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
-	if (IS_ERR(pll))
-		return ERR_CAST(pll);
-
-	val = pll_readl_base(pll);
-	val &= ~PLLSS_REF_SRC_SEL_MASK;
-	pll_writel_base(val, pll);
+	val = readl_relaxed(clk_base + pll_params->base_reg);
+	if (val & PLLSS_REF_SRC_SEL_MASK) {
+		WARN(1, "not supported reference clock for %s\n", name);
+		return ERR_PTR(-EINVAL);
+	}
 
 	parent_rate = clk_get_rate(parent);
 
@@ -2649,36 +2645,10 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 		pll_params->vco_min = pll_params->adjust_vco(pll_params,
 							     parent_rate);
 
-	/* initialize PLL to minimum rate */
-
-	cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
-	cfg.n = cfg.m * pll_params->vco_min / parent_rate;
-
-	for (i = 0; pll_params->pdiv_tohw[i].pdiv; i++)
-		;
-	if (!i) {
-		kfree(pll);
-		return ERR_PTR(-EINVAL);
-	}
-
-	cfg.p = pll_params->pdiv_tohw[i-1].hw_val;
-
-	_update_pll_mnp(pll, &cfg);
-
-	pll_writel_misc(PLLSS_MISC_DEFAULT, pll);
-
-	val = pll_readl_base(pll);
-	if (val & PLL_BASE_ENABLE) {
-		if (val & BIT(pll_params->iddq_bit_idx)) {
-			WARN(1, "%s is on but IDDQ set\n", name);
-			kfree(pll);
-			return ERR_PTR(-EINVAL);
-		}
-	} else
-		val |= BIT(pll_params->iddq_bit_idx);
-
-	val &= ~PLLSS_LOCK_OVERRIDE;
-	pll_writel_base(val, pll);
+	pll_params->flags |= TEGRA_PLL_BYPASS;
+	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
+	if (IS_ERR(pll))
+		return ERR_CAST(pll);
 
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
 					&tegra_clk_pll_ops);
-- 
1.9.1
