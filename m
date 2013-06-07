From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: disable nonboot CPUs when reboot
Date: Fri, 7 Jun 2013 17:36:50 +0800
Message-ID: <1370597810-1153-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The normal CPU hotplug flow in kernel and the flow for Tegra we expected,
is checking the CPU ID is OK for hotplug by "tegra_cpu_disable", the CPU
that would be hotplugged runs into a power-gate state by "tegra_cpu_die",
then the other CPU waits for the CPU that was hotplugged in reset and
clock gate it by "tegra_cpu_kill". That means we don't support the CPU
being stopped or put into offline by trigger "tegra_cpu_kill" directly.
It may cause a busy loop for waiting CPU in reset.

After the commit "62e930e reboot: rigrate shutdown/reboot to boot cpu",
we remove "disable_nonboot_cpus" when kernel_{restart,halt,power_off}.
But the ARM kernel trigger "send_smp_stop" when machine_shutdown, that
would cause the "tegra_cpu_kill" directly without "tegra_cpu_die" first.

We hook "disable_nonboot_cpus" in "reboot_notifier" to avoid that happens.
And it can work for reboot, shutdown, halt and kexec.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/hotplug.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/mach-tegra/hotplug.c b/arch/arm/mach-tegra/hotplug.c
index a52c10e..1676669 100644
--- a/arch/arm/mach-tegra/hotplug.c
+++ b/arch/arm/mach-tegra/hotplug.c
@@ -10,6 +10,8 @@
 #include <linux/kernel.h>
 #include <linux/smp.h>
 #include <linux/clk/tegra.h>
+#include <linux/cpu.h>
+#include <linux/reboot.h>
 
 #include <asm/smp_plat.h>
 
@@ -57,6 +59,21 @@ int tegra_cpu_disable(unsigned int cpu)
 	}
 }
 
+/*
+ * reboot notifier for avoid busy loop when trigger tegra_cpu_kill
+ * without tegra_cpu_die first
+ */
+static int tegra_cpu_kill_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	disable_nonboot_cpus();
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block tegra_cpu_kill_nb = {
+	.notifier_call = tegra_cpu_kill_notify,
+};
+
 void __init tegra_hotplug_init(void)
 {
 	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU))
@@ -68,4 +85,6 @@ void __init tegra_hotplug_init(void)
 		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) && tegra_chip_id == TEGRA114)
 		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
+
+	register_reboot_notifier(&tegra_cpu_kill_nb);
 }
-- 
1.8.3
