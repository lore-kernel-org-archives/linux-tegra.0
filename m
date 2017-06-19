From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 4/4] soc/tegra: pmc: Use the new reset APIs to manage reset controllers
Date: Mon, 19 Jun 2017 16:34:08 +0200
Message-ID: <20170619143408.15668-5-p.zabel@pengutronix.de>
References: <20170619143408.15668-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170619143408.15668-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Make use of of_reset_control_array_get_exclusive() to manage
an array of reset controllers available with the device.

Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
[p.zabel@pengutronix.de: switch to hidden reset control array]
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v5: updated commit message, added missing SoB
---
 drivers/soc/tegra/pmc.c | 82 ++++++++++++-------------------------------------
 1 file changed, 20 insertions(+), 62 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e233dd5dcab3d..749b218147a19 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -124,8 +124,7 @@ struct tegra_powergate {
 	unsigned int id;
 	struct clk **clks;
 	unsigned int num_clks;
-	struct reset_control **resets;
-	unsigned int num_resets;
+	struct reset_control *reset;
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
+	return reset_control_assert(pg->reset);
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
+	return reset_control_deassert(pg->reset);
 }
 
 static int tegra_powergate_power_up(struct tegra_powergate *pg,
@@ -566,8 +547,7 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 	pg.id = id;
 	pg.clks = &clk;
 	pg.num_clks = 1;
-	pg.resets = &rst;
-	pg.num_resets = 1;
+	pg.reset = IS_ERR(rst) ? NULL : rst;
 
 	err = tegra_powergate_power_up(&pg, false);
 	if (err)
@@ -755,45 +735,26 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
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
+	pg->reset = of_reset_control_array_get_exclusive(np);
+	if (IS_ERR(pg->reset)) {
+		pr_err("failed to get device resets\n");
+		return PTR_ERR(pg->reset);
 	}
 
-	pg->num_resets = count;
+	if (off)
+		err = reset_control_assert(pg->reset);
+	else
+		err = reset_control_deassert(pg->reset);
 
-	return 0;
+	if (err)
+		goto put_reset;
 
-error:
-	while (i--)
-		reset_control_put(pg->resets[i]);
+	return 0;
 
-	kfree(pg->resets);
+put_reset:
+	reset_control_put(pg->reset);
 
 	return err;
 }
@@ -885,10 +846,7 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	pm_genpd_remove(&pg->genpd);
 
 remove_resets:
-	while (pg->num_resets--)
-		reset_control_put(pg->resets[pg->num_resets]);
-
-	kfree(pg->resets);
+	reset_control_put(pg->reset);
 
 remove_clks:
 	while (pg->num_clks--)
-- 
2.11.0
