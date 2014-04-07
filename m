From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove TEGRA_EMC_SCALING_ENABLE
Date: Mon,  7 Apr 2014 10:52:23 -0600
Message-ID: <1396889543-11896-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>

Commit a7cbe92cef27 ("ARM: tegra: remove tegra EMC scaling driver")
removed the only user of TEGRA_EMC_SCALING_ENABLE. Remove its Kconfig
entry too.

Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
arm-soc, this is another fix patch for 3.15.

 arch/arm/mach-tegra/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 92d660f9610f..55b305d51669 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -70,7 +70,4 @@ config TEGRA_AHB
 	  which controls AHB bus master arbitration and some
 	  performance parameters(priority, prefech size).
 
-config TEGRA_EMC_SCALING_ENABLE
-	bool "Enable scaling the memory frequency"
-
 endmenu
-- 
1.8.1.5
