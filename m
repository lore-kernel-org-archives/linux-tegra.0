From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clk: Do not recalc rate for reparented clocks
Date: Thu,  5 Mar 2020 18:51:38 +0100
Message-ID: <20200305175138.92075-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

As part of the clock frequency change sequence, a driver may need to
reparent a clock. In that case, the rate will already have been updated
and the cached parent rate will no longer be valid, so just skip the
recalculation.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/clk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ebfc1e2103cb..49d92f4785a2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2079,7 +2079,14 @@ static void clk_change_rate(struct clk_core *core)
 
 	trace_clk_set_rate_complete(core, core->new_rate);
 
-	core->rate = clk_recalc(core, best_parent_rate);
+	/*
+	 * Some drivers need to change the parent of a clock as part of the
+	 * rate change sequence. In that case, best_parent_rate is no longer
+	 * valid. However, reparenting already recalculates the rate for the
+	 * entire clock subtree, so we can safely skip this here.
+	 */
+	if (core->parent == parent)
+		core->rate = clk_recalc(core, best_parent_rate);
 
 	if (core->flags & CLK_SET_RATE_UNGATE) {
 		unsigned long flags;
-- 
2.24.1
