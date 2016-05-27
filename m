From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 10/11] clk: Show CRITICAL clks in clk_summary output
Date: Fri, 27 May 2016 16:38:13 -0400
Message-ID: <1464381494-27096-11-git-send-email-rklein@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add a '^' character to the beginning of clk entries that are for
CRITICAL clks.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/clk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 874c7dd8ef66..22dd0ca1e491 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1948,8 +1948,9 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
 	if (!c)
 		return;
 
-	seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
-		   level * 3 + 1, "",
+	seq_printf(s, "%s%*s%-*s %11d %12d %11lu %10lu %-3d\n",
+		   (c->flags & CLK_IS_CRITICAL ? "^" : ""),
+		   level * 3 + (c->flags & CLK_IS_CRITICAL ? 0 : 1), "",
 		   30 - level * 3, c->name,
 		   c->enable_count, c->prepare_count, clk_core_get_rate(c),
 		   clk_core_get_accuracy(c), clk_core_get_phase(c));
@@ -1985,6 +1986,8 @@ static int clk_summary_show(struct seq_file *s, void *data)
 
 	clk_prepare_unlock();
 
+	seq_puts(s, "clocks starting with ^ are marked as CRITICAL\n");
+
 	return 0;
 }
 
-- 
1.9.1
