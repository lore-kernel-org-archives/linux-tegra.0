From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH RESEND] clk: tegra: Don't enable already enabled PLLs
Date: Fri, 19 Apr 2019 14:42:26 +0300
Message-ID: <20190419114226.8066-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Initially Common Clock Framework isn't aware of the clock-enable status,
this results in enabling of clocks that were enabled by bootloader. This
is not a big deal for a regular clock-gates, but for PLL's it may have
some unpleasant consequences. Thus re-enabling PLLX (the main CPU parent
clock) may result in extra long period of PLL re-locking.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 50 +++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 3e67cbcd80da..6b976b2514f7 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -444,6 +444,9 @@ static int clk_pll_enable(struct clk_hw *hw)
 	unsigned long flags = 0;
 	int ret;
 
+	if (clk_pll_is_enabled(hw))
+		return 0;
+
 	if (pll->lock)
 		spin_lock_irqsave(pll->lock, flags);
 
@@ -940,11 +943,16 @@ static int clk_plle_training(struct tegra_clk_pll *pll)
 static int clk_plle_enable(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	unsigned long input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 	struct tegra_clk_pll_freq_table sel;
+	unsigned long input_rate;
 	u32 val;
 	int err;
 
+	if (clk_pll_is_enabled(hw))
+		return 0;
+
+	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
+
 	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
 		return -EINVAL;
 
@@ -1355,6 +1363,9 @@ static int clk_pllc_enable(struct clk_hw *hw)
 	int ret;
 	unsigned long flags = 0;
 
+	if (clk_pll_is_enabled(hw))
+		return 0;
+
 	if (pll->lock)
 		spin_lock_irqsave(pll->lock, flags);
 
@@ -1567,7 +1578,12 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	u32 val;
 	int ret;
 	unsigned long flags = 0;
-	unsigned long input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
+	unsigned long input_rate;
+
+	if (clk_pll_is_enabled(hw))
+		return 0;
+
+	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
 	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
 		return -EINVAL;
@@ -1704,6 +1720,9 @@ static int clk_pllu_tegra114_enable(struct clk_hw *hw)
 		return -EINVAL;
 	}
 
+	if (clk_pll_is_enabled(hw))
+		return 0;
+
 	input_rate = clk_hw_get_rate(__clk_get_hw(osc));
 
 	if (pll->lock)
@@ -2379,6 +2398,16 @@ struct clk *tegra_clk_register_pllre_tegra210(const char *name,
 	return clk;
 }
 
+static int clk_plle_tegra210_is_enabled(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	u32 val;
+
+	val = pll_readl_base(pll);
+
+	return val & PLLE_BASE_ENABLE ? 1 : 0;
+}
+
 static int clk_plle_tegra210_enable(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
@@ -2386,7 +2415,12 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	u32 val;
 	int ret = 0;
 	unsigned long flags = 0;
-	unsigned long input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
+	unsigned long input_rate;
+
+	if (clk_plle_tegra210_is_enabled(hw))
+		return 0;
+
+	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
 	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
 		return -EINVAL;
@@ -2497,16 +2531,6 @@ static void clk_plle_tegra210_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(pll->lock, flags);
 }
 
-static int clk_plle_tegra210_is_enabled(struct clk_hw *hw)
-{
-	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	u32 val;
-
-	val = pll_readl_base(pll);
-
-	return val & PLLE_BASE_ENABLE ? 1 : 0;
-}
-
 static const struct clk_ops tegra_clk_plle_tegra210_ops = {
 	.is_enabled =  clk_plle_tegra210_is_enabled,
 	.enable = clk_plle_tegra210_enable,
-- 
2.21.0
