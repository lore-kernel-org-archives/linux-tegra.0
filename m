From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V2 05/12] clk: tegra: add support for OSC clock resume
Date: Tue, 28 May 2019 16:08:49 -0700
Message-ID: <1559084936-4610-6-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch adds support for restoring OSC control context on resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-fixed.c | 16 ++++++++++++++++
 drivers/clk/tegra/clk.h             |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 91c38f1666c1..de94333e800c 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -28,7 +28,10 @@
 #define OSC_CTRL			0x50
 #define OSC_CTRL_OSC_FREQ_SHIFT		28
 #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
+#define OSC_CTRL_MASK			(0x3f2 |	\
+					(0xf << OSC_CTRL_OSC_FREQ_SHIFT))
 
+static u32 osc_ctrl_ctx;
 int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 			      unsigned long *input_freqs, unsigned int num,
 			      unsigned int clk_m_div, unsigned long *osc_freq,
@@ -40,6 +43,7 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 	unsigned osc_idx;
 
 	val = readl_relaxed(clk_base + OSC_CTRL);
+	osc_ctrl_ctx = val & OSC_CTRL_MASK;
 	osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
 
 	if (osc_idx < num)
@@ -107,3 +111,15 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
 		*dt_clk = clk;
 	}
 }
+
+#ifdef CONFIG_PM_SLEEP
+void tegra_clk_osc_resume(void __iomem *clk_base)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
+	val |= osc_ctrl_ctx;
+	writel_relaxed(val, clk_base + OSC_CTRL);
+	fence_udelay(2, clk_base);
+}
+#endif
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index ab238b2c3125..666b9d907951 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -851,6 +851,7 @@ void tegra_clk_sync_state_pll_out(struct clk *clk);
 void tegra_clk_periph_suspend(void __iomem *clk_base);
 void tegra_clk_periph_resume(void __iomem *clk_base);
 void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base);
+void tegra_clk_osc_resume(void __iomem *clk_base);
 #endif
 
 
-- 
2.7.4
