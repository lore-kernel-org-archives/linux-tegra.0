From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/2] soc/tegra: pmc: Turn powergates_lock into spinlock
Date: Thu, 30 Aug 2018 21:36:34 +0300
Message-ID: <20180830183635.4474-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This fixes splats like the one below if CONFIG_DEBUG_ATOMIC_SLEEP=y
and machine (Tegra30) booted with SMP=n or all secondary CPU's are put
offline.

 BUG: sleeping function called from invalid context at kernel/locking/mutex.c:254
 in_atomic(): 1, irqs_disabled(): 128, pid: 0, name: swapper/0
 CPU: 0 PID: 0 Comm: swapper/0 Tainted: G         C        4.18.0-next-20180821-00180-gc3ebb6544e44-dirty #823
 Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
 [<c01134f4>] (unwind_backtrace) from [<c010db2c>] (show_stack+0x20/0x24)
 [<c010db2c>] (show_stack) from [<c0bd0f3c>] (dump_stack+0x94/0xa8)
 [<c0bd0f3c>] (dump_stack) from [<c0151df8>] (___might_sleep+0x13c/0x174)
 [<c0151df8>] (___might_sleep) from [<c0151ea0>] (__might_sleep+0x70/0xa8)
 [<c0151ea0>] (__might_sleep) from [<c0bec2b8>] (mutex_lock+0x2c/0x70)
 [<c0bec2b8>] (mutex_lock) from [<c0589844>] (tegra_powergate_is_powered+0x44/0xa8)
 [<c0589844>] (tegra_powergate_is_powered) from [<c0581a60>] (tegra30_cpu_rail_off_ready+0x30/0x74)
 [<c0581a60>] (tegra30_cpu_rail_off_ready) from [<c0122244>] (tegra30_idle_lp2+0xa0/0x108)
 [<c0122244>] (tegra30_idle_lp2) from [<c0853438>] (cpuidle_enter_state+0x140/0x540)
 [<c0853438>] (cpuidle_enter_state) from [<c08538a4>] (cpuidle_enter+0x40/0x4c)
 [<c08538a4>] (cpuidle_enter) from [<c01595e0>] (call_cpuidle+0x30/0x48)
 [<c01595e0>] (call_cpuidle) from [<c01599f8>] (do_idle+0x238/0x28c)
 [<c01599f8>] (do_idle) from [<c0159d28>] (cpu_startup_entry+0x28/0x2c)
 [<c0159d28>] (cpu_startup_entry) from [<c0be76c8>] (rest_init+0xd8/0xdc)
 [<c0be76c8>] (rest_init) from [<c1200f50>] (start_kernel+0x41c/0x430)

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2d6f3fcf3211..d6bc9f66f1cd 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -186,7 +186,7 @@ struct tegra_pmc_soc {
  * @lp0_vec_phys: physical base address of the LP0 warm boot code
  * @lp0_vec_size: size of the LP0 warm boot code
  * @powergates_available: Bitmap of available power gates
- * @powergates_lock: mutex for power gate register access
+ * @powergates_lock: lock for power gate register access
  */
 struct tegra_pmc {
 	struct device *dev;
@@ -215,7 +215,7 @@ struct tegra_pmc {
 	u32 lp0_vec_size;
 	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
 
-	struct mutex powergates_lock;
+	spinlock_t powergates_lock;
 };
 
 static struct tegra_pmc *pmc = &(struct tegra_pmc) {
@@ -288,10 +288,10 @@ static int tegra_powergate_set(unsigned int id, bool new_state)
 	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
 		return -EINVAL;
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->powergates_lock);
 
 	if (tegra_powergate_state(id) == new_state) {
-		mutex_unlock(&pmc->powergates_lock);
+		spin_unlock(&pmc->powergates_lock);
 		return 0;
 	}
 
@@ -300,7 +300,7 @@ static int tegra_powergate_set(unsigned int id, bool new_state)
 	err = readx_poll_timeout(tegra_powergate_state, id, status,
 				 status == new_state, 10, 100000);
 
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->powergates_lock);
 
 	return err;
 }
@@ -309,7 +309,7 @@ static int __tegra_powergate_remove_clamping(unsigned int id)
 {
 	u32 mask;
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->powergates_lock);
 
 	/*
 	 * On Tegra124 and later, the clamps for the GPU are controlled by a
@@ -336,7 +336,7 @@ static int __tegra_powergate_remove_clamping(unsigned int id)
 	tegra_pmc_writel(mask, REMOVE_CLAMPING);
 
 out:
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->powergates_lock);
 
 	return 0;
 }
@@ -529,9 +529,9 @@ int tegra_powergate_is_powered(unsigned int id)
 	if (!tegra_powergate_is_valid(id))
 		return -EINVAL;
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->powergates_lock);
 	status = tegra_powergate_state(id);
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->powergates_lock);
 
 	return status;
 }
@@ -998,7 +998,7 @@ int tegra_io_pad_power_enable(enum tegra_io_pad id)
 	u32 mask;
 	int err;
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->powergates_lock);
 
 	err = tegra_io_pad_prepare(id, &request, &status, &mask);
 	if (err < 0) {
@@ -1017,7 +1017,7 @@ int tegra_io_pad_power_enable(enum tegra_io_pad id)
 	tegra_io_pad_unprepare();
 
 unlock:
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->powergates_lock);
 	return err;
 }
 EXPORT_SYMBOL(tegra_io_pad_power_enable);
@@ -1034,7 +1034,7 @@ int tegra_io_pad_power_disable(enum tegra_io_pad id)
 	u32 mask;
 	int err;
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->powergates_lock);
 
 	err = tegra_io_pad_prepare(id, &request, &status, &mask);
 	if (err < 0) {
@@ -1053,7 +1053,7 @@ int tegra_io_pad_power_disable(enum tegra_io_pad id)
 	tegra_io_pad_unprepare();
 
 unlock:
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->powergates_lock);
 	return err;
 }
 EXPORT_SYMBOL(tegra_io_pad_power_disable);
@@ -1071,7 +1071,7 @@ int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 	if (pad->voltage == UINT_MAX)
 		return -ENOTSUPP;
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->powergates_lock);
 
 	/* write-enable PMC_PWR_DET_VALUE[pad->voltage] */
 	value = tegra_pmc_readl(PMC_PWR_DET);
@@ -1088,7 +1088,7 @@ int tegra_io_pad_set_voltage(enum tegra_io_pad id,
 
 	tegra_pmc_writel(value, PMC_PWR_DET_VALUE);
 
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->powergates_lock);
 
 	usleep_range(100, 250);
 
@@ -1436,10 +1436,10 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	mutex_lock(&pmc->powergates_lock);
+	spin_lock(&pmc->powergates_lock);
 	iounmap(pmc->base);
 	pmc->base = base;
-	mutex_unlock(&pmc->powergates_lock);
+	spin_unlock(&pmc->powergates_lock);
 
 	return 0;
 }
@@ -1919,7 +1919,7 @@ static int __init tegra_pmc_early_init(void)
 	struct resource regs;
 	bool invert;
 
-	mutex_init(&pmc->powergates_lock);
+	spin_lock_init(&pmc->powergates_lock);
 
 	np = of_find_matching_node_and_match(NULL, tegra_pmc_match, &match);
 	if (!np) {
-- 
2.18.0
