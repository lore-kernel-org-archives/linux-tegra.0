From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: sor: Reimplement pad clock
Date: Wed, 15 Nov 2017 15:43:41 +0100
Message-ID: <20171115144341.16402-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The current implementation of the pad clock isn't quite correct. This
has the side-effect of being incompatible with the implementation for
Tegra186 (provided by the BPMP) and therefore would require a massive
change to the driver to cope with the differences. Instead, simple do
what Tegra186 does and add some code to fallback to the old behaviour
for existing device trees.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 157 +++++++++++++++++++++++++++++++-------------
 1 file changed, 111 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4bcacd3f4861..b0a1dedac802 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -174,9 +174,9 @@ struct tegra_sor {
 
 	struct reset_control *rst;
 	struct clk *clk_parent;
-	struct clk *clk_brick;
 	struct clk *clk_safe;
-	struct clk *clk_src;
+	struct clk *clk_out;
+	struct clk *clk_pad;
 	struct clk *clk_dp;
 	struct clk *clk;
 
@@ -255,7 +255,7 @@ static int tegra_sor_set_parent_clock(struct tegra_sor *sor, struct clk *parent)
 
 	clk_disable_unprepare(sor->clk);
 
-	err = clk_set_parent(sor->clk, parent);
+	err = clk_set_parent(sor->clk_out, parent);
 	if (err < 0)
 		return err;
 
@@ -266,24 +266,24 @@ static int tegra_sor_set_parent_clock(struct tegra_sor *sor, struct clk *parent)
 	return 0;
 }
 
-struct tegra_clk_sor_brick {
+struct tegra_clk_sor_pad {
 	struct clk_hw hw;
 	struct tegra_sor *sor;
 };
 
-static inline struct tegra_clk_sor_brick *to_brick(struct clk_hw *hw)
+static inline struct tegra_clk_sor_pad *to_pad(struct clk_hw *hw)
 {
-	return container_of(hw, struct tegra_clk_sor_brick, hw);
+	return container_of(hw, struct tegra_clk_sor_pad, hw);
 }
 
-static const char * const tegra_clk_sor_brick_parents[] = {
+static const char * const tegra_clk_sor_pad_parents[] = {
 	"pll_d2_out0", "pll_dp"
 };
 
-static int tegra_clk_sor_brick_set_parent(struct clk_hw *hw, u8 index)
+static int tegra_clk_sor_pad_set_parent(struct clk_hw *hw, u8 index)
 {
-	struct tegra_clk_sor_brick *brick = to_brick(hw);
-	struct tegra_sor *sor = brick->sor;
+	struct tegra_clk_sor_pad *pad = to_pad(hw);
+	struct tegra_sor *sor = pad->sor;
 	u32 value;
 
 	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
@@ -304,10 +304,10 @@ static int tegra_clk_sor_brick_set_parent(struct clk_hw *hw, u8 index)
 	return 0;
 }
 
-static u8 tegra_clk_sor_brick_get_parent(struct clk_hw *hw)
+static u8 tegra_clk_sor_pad_get_parent(struct clk_hw *hw)
 {
-	struct tegra_clk_sor_brick *brick = to_brick(hw);
-	struct tegra_sor *sor = brick->sor;
+	struct tegra_clk_sor_pad *pad = to_pad(hw);
+	struct tegra_sor *sor = pad->sor;
 	u8 parent = U8_MAX;
 	u32 value;
 
@@ -328,33 +328,33 @@ static u8 tegra_clk_sor_brick_get_parent(struct clk_hw *hw)
 	return parent;
 }
 
-static const struct clk_ops tegra_clk_sor_brick_ops = {
-	.set_parent = tegra_clk_sor_brick_set_parent,
-	.get_parent = tegra_clk_sor_brick_get_parent,
+static const struct clk_ops tegra_clk_sor_pad_ops = {
+	.set_parent = tegra_clk_sor_pad_set_parent,
+	.get_parent = tegra_clk_sor_pad_get_parent,
 };
 
-static struct clk *tegra_clk_sor_brick_register(struct tegra_sor *sor,
-						const char *name)
+static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
+					      const char *name)
 {
-	struct tegra_clk_sor_brick *brick;
+	struct tegra_clk_sor_pad *pad;
 	struct clk_init_data init;
 	struct clk *clk;
 
-	brick = devm_kzalloc(sor->dev, sizeof(*brick), GFP_KERNEL);
-	if (!brick)
+	pad = devm_kzalloc(sor->dev, sizeof(*pad), GFP_KERNEL);
+	if (!pad)
 		return ERR_PTR(-ENOMEM);
 
-	brick->sor = sor;
+	pad->sor = sor;
 
 	init.name = name;
 	init.flags = 0;
-	init.parent_names = tegra_clk_sor_brick_parents;
-	init.num_parents = ARRAY_SIZE(tegra_clk_sor_brick_parents);
-	init.ops = &tegra_clk_sor_brick_ops;
+	init.parent_names = tegra_clk_sor_pad_parents;
+	init.num_parents = ARRAY_SIZE(tegra_clk_sor_pad_parents);
+	init.ops = &tegra_clk_sor_pad_ops;
 
-	brick->hw.init = &init;
+	pad->hw.init = &init;
 
-	clk = devm_clk_register(sor->dev, &brick->hw);
+	clk = devm_clk_register(sor->dev, &pad->hw);
 
 	return clk;
 }
@@ -998,8 +998,10 @@ static int tegra_sor_power_down(struct tegra_sor *sor)
 
 	/* switch to safe parent clock */
 	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
-	if (err < 0)
+	if (err < 0) {
 		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
+		return err;
+	}
 
 	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
 	value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_0 |
@@ -2007,8 +2009,10 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 
 	/* switch to safe parent clock */
 	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
-	if (err < 0)
+	if (err < 0) {
 		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
+		return;
+	}
 
 	div = clk_get_rate(sor->clk) / 1000000 * 4;
 
@@ -2111,13 +2115,17 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, value, SOR_XBAR_CTRL);
 
 	/* switch to parent clock */
-	err = clk_set_parent(sor->clk_src, sor->clk_parent);
-	if (err < 0)
-		dev_err(sor->dev, "failed to set source clock: %d\n", err);
-
-	err = tegra_sor_set_parent_clock(sor, sor->clk_src);
-	if (err < 0)
+	err = clk_set_parent(sor->clk, sor->clk_parent);
+	if (err < 0) {
 		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
+		return;
+	}
+
+	err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to set pad clock: %d\n", err);
+		return;
+	}
 
 	value = SOR_INPUT_CONTROL_HDMI_SRC_SELECT(dc->pipe);
 
@@ -2628,11 +2636,24 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	}
 
 	if (sor->soc->supports_hdmi || sor->soc->supports_dp) {
-		sor->clk_src = devm_clk_get(&pdev->dev, "source");
-		if (IS_ERR(sor->clk_src)) {
-			err = PTR_ERR(sor->clk_src);
-			dev_err(sor->dev, "failed to get source clock: %d\n",
-				err);
+		struct device_node *np = pdev->dev.of_node;
+		const char *name;
+
+		/*
+		 * For backwards compatibility with Tegra210 device trees,
+		 * fall back to the old clock name "source" if the new "out"
+		 * clock is not available.
+		 */
+		if (of_property_match_string(np, "clock-names", "out") < 0)
+			name = "source";
+		else
+			name = "out";
+
+		sor->clk_out = devm_clk_get(&pdev->dev, name);
+		if (IS_ERR(sor->clk_out)) {
+			err = PTR_ERR(sor->clk_out);
+			dev_err(sor->dev, "failed to get %s clock: %d\n",
+				name, err);
 			goto remove;
 		}
 	}
@@ -2658,16 +2679,60 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
+	/*
+	 * Starting with Tegra186, the BPMP provides an implementation for
+	 * the pad output clock, so we have to look it up from device tree.
+	 */
+	sor->clk_pad = devm_clk_get(&pdev->dev, "pad");
+	if (IS_ERR(sor->clk_pad)) {
+		if (sor->clk_pad != ERR_PTR(-ENOENT)) {
+			err = PTR_ERR(sor->clk_pad);
+			goto remove;
+		}
+
+		/*
+		 * If the pad output clock is not available, then we assume
+		 * we're on Tegra210 or earlier and have to provide our own
+		 * implementation.
+		 */
+		sor->clk_pad = NULL;
+	}
+
+	/*
+	 * The bootloader may have set up the SOR such that it's module clock
+	 * is sourced by one of the display PLLs. However, that doesn't work
+	 * without properly having set up other bits of the SOR.
+	 */
+	err = clk_set_parent(sor->clk_out, sor->clk_safe);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to use safe clock: %d\n", err);
+		goto remove;
+	}
+
 	platform_set_drvdata(pdev, sor);
 	pm_runtime_enable(&pdev->dev);
 
-	pm_runtime_get_sync(&pdev->dev);
-	sor->clk_brick = tegra_clk_sor_brick_register(sor, "sor1_brick");
-	pm_runtime_put(&pdev->dev);
+	/*
+	 * On Tegra210 and earlier, provide our own implementation for the
+	 * pad output clock.
+	 */
+	if (!sor->clk_pad) {
+		err = pm_runtime_get_sync(&pdev->dev);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to get runtime PM: %d\n",
+				err);
+			goto remove;
+		}
+
+		sor->clk_pad = tegra_clk_sor_pad_register(sor,
+							  "sor1_pad_clkout");
+		pm_runtime_put(&pdev->dev);
+	}
 
-	if (IS_ERR(sor->clk_brick)) {
-		err = PTR_ERR(sor->clk_brick);
-		dev_err(&pdev->dev, "failed to register SOR clock: %d\n", err);
+	if (IS_ERR(sor->clk_pad)) {
+		err = PTR_ERR(sor->clk_pad);
+		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
+			err);
 		goto remove;
 	}
 
-- 
2.14.1
