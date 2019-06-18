From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V3 08/17] clk: tegra: add support for peripheral clock suspend and resume
Date: Tue, 18 Jun 2019 00:46:22 -0700
Message-ID: <1560843991-24123-9-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch creates APIs to save and restore the state of all
peripheral clocks reset and enables.

These APIs are invoked by Tegra210 clock driver during suspend and
resume to save the peripheral clocks state before suspend and to
restore them on resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h |  3 +++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 26690663157a..bd3b46c5f941 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -70,6 +70,7 @@ static struct clk **clks;
 static int clk_num;
 static struct clk_onecell_data clk_data;
 
+static u32 *periph_ctx;
 static u32 cclkg_burst_policy_ctx[2];
 static u32 cclklp_burst_policy_ctx[2];
 static u32 sclk_burst_policy_ctx[2];
@@ -279,6 +280,63 @@ void tegra_sclk_cpulp_burst_policy_restore_context(void)
 	writel_relaxed(clk_arm_ctx, clk_base + CLK_MASK_ARM);
 }
 
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
+	periph_ctx = kcalloc(2 * banks, sizeof(*periph_ctx), GFP_KERNEL);
+	if (!periph_ctx)
+		err = -ENOMEM;
+
+	return err;
+}
+
 struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 {
 	clk_base = regs;
@@ -295,11 +353,21 @@ struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 	periph_banks = banks;
 
 	clks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-	if (!clks)
+	if (!clks) {
 		kfree(periph_clk_enb_refcnt);
+		return NULL;
+	}
 
 	clk_num = num;
 
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		if (tegra_clk_suspend_ctx_init(banks)) {
+			kfree(periph_clk_enb_refcnt);
+			kfree(clks);
+			return NULL;
+		}
+	}
+
 	return clks;
 }
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index c8f8a23096e2..a354cacae5a6 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -853,6 +853,9 @@ void tegra_cclkg_burst_policy_save_context(void);
 void tegra_cclkg_burst_policy_restore_context(void);
 void tegra_sclk_cclklp_burst_policy_save_context(void);
 void tegra_sclk_cpulp_burst_policy_restore_context(void);
+void tegra_clk_periph_suspend(void __iomem *clk_base);
+void tegra_clk_periph_resume(void __iomem *clk_base);
+void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base);
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
-- 
2.7.4
