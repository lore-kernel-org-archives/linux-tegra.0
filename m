From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] clk: tegra20/30: Optimize PLLX configuration restoring
Date: Mon, 23 Sep 2019 00:52:03 +0300
Message-ID: <20190922215203.32103-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no need to re-configure PLLX if its configuration in unchanged
on return from suspend / cpuidle, this saves 300us if PLLX is already
enabled (common case for cpuidle).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 25 ++++++++++++++++---------
 drivers/clk/tegra/clk-tegra30.c | 25 ++++++++++++++++---------
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index cceefbd67a3b..4d8222f5c638 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -955,6 +955,7 @@ static void tegra20_cpu_clock_suspend(void)
 static void tegra20_cpu_clock_resume(void)
 {
 	unsigned int reg, policy;
+	u32 misc, base;
 
 	/* Is CPU complex already running on PLLX? */
 	reg = readl(clk_base + CCLK_BURST_POLICY);
@@ -968,15 +969,21 @@ static void tegra20_cpu_clock_resume(void)
 		BUG();
 
 	if (reg != CCLK_BURST_POLICY_PLLX) {
-		/* restore PLLX settings if CPU is on different PLL */
-		writel(tegra20_cpu_clk_sctx.pllx_misc,
-					clk_base + PLLX_MISC);
-		writel(tegra20_cpu_clk_sctx.pllx_base,
-					clk_base + PLLX_BASE);
-
-		/* wait for PLL stabilization if PLLX was enabled */
-		if (tegra20_cpu_clk_sctx.pllx_base & (1 << 30))
-			udelay(300);
+		misc = readl_relaxed(clk_base + PLLX_MISC);
+		base = readl_relaxed(clk_base + PLLX_BASE);
+
+		if (misc != tegra20_cpu_clk_sctx.pllx_misc ||
+		    base != tegra20_cpu_clk_sctx.pllx_base) {
+			/* restore PLLX settings if CPU is on different PLL */
+			writel(tegra20_cpu_clk_sctx.pllx_misc,
+						clk_base + PLLX_MISC);
+			writel(tegra20_cpu_clk_sctx.pllx_base,
+						clk_base + PLLX_BASE);
+
+			/* wait for PLL stabilization if PLLX was enabled */
+			if (tegra20_cpu_clk_sctx.pllx_base & (1 << 30))
+				udelay(300);
+		}
 	}
 
 	/*
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index a19840fac716..3b5bca44b7aa 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1135,6 +1135,7 @@ static void tegra30_cpu_clock_suspend(void)
 static void tegra30_cpu_clock_resume(void)
 {
 	unsigned int reg, policy;
+	u32 misc, base;
 
 	/* Is CPU complex already running on PLLX? */
 	reg = readl(clk_base + CLK_RESET_CCLK_BURST);
@@ -1148,15 +1149,21 @@ static void tegra30_cpu_clock_resume(void)
 		BUG();
 
 	if (reg != CLK_RESET_CCLK_BURST_POLICY_PLLX) {
-		/* restore PLLX settings if CPU is on different PLL */
-		writel(tegra30_cpu_clk_sctx.pllx_misc,
-					clk_base + CLK_RESET_PLLX_MISC);
-		writel(tegra30_cpu_clk_sctx.pllx_base,
-					clk_base + CLK_RESET_PLLX_BASE);
-
-		/* wait for PLL stabilization if PLLX was enabled */
-		if (tegra30_cpu_clk_sctx.pllx_base & (1 << 30))
-			udelay(300);
+		misc = readl_relaxed(clk_base + CLK_RESET_PLLX_MISC);
+		base = readl_relaxed(clk_base + CLK_RESET_PLLX_BASE);
+
+		if (misc != tegra30_cpu_clk_sctx.pllx_misc ||
+		    base != tegra30_cpu_clk_sctx.pllx_base) {
+			/* restore PLLX settings if CPU is on different PLL */
+			writel(tegra30_cpu_clk_sctx.pllx_misc,
+						clk_base + CLK_RESET_PLLX_MISC);
+			writel(tegra30_cpu_clk_sctx.pllx_base,
+						clk_base + CLK_RESET_PLLX_BASE);
+
+			/* wait for PLL stabilization if PLLX was enabled */
+			if (tegra30_cpu_clk_sctx.pllx_base & (1 << 30))
+				udelay(300);
+		}
 	}
 
 	/*
-- 
2.23.0
