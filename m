From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v5 18/21] clk: tegra: pll: Fix _pll_ramp_calc_pll logic and _calc_dynamic_ramp_rate
Date: Tue, 12 May 2015 13:24:01 -0400
Message-ID: <1431451444-23155-20-git-send-email-rklein@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This removes the conversion from pdiv to hw, which is already taken
care of by _get_table_rate before this code is run. This avoids
incorrectly converting pdiv to hw twice and getting the wrong hw value.

Also set the input_rate in the freq cfg in _calc_dynamic_ramp_rate while
setting all the other fields.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v2:
  - Added fix for _calc_dynamic_ramp_rate where input_rate wasn't ever
    populated in the cfg, which could cause problems later if/when
    accessed.

 drivers/clk/tegra/clk-pll.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 727fedff824d..43d7ee4fb603 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1032,6 +1032,7 @@ static int _calc_dynamic_ramp_rate(struct clk_hw *hw,
 	cfg->m = _pll_fixed_mdiv(pll->params, parent_rate);
 	cfg->output_rate = rate * p;
 	cfg->n = cfg->output_rate * cfg->m / parent_rate;
+	cfg->input_rate = parent_rate;
 
 	p_div = _p_div_to_hw(hw, p);
 	if (p_div < 0)
@@ -1050,7 +1051,7 @@ static int _pll_ramp_calc_pll(struct clk_hw *hw,
 			      unsigned long rate, unsigned long parent_rate)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	int err = 0, p_div;
+	int err = 0;
 
 	err = _get_table_rate(hw, cfg, rate, parent_rate);
 	if (err < 0)
@@ -1061,11 +1062,6 @@ static int _pll_ramp_calc_pll(struct clk_hw *hw,
 			err = -EINVAL;
 			goto out;
 		}
-		p_div = _p_div_to_hw(hw, cfg->p);
-		if (p_div < 0)
-			return p_div;
-		else
-			cfg->p = p_div;
 	}
 
 	if (cfg->p >  pll->params->max_p)
-- 
1.7.9.5
