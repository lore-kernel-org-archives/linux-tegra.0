From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: remove CONFIG_ARCH_TEGRA_*_SOC
Date: Tue, 16 Jul 2013 16:36:20 -0600
Message-ID: <1374014181-22605-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These kconfig symbols are no longer used, so delete them.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
These will need to be applied after all the various subsystems have
merged the other patches I sent related to ARCH_TEGRA_*_SOC, and those
subsystem trees have all been merged together. So, after v3.12-rc1 some
time.

 arch/arm/mach-tegra/Kconfig | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 94713e4..b1fabe6 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -3,9 +3,6 @@ config ARCH_TEGRA
 	select ARCH_HAS_CPUFREQ
 	select ARCH_NEEDS_CPU_IDLE_COUPLED if SMP
 	select ARCH_REQUIRE_GPIOLIB
-	select ARCH_TEGRA_2x_SOC
-	select ARCH_TEGRA_3x_SOC
-	select ARCH_TEGRA_114_SOC
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_754327 if SMP
@@ -43,15 +40,6 @@ config ARCH_TEGRA
 menu "NVIDIA Tegra options"
 	depends on ARCH_TEGRA
 
-config ARCH_TEGRA_2x_SOC
-	bool
-
-config ARCH_TEGRA_3x_SOC
-	bool
-
-config ARCH_TEGRA_114_SOC
-	bool
-
 config TEGRA_PCI
 	bool "PCI Express support"
 	depends on ARCH_TEGRA
-- 
1.8.1.5
