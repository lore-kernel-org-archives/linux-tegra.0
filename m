From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/11] clk: tegra: Remove needless initializations
Date: Mon, 30 Mar 2015 14:31:08 +0200
Message-ID: <1427718673-32011-7-git-send-email-thierry.reding@gmail.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The ret variable is often explicitly initialized to 0, but there is no
need to do so in many cases because it will immediately be overwritten
with the return value from a function.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index f9950dda102e..05c6d08a6695 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -981,7 +981,7 @@ static int clk_pllxc_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg, old_cfg;
 	unsigned long flags = 0;
-	int ret = 0;
+	int ret;
 
 	ret = _pll_ramp_calc_pll(hw, &cfg, rate, parent_rate);
 	if (ret < 0)
@@ -1005,7 +1005,7 @@ static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *prate)
 {
 	struct tegra_clk_pll_freq_table cfg;
-	int ret = 0, p_div;
+	int ret, p_div;
 	u64 output_rate = *prate;
 
 	ret = _pll_ramp_calc_pll(hw, &cfg, rate, *prate);
@@ -1073,7 +1073,7 @@ static int clk_pllc_enable(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	u32 val;
-	int ret = 0;
+	int ret;
 	unsigned long flags = 0;
 
 	if (pll->lock)
-- 
2.3.2
