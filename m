From: Mikko Perttunen <mikko.perttunen@kapsi.fi>
Subject: [PATCH] clk: tegra: Unlock top rates for Tegra124 DFLL clock
Date: Tue, 15 Sep 2015 12:55:15 +0300
Message-ID: <1442310915-15475-1-git-send-email-mikko.perttunen@kapsi.fi>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, thierry.reding@gmail.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mikko.perttunen@kapsi.fi>
List-Id: linux-tegra@vger.kernel.org

The new determine_rate prototype allows for clock rates exceeding
2^31-1 Hz to be used. Switch the DFLL clock to use determine_rate
instead of round_rate and unlock the top rates supported by the
Tegra124.

Signed-off-by: Mikko Perttunen <mikko.perttunen@kapsi.fi>
---
 drivers/clk/tegra/clk-dfll.c | 15 ++++++++-------
 drivers/clk/tegra/cvb.c      |  7 -------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 4adff56..7bd309c 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1004,24 +1004,25 @@ static unsigned long dfll_clk_recalc_rate(struct clk_hw *hw,
 	return td->last_unrounded_rate;
 }
 
-static long dfll_clk_round_rate(struct clk_hw *hw,
-				unsigned long rate,
-				unsigned long *parent_rate)
+/* Must use determine_rate since it allows for rates exceeding 2^31-1 */
+static int dfll_clk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *clk_req)
 {
 	struct tegra_dfll *td = clk_hw_to_dfll(hw);
 	struct dfll_rate_req req;
 	int ret;
 
-	ret = dfll_calculate_rate_request(td, &req, rate);
+	ret = dfll_calculate_rate_request(td, &req, clk_req->rate);
 	if (ret)
 		return ret;
 
 	/*
-	 * Don't return the rounded rate, since it doesn't really matter as
+	 * Don't set the rounded rate, since it doesn't really matter as
 	 * the output rate will be voltage controlled anyway, and cpufreq
 	 * freaks out if any rounding happens.
 	 */
-	return rate;
+
+	return 0;
 }
 
 static int dfll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1037,7 +1038,7 @@ static const struct clk_ops dfll_clk_ops = {
 	.enable		= dfll_clk_enable,
 	.disable	= dfll_clk_disable,
 	.recalc_rate	= dfll_clk_recalc_rate,
-	.round_rate	= dfll_clk_round_rate,
+	.determine_rate	= dfll_clk_determine_rate,
 	.set_rate	= dfll_clk_set_rate,
 };
 
diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
index 0204e08..69c74ee 100644
--- a/drivers/clk/tegra/cvb.c
+++ b/drivers/clk/tegra/cvb.c
@@ -78,13 +78,6 @@ static int build_opp_table(const struct cvb_table *d,
 		if (!table->freq || (table->freq > max_freq))
 			break;
 
-		/*
-		 * FIXME after clk_round_rate/clk_determine_rate prototypes
-		 * have been updated
-		 */
-		if (table->freq & (1<<31))
-			continue;
-
 		dfll_mv = get_cvb_voltage(
 			speedo_value, d->speedo_scale, &table->coefficients);
 		dfll_mv = round_cvb_voltage(dfll_mv, d->voltage_scale, align);
-- 
2.5.0
