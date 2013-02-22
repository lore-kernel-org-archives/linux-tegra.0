From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra114: bring up secondary CPU for SMP
Date: Fri, 22 Feb 2013 14:44:51 +0800
Message-ID: <1361515491-16199-5-git-send-email-josephl@nvidia.com>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361515491-16199-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The secondary CPU can be brought up by toggling the power in PMC. Then
the flow controller will release CPU to go by clearing the reset and
clamp signal automatically.

Based on the work by:
Bo Yan <byan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/platsmp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index 601bd0c..516aab2 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -146,6 +146,12 @@ remove_clamps:
 	return 0;
 }
 
+static int tegra114_boot_secondary(unsigned int cpu, struct task_struct *idle)
+{
+	cpu = cpu_logical_map(cpu);
+	return tegra_pmc_cpu_power_on(cpu);
+}
+
 static int __cpuinit tegra_boot_secondary(unsigned int cpu,
 					  struct task_struct *idle)
 {
@@ -153,6 +159,8 @@ static int __cpuinit tegra_boot_secondary(unsigned int cpu,
 		return tegra20_boot_secondary(cpu, idle);
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) && tegra_chip_id == TEGRA30)
 		return tegra30_boot_secondary(cpu, idle);
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) && tegra_chip_id == TEGRA114)
+		return tegra114_boot_secondary(cpu, idle);
 
 	return -EINVAL;
 }
-- 
1.8.1.1
