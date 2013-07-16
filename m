From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: expose config options for individual SoCs
Date: Tue, 16 Jul 2013 16:34:37 -0600
Message-ID: <1374014077-22536-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I'm planning to remove CONFIG_ARCH_TEGRA_*_SOC, leaving just ARCH_TEGRA.
This will reduce the number of configurations that need to be supported
by core Tegra code, e.g. CPU idle, hotplug. As a precursor, we need to
update Kconfig for all Tegra drivers not to reference ARCH_TEGRA_*_SOC.

The Tegra pinctrl driver contains a fairly large amount of SoC-specific
code and data. Introduce explicit config options so that the user can
trim the set of supported SoCs if they wish. Default these to on, since
most people will probably want to enable support for all SoCs. This also
avoids the need to change any defconfig files.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/Kconfig | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 5a8ad51..25a56b5 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -207,15 +207,21 @@ config PINCTRL_TEGRA
 	select PINCONF
 
 config PINCTRL_TEGRA20
-	bool
+	bool "NVIDIA Tegra20 pin control driver"
+	depends on ARCH_TEGRA
+	default y
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA30
-	bool
+	bool "NVIDIA Tegra30 pin control driver"
+	depends on ARCH_TEGRA
+	default y
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA114
-	bool
+	bool "NVIDIA Tegra114 pin control driver"
+	depends on ARCH_TEGRA
+	default y
 	select PINCTRL_TEGRA
 
 config PINCTRL_TZ1090
-- 
1.8.1.5
