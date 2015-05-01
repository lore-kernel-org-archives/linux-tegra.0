From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v3 11/20] clk: tegra: pll: Add code to handle if resets are supported by PLL
Date: Fri, 1 May 2015 14:53:58 -0400
Message-ID: <1430506447-29074-12-git-send-email-rklein@nvidia.com>
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430506447-29074-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

If a PLL has a reset_reg specified, properly handle that in the
enable/disable logic paths.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
v2:
  - Moved reset logic to _clk_pll_enable/disable as well

 drivers/clk/tegra/clk-pll.c |   12 ++++++++++++
 drivers/clk/tegra/clk.h     |    2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 0b9cbe12a3eb..3c40a8136136 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -311,6 +311,12 @@ static void _clk_pll_enable(struct clk_hw *hw)
 		udelay(2);
 	}
 
+	if (pll->params->reset_reg) {
+		val = pll_readl(pll->params->reset_reg, pll);
+		val &= ~BIT(pll->params->reset_bit_idx);
+		pll_writel(val, pll->params->reset_reg, pll);
+	}
+
 	clk_pll_enable_lock(pll);
 
 	val = pll_readl_base(pll);
@@ -343,6 +349,12 @@ static void _clk_pll_disable(struct clk_hw *hw)
 		writel_relaxed(val, pll->pmc + PMC_PLLP_WB0_OVERRIDE);
 	}
 
+	if (pll->params->reset_reg) {
+		val = pll_readl(pll->params->reset_reg, pll);
+		val |= BIT(pll->params->reset_bit_idx);
+		pll_writel(val, pll->params->reset_reg, pll);
+	}
+
 	if (pll->params->iddq_reg) {
 		val = pll_readl(pll->params->iddq_reg, pll);
 		val |= BIT(pll->params->iddq_bit_idx);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index b009c803f277..142999f1cd24 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -217,6 +217,8 @@ struct tegra_clk_pll_params {
 	u32		lock_enable_bit_idx;
 	u32		iddq_reg;
 	u32		iddq_bit_idx;
+	u32		reset_reg;
+	u32		reset_bit_idx;
 	u32		sdm_din_reg;
 	u32		sdm_din_mask;
 	u32		sdm_ctrl_reg;
-- 
1.7.9.5
