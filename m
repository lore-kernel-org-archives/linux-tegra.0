From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v6 3/8] clk: tegra: Have EMC clock implement determine_rate()
Date: Tue, 17 Mar 2015 10:36:13 +0100
Message-ID: <1426584991-11110-4-git-send-email-tomeu.vizoso@collabora.com>
References: <1426584991-11110-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426584991-11110-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

instead of round_rate, so we can take rate constraints into account when
choosing the best rate.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/clk/tegra/clk-emc.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 704fff7..615da43 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -117,8 +117,11 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
  * safer since things have EMC rate floors. Also don't touch parent_rate
  * since we don't want the CCF to play with our parent clocks.
  */
-static long emc_round_rate(struct clk_hw *hw, unsigned long rate,
-		    unsigned long *parent_rate)
+static long emc_determine_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long min_rate,
+			       unsigned long max_rate,
+			       unsigned long *best_parent_rate,
+			       struct clk_hw **best_parent_hw)
 {
 	struct tegra_clk_emc *tegra;
 	u8 ram_code = tegra_read_ram_code();
@@ -133,7 +136,15 @@ static long emc_round_rate(struct clk_hw *hw, unsigned long rate,
 
                 timing = tegra->timings + i;
 
-                if (timing->rate >= rate)
+		if (timing->rate > max_rate) {
+			i = min(i, 1);
+			return tegra->timings[i - 1].rate;
+		}
+
+		if (timing->rate < min_rate)
+			continue;
+
+		if (timing->rate >= rate)
                         return timing->rate;
         }
 
@@ -452,7 +463,7 @@ static int load_timings_from_dt(struct tegra_clk_emc *tegra,
 
 static const struct clk_ops tegra_clk_emc_ops = {
 	.recalc_rate = emc_recalc_rate,
-	.round_rate = emc_round_rate,
+	.determine_rate = emc_determine_rate,
 	.set_rate = emc_set_rate,
 	.get_parent = emc_get_parent,
 };
-- 
2.1.0
