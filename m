From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: disable SUSPEND/ARCH_SUSPEND_POSSIBLE for ARCH_TEGRA
Date: Wed, 25 Apr 2012 13:20:50 -0600
Message-ID: <1335381650-7666-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra doesn't yet support system sleep. Explicitly disable support
for this feature in Kconfig.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Russell, I assume this should go into the ARM patch tracker?

 arch/arm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4f4fead..5bc48d2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2243,7 +2243,7 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 config ARCH_SUSPEND_POSSIBLE
-	depends on !ARCH_S5PC100
+	depends on !ARCH_S5PC100 && !ARCH_TEGRA
 	depends on CPU_ARM920T || CPU_ARM926T || CPU_SA1100 || \
 		CPU_V6 || CPU_V6K || CPU_V7 || CPU_XSC3 || CPU_XSCALE
 	def_bool y
-- 
1.7.0.4
