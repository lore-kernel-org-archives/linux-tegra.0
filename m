From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: Tegra: select MACH_WANT_SND_SOC_TEGRA_WM8903
Date: Mon, 18 Apr 2011 21:40:12 -0600
Message-ID: <1303184412-3494-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

CONFIG_SND_SOC_TEGRA_WM8903 is useful for many Tegra boards. To avoid the
ASoC tegra/Kconfig enumerating them all, instead have the Tegra machine
Kconfig select MACH_WANT_SND_SOC_TEGRA_WM8903 where appropriate, and have
SND_SOC_TEGRA_WM8903 depend on this.

This addresses Olof's feedback on 773b1d3 "ASoC: Tegra: Support more
boards".

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Mark, this will need to be applied to your tegra branch so it can get
merged into both trees. Thanks.

 arch/arm/mach-tegra/Kconfig |    3 +++
 sound/soc/tegra/Kconfig     |   10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 3cdeffc..561b5e0 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -27,12 +27,14 @@ comment "Tegra board type"
 
 config MACH_HARMONY
        bool "Harmony board"
+       select MACH_WANT_SND_SOC_TEGRA_WM8903
        help
          Support for nVidia Harmony development platform
 
 config MACH_KAEN
        bool "Kaen board"
        select MACH_SEABOARD
+       select MACH_WANT_SND_SOC_TEGRA_WM8903
        help
          Support for the Kaen version of Seaboard
 
@@ -43,6 +45,7 @@ config MACH_PAZ00
 
 config MACH_SEABOARD
        bool "Seaboard board"
+       select MACH_WANT_SND_SOC_TEGRA_WM8903
        help
          Support for nVidia Seaboard development platform. It will
 	 also be included for some of the derivative boards that
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 14f7119..64a5b92 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -14,10 +14,16 @@ config SND_SOC_TEGRA_I2S
 	  Tegra I2S interface. You will also need to select the individual
 	  machine drivers to support below.
 
+config MACH_WANT_SND_SOC_TEGRA_WM8903
+	bool
+	help
+	  Machines that use the SND_SOC_TEGRA_WM8903 driver should select
+	  this config option, in order to allow the user to enable
+	  SND_SOC_TEGRA_WM8903.
+
 config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
-	depends on SND_SOC_TEGRA && I2C
-	depends on MACH_HARMONY || MACH_VENTANA || MACH_SEABOARD || MACH_KAEN || MACH_AEBL
+	depends on SND_SOC_TEGRA && I2C && MACH_WANT_SND_SOC_TEGRA_WM8903
 	default m
 	select SND_SOC_TEGRA_I2S
 	select SND_SOC_WM8903
-- 
1.7.1
