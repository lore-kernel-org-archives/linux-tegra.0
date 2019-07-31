From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v7 04/20] clk: tegra: pllout: Save and restore pllout context
Date: Tue, 30 Jul 2019 17:20:08 -0700
Message-ID: <1564532424-10449-5-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements save and restore of pllout context.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry the state of pllout is saved and on resume
it is restored back to have pllout in same state as before suspend.

pllout rate is saved and restore in clock divider so it will be at
same rate as before suspend when pllout state is restored.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-pll-out.c  | 26 ++++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra210.c |  3 ++-
 drivers/clk/tegra/clk.h          |  9 +++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
index 35f2bf00e1e6..312a3e8ef398 100644
--- a/drivers/clk/tegra/clk-pll-out.c
+++ b/drivers/clk/tegra/clk-pll-out.c
@@ -69,10 +69,36 @@ static void clk_pll_out_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(pll_out->lock, flags);
 }
 
+static int tegra_clk_pll_out_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll_out *pll_out = to_clk_pll_out(hw);
+
+	if (pll_out->flags & TEGRA_PLLRE_OUT)
+		pll_out->pllout_ctx = readl_relaxed(pll_out->reg);
+
+	return 0;
+}
+
+static void tegra_clk_pll_out_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll_out *pll_out = to_clk_pll_out(hw);
+
+	if (pll_out->flags & TEGRA_PLLRE_OUT) {
+		writel_relaxed(pll_out->pllout_ctx, pll_out->reg);
+	} else {
+		if (!__clk_get_enable_count(hw->clk))
+			clk_pll_out_disable(hw);
+		else
+			clk_pll_out_enable(hw);
+	}
+}
+
 const struct clk_ops tegra_clk_pll_out_ops = {
 	.is_enabled = clk_pll_out_is_enabled,
 	.enable = clk_pll_out_enable,
 	.disable = clk_pll_out_disable,
+	.save_context = tegra_clk_pll_out_save_context,
+	.restore_context = tegra_clk_pll_out_restore_context,
 };
 
 struct clk *tegra_clk_register_pll_out(const char *name,
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index df172d5772d7..4721ee030d1c 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3200,7 +3200,8 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 					 8, 8, 1, NULL);
 	clk = tegra_clk_register_pll_out("pll_re_out1", "pll_re_out1_div",
 					 clk_base + PLLRE_OUT1, 1, 0,
-					 CLK_SET_RATE_PARENT, 0, NULL);
+					 CLK_SET_RATE_PARENT, TEGRA_PLLRE_OUT,
+					 NULL);
 	clks[TEGRA210_CLK_PLL_RE_OUT1] = clk;
 
 	/* PLLE */
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 905bf1096558..230c05d8eef0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -437,6 +437,12 @@ struct clk *tegra_clk_register_pllu_tegra210(const char *name,
  * @rst_bit_idx:	bit to reset PLL divider
  * @lock:		register lock
  * @flags:		hardware-specific flags
+ * @pllout_ctx:		pllout context to save and restore during suspend
+ *			and resume
+ *
+ * Flags:
+ * TEGRA_PLLRE_OUT - This flag indicates that it is PLLRE_OUT and is used to
+ *		     identify PLLRE_OUT during clk_pll_out save and restore.
  */
 struct tegra_clk_pll_out {
 	struct clk_hw	hw;
@@ -445,8 +451,11 @@ struct tegra_clk_pll_out {
 	u8		rst_bit_idx;
 	spinlock_t	*lock;
 	u8		flags;
+	u32		pllout_ctx;
 };
 
+#define TEGRA_PLLRE_OUT BIT(0)
+
 #define to_clk_pll_out(_hw) container_of(_hw, struct tegra_clk_pll_out, hw)
 
 extern const struct clk_ops tegra_clk_pll_out_ops;
-- 
2.7.4
