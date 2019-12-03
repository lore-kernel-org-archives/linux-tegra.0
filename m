From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 05/19] ARM: tegra: Propagate error from tegra_idle_lp2_last()
Date: Tue,  3 Dec 2019 03:41:02 +0300
Message-ID: <20191203004116.11771-6-digetx@gmail.com>
References: <20191203004116.11771-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191203004116.11771-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Technically cpu_suspend() may fail and it's never good to lose information
about failure. For example things like cpuidle core could correctly sample
idling time in the case of failure.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/cpuidle-tegra20.c | 6 ++++--
 arch/arm/mach-tegra/cpuidle-tegra30.c | 4 +---
 arch/arm/mach-tegra/pm.c              | 8 ++++++--
 arch/arm/mach-tegra/pm.h              | 2 +-
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index f7d5041e73cc..9789541adb7d 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -87,15 +87,17 @@ static bool tegra20_cpu_cluster_power_down(struct cpuidle_device *dev,
 					   struct cpuidle_driver *drv,
 					   int index)
 {
+	bool ret;
+
 	while (!tegra_cpu_rail_off_ready())
 		cpu_relax();
 
-	tegra_idle_lp2_last();
+	ret = !tegra_idle_lp2_last();
 
 	if (cpu_online(1))
 		tegra20_wake_cpu1_from_reset();
 
-	return true;
+	return ret;
 }
 
 #ifdef CONFIG_SMP
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index a3ce8dabfe18..17cbd118abee 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -68,9 +68,7 @@ static bool tegra30_cpu_cluster_power_down(struct cpuidle_device *dev,
 		return false;
 	}
 
-	tegra_idle_lp2_last();
-
-	return true;
+	return !tegra_idle_lp2_last();
 }
 
 #ifdef CONFIG_SMP
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index a72f9a2d3cb7..a094acaca307 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -189,14 +189,16 @@ static void tegra_pm_set(enum tegra_suspend_mode mode)
 	tegra_pmc_enter_suspend_mode(mode);
 }
 
-void tegra_idle_lp2_last(void)
+int tegra_idle_lp2_last(void)
 {
+	int err;
+
 	tegra_pm_set(TEGRA_SUSPEND_LP2);
 
 	cpu_cluster_pm_enter();
 	suspend_cpu_complex();
 
-	cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
+	err = cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
 
 	/*
 	 * Resume L2 cache if it wasn't re-enabled early during resume,
@@ -208,6 +210,8 @@ void tegra_idle_lp2_last(void)
 
 	restore_cpu_complex();
 	cpu_cluster_pm_exit();
+
+	return err;
 }
 
 enum tegra_suspend_mode tegra_pm_validate_suspend_mode(
diff --git a/arch/arm/mach-tegra/pm.h b/arch/arm/mach-tegra/pm.h
index 2c294f6365c0..7d72f31dee77 100644
--- a/arch/arm/mach-tegra/pm.h
+++ b/arch/arm/mach-tegra/pm.h
@@ -25,7 +25,7 @@ void tegra30_sleep_core_init(void);
 
 void tegra_clear_cpu_in_lp2(void);
 void tegra_set_cpu_in_lp2(void);
-void tegra_idle_lp2_last(void);
+int tegra_idle_lp2_last(void);
 extern void (*tegra_tear_down_cpu)(void);
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.24.0
