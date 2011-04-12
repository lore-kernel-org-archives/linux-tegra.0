From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ASoC: Tegra: Rename Kconfig SND_TEGRA_SOC_* to SND_SOC_TEGRA_*
Date: Tue, 12 Apr 2011 11:40:37 -0600
Message-ID: <1302630039-19514-2-git-send-email-swarren@nvidia.com>
References: <1302630039-19514-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302630039-19514-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The previous commit renames SND_TEGRA_SOC_HARMONY to SND_TEGRA_SOC_WM8903.
While we're breaking people's .config files, rename all Tegra/SOC-related
Kconfig variables to be more consistent with at least the core codec
variables. Note that there exist machines that name their variables both
ways.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch is for 2.6.40, and for the ASoC subsystem

 sound/soc/tegra/Kconfig  |   12 ++++++------
 sound/soc/tegra/Makefile |   10 +++++-----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 9e53fec..21125b3 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -1,24 +1,24 @@
-config SND_TEGRA_SOC
+config SND_SOC_TEGRA
 	tristate "SoC Audio for the Tegra System-on-Chip"
 	depends on ARCH_TEGRA && TEGRA_SYSTEM_DMA
 	default m
 	help
 	  Say Y or M here if you want support for SoC audio on Tegra.
 
-config SND_TEGRA_SOC_I2S
+config SND_SOC_TEGRA_I2S
 	tristate
-	depends on SND_TEGRA_SOC
+	depends on SND_SOC_TEGRA
 	default m
 	help
 	  Say Y or M if you want to add support for codecs attached to the
 	  Tegra I2S interface. You will also need to select the individual
 	  machine drivers to support below.
 
-config SND_TEGRA_SOC_WM8903
+config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
-	depends on SND_TEGRA_SOC && MACH_HARMONY && I2C
+	depends on SND_SOC_TEGRA && MACH_HARMONY && I2C
 	default m
-	select SND_TEGRA_SOC_I2S
+	select SND_SOC_TEGRA_I2S
 	select SND_SOC_WM8903
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index c9f7ea4..13bef8d 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -4,12 +4,12 @@ snd-soc-tegra-pcm-objs := tegra_pcm.o
 snd-soc-tegra-i2s-objs := tegra_i2s.o
 snd-soc-tegra-utils-objs += tegra_asoc_utils.o
 
-obj-$(CONFIG_SND_TEGRA_SOC) += snd-soc-tegra-utils.o
-obj-$(CONFIG_SND_TEGRA_SOC) += snd-soc-tegra-das.o
-obj-$(CONFIG_SND_TEGRA_SOC) += snd-soc-tegra-pcm.o
-obj-$(CONFIG_SND_TEGRA_SOC_I2S) += snd-soc-tegra-i2s.o
+obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
+obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-das.o
+obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
+obj-$(CONFIG_SND_SOC_TEGRA_I2S) += snd-soc-tegra-i2s.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
 
-obj-$(CONFIG_SND_TEGRA_SOC_WM8903) += snd-soc-tegra-wm8903.o
+obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
-- 
1.7.1
