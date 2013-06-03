From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: hook tegra_tear_down_cpu function in the PM suspend init function
Date: Mon, 3 Jun 2013 19:17:45 +0800
Message-ID: <1370258267-30184-3-git-send-email-josephl@nvidia.com>
References: <1370258267-30184-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370258267-30184-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The tegra_tear_down_cpu was used to cut off the CPU rail for various Tegra
SoCs. Hooking it in the PM suspend init function and making the CPUidle
driver more generic.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/cpuidle-tegra20.c | 3 ---
 arch/arm/mach-tegra/cpuidle-tegra30.c | 3 ---
 arch/arm/mach-tegra/pm.c              | 9 +++++++++
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index 0cdba8d..d667513 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -214,8 +214,5 @@ static int tegra20_idle_lp2_coupled(struct cpuidle_device *dev,
 
 int __init tegra20_cpuidle_init(void)
 {
-#ifdef CONFIG_PM_SLEEP
-	tegra_tear_down_cpu = tegra20_tear_down_cpu;
-#endif
 	return cpuidle_register(&tegra_idle_driver, cpu_possible_mask);
 }
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index 3cf9aca..9d9f554 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -146,8 +146,5 @@ static int tegra30_idle_lp2(struct cpuidle_device *dev,
 
 int __init tegra30_cpuidle_init(void)
 {
-#ifdef CONFIG_PM_SLEEP
-	tegra_tear_down_cpu = tegra30_tear_down_cpu;
-#endif
 	return cpuidle_register(&tegra_idle_driver, NULL);
 }
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 45cf52c..779dbb4 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -44,6 +44,14 @@
 static DEFINE_SPINLOCK(tegra_lp2_lock);
 void (*tegra_tear_down_cpu)(void);
 
+static void tegra_tear_down_cpu_init(void)
+{
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && tegra_chip_id == TEGRA20)
+		tegra_tear_down_cpu = tegra20_tear_down_cpu;
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) && tegra_chip_id == TEGRA30)
+		tegra_tear_down_cpu = tegra30_tear_down_cpu;
+}
+
 /*
  * restore_cpu_complex
  *
@@ -224,6 +232,7 @@ void __init tegra_init_suspend(void)
 	if (tegra_pmc_get_suspend_mode() == TEGRA_SUSPEND_NONE)
 		return;
 
+	tegra_tear_down_cpu_init();
 	tegra_pmc_suspend_init();
 
 	suspend_set_ops(&tegra_suspend_ops);
-- 
1.8.3
