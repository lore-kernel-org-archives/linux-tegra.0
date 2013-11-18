From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5] clk: tegra: Fix clock rate computation
Date: Mon, 18 Nov 2013 16:11:35 +0100
Message-ID: <1384787499-26994-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The PLL output frequency is multiplied during the P-divider computation,
so it needs to be divided by the P-divider again before returning.

This fixes an issue where clk_round_rate() would return the multiplied
frequency instead of the real one after the P-divider.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 193457b81a90..7aec773a5ca6 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -441,6 +441,8 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 		return -EINVAL;
 	}
 
+	cfg->output_rate >>= p_div;
+
 	if (pll->params->pdiv_tohw) {
 		ret = _p_div_to_hw(hw, 1 << p_div);
 		if (ret < 0)
-- 
1.8.4.2
