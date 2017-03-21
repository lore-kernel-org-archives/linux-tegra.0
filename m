From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] soc/tegra: pmc: Don't allocate struct tegra_powergate on stack
Date: Tue, 21 Mar 2017 10:54:53 +0530
Message-ID: <3fe40fcd427e49cbeac31e14721fea569d230b6e.1490073884.git.viresh.kumar@linaro.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The size of the struct tegra_powergate is quite big and if any more
fields are added to the internal genpd structure, following warnings are
thrown:

drivers/soc/tegra/pmc.c:577:1: warning: the frame size of 1176 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Avoid such warnings by allocating the structure dynamically.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e233dd5dcab3..c94196b939a4 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -557,22 +557,28 @@ EXPORT_SYMBOL(tegra_powergate_remove_clamping);
 int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 				      struct reset_control *rst)
 {
-	struct tegra_powergate pg;
+	struct tegra_powergate *pg;
 	int err;
 
 	if (!tegra_powergate_is_available(id))
 		return -EINVAL;
 
-	pg.id = id;
-	pg.clks = &clk;
-	pg.num_clks = 1;
-	pg.resets = &rst;
-	pg.num_resets = 1;
+	pg = kzalloc(sizeof(*pg), GFP_KERNEL);
+	if (!pg)
+		return -ENOMEM;
+
+	pg->id = id;
+	pg->clks = &clk;
+	pg->num_clks = 1;
+	pg->resets = &rst;
+	pg->num_resets = 1;
 
-	err = tegra_powergate_power_up(&pg, false);
+	err = tegra_powergate_power_up(pg, false);
 	if (err)
 		pr_err("failed to turn on partition %d: %d\n", id, err);
 
+	kfree(pg);
+
 	return err;
 }
 EXPORT_SYMBOL(tegra_powergate_sequence_power_up);
-- 
2.12.0.432.g71c3a4f4ba37
