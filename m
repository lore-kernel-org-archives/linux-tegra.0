From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 18/25] clk: tegra: pll: Add logic for SS
Date: Thu, 18 Jun 2015 17:28:33 -0400
Message-ID: <1434662920-21469-19-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add some logic for Spread Spectrum control. It is used in conjuncture
with SDM fractional dividers. SSC has to be disabled when we configure
the divider settings.

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v5:
  - Reorderd Patch so set_defaults logic is present already

 drivers/clk/tegra/clk-pll.c |   25 ++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h     |    4 ++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c6cb22cebac1..da356fcc7eeb 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -649,6 +649,26 @@ static void _update_pll_cpcon(struct tegra_clk_pll *pll,
 	pll_writel_misc(val, pll);
 }
 
+static void pll_clk_start_ss(struct tegra_clk_pll *pll)
+{
+	if (pll->params->defaults_set && pll->params->ssc_ctrl_reg) {
+		u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
+
+		val |= pll->params->ssc_ctrl_en_mask;
+		pll_writel(val, pll->params->ssc_ctrl_reg, pll);
+	}
+}
+
+static void pll_clk_stop_ss(struct tegra_clk_pll *pll)
+{
+	if (pll->params->defaults_set && pll->params->ssc_ctrl_reg) {
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
@@ -667,8 +687,10 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 			return 0;
 	}
 
-	if (state)
+	if (state) {
+		pll_clk_stop_ss(pll);
 		_clk_pll_disable(hw);
+	}
 
 	if (!pll->params->defaults_set && pll->params->set_defaults)
 		pll->params->set_defaults(pll);
@@ -681,6 +703,7 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	if (state) {
 		_clk_pll_enable(hw);
 		ret = clk_pll_wait_for_lock(pll);
+		pll_clk_start_ss(pll);
 	}
 
 	return ret;
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index d29d095659a2..87239298043c 100644
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
@@ -262,6 +264,8 @@ struct tegra_clk_pll_params {
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
