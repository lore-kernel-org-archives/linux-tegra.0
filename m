From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: [PATCH v2 26/34] clk: tegra: pll: change clk_pll_round_rate() return logic
Date: Mon,  1 Jan 2018 19:34:52 +0000
Message-ID: <1514835300-381-12-git-send-email-pure.logic@nexus-software.ie>
References: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514835300-381-1-git-send-email-pure.logic@nexus-software.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Rhyland Klein <rklein@nvidia.com>
Cc: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index b4a7d30..0a3edb0 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -839,7 +839,7 @@ static unsigned long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (_get_table_rate(hw, &cfg, rate, *prate) &&
 	    pll->params->calc_rate(hw, &cfg, rate, *prate))
-		return -EINVAL;
+		return 0;
 
 	return cfg.output_rate;
 }
-- 
2.7.4
