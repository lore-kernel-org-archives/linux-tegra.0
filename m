From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: Tegra: select MACH_HAS_SND_SOC_TEGRA_WM8903
Date: Tue, 19 Apr 2011 10:18:01 -0600
Message-ID: <1303229881-9054-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

CONFIG_SND_SOC_TEGRA_WM8903 is useful for many Tegra boards. To avoid the
ASoC tegra/Kconfig enumerating them all, instead have the Tegra machine
Kconfig select MACH_HAS_SND_SOC_TEGRA_WM8903 where appropriate, and have
SND_SOC_TEGRA_WM8903 depend on this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Mark, this will need to be applied to your tegra branch so it can get
merged into both trees. Thanks.

v2: s/HAS/WANT/ in Kconfig variable name.
  I figured a machine "HAVING" a Kconfig variable didn't make much sense.
  I also wondered about ALLOW/ENABLE.
  Still, being consistent with existing variable naming is more important
  that the finer details of English:-)

 arch/arm/mach-tegra/Kconfig |    3 +++
 sound/soc/tegra/Kconfig     |   10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 3cdeffc..5ec1846 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -27,12 +27,14 @@ comment "Tegra board type"
 
 config MACH_HARMONY
        bool "Harmony board"
+       select MACH_HAS_SND_SOC_TEGRA_WM8903
        help
          Support for nVidia Harmony development platform
 
 config MACH_KAEN
        bool "Kaen board"
        select MACH_SEABOARD
+       select MACH_HAS_SND_SOC_TEGRA_WM8903
        help
          Support for the Kaen version of Seaboard
 
@@ -43,6 +45,7 @@ config MACH_PAZ00
 
 config MACH_SEABOARD
        bool "Seaboard board"
+       select MACH_HAS_SND_SOC_TEGRA_WM8903
        help
          Support for nVidia Seaboard development platform. It will
 	 also be included for some of the derivative boards that
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 14f7119..de32dfb 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -14,10 +14,16 @@ config SND_SOC_TEGRA_I2S
 	  Tegra I2S interface. You will also need to select the individual
 	  machine drivers to support below.
 
+config MACH_HAS_SND_SOC_TEGRA_WM8903
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
+	depends on SND_SOC_TEGRA && I2C && MACH_HAS_SND_SOC_TEGRA_WM8903
 	default m
 	select SND_SOC_TEGRA_I2S
 	select SND_SOC_WM8903
-- 
1.7.1
