From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 4/4] soc/tegra: pmc: Use the new reset APIs to manage reset controllers
Date: Mon,  3 Apr 2017 19:12:02 +0530
Message-ID: <1491226922-20307-5-git-send-email-vivek.gautam@codeaurora.org>
References: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491226922-20307-1-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Make use of reset_control_array_*() set of APIs to manage
an array of reset controllers available with the device.

Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---

Changes since v1:
 - New patch added to the series to enable this driver use the
   newer set of APIs that manage reset control array.

 drivers/soc/tegra/pmc.c | 92 +++++++++++++++++++++----------------------------
 1 file changed, 39 insertions(+), 53 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e233dd5dcab3..d06e624381aa 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -124,7 +124,7 @@ struct tegra_powergate {
 	unsigned int id;
 	struct clk **clks;
 	unsigned int num_clks;
-	struct reset_control **resets;
+	struct reset_control_array *resets;
 	unsigned int num_resets;
 };
 
@@ -348,32 +348,14 @@ static int tegra_powergate_enable_clocks(struct tegra_powergate *pg)
 	return err;
 }
 
-static int tegra_powergate_reset_assert(struct tegra_powergate *pg)
+static inline int tegra_powergate_reset_assert(struct tegra_powergate *pg)
 {
-	unsigned int i;
-	int err;
-
-	for (i = 0; i < pg->num_resets; i++) {
-		err = reset_control_assert(pg->resets[i]);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return reset_control_array_assert(pg->num_resets, pg->resets);
 }
 
-static int tegra_powergate_reset_deassert(struct tegra_powergate *pg)
+static inline int tegra_powergate_reset_deassert(struct tegra_powergate *pg)
 {
-	unsigned int i;
-	int err;
-
-	for (i = 0; i < pg->num_resets; i++) {
-		err = reset_control_deassert(pg->resets[i]);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return reset_control_array_deassert(pg->num_resets, pg->resets);
 }
 
 static int tegra_powergate_power_up(struct tegra_powergate *pg,
@@ -566,12 +548,24 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 	pg.id = id;
 	pg.clks = &clk;
 	pg.num_clks = 1;
-	pg.resets = &rst;
 	pg.num_resets = 1;
 
+	pg.resets = kcalloc(1, sizeof(pg.resets), GFP_KERNEL);
+	if (!pg.resets)
+		return -ENOMEM;
+
+	pg.resets[0].rst = rst;
+
 	err = tegra_powergate_power_up(&pg, false);
-	if (err)
+	if (err) {
 		pr_err("failed to turn on partition %d: %d\n", id, err);
+		goto free_reset;
+	}
+
+	return 0;
+
+free_reset:
+	kfree(pg.resets);
 
 	return err;
 }
@@ -755,44 +749,38 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
 					 struct device_node *np, bool off)
 {
-	struct reset_control *rst;
-	unsigned int i, count;
+	unsigned int count;
 	int err;
 
-	count = of_count_phandle_with_args(np, "resets", "#reset-cells");
-	if (count == 0)
-		return -ENODEV;
+	count = of_reset_control_get_count(np);
+	if (count < 0)
+		return count;
 
-	pg->resets = kcalloc(count, sizeof(rst), GFP_KERNEL);
+	pg->resets = kcalloc(count, sizeof(pg->resets), GFP_KERNEL);
 	if (!pg->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < count; i++) {
-		pg->resets[i] = of_reset_control_get_by_index(np, i);
-		if (IS_ERR(pg->resets[i])) {
-			err = PTR_ERR(pg->resets[i]);
-			goto error;
-		}
+	err = of_reset_control_array_get_exclusive(np, count, pg->resets);
+	if (err) {
+		pr_err("failed to get device resets\n");
+		goto free_reset;
+	}
 
-		if (off)
-			err = reset_control_assert(pg->resets[i]);
-		else
-			err = reset_control_deassert(pg->resets[i]);
+	if (off)
+		err = reset_control_array_assert(count, pg->resets);
+	else
+		err = reset_control_array_deassert(count, pg->resets);
 
-		if (err) {
-			reset_control_put(pg->resets[i]);
-			goto error;
-		}
-	}
+	if (err)
+		goto put_reset;
 
 	pg->num_resets = count;
 
 	return 0;
 
-error:
-	while (i--)
-		reset_control_put(pg->resets[i]);
-
+put_reset:
+	reset_control_array_put(count, pg->resets);
+free_reset:
 	kfree(pg->resets);
 
 	return err;
@@ -885,9 +873,7 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	pm_genpd_remove(&pg->genpd);
 
 remove_resets:
-	while (pg->num_resets--)
-		reset_control_put(pg->resets[pg->num_resets]);
