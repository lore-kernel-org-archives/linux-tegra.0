From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v5 14/21] clk: tegra: pll: Adjust vco_min if SDM present
Date: Tue, 12 May 2015 13:23:57 -0400
Message-ID: <1431451444-23155-16-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

This code makes use of the SDM fractional divider if present to
contrain the allowable programming range of the PLL divider register
bitfields to take advantage of higher frequency granularity that can
be induced by the SDM divider.

Based on original work by Aleksandr Frid <afrid@nvidia.com>

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
v5:
  - Removed whitespace change

 drivers/clk/tegra/clk-pll.c |   28 ++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h     |    2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1dfa1433375d..626466665dde 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1653,6 +1653,10 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
 	if (err)
 		return ERR_PTR(err);
@@ -1691,6 +1695,10 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -1747,6 +1755,10 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLM;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
@@ -2177,6 +2189,10 @@ struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
@@ -2214,6 +2230,10 @@ struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -2261,6 +2281,10 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	/* initialize PLL to minimum rate */
 
 	cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
@@ -2325,6 +2349,10 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLMB;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 7ee764e583f9..330729a822cf 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -269,6 +269,8 @@ struct tegra_clk_pll_params {
 	int	(*calc_rate)(struct clk_hw *hw,
 			struct tegra_clk_pll_freq_table *cfg,
 			unsigned long rate, unsigned long parent_rate);
+	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
+				unsigned long parent_rate);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
