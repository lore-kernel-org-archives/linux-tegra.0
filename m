From: ryang <decatf@gmail.com>
Subject: [PATCH] clk: tegra: Return the exact clock rate from clk_round_rate
Date: Fri, 21 Sep 2018 18:01:49 -0400
Message-ID: <20180921220149.17136-1-decatf@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ryang <decatf@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The current behavior is that clk_round_rate would return the same clock
rate passed to it for valid PLL configurations. This change will return
the exact rate the PLL will provide in accordance with clk API.

Signed-off-by: ryang <decatf@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 17a058c3bbc1..36014a6ec42e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -595,7 +595,12 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 		return -EINVAL;
 	}
 
-	cfg->output_rate >>= p_div;
+	if (cfg->m == 0) {
+		cfg->output_rate = 0;
+	} else {
+		cfg->output_rate = cfg->n * DIV_ROUND_UP(parent_rate, cfg->m);
+		cfg->output_rate >>= p_div;
+	}
 
 	if (pll->params->pdiv_tohw) {
 		ret = _p_div_to_hw(hw, 1 << p_div);
-- 
2.17.1
