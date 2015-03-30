From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/11] clk: tegra: Various whitespace cleanups
Date: Mon, 30 Mar 2015 14:31:06 +0200
Message-ID: <1427718673-32011-5-git-send-email-thierry.reding@gmail.com>
References: <1427718673-32011-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427718673-32011-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Make usage of blank lines as separators more consistent.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c      | 1 +
 drivers/clk/tegra/clk-tegra114.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index bfef9abdf232..f9950dda102e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1223,6 +1223,7 @@ static long _pllre_calc_rate(struct tegra_clk_pll *pll,
 
 	return output_rate;
 }
+
 static int clk_pllre_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index d0766423a5d6..75d8af6213e7 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1263,6 +1263,7 @@ static void tegra114_wait_cpu_in_reset(u32 cpu)
 		cpu_relax();
 	} while (!(reg & (1 << cpu)));  /* check CPU been reset or not */
 }
+
 static void tegra114_disable_cpu_clock(u32 cpu)
 {
 	/* flow controller would take care in the power sequence. */
@@ -1351,7 +1352,6 @@ static void __init tegra114_clock_apply_init_table(void)
 	tegra_init_from_table(init_table, clks, TEGRA114_CLK_CLK_MAX);
 }
 
-
 /**
  * tegra114_car_barrier - wait for pending writes to the CAR to complete
  *
-- 
2.3.2
