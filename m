From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 8/8] clk: tegra: show clock name in error from _calc_rate
Date: Fri, 20 Jul 2018 14:45:32 +0100
Message-ID: <20180720134532.13148-9-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

If the _calc_rate() function fails in the tegra clock code, print
the name of the clock that failed to allow debugging.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/tegra/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 830d1c87fa7c..d1339a6139a1 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -576,8 +576,8 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 		cfreq = parent_rate / (parent_rate / 1000000);
 		break;
 	default:
-		pr_err("%s Unexpected reference rate %lu\n",
-		       __func__, parent_rate);
+		pr_err("%s Unexpected reference rate %lu for %s\n",
+		       __func__, parent_rate, __clk_get_name(hw->clk));
 		BUG();
 	}
 
-- 
2.18.0
