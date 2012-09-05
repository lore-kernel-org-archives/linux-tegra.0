From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: enable SUSPEND/ARCH_SUSPEND_POSSIBLE for ARCH_TEGRA
Date: Wed,  5 Sep 2012 10:16:51 -0600
Message-ID: <1346861811-6597-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Even though system suspend/resume hasn't been validated on Tegra yet,
this Kconfig option needs to be enabled so that system shutdown is
reliable on an SMP system. Without it, I2C interrupts may be routed
to CPU0, whereas shutdown code may be running on CPU1, causing I2C
timeouts, preventing communication with the external PMIC.

This reverts 3d5e8af "ARM: disable SUSPEND/ARCH_SUSPEND_POSSIBLE for
ARCH_TEGRA".

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 88ff698..0dd1fca 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2247,7 +2247,7 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 config ARCH_SUSPEND_POSSIBLE
-	depends on !ARCH_S5PC100 && !ARCH_TEGRA
+	depends on !ARCH_S5PC100
 	depends on CPU_ARM920T || CPU_ARM926T || CPU_SA1100 || \
 		CPU_V6 || CPU_V6K || CPU_V7 || CPU_XSC3 || CPU_XSCALE || CPU_MOHAWK
 	def_bool y
-- 
1.7.0.4
