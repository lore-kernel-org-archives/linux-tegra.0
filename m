From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] soc/tegra: pmc: Fix "scheduling while atomic"
Date: Sun, 17 Apr 2016 16:34:11 +0300
Message-ID: <1460900051-3065-1-git-send-email-digetx@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

clk_get_rate() takes a mutex, hence cannot be used while IRQ's been
disabled. Replace it with a locked version.

[    3.430853] [<c0850fcc>] (dump_stack) from [<c00411f8>] (__schedule_bug+0x50/0x64)
[    3.431079] [<c00411f8>] (__schedule_bug) from [<c08553a8>] (__schedule+0x5c8/0x688)
[    3.431453] [<c08553a8>] (__schedule) from [<c08558f4>] (schedule_preempt_disabled+0x24/0x34)
[    3.431835] [<c08558f4>] (schedule_preempt_disabled) from [<c0856f24>] (__mutex_lock_slowpath+0xbc/0x170)
[    3.432204] [<c0856f24>] (__mutex_lock_slowpath) from [<c0857024>] (mutex_lock+0x4c/0x50)
[    3.432427] [<c0857024>] (mutex_lock) from [<c0610368>] (clk_prepare_lock+0x88/0xfc)
[    3.432800] [<c0610368>] (clk_prepare_lock) from [<c0611034>] (clk_get_rate+0xc/0x60)
[    3.433177] [<c0611034>] (clk_get_rate) from [<c034f10c>] (tegra_pmc_enter_suspend_mode+0x188/0x20c)
[    3.433580] [<c034f10c>] (tegra_pmc_enter_suspend_mode) from [<c0020d48>] (tegra_idle_lp2_last+0xc/0x40)
[    3.433795] [<c0020d48>] (tegra_idle_lp2_last) from [<c0021e1c>] (tegra20_idle_lp2_coupled+0x118/0x1fc)
[    3.434171] [<c0021e1c>] (tegra20_idle_lp2_coupled) from [<c055ec24>] (cpuidle_enter_state+0x3c/0x160)
[    3.434551] [<c055ec24>] (cpuidle_enter_state) from [<c0560ce8>] (cpuidle_enter_state_coupled+0x3dc/0x3f4)
[    3.434959] [<c0560ce8>] (cpuidle_enter_state_coupled) from [<c0055f1c>] (cpu_startup_entry+0x240/0x288)
[    3.435340] [<c0055f1c>] (cpu_startup_entry) from [<c0b29c84>] (start_kernel+0x3b4/0x3c0)
[    3.435557] [<c0b29c84>] (start_kernel) from [<00008074>] (0x8074)

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra-pmc.c | 9 +++++++++
 drivers/soc/tegra/pmc.c           | 2 +-
 include/linux/clk/tegra.h         | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index 91377ab..1ccf414 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -78,6 +78,8 @@ static struct pmc_clk_init_data pmc_clks[] = {
 	PMC_CLK(3, 22, 18),
 };
 
+static struct clk_hw *pclk_hw;
+
 void __init tegra_pmc_clk_init(void __iomem *pmc_base,
 				struct tegra_clk *tegra_clks)
 {
@@ -112,6 +114,9 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_base,
 		clk_register_clkdev(clk, data->dev_name, data->gate_name);
 	}
 
+	dt_clk = tegra_lookup_dt_id(tegra_clk_pclk, tegra_clks);
+	pclk_hw = __clk_get_hw(*dt_clk);
+
 	/* blink */
 	writel_relaxed(0, pmc_base + PMC_BLINK_TIMER);
 	clk = clk_register_gate(NULL, "blink_override", "clk_32k", 0,
@@ -129,3 +134,7 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_base,
 	*dt_clk = clk;
 }
 
+unsigned long tegra_pmc_get_pclk_rate(void)
+{
+	return clk_hw_get_rate(pclk_hw);
+}
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 08966c2..6752714 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -638,7 +638,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 		break;
 
 	case TEGRA_SUSPEND_LP2:
-		rate = clk_get_rate(pmc->clk);
+		rate = tegra_pmc_get_pclk_rate();
 		break;
 
 	default:
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 57bf7aa..717d71d 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -121,4 +121,6 @@ static inline void tegra_cpu_clock_resume(void)
 }
 #endif
 
+unsigned long tegra_pmc_get_pclk_rate(void);
+
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
2.8.1

