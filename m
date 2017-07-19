From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v7 4/4] soc/tegra: pmc: Use the new reset APIs to manage reset controllers
Date: Wed, 19 Jul 2017 17:59:08 +0200
Message-ID: <1500479948-29988-5-git-send-email-p.zabel@pengutronix.de>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500479948-29988-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Make use of of_reset_control_array_get_exclusive() to manage
an array of reset controllers available with the device.

Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
[p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org: switch to hidden reset control array]
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
No changes since v6.
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
