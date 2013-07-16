From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] memory: tegra: depend on ARCH_TEGRA, not ARCH_TEGRA_*
Date: Tue, 16 Jul 2013 16:19:07 -0600
Message-ID: <1374013147-4775-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I'm planning to remove CONFIG_ARCH_TEGRA_*_SOC, leaving just ARCH_TEGRA.
This will reduce the number of configurations that need to be supported
by core Tegra code, e.g. CPU idle, hotplug. As a precursor, we need to
update Kconfig for all Tegra drivers not to reference ARCH_TEGRA_*_SOC.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 29a11db..0ed76f7 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -33,7 +33,7 @@ config MVEBU_DEVBUS
 config TEGRA20_MC
 	bool "Tegra20 Memory Controller(MC) driver"
 	default y
-	depends on ARCH_TEGRA_2x_SOC
+	depends on ARCH_TEGRA
 	help
 	  This driver is for the Memory Controller(MC) module available
 	  in Tegra20 SoCs, mainly for a address translation fault
@@ -43,7 +43,7 @@ config TEGRA20_MC
 config TEGRA30_MC
 	bool "Tegra30 Memory Controller(MC) driver"
 	default y
-	depends on ARCH_TEGRA_3x_SOC
+	depends on ARCH_TEGRA
 	help
 	  This driver is for the Memory Controller(MC) module available
 	  in Tegra30 SoCs, mainly for a address translation fault
-- 
1.8.1.5
