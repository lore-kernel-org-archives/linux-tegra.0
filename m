From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 16/17] ASoC: tegra: add Kconfig and Makefile support for Tegra30
Date: Fri, 30 Mar 2012 17:07:31 -0600
Message-ID: <1333148852-17806-17-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This adds Kconfig options for the Tegra30 AHUB and I2S controller, and
updates the Tegra+WM8903 machine driver Kconfig to select those.

Includes a squashed bugfix from Sumit Bhattacharya <sumitb-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/Kconfig  |   18 ++++++++++++++++++
 sound/soc/tegra/Makefile |    4 ++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 63603d0..cdec4be 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -30,6 +30,23 @@ config SND_SOC_TEGRA20_SPDIF
 	  You will also need to select the individual machine drivers to support
 	  below.
 
+config SND_SOC_TEGRA30_AHUB
+	tristate "Tegra30 Audio Hub driver"
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
+	help
+	  Say Y or M if you want to add support for the Tegra20 AHUB module.
+	  You will also need to select the individual machine drivers to
+	  support below.
+
+config SND_SOC_TEGRA30_I2S
+	tristate "Tegra30 I2S driver"
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
+	select SND_SOC_TEGRA30_AHUB
+	help
+	  Say Y or M if you want to add support for codecs attached to the
+	  Tegra30 I2S interface. You will also need to select the individual
+	  machine drivers to support below.
+
 config MACH_HAS_SND_SOC_TEGRA_WM8903
 	bool
 	help
@@ -42,6 +59,7 @@ config SND_SOC_TEGRA_WM8903
 	depends on SND_SOC_TEGRA && I2C
 	depends on MACH_HAS_SND_SOC_TEGRA_WM8903
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
+	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
 	select SND_SOC_WM8903
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 4726b90..98704b4 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -4,12 +4,16 @@ snd-soc-tegra-utils-objs += tegra_asoc_utils.o
 snd-soc-tegra20-das-objs := tegra20_das.o
 snd-soc-tegra20-i2s-objs := tegra20_i2s.o
 snd-soc-tegra20-spdif-objs := tegra20_spdif.o
+snd-soc-tegra30-ahub-objs := tegra30_ahub.o
+snd-soc-tegra30-i2s-objs := tegra30_i2s.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
 obj-$(CONFIG_SND_SOC_TEGRA20_DAS) += snd-soc-tegra20-das.o
 obj-$(CONFIG_SND_SOC_TEGRA20_I2S) += snd-soc-tegra20-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA20_SPDIF) += snd-soc-tegra20-spdif.o
+obj-$(CONFIG_SND_SOC_TEGRA30_AHUB) += snd-soc-tegra30-ahub.o
+obj-$(CONFIG_SND_SOC_TEGRA30_I2S) += snd-soc-tegra30-i2s.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
-- 
1.7.0.4
