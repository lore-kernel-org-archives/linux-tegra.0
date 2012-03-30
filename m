From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 07/17] ASoC: tegra: introduce separate Kconfig variable for DAS driver
Date: Fri, 30 Mar 2012 17:07:22 -0600
Message-ID: <1333148852-17806-8-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is mainly for symmetry with a future Tegra30 driver, where the
equivalent of the DAS (the AHUB) is useful separately from the I2S driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/Kconfig  |    9 +++++++++
 sound/soc/tegra/Makefile |    2 +-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index e42ca2e..87fb90d 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -4,9 +4,18 @@ config SND_SOC_TEGRA
 	help
 	  Say Y or M here if you want support for SoC audio on Tegra.
 
+config SND_SOC_TEGRA_DAS
+	tristate "Tegra Digital Audio Switch driver"
+	depends on SND_SOC_TEGRA
+	help
+	  Say Y or M if you want to add support for the Tegra DAS module.
+	  You will also need to select the individual machine drivers to
+	  support below.
+
 config SND_SOC_TEGRA_I2S
 	tristate "Tegra I2S driver"
 	depends on SND_SOC_TEGRA
+	select SND_SOC_TEGRA_DAS
 	help
 	  Say Y or M if you want to add support for codecs attached to the
 	  Tegra I2S interface. You will also need to select the individual
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 8e584b8..6d5d81e 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -6,7 +6,7 @@ snd-soc-tegra-spdif-objs := tegra_spdif.o
 snd-soc-tegra-utils-objs += tegra_asoc_utils.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
-obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-das.o
+obj-$(CONFIG_SND_SOC_TEGRA_DAS) += snd-soc-tegra-das.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA_I2S) += snd-soc-tegra-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA_SPDIF) += snd-soc-tegra-spdif.o
-- 
1.7.0.4
