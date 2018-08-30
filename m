From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/3] clk: tegra: Poll PLLX lock-status on resume from suspend on Tegra20/30
Date: Thu, 30 Aug 2018 22:20:45 +0300
Message-ID: <20180830192045.11017-4-digetx@gmail.com>
References: <20180830192045.11017-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830192045.11017-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Poll PLLX lock-status instead of delaying for a constant time. This speeds
up resume from suspend a tad and is less error-prone since lock failure
will be reported.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 51 +++++++++++++++++++++++++++------
 drivers/clk/tegra/clk-tegra30.c | 51 +++++++++++++++++++++++++++------
 2 files changed, 86 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index f987ed361df6..c8146e65e7ad 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
@@ -1001,6 +1002,47 @@ static void tegra20_cpu_clock_suspend(void)
 				readl(clk_base + SUPER_CCLK_DIVIDER);
 }
 
+static void tegra20_cpu_clock_restore_pllx(void)
+{
+	u32 misc = readl_relaxed(clk_base + PLLX_MISC);
+	u32 base = readl_relaxed(clk_base + PLLX_BASE);
+	u32 misc_restore = tegra20_cpu_clk_sctx.pllx_misc;
+	u32 base_restore = tegra20_cpu_clk_sctx.pllx_base;
+	int err;
+
+	/* nothing to do if PLL configuration is unchanged */
+	if (misc == misc_restore && base == base_restore)
+		return;
+
+	/* otherwise restore configuration */
+	if (base_restore & BIT(30)) {
+		/* PLL shall be locked if we are going to (re)enable it */
+		misc_restore |= BIT(18);
+	}
+
+	/* disable PLL if it is enabled to re-apply configuration safely */
+	if (base & BIT(30)) {
+		writel_relaxed(base & ~BIT(30), clk_base + PLLX_BASE);
+		udelay(1);
+	}
+
+	/* restore the configuration */
+	writel_relaxed(misc_restore, clk_base + PLLX_MISC);
+	writel_relaxed(base_restore, clk_base + PLLX_BASE);
+
+	/* PLL is disabled now, nothing left to do */
+	if (!(base_restore & BIT(30)))
+		return;
+
+	/* otherwise start polling the PLL lock-status */
+	err = readl_relaxed_poll_timeout_atomic(clk_base + PLLX_BASE, base,
+						base & BIT(27), 1, 2000);
+	/* should not happen */
+	WARN_ONCE(err, "PLLX failed to lock: %d\n", err);
+	/* post-enable delay */
+	udelay(50);
+}
+
 static void tegra20_cpu_clock_resume(void)
 {
 	unsigned int reg, policy;
@@ -1018,14 +1060,7 @@ static void tegra20_cpu_clock_resume(void)
 
 	if (reg != CCLK_BURST_POLICY_PLLX) {
 		/* restore PLLX settings if CPU is on different PLL */
-		writel(tegra20_cpu_clk_sctx.pllx_misc,
-					clk_base + PLLX_MISC);
-		writel(tegra20_cpu_clk_sctx.pllx_base,
-					clk_base + PLLX_BASE);
-
-		/* wait for PLL stabilization if PLLX was enabled */
-		if (tegra20_cpu_clk_sctx.pllx_base & (1 << 30))
-			udelay(300);
+		tegra20_cpu_clock_restore_pllx();
 	}
 
 	/*
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 0f8797ca39e2..0059fdf79169 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
@@ -1189,6 +1190,47 @@ static void tegra30_cpu_clock_suspend(void)
 				readl(clk_base + CLK_RESET_CCLK_DIVIDER);
 }
 
+static void tegra30_cpu_clock_restore_pllx(void)
+{
+	u32 misc = readl_relaxed(clk_base + CLK_RESET_PLLX_MISC);
+	u32 base = readl_relaxed(clk_base + CLK_RESET_PLLX_BASE);
+	u32 misc_restore = tegra30_cpu_clk_sctx.pllx_misc;
+	u32 base_restore = tegra30_cpu_clk_sctx.pllx_base;
+	int err;
+
+	/* nothing to do if PLL configuration is unchanged */
+	if (misc == misc_restore && base == base_restore)
+		return;
+
+	/* otherwise restore configuration */
+	if (base_restore & BIT(30)) {
+		/* PLL shall be locked if we are going to (re)enable it */
+		misc_restore |= BIT(18);
+	}
+
+	/* disable PLL if it is enabled to re-apply configuration safely */
+	if (base & BIT(30)) {
+		writel_relaxed(base & ~BIT(30), clk_base + CLK_RESET_PLLX_BASE);
+		udelay(1);
+	}
+
+	/* restore the configuration */
+	writel_relaxed(misc_restore, clk_base + CLK_RESET_PLLX_MISC);
+	writel_relaxed(base_restore, clk_base + CLK_RESET_PLLX_BASE);
+
+	/* PLL is disabled now, nothing left to do */
+	if (!(base_restore & BIT(30)))
+		return;
+
+	/* otherwise start polling the PLL lock-status */
+	err = readl_relaxed_poll_timeout_atomic(clk_base + CLK_RESET_PLLX_BASE,
+						base, base & BIT(27), 1, 2000);
+	/* should not happen */
+	WARN_ONCE(err, "PLLX failed to lock: %d\n", err);
+	/* post-enable delay */
+	udelay(50);
+}
+
 static void tegra30_cpu_clock_resume(void)
 {
 	unsigned int reg, policy;
@@ -1206,14 +1248,7 @@ static void tegra30_cpu_clock_resume(void)
 
 	if (reg != CLK_RESET_CCLK_BURST_POLICY_PLLX) {
 		/* restore PLLX settings if CPU is on different PLL */
-		writel(tegra30_cpu_clk_sctx.pllx_misc,
-					clk_base + CLK_RESET_PLLX_MISC);
-		writel(tegra30_cpu_clk_sctx.pllx_base,
-					clk_base + CLK_RESET_PLLX_BASE);
-
-		/* wait for PLL stabilization if PLLX was enabled */
-		if (tegra30_cpu_clk_sctx.pllx_base & (1 << 30))
-			udelay(300);
+		tegra30_cpu_clock_restore_pllx();
 	}
 
 	/*
-- 
2.18.0
