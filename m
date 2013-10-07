From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix ARCH_TEGRA_114_SOC select sort order
Date: Mon,  7 Oct 2013 13:11:45 -0600
Message-ID: <1381173105-17971-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

All the other select statements are alphabetically sorted. Fix the one
remaining escape.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 67a76f2..f2e026a 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -53,9 +53,9 @@ config ARCH_TEGRA_3x_SOC
 
 config ARCH_TEGRA_114_SOC
 	bool "Enable support for Tegra114 family"
-	select HAVE_ARM_ARCH_TIMER
 	select ARM_ERRATA_798181
 	select ARM_L1_CACHE_SHIFT_6
+	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA114
 	help
 	  Support for NVIDIA Tegra T114 processor family, based on the
-- 
1.8.1.5
