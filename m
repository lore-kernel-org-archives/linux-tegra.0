From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Tue, 25 Jun 2013 17:23:48 +0800
Message-ID: <1372152228-16199-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when entering
this state.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch depends on the patch "tick:  Fix tick_broadcast_pending_mask not cleared".
---
 arch/arm/mach-tegra/cpuidle-tegra20.c | 11 ++---------
 arch/arm/mach-tegra/cpuidle-tegra30.c | 13 ++-----------
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index 706aa42..c7598fb 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -60,7 +60,8 @@ static struct cpuidle_driver tegra_idle_driver = {
 			.target_residency = 10000,
 			.power_usage      = 0,
 			.flags            = CPUIDLE_FLAG_TIME_VALID |
-			CPUIDLE_FLAG_COUPLED,
+					    CPUIDLE_FLAG_COUPLED |
+					    CPUIDLE_FLAG_TIMER_STOP,
 			.name             = "powered-down",
 			.desc             = "CPU power gated",
 		},
@@ -137,12 +138,8 @@ static bool tegra20_cpu_cluster_power_down(struct cpuidle_device *dev,
 	if (tegra20_reset_cpu_1() || !tegra_cpu_rail_off_ready())
 		return false;
 
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
-
 	tegra_idle_lp2_last();
 
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
-
 	if (cpu_online(1))
 		tegra20_wake_cpu1_from_reset();
 
@@ -154,14 +151,10 @@ static bool tegra20_idle_enter_lp2_cpu_1(struct cpuidle_device *dev,
 					 struct cpuidle_driver *drv,
 					 int index)
 {
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
-
 	cpu_suspend(0, tegra20_sleep_cpu_secondary_finish);
 
 	tegra20_cpu_clear_resettable();
 
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
-
 	return true;
 }
 #else
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index ed2a2a7..8ffd8d9 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -56,7 +56,8 @@ static struct cpuidle_driver tegra_idle_driver = {
 			.exit_latency		= 2000,
 			.target_residency	= 2200,
 			.power_usage		= 0,
-			.flags			= CPUIDLE_FLAG_TIME_VALID,
+			.flags			= CPUIDLE_FLAG_TIME_VALID |
+						  CPUIDLE_FLAG_TIMER_STOP,
 			.name			= "powered-down",
 			.desc			= "CPU power gated",
 		},
@@ -77,12 +78,8 @@ static bool tegra30_cpu_cluster_power_down(struct cpuidle_device *dev,
 		return false;
 	}
 
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
-
 	tegra_idle_lp2_last();
 
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
-
 	return true;
 }
 
@@ -91,14 +88,8 @@ static bool tegra30_cpu_core_power_down(struct cpuidle_device *dev,
 					struct cpuidle_driver *drv,
 					int index)
 {
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
-
-	smp_wmb();
-
 	cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
 
-	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
-
 	return true;
 }
 #else
-- 
1.8.3.1
