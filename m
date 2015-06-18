From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 17/25] clk: tegra: pll: Add dyn_ramp callback
Date: Thu, 18 Jun 2015 17:28:32 -0400
Message-ID: <1434662920-21469-18-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add a callback to the pll_params for custom dynamic ramping
functions which can be specified per PLL.

Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v6:
  - Added kerneldoc
  - Moved adding dyn_ramp callback from set_defaults patch to this patch
  - Reordered patch

 drivers/clk/tegra/clk-pll.c |    7 +++++++
 drivers/clk/tegra/clk.h     |    4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index f878bc879df2..c6cb22cebac1 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -660,6 +660,13 @@ static int _program_pll(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 
 	_get_pll_mnp(pll, &old_cfg);
 
+	if (state && pll->params->defaults_set && pll->params->dyn_ramp &&
+			(cfg->m == old_cfg.m) && (cfg->p == old_cfg.p)) {
+		ret = pll->params->dyn_ramp(pll, cfg);
+		if (!ret)
+			return 0;
+	}
+
 	if (state)
 		_clk_pll_disable(hw);
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index ae42e3e6a116..d29d095659a2 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -213,6 +213,8 @@ struct tegra_clk_pll;
  *				is already enabled, it will be done the first
  *				time the rate is changed while the PLL is
  *				disabled.
+ * @dyn_ramp:			Callback which can be used to define a custom
+ *				dynamic ramp function for a given PLL.
  *
  * Flags:
  * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
@@ -284,6 +286,8 @@ struct tegra_clk_pll_params {
 	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
 				unsigned long parent_rate);
 	void	(*set_defaults)(struct tegra_clk_pll *pll);
+	int	(*dyn_ramp)(struct tegra_clk_pll *pll,
+			struct tegra_clk_pll_freq_table *cfg);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
