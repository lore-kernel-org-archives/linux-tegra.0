From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 01/14] clk: tegra: fix SS control on PLL enable/disable
Date: Tue, 25 Jul 2017 13:34:02 +0300
Message-ID: <1500978856-5981-2-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PLL SS was only controlled when setting the PLL rate, not when the PLL itself
is enabled or disabled.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Jon Mayo <jmayo@nvidia.com>
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
