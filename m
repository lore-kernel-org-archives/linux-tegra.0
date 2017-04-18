From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH V3 4/4] soc/tegra: pmc: Use the new reset APIs to manage reset controllers
Date: Tue, 18 Apr 2017 16:51:28 +0530
Message-ID: <1492514488-27385-5-git-send-email-vivek.gautam@codeaurora.org>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: p.zabel@pengutronix.de, swarren@wwwdotorg.org, balbi@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, thierry.reding@gmail.com, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Make use of reset_control_array_*() set of APIs to manage
an array of reset controllers available with the device.

Cc: Thierry Reding <treding@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/soc/tegra/pmc.c | 99 ++++++++++++++++++-------------------------------
 1 file changed, 36 insertions(+), 63 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e233dd5dcab3..4d039fa3db1b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -124,8 +124,7 @@ struct tegra_powergate {
 	unsigned int id;
 	struct clk **clks;
 	unsigned int num_clks;
-	struct reset_control **resets;
-	unsigned int num_resets;
+	struct reset_control_array *resets;
 };
 
 struct tegra_io_pad_soc {
@@ -348,32 +347,14 @@ static int tegra_powergate_enable_clocks(struct tegra_powergate *pg)
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
+	return reset_control_array_assert(pg->resets);
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
+	return reset_control_array_deassert(pg->resets);
 }
 
 static int tegra_powergate_power_up(struct tegra_powergate *pg,
@@ -558,6 +539,7 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 				      struct reset_control *rst)
 {
 	struct tegra_powergate pg;
+	struct reset_control_array *resets;
 	int err;
 
 	if (!tegra_powergate_is_available(id))
@@ -566,12 +548,25 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 	pg.id = id;
 	pg.clks = &clk;
 	pg.num_clks = 1;
-	pg.resets = &rst;
-	pg.num_resets = 1;
+
+	resets = kzalloc(sizeof(*resets) + sizeof(resets->rstc[0]) * 1,
+			 GFP_KERNEL);
+	if (!resets)
+		return -ENOMEM;
+
+	resets->rstc[0] = rst;
+	pg.resets = resets;
 
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
+	kfree(resets);
 
 	return err;
 }
@@ -755,45 +750,26 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
 					 struct device_node *np, bool off)
 {
-	struct reset_control *rst;
-	unsigned int i, count;
 	int err;
 
-	count = of_count_phandle_with_args(np, "resets", "#reset-cells");
-	if (count == 0)
-		return -ENODEV;
-
-	pg->resets = kcalloc(count, sizeof(rst), GFP_KERNEL);
-	if (!pg->resets)
-		return -ENOMEM;
-
-	for (i = 0; i < count; i++) {
-		pg->resets[i] = of_reset_control_get_by_index(np, i);
-		if (IS_ERR(pg->resets[i])) {
-			err = PTR_ERR(pg->resets[i]);
-			goto error;
-		}
-
-		if (off)
-			err = reset_control_assert(pg->resets[i]);
-		else
-			err = reset_control_deassert(pg->resets[i]);
-
-		if (err) {
-			reset_control_put(pg->resets[i]);
-			goto error;
-		}
+	pg->resets = of_reset_control_array_get_exclusive(np);
+	if (IS_ERR(pg->resets)) {
+		pr_err("failed to get device resets\n");
+		return PTR_ERR(pg->resets);
 	}
 
-	pg->num_resets = count;
+	if (off)
+		err = reset_control_array_assert(pg->resets);
+	else
+		err = reset_control_array_deassert(pg->resets);
 
-	return 0;
+	if (err)
+		goto put_reset;
 
-error:
-	while (i--)
-		reset_control_put(pg->resets[i]);
+	return 0;
 
-	kfree(pg->resets);
+put_reset:
+	reset_control_array_put(pg->resets);
 
 	return err;
 }
@@ -885,10 +861,7 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	pm_genpd_remove(&pg->genpd);
 
 remove_resets:
-	while (pg->num_resets--)
-		reset_control_put(pg->resets[pg->num_resets]);
-
-	kfree(pg->resets);
+	reset_control_array_put(pg->resets);
 
 remove_clks:
 	while (pg->num_clks--)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
