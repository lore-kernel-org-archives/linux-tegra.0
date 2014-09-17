From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH] clk: tegra: Make clock initialization more robust
Date: Wed, 17 Sep 2014 11:34:17 +0200
Message-ID: <1410946457-24669-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Don't abort clock initialization if we cannot match an entry in
tegra_clk_init_table to a valid entry in the clk array.

Also log a corresponding error message.

This was discovered when testing a patch that removed the EMC clock from
tegra124_clks but left a mention in tegra_clk_init_table.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/clk/tegra/clk.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index d5963f6..562c911 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -206,8 +206,13 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 
 	for (; tbl->clk_id < clk_max; tbl++) {
 		clk = clks[tbl->clk_id];
-		if (IS_ERR_OR_NULL(clk))
-			return;
+		if (IS_ERR_OR_NULL(clk)) {
+			pr_err("%s: invalid entry %ld in clks array for id %d\n",
+			       __func__, PTR_ERR(clk), tbl->clk_id);
+			WARN_ON(1);
+
+			continue;
+		}
 
 		if (tbl->parent_id < clk_max) {
 			struct clk_core *parent = clks[tbl->parent_id];
-- 
1.9.3
