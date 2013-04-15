From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] ARM: tegra: cpuidle: Remove unused variables
Date: Mon, 15 Apr 2013 09:32:01 +0200
Message-ID: <1366011121-7858-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Commit 0697598 ("ARM: tegra: cpuidle: remove useless initialization")
removes the last usage of the drv variable from the Tegra20, Tegra30 and
Tegra114 cpuidle drivers but forgot to remove the variable.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/mach-tegra/cpuidle-tegra114.c | 1 -
 arch/arm/mach-tegra/cpuidle-tegra20.c  | 1 -
 arch/arm/mach-tegra/cpuidle-tegra30.c  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
index c527cff..d6bea18 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra114.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
@@ -37,7 +37,6 @@ int __init tegra114_cpuidle_init(void)
 	int ret;
 	unsigned int cpu;
 	struct cpuidle_device *dev;
-	struct cpuidle_driver *drv = &tegra_idle_driver;
 
 	ret = cpuidle_register_driver(&tegra_idle_driver);
 	if (ret) {
diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index 7cb1d3a..a1d524d 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -220,7 +220,6 @@ int __init tegra20_cpuidle_init(void)
 	int ret;
 	unsigned int cpu;
 	struct cpuidle_device *dev;
-	struct cpuidle_driver *drv = &tegra_idle_driver;
 
 #ifdef CONFIG_PM_SLEEP
 	tegra_tear_down_cpu = tegra20_tear_down_cpu;
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index 3fa95df..a308a3d 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -152,7 +152,6 @@ int __init tegra30_cpuidle_init(void)
 	int ret;
 	unsigned int cpu;
 	struct cpuidle_device *dev;
-	struct cpuidle_driver *drv = &tegra_idle_driver;
 
 #ifdef CONFIG_PM_SLEEP
 	tegra_tear_down_cpu = tegra30_tear_down_cpu;
-- 
1.8.2
