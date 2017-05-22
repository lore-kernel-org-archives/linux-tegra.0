From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v4 4/4] soc/tegra: pmc: Use the new reset APIs to manage reset controllers
Date: Mon, 22 May 2017 16:53:27 +0530
Message-ID: <1495452207-6129-5-git-send-email-vivek.gautam@codeaurora.org>
References: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, jonathanh@nvidia.com, balbi@kernel.org, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Make use of reset_control_array_*() set of APIs to manage
an array of reset controllers available with the device.

Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/soc/tegra/pmc.c | 91 +++++++++++++++++--------------------------------
 1 file changed, 31 insertions(+), 60 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e233dd5dcab3..668f5d3d3635 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -124,8 +124,8 @@ struct tegra_powergate {
 	unsigned int id;
 	struct clk **clks;
 	unsigned int num_clks;
-	struct reset_control **resets;
-	unsigned int num_resets;
+	struct reset_control *reset;
+	struct reset_control_array *resets;
 };
 
 struct tegra_io_pad_soc {
@@ -348,32 +348,20 @@ static int tegra_powergate_enable_clocks(struct tegra_powergate *pg)
 	return err;
 }
 
-static int tegra_powergate_reset_assert(struct tegra_powergate *pg)
+static inline int tegra_powergate_reset_assert(struct tegra_powergate *pg)
 {
-	unsigned int i;
-	int err;
+	if (!IS_ERR_OR_NULL(pg->reset))
+		return reset_control_assert(pg->reset);
 
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
+	if (!IS_ERR_OR_NULL(pg->reset))
+		return reset_control_deassert(pg->reset);
 
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
@@ -566,8 +554,13 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 	pg.id = id;
 	pg.clks = &clk;
 	pg.num_clks = 1;
-	pg.resets = &rst;
-	pg.num_resets = 1;
+
+	/*
+	 * Handle the reset control passed from the client separately.
+	 * So, the pmc will either have this single reset control, or,
+	 * have a list of reset controls managed by the driver on its own.
+	 */
+	pg.reset = rst;
 
 	err = tegra_powergate_power_up(&pg, false);
 	if (err)
@@ -755,45 +748,26 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
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
@@ -885,10 +859,7 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
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
