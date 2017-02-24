From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/5] clk: tegra: add super clk mux/div
Date: Fri, 24 Feb 2017 15:19:29 +0200
Message-ID: <1487942376-19631-5-git-send-email-pdeschrijver@nvidia.com>
References: <1487942376-19631-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487942376-19631-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add a super clock type which implements both mux and divider. This is used
for aclk.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-super.c | 87 +++++++++++++++++++++++++++++++++++++++++--
 drivers/clk/tegra/clk.h       |  7 +++-
 2 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 131d1b50..7982d41 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -121,9 +121,50 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
 	return err;
 }
 
+const struct clk_ops tegra_clk_super_mux_ops = {
+	.get_parent = clk_super_get_parent,
+	.set_parent = clk_super_set_parent,
+};
+
+static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	struct clk_hw *div_hw = &super->frac_div.hw;
+
+	__clk_hw_set_clk(div_hw, hw);
+
+	return super->div_ops->round_rate(div_hw, rate, parent_rate);
+}
+
+static unsigned long clk_super_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	struct clk_hw *div_hw = &super->frac_div.hw;
+
+	__clk_hw_set_clk(div_hw, hw);
+
+	return super->div_ops->recalc_rate(div_hw, parent_rate);
+}
+
+static int clk_super_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	struct clk_hw *div_hw = &super->frac_div.hw;
+
+	__clk_hw_set_clk(div_hw, hw);
+
+	return super->div_ops->set_rate(div_hw, rate, parent_rate);
+}
+
 const struct clk_ops tegra_clk_super_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
+	.set_rate = clk_super_set_rate,
+	.round_rate = clk_super_round_rate,
+	.recalc_rate = clk_super_recalc_rate,
 };
 
 struct clk *tegra_clk_register_super_mux(const char *name,
@@ -136,13 +177,11 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 	struct clk_init_data init;
 
 	super = kzalloc(sizeof(*super), GFP_KERNEL);
-	if (!super) {
-		pr_err("%s: could not allocate super clk\n", __func__);
+	if (!super)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
-	init.ops = &tegra_clk_super_ops;
+	init.ops = &tegra_clk_super_mux_ops;
 	init.flags = flags;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
@@ -163,3 +202,43 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 
 	return clk;
 }
+
+struct clk *tegra_clk_register_super_clk(const char *name,
+		const char **parent_names, u8 num_parents,
+		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
+		spinlock_t *lock)
+{
+	struct tegra_clk_super_mux *super;
+	struct clk *clk;
+	struct clk_init_data init;
+
+	super = kzalloc(sizeof(*super), GFP_KERNEL);
+	if (!super)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &tegra_clk_super_ops;
+	init.flags = flags;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+
+	super->reg = reg;
+	super->lock = lock;
+	super->width = 4;
+	super->flags = clk_super_flags;
+	super->frac_div.reg = reg + 4;
+	super->frac_div.shift = 16;
+	super->frac_div.width = 8;
+	super->frac_div.frac_width = 1;
+	super->frac_div.lock = lock;
+	super->div_ops = &tegra_clk_frac_div_ops;
+
+	/* Data in .init is copied by clk_register(), so stack variable OK */
+	super->hw.init = &init;
+
+	clk = clk_register(NULL, &super->hw);
+	if (IS_ERR(clk))
+		kfree(super);
+
+	return clk;
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index a62ea73..6249190 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -686,6 +686,8 @@ struct tegra_periph_init_data {
 struct tegra_clk_super_mux {
 	struct clk_hw	hw;
 	void __iomem	*reg;
+	struct tegra_clk_frac_div frac_div;
+	const struct clk_ops	*div_ops;
 	u8		width;
 	u8		flags;
 	u8		div2_index;
@@ -702,7 +704,10 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 		const char **parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
 		u8 width, u8 pllx_index, u8 div2_index, spinlock_t *lock);
-
+struct clk *tegra_clk_register_super_clk(const char *name,
+		const char **parent_names, u8 num_parents,
+		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
+		spinlock_t *lock);
 /**
  * struct clk_init_table - clock initialization table
  * @clk_id:	clock id as mentioned in device tree bindings
-- 
1.9.1
