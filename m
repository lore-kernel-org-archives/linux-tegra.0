From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/6] ARM: tegra: add Tegra124 SoC support
Date: Tue, 8 Oct 2013 12:50:03 +0800
Message-ID: <1381207808-14734-2-git-send-email-josephl@nvidia.com>
References: <1381207808-14734-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381207808-14734-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add Tegra124 SoC support that base on CortexA15MP Core. And enable the
SMP function that can re-use the same procedure with Tegra114.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* squash the [v1 1/7] ~ [v2 3/7] into the 1st patch in v2
---
 arch/arm/mach-tegra/Kconfig   | 8 ++++++++
 arch/arm/mach-tegra/fuse.h    | 1 +
 arch/arm/mach-tegra/platsmp.c | 2 ++
 arch/arm/mach-tegra/tegra.c   | 1 +
 4 files changed, 12 insertions(+)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 67a76f2..92272e0 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -61,6 +61,14 @@ config ARCH_TEGRA_114_SOC
 	  Support for NVIDIA Tegra T114 processor family, based on the
 	  ARM CortexA15MP CPU
 
+config ARCH_TEGRA_124_SOC
+	bool "Enable support for Tegra124 family"
+	select ARM_L1_CACHE_SHIFT_6
+	select HAVE_ARM_ARCH_TIMER
+	help
+	  Support for NVIDIA Tegra T124 processor family, based on the
+	  ARM CortexA15MP CPU
+
 config TEGRA_AHB
 	bool "Enable AHB driver for NVIDIA Tegra SoCs"
 	default y
diff --git a/arch/arm/mach-tegra/fuse.h b/arch/arm/mach-tegra/fuse.h
index def7968..c01d047 100644
--- a/arch/arm/mach-tegra/fuse.h
+++ b/arch/arm/mach-tegra/fuse.h
@@ -29,6 +29,7 @@
 #define TEGRA20		0x20
 #define TEGRA30		0x30
 #define TEGRA114	0x35
+#define TEGRA124	0x40
 
 #ifndef __ASSEMBLY__
 enum tegra_revision {
diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
index 2d02036..eb72ae7 100644
--- a/arch/arm/mach-tegra/platsmp.c
+++ b/arch/arm/mach-tegra/platsmp.c
@@ -176,6 +176,8 @@ static int tegra_boot_secondary(unsigned int cpu,
 		return tegra30_boot_secondary(cpu, idle);
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_114_SOC) && tegra_chip_id == TEGRA114)
 		return tegra114_boot_secondary(cpu, idle);
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) && tegra_chip_id == TEGRA124)
+		return tegra114_boot_secondary(cpu, idle);
 
 	return -EINVAL;
 }
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 40b031c..80b801a 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -181,6 +181,7 @@ static void __init tegra_dt_init_late(void)
 }
 
 static const char * const tegra_dt_board_compat[] = {
+	"nvidia,tegra124",
 	"nvidia,tegra114",
 	"nvidia,tegra30",
 	"nvidia,tegra20",
-- 
1.8.4
