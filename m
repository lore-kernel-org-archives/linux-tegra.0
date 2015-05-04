From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 11/20] clk: tegra: pll: Add code to handle if resets are supported by PLL
Date: Mon, 4 May 2015 12:37:31 -0400
Message-ID: <1430757460-9478-12-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

If a PLL has a reset_reg specified, properly handle that in the
enable/disable logic paths.

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
index b63ef31a2d7a..0146c91df635 100644
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
