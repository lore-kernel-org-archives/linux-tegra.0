From: Robert Yang <decatf@gmail.com>
Subject: [PATCH V2] clk: tegra: Return the exact clock rate from clk_round_rate
Date: Tue, 25 Sep 2018 17:49:40 -0400
Message-ID: <20180925214940.15188-1-decatf@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Yang <decatf@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The current behavior is that clk_round_rate would return the same clock
rate passed to it for valid PLL configurations. This change will return
the exact rate the PLL will provide in accordance with clk API.

Signed-off-by: Robert Yang <decatf@gmail.com>
---
Changes in V2:
 - Move input divider (m == 0) check into the cfg constraints check
   condition. Forgo adding WARN_ON and avoid using 0 input divider
   all together.

 drivers/clk/tegra/clk-pll.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 17a058c3bbc1..2a800a9c56e6 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -589,12 +589,13 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	cfg->n = cfg->output_rate / cfreq;
 	cfg->cpcon = OUT_OF_TABLE_CPCON;
 
-	if (cfg->m > divm_max(pll) || cfg->n > divn_max(pll) ||
-	    (1 << p_div) > divp_max(pll)
-	    || cfg->output_rate > pll->params->vco_max) {
+	if (cfg->m == 0 || cfg->m > divm_max(pll) ||
+	    cfg->n > divn_max(pll) || (1 << p_div) > divp_max(pll) ||
+	    cfg->output_rate > pll->params->vco_max) {
 		return -EINVAL;
 	}
 
+	cfg->output_rate = cfg->n * DIV_ROUND_UP(parent_rate, cfg->m);
 	cfg->output_rate >>= p_div;
 
 	if (pll->params->pdiv_tohw) {
-- 
2.17.1
