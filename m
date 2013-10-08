From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: CPU hotplug support for Tegra124
Date: Tue, 8 Oct 2013 16:23:05 +0800
Message-ID: <1381220587-29697-3-git-send-email-josephl@nvidia.com>
References: <1381220587-29697-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381220587-29697-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The procedure of CPU hotplug for Tegra124 is same with Tegra114. We
re-use the same function with it.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Makefile  | 1 +
 arch/arm/mach-tegra/hotplug.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 97eb48e..04ca2b3 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -35,5 +35,6 @@ obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= pm-tegra30.o
 ifeq ($(CONFIG_CPU_IDLE),y)
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= cpuidle-tegra114.o
 endif
+obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= sleep-tegra30.o
 
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-paz00.o
diff --git a/arch/arm/mach-tegra/hotplug.c b/arch/arm/mach-tegra/hotplug.c
index 04de2e8..ff26af2 100644
--- a/arch/arm/mach-tegra/hotplug.c
+++ b/arch/arm/mach-tegra/hotplug.c
@@ -57,4 +57,6 @@ void __init tegra_hotplug_init(void)
 		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) && tegra_chip_id == TEGRA114)
 		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) && tegra_chip_id == TEGRA124)
+		tegra_hotplug_shutdown = tegra30_hotplug_shutdown;
 }
-- 
1.8.4
