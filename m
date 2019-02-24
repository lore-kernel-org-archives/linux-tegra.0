From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] ARM: tegra: cpuidle: Handle tick broadcasting within cpuidle core on Tegra20/30
Date: Sun, 24 Feb 2019 18:21:14 +0300
Message-ID: <20190224152114.6161-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra20/30 drivers do not handle the tick_broadcast_enter() error which
potentially could happen when CPU timer isn't permitted to be stopped.
Let's just move out the broadcasting to the CPUIDLE core by setting the
respective flag in the Tegra20/30 drivers. This patch doesn't fix any
problem because currently tick_broadcast_enter() could fail only on
ARM64, so consider this change as a minor cleanup.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/cpuidle-tegra20.c | 11 ++---------
 arch/arm/mach-tegra/cpuidle-tegra30.c |  9 +--------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index 3f24addd7972..6620d61b5ec5 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -61,7 +61,8 @@ static struct cpuidle_driver tegra_idle_driver = {
 			.exit_latency     = 5000,
 			.target_residency = 10000,
 			.power_usage      = 0,
-			.flags            = CPUIDLE_FLAG_COUPLED,
+			.flags            = CPUIDLE_FLAG_COUPLED |
+			                    CPUIDLE_FLAG_TIMER_STOP,
 			.name             = "powered-down",
 			.desc             = "CPU power gated",
 		},
@@ -136,12 +137,8 @@ static bool tegra20_cpu_cluster_power_down(struct cpuidle_device *dev,
 	if (tegra20_reset_cpu_1() || !tegra_cpu_rail_off_ready())
 		return false;
 
-	tick_broadcast_enter();
-
 	tegra_idle_lp2_last();
 
-	tick_broadcast_exit();
-
 	if (cpu_online(1))
 		tegra20_wake_cpu1_from_reset();
 
@@ -153,14 +150,10 @@ static bool tegra20_idle_enter_lp2_cpu_1(struct cpuidle_device *dev,
 					 struct cpuidle_driver *drv,
 					 int index)
 {
-	tick_broadcast_enter();
-
 	cpu_suspend(0, tegra20_sleep_cpu_secondary_finish);
 
 	tegra20_cpu_clear_resettable();
 
-	tick_broadcast_exit();
-
 	return true;
 }
 #else
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index c1417361e10e..c8fe0447e3a9 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -56,6 +56,7 @@ static struct cpuidle_driver tegra_idle_driver = {
 			.exit_latency		= 2000,
 			.target_residency	= 2200,
 			.power_usage		= 0,
+			.flags			= CPUIDLE_FLAG_TIMER_STOP,
 			.name			= "powered-down",
 			.desc			= "CPU power gated",
 		},
@@ -76,12 +77,8 @@ static bool tegra30_cpu_cluster_power_down(struct cpuidle_device *dev,
 		return false;
 	}
 
-	tick_broadcast_enter();
-
 	tegra_idle_lp2_last();
 
-	tick_broadcast_exit();
-
 	return true;
 }
 
@@ -90,14 +87,10 @@ static bool tegra30_cpu_core_power_down(struct cpuidle_device *dev,
 					struct cpuidle_driver *drv,
 					int index)
 {
-	tick_broadcast_enter();
-
 	smp_wmb();
 
 	cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
 
-	tick_broadcast_exit();
-
 	return true;
 }
 #else
-- 
2.20.1
