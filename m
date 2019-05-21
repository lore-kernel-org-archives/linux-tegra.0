From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1 04/12] clk: tegra: add support for peripheral clock suspend and resume
Date: Tue, 21 May 2019 16:31:15 -0700
Message-ID: <1558481483-22254-5-git-send-email-skomatineni@nvidia.com>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements peripheral clock context save and restore
to support system suspend and resume operation.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h |  3 ++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 6f2862eddad7..08b788766564 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -81,6 +81,10 @@ static struct clk **clks;
 static int clk_num;
 static struct clk_onecell_data clk_data;
 
+#ifdef CONFIG_PM_SLEEP
+static u32 *periph_ctx;
+#endif
+
 /* Handlers for SoC-specific reset lines */
 static int (*special_reset_assert)(unsigned long);
 static int (*special_reset_deassert)(unsigned long);
@@ -210,6 +214,65 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
 	}
 }
 
+#ifdef CONFIG_PM_SLEEP
+void tegra_clk_periph_suspend(void __iomem *clk_base)
+{
+	int i, idx;
+
+	idx = 0;
+	for (i = 0; i < periph_banks; i++, idx++)
+		periph_ctx[idx] =
+			readl_relaxed(clk_base + periph_regs[i].rst_reg);
+
+	for (i = 0; i < periph_banks; i++, idx++)
+		periph_ctx[idx] =
+			readl_relaxed(clk_base + periph_regs[i].enb_reg);
+}
+
+void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base)
+{
+	int i;
+
+	WARN_ON(count != periph_banks);
+
+	for (i = 0; i < count; i++)
+		writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_reg);
+}
+
+void tegra_clk_periph_resume(void __iomem *clk_base)
+{
+	int i, idx;
+
+	idx = 0;
+	for (i = 0; i < periph_banks; i++, idx++)
+		writel_relaxed(periph_ctx[idx],
+			       clk_base + periph_regs[i].rst_reg);
+
+	/* ensure all resets have propagated */
+	fence_udelay(2, clk_base);
+	tegra_read_chipid();
+
+	for (i = 0; i < periph_banks; i++, idx++)
+		writel_relaxed(periph_ctx[idx],
+			       clk_base + periph_regs[i].enb_reg);
+
+	/* ensure all enables have propagated */
+	fence_udelay(2, clk_base);
+	tegra_read_chipid();
+}
+
+static int tegra_clk_suspend_ctx_init(int banks)
+{
+	int err = 0;
+
+	periph_ctx = kzalloc(2 * banks * sizeof(*periph_ctx), GFP_KERNEL);
+	if (!periph_ctx)
+		err = -ENOMEM;
+
+	return err;
+}
+#endif
+
 struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 {
 	clk_base = regs;
@@ -226,11 +289,20 @@ struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 	periph_banks = banks;
 
 	clks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-	if (!clks)
+	if (!clks) {
 		kfree(periph_clk_enb_refcnt);
+		return NULL;
+	}
 
 	clk_num = num;
 
+#ifdef CONFIG_PM_SLEEP
+	if (tegra_clk_suspend_ctx_init(banks)) {
+		kfree(periph_clk_enb_refcnt);
+		kfree(clks);
+		return NULL;
+	}
+#endif
 	return clks;
 }
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index c82633686820..ef444648fcb1 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -853,6 +853,9 @@ void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate);
 void tegra_clk_plle_tegra210_resume(struct clk *c);
 void tegra_clk_sync_state_pll(struct clk *c);
 void tegra_clk_sync_state_pll_out(struct clk *clk);
+void tegra_clk_periph_suspend(void __iomem *clk_base);
+void tegra_clk_periph_resume(void __iomem *clk_base);
+void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base);
 #endif
 
 
-- 
2.7.4
