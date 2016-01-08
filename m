From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 7/9] clk: tegra: pll: Do not disable PLLE when under HW control
Date: Fri, 8 Jan 2016 13:37:09 -0500
Message-ID: <1452278231-9546-8-git-send-email-rklein@nvidia.com>
References: <1452278231-9546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452278231-9546-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Kuo <mkuo@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Mark Kuo <mkuo@nvidia.com>

SW should not disable PLLE if PLLE is already put under HW control.

Signed-off-by: Mark Kuo <mkuo@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 65156486889a..d9c3109b75bd 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2012,7 +2012,7 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table sel;
 	u32 val;
-	int ret;
+	int ret = 0;
 	unsigned long flags = 0;
 	unsigned long input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
@@ -2022,16 +2022,14 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	if (pll->lock)
 		spin_lock_irqsave(pll->lock, flags);
 
+	val = pll_readl(pll->params->aux_reg, pll);
+	if (val & PLLE_AUX_SEQ_ENABLE)
+		goto out;
+
 	val = pll_readl_base(pll);
 	val &= ~BIT(30); /* Disable lock override */
 	pll_writel_base(val, pll);
 
-	val = pll_readl(pll->params->aux_reg, pll);
-	val |= PLLE_AUX_ENABLE_SWCTL;
-	val &= ~PLLE_AUX_SEQ_ENABLE;
-	pll_writel(val, pll->params->aux_reg, pll);
-	udelay(1);
-
 	val = pll_readl_misc(pll);
 	val |= PLLE_MISC_LOCK_ENABLE;
 	val |= PLLE_MISC_IDDQ_SW_CTRL;
@@ -2104,15 +2102,25 @@ static void clk_plle_tegra210_disable(struct clk_hw *hw)
 	if (pll->lock)
 		spin_lock_irqsave(pll->lock, flags);
 
+	/* If PLLE HW sequencer is enabled, SW should not disable PLLE */
+	val = pll_readl(pll->params->aux_reg, pll);
+	if (val & PLLE_AUX_SEQ_ENABLE)
+		goto out;
+
 	val = pll_readl_base(pll);
 	val &= ~PLLE_BASE_ENABLE;
 	pll_writel_base(val, pll);
 
+	val = pll_readl(pll->params->aux_reg, pll);
+	val |= PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL;
+	pll_writel(val, pll->params->aux_reg, pll);
+
 	val = pll_readl_misc(pll);
 	val |= PLLE_MISC_IDDQ_SW_CTRL | PLLE_MISC_IDDQ_SW_VALUE;
 	pll_writel_misc(val, pll);
 	udelay(1);
 
+out:
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
 }
-- 
1.9.1
