From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 3/3] ARM: tegra114: cpuidle: add powered-down state
Date: Tue, 4 Jun 2013 18:48:00 +0800
Message-ID: <1370342880-422-4-git-send-email-josephl@nvidia.com>
References: <1370342880-422-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370342880-422-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This supports CPU core power down on each CPU when CPU idle. When CPU go
into this state, it saves it's context and needs a proper configuration
in flow controller to power gate the CPU when CPU runs into WFI
instruction. And the CPU also needs to set the IRQ as CPU power down idle
wake up event in flow controller.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* remove some redundant code of memory barrier
* remove the function declaration by rearranging the coding sequence 
---
 arch/arm/mach-tegra/cpuidle-tegra114.c | 51 +++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
index 1d1c602..e0b8730 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra114.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
@@ -17,15 +17,64 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/cpuidle.h>
+#include <linux/cpu_pm.h>
+#include <linux/clockchips.h>
 
 #include <asm/cpuidle.h>
+#include <asm/suspend.h>
+#include <asm/smp_plat.h>
+
+#include "pm.h"
+#include "sleep.h"
+
+#ifdef CONFIG_PM_SLEEP
+#define TEGRA114_MAX_STATES 2
+#else
+#define TEGRA114_MAX_STATES 1
+#endif
+
+#ifdef CONFIG_PM_SLEEP
+static int tegra114_idle_power_down(struct cpuidle_device *dev,
+				    struct cpuidle_driver *drv,
+				    int index)
+{
+	local_fiq_disable();
+
+	tegra_set_cpu_in_lp2();
+	cpu_pm_enter();
+
+	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
+
+	cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
+
+	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
+
+	cpu_pm_exit();
+	tegra_clear_cpu_in_lp2();
+
+	local_fiq_enable();
+
+	return index;
+}
+#endif
 
 static struct cpuidle_driver tegra_idle_driver = {
 	.name = "tegra_idle",
 	.owner = THIS_MODULE,
-	.state_count = 1,
+	.state_count = TEGRA114_MAX_STATES,
 	.states = {
 		[0] = ARM_CPUIDLE_WFI_STATE_PWR(600),
+#ifdef CONFIG_PM_SLEEP
+		[1] = {
+			.enter			= tegra114_idle_power_down,
+			.exit_latency		= 500,
+			.target_residency	= 1000,
+			.power_usage		= 0,
+			.flags			= CPUIDLE_FLAG_TIME_VALID,
+			.name			= "powered-down",
+			.desc			= "CPU power gated",
+		},
+#endif
 	},
 };
 
-- 
1.8.3
