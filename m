From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 19/25] clk: tegra: pll: Fix _pll_ramp_calc_pll logic and _calc_dynamic_ramp_rate
Date: Thu, 18 Jun 2015 17:28:34 -0400
Message-ID: <1434662920-21469-20-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This removes the conversion from pdiv to hw, which is already taken
care of by _get_table_rate before this code is run. This avoids
incorrectly converting pdiv to hw twice and getting the wrong hw value.

Also set the input_rate in the freq cfg in _calc_dynamic_ramp_rate while
setting all the other fields.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
  - Added fix for _calc_dynamic_ramp_rate where input_rate wasn't ever
    populated in the cfg, which could cause problems later if/when
    accessed.

 drivers/clk/tegra/clk-pll.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index da356fcc7eeb..b27729d046f4 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1034,6 +1034,7 @@ static int _calc_dynamic_ramp_rate(struct clk_hw *hw,
 	cfg->m = _pll_fixed_mdiv(pll->params, parent_rate);
 	cfg->output_rate = rate * p;
 	cfg->n = cfg->output_rate * cfg->m / parent_rate;
+	cfg->input_rate = parent_rate;
 
 	p_div = _p_div_to_hw(hw, p);
 	if (p_div < 0)
@@ -1052,7 +1053,7 @@ static int _pll_ramp_calc_pll(struct clk_hw *hw,
 			      unsigned long rate, unsigned long parent_rate)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	int err = 0, p_div;
+	int err = 0;
 
 	err = _get_table_rate(hw, cfg, rate, parent_rate);
 	if (err < 0)
@@ -1063,11 +1064,6 @@ static int _pll_ramp_calc_pll(struct clk_hw *hw,
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
