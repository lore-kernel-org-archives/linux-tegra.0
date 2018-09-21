From: ryang <decatf@gmail.com>
Subject: [PATCH] clk: tegra: Fix an infinite loop when clock rate is zero
Date: Fri, 21 Sep 2018 18:00:37 -0400
Message-ID: <20180921220037.16862-1-decatf@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ryang <decatf@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Calling clk_set_rate or clk_round_rate will lock up the kernel when the
rate is zero. This avoids the infinite loop and uses a slightly more
optimized p divider calculation.

Signed-off-by: ryang <decatf@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 830d1c87fa7c..17a058c3bbc1 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -582,9 +582,8 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	}
 
 	/* Raise VCO to guarantee 0.5% accuracy */
-	for (cfg->output_rate = rate; cfg->output_rate < 200 * cfreq;
-	     cfg->output_rate <<= 1)
-		p_div++;
+	p_div = rate ? fls((200 * cfreq) / rate) : 0;
+	cfg->output_rate = rate << p_div;
 
 	cfg->m = parent_rate / cfreq;
 	cfg->n = cfg->output_rate / cfreq;
-- 
2.17.1
