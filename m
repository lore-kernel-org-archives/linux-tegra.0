From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: simplify Kconfig dependencies
Date: Mon, 21 May 2012 15:22:23 -0600
Message-ID: <1337635343-16613-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra ASoC machine drivers only depend on Tegra architecture support
to compile, not specific board support. Remove Kconfig dependencies on
any particular board. This is required since Kconfig options for boards
are going away given the migration to device tree.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
(This is for 3.6)

Note that changes in the Tegra tree will remove some of the chunks of
mach-tegra/Kconfig that are edited here, since those chunks are the
board-specific Kconfig options. However, I hope those conflicts are
easy enough to resolve that this is not an issue.

 arch/arm/mach-tegra/Kconfig |    3 ---
 sound/soc/tegra/Kconfig     |   10 +---------
 2 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 6a113a9..7c40739 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -63,7 +63,6 @@ comment "Tegra board type"
 config MACH_HARMONY
        bool "Harmony board"
        depends on ARCH_TEGRA_2x_SOC
-       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
        help
          Support for nVidia Harmony development platform
 
@@ -71,7 +70,6 @@ config MACH_KAEN
        bool "Kaen board"
        depends on ARCH_TEGRA_2x_SOC
        select MACH_SEABOARD
-       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
        help
          Support for the Kaen version of Seaboard
 
@@ -84,7 +82,6 @@ config MACH_PAZ00
 config MACH_SEABOARD
        bool "Seaboard board"
        depends on ARCH_TEGRA_2x_SOC
-       select MACH_HAS_SND_SOC_TEGRA_WM8903 if SND_SOC
        help
          Support for nVidia Seaboard development platform. It will
 	 also be included for some of the derivative boards that
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index c1c8e95..76dc230 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -58,17 +58,9 @@ config SND_SOC_TEGRA_WM8753
 	  Say Y or M here if you want to add support for SoC audio on Tegra
 	  boards using the WM8753 codec, such as Whistler.
 
-config MACH_HAS_SND_SOC_TEGRA_WM8903
-	bool
-	help
-	  Machines that use the SND_SOC_TEGRA_WM8903 driver should select
-	  this config option, in order to allow the user to enable
-	  SND_SOC_TEGRA_WM8903.
-
 config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
 	depends on SND_SOC_TEGRA && I2C
-	depends on MACH_HAS_SND_SOC_TEGRA_WM8903
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
 	select SND_SOC_WM8903
@@ -79,7 +71,7 @@ config SND_SOC_TEGRA_WM8903
 
 config SND_SOC_TEGRA_TRIMSLICE
 	tristate "SoC Audio support for TrimSlice board"
-	depends on SND_SOC_TEGRA && MACH_TRIMSLICE && I2C
+	depends on SND_SOC_TEGRA && I2C
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_TLV320AIC23
 	help
-- 
1.7.0.4
