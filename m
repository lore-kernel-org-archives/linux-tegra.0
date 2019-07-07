From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] soc/tegra: pmc: Query PCLK clock rate at probe time
Date: Mon,  8 Jul 2019 02:08:43 +0300
Message-ID: <20190707230843.11224-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The PCLK clock is running off SCLK, which is a critical clock that is
very unlikely to randomly change its rate. It's also a bit clumsy (and
apparently incorrect) to query the clock's rate with interrupts being
disabled because clk_get_rate() takes a mutex and that's the case during
suspend/cpuidle entering. Lastly, it's better to always fully reprogram
PMC state because it's not obvious whether it could be changed after SC7.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 9f9c1c677cf4..532e0ada012b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1433,6 +1433,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 {
 	unsigned long long rate = 0;
+	u64 ticks;
 	u32 value;
 
 	switch (mode) {
@@ -1441,7 +1442,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 		break;
 
 	case TEGRA_SUSPEND_LP2:
-		rate = clk_get_rate(pmc->clk);
+		rate = pmc->rate;
 		break;
 
 	default:
@@ -1451,26 +1452,20 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 	if (WARN_ON_ONCE(rate == 0))
 		rate = 100000000;
 
-	if (rate != pmc->rate) {
-		u64 ticks;
-
-		ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
-		do_div(ticks, USEC_PER_SEC);
-		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
-
-		ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
-		do_div(ticks, USEC_PER_SEC);
-		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
+	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
+	do_div(ticks, USEC_PER_SEC);
+	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
 
-		wmb();
-
-		pmc->rate = rate;
-	}
+	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
+	do_div(ticks, USEC_PER_SEC);
+	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
 
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
 	value |= PMC_CNTRL_CPU_PWRREQ_OE;
 	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+
+	wmb();
 }
 #endif
 
@@ -2082,6 +2077,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		pmc->clk = NULL;
 	}
 
+	pmc->rate = clk_get_rate(pmc->clk);
 	pmc->dev = &pdev->dev;
 
 	tegra_pmc_init(pmc);
-- 
2.22.0
