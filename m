From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: fix SS control on PLL enable/disable
Date: Thu, 13 Apr 2017 16:21:07 +0300
Message-ID: <1492089667-27844-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

PLL SS was only controlled when setting the PLL rate, not when the PLL
itself is enabled or disabled. This means that if the PLL rate was set
before the PLL is enabled, SS will not be enabled, even when configured.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 159a854..e9bdb16 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -418,6 +418,26 @@ static void _clk_pll_disable(struct clk_hw *hw)
 	}
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
 static int clk_pll_enable(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
@@ -431,6 +451,8 @@ static int clk_pll_enable(struct clk_hw *hw)
 
 	ret = clk_pll_wait_for_lock(pll);
 
+	pll_clk_start_ss(pll);
+
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
 
@@ -445,6 +467,8 @@ static void clk_pll_disable(struct clk_hw *hw)
 	if (pll->lock)
 		spin_lock_irqsave(pll->lock, flags);
 
+	pll_clk_stop_ss(pll);
+
 	_clk_pll_disable(hw);
 
 	if (pll->lock)
@@ -716,26 +740,6 @@ static void _update_pll_cpcon(struct tegra_clk_pll *pll,
 	pll_writel_misc(val, pll);
 }
 
-static void pll_clk_start_ss(struct tegra_clk_pll *pll)
-{
-	if (pll->params->defaults_set && pll->params->ssc_ctrl_reg) {
-		u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
-
-		val |= pll->params->ssc_ctrl_en_mask;
-		pll_writel(val, pll->params->ssc_ctrl_reg, pll);
-	}
-}
-
-static void pll_clk_stop_ss(struct tegra_clk_pll *pll)
-{
-	if (pll->params->defaults_set && pll->params->ssc_ctrl_reg) {
-		u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
-
-		val &= ~pll->params->ssc_ctrl_en_mask;
-		pll_writel(val, pll->params->ssc_ctrl_reg, pll);
-	}
-}
-
 static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 			unsigned long rate)
 {
-- 
1.9.1
