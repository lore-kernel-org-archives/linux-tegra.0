From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: defconfig updates
Date: Mon,  4 Jun 2012 12:03:38 -0600
Message-ID: <1338833018-18408-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Enable:
* SND_SOC_TEGRA_WM8753 (new feature)

Remove some deleted options:
* MACH_KAEN
* MACH_VENTANA
* MACH_WARIO

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I'll be applying this immediately for 3.6.

 arch/arm/configs/tegra_defconfig |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 1198dd6..019a43e 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -25,11 +25,8 @@ CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_MACH_HARMONY=y
-CONFIG_MACH_KAEN=y
 CONFIG_MACH_PAZ00=y
 CONFIG_MACH_TRIMSLICE=y
-CONFIG_MACH_WARIO=y
-CONFIG_MACH_VENTANA=y
 CONFIG_TEGRA_EMC_SCALING_ENABLE=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
@@ -126,6 +123,7 @@ CONFIG_SND=y
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
+CONFIG_SND_SOC_TEGRA_WM8753=y
 CONFIG_SND_SOC_TEGRA_WM8903=y
 CONFIG_SND_SOC_TEGRA_TRIMSLICE=y
 CONFIG_SND_SOC_TEGRA_ALC5632=y
-- 
1.7.0.4
