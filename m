From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/12] ARM: tegra: Setup CPU hotplug in a pure initcall
Date: Fri, 11 Jul 2014 14:16:08 +0200
Message-ID: <1405080971-7609-10-git-send-email-thierry.reding@gmail.com>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405080971-7609-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

CPU hotplug support doesn't have to be set up until fairly late in the
boot process, so it can be done in a regular initcall. To make sure that
we don't miss any ordering problems in the future, output a warning if
any of the functions are called before initialization has completed.

This is part of untangling the boot order dependencies on Tegra so that
more code can be shared between 32-bit and 64-bit ARM.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/hotplug.c | 12 ++++++++++--
 arch/arm/mach-tegra/sleep.h   |  3 ---
 arch/arm/mach-tegra/tegra.c   |  1 -
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/hotplug.c b/arch/arm/mach-tegra/hotplug.c
index d0a37dcbbb5d..e2ea4aa8f675 100644
--- a/arch/arm/mach-tegra/hotplug.c
+++ b/arch/arm/mach-tegra/hotplug.c
@@ -37,6 +37,11 @@ int tegra_cpu_kill(unsigned cpu)
  */
 void __ref tegra_cpu_die(unsigned int cpu)
 {
+	if (!tegra_hotplug_shutdown) {
+		WARN(1, "hotplug is not yet initialized\n");
+		return;
+	}
+
 	/* Clean L1 data cache */
 	tegra_disable_clean_inv_dcache(TEGRA_FLUSH_CACHE_LOUIS);
 
@@ -47,10 +52,10 @@ void __ref tegra_cpu_die(unsigned int cpu)
 	BUG();
 }
 
-void __init tegra_hotplug_init(void)
+static int __init tegra_hotplug_init(void)
 {
 	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU))
-		return;
+		return 0;
 
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && tegra_get_chip_id() == TEGRA20)
 		tegra_hotplug_shutdown = tegra20_hotplug_shutdown;
@@ -60,4 +65,7 @@ void __init tegra_hotplug_init(void)
 		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) && tegra_get_chip_id() == TEGRA124)
 		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
+
+	return 0;
 }
+pure_initcall(tegra_hotplug_init);
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 339fe42cd6fb..92d46ec1361a 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -130,9 +130,6 @@ void tegra_disable_clean_inv_dcache(u32 flag);
 #ifdef CONFIG_HOTPLUG_CPU
 void tegra20_hotplug_shutdown(void);
 void tegra30_hotplug_shutdown(void);
-void tegra_hotplug_init(void);
-#else
-static inline void tegra_hotplug_init(void) {}
 #endif
 
 void tegra20_cpu_shutdown(int cpu);
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 869fddd7e83e..b7d57027ae67 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -75,7 +75,6 @@ static void __init tegra_init_early(void)
 	tegra_init_fuse();
 	tegra_cpu_reset_handler_init();
 	tegra_powergate_init();
-	tegra_hotplug_init();
 }
 
 static void __init tegra_dt_init_irq(void)
-- 
2.0.1
