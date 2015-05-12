From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v5 17/21] clk: tegra: pll: Add logic for SS
Date: Tue, 12 May 2015 13:24:00 -0400
Message-ID: <1431451444-23155-19-git-send-email-rklein@nvidia.com>
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

Add some logic for Spread Spectrum control. It is used in conjuncture
with SDM fractional dividers. SSC has to be disabled when we configure
the divider settings.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
v5:
  - Reorderd Patch so set_defaults logic is present already

 drivers/clk/tegra/clk-pll.c |   25 ++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h     |    4 ++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 36aa2a95fac0..727fedff824d 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -648,6 +648,26 @@ static void _update_pll_cpcon(struct tegra_clk_pll *pll,
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
@@ -666,8 +686,10 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 			return 0;
 	}
 
-	if (state)
+	if (state) {
+		pll_clk_stop_ss(pll);
 		_clk_pll_disable(hw);
+	}
 
 	if (!pll->params->defaults_set && pll->params->set_defaults)
 		pll->params->set_defaults(pll);
@@ -680,6 +702,7 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	if (state) {
 		_clk_pll_enable(hw);
 		ret = clk_pll_wait_for_lock(pll);
+		pll_clk_start_ss(pll);
 	}
 
 	return ret;
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 38b4c95cfb2f..32ce32a056ca 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -184,6 +184,8 @@ struct tegra_clk_pll;
  * @sdm_din_mask:		Mask of SDM divider bits
  * @sdm_ctrl_reg:		Register offset where SDM enable is
  * @sdm_ctrl_en_mask:		Mask of SDM enable bit
+ * @ssc_ctrl_reg:		Register offset where SSC settings are
+ * @ssc_ctrl_en_mask:		Mask of SSC enable bit
  * @aux_reg:			AUX register offset
  * @dyn_ramp_reg:		Dynamic ramp control register offset
  * @ext_misc_reg:		Miscellaneous control register offsets
@@ -251,6 +253,8 @@ struct tegra_clk_pll_params {
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
