From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v7 09/20] clk: tegra: clk-super: Add save and restore support
Date: Tue, 30 Jul 2019 17:20:13 -0700
Message-ID: <1564532424-10449-10-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements save and restore context for clk_super_mux
and clk_super.

During system supend, core power goes off the and context of Tegra
CAR registers is lost.

So during suspend entry, context of super clock registers are saved
through save_context clk_ops and are restored through restore_context
clk_ops to have them in same state as before suspend.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-super.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h       |  1 +
 2 files changed, 40 insertions(+)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index e2a1e95a8db7..be0551cb5587 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -124,9 +124,27 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
 	return err;
 }
 
+static int clk_super_mux_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
+
+	mux->parent_index_ctx = clk_super_get_parent(hw);
+
+	return 0;
+}
+
+static void clk_super_mux_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
+
+	clk_super_set_parent(hw, mux->parent_index_ctx);
+}
+
 static const struct clk_ops tegra_clk_super_mux_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
+	.save_context = clk_super_mux_save_context,
+	.restore_context = clk_super_mux_restore_context,
 };
 
 static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -162,12 +180,33 @@ static int clk_super_set_rate(struct clk_hw *hw, unsigned long rate,
 	return super->div_ops->set_rate(div_hw, rate, parent_rate);
 }
 
+static int clk_super_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+
+	super->parent_index_ctx = clk_super_get_parent(hw);
+
+	return 0;
+}
+
+static void clk_super_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	struct clk_hw *div_hw = &super->frac_div.hw;
+
+	clk_super_set_parent(hw, super->parent_index_ctx);
+
+	super->div_ops->restore_context(div_hw);
+}
+
 const struct clk_ops tegra_clk_super_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.set_rate = clk_super_set_rate,
 	.round_rate = clk_super_round_rate,
 	.recalc_rate = clk_super_recalc_rate,
+	.save_context = clk_super_save_context,
+	.restore_context = clk_super_restore_context,
 };
 
 struct clk *tegra_clk_register_super_mux(const char *name,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index f8de447f505b..d397dda7c6d0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -701,6 +701,7 @@ struct tegra_clk_super_mux {
 	u8		div2_index;
 	u8		pllx_index;
 	spinlock_t	*lock;
+	u8		parent_index_ctx;
 };
 
 #define to_clk_super_mux(_hw) container_of(_hw, struct tegra_clk_super_mux, hw)
-- 
2.7.4
