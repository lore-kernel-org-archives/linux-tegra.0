From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 09/19] clk: tegra: pll: Add logic for SS
Date: Wed, 29 Apr 2015 13:21:39 -0400
Message-ID: <1430328109-537-10-git-send-email-rklein@nvidia.com>
References: <1430328109-537-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430328109-537-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

Add some logic for Spread Spectrum control. It is used in conjuncture
with SDM fractional dividers. SSC has to be disabled when we configure
the divider settings.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c |   25 ++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h     |    2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c64b75185d6b..2a559408cee1 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -621,6 +621,26 @@ static void _update_pll_cpcon(struct tegra_clk_pll *pll,
 	pll_writel_misc(val, pll);
 }
 
+static void pll_clk_start_ss(struct tegra_clk_pll *pll)
+{
+	if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {
+		u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
+
+		val |= pll->params->ssc_ctrl_en_mask;
+		pll_writel(val, pll->params->ssc_ctrl_reg, pll);
+	}
+}
+
+static void pll_clk_stop_ss(struct tegra_clk_pll *pll)
+{
+	if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {
+		u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
+
+		val &= ~pll->params->ssc_ctrl_en_mask;
+		pll_writel(val, pll->params->ssc_ctrl_reg, pll);
+	}
+}
+
 static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 			unsigned long rate)
 {
@@ -629,8 +649,10 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 
 	state = clk_pll_is_enabled(hw);
 
-	if (state)
+	if (state) {
+		pll_clk_stop_ss(pll);
 		_clk_pll_disable(hw);
+	}
 
 	_update_pll_mnp(pll, cfg);
 
@@ -640,6 +662,7 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	if (state) {
 		_clk_pll_enable(hw);
 		ret = clk_pll_wait_for_lock(pll);
+		pll_clk_start_ss(pll);
 	}
 
 	return ret;
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index ef5754f64622..f3c1f07d5332 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -219,6 +219,8 @@ struct tegra_clk_pll_params {
 	u32		sdm_din_mask;
 	u32		sdm_ctrl_reg;
 	u32		sdm_ctrl_en_mask;
+	u32		ssc_ctrl_reg;
+	u32		ssc_ctrl_en_mask;
 	u32		aux_reg;
 	u32		dyn_ramp_reg;
 	u32		ext_misc_reg[MAX_PLL_MISC_REG_COUNT];
-- 
1.7.9.5
