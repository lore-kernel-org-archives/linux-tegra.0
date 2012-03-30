From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 08/17] ASoC: tegra: make Tegra20 drivers depend on Tegra20 support
Date: Fri, 30 Mar 2012 17:07:23 -0600
Message-ID: <1333148852-17806-9-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Without this, the Tegra20 drivers can be built into a kernel that's
built only for Tegra30.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/Kconfig |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 87fb90d..3aec43d 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -6,7 +6,7 @@ config SND_SOC_TEGRA
 
 config SND_SOC_TEGRA_DAS
 	tristate "Tegra Digital Audio Switch driver"
-	depends on SND_SOC_TEGRA
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
 	help
 	  Say Y or M if you want to add support for the Tegra DAS module.
 	  You will also need to select the individual machine drivers to
@@ -14,7 +14,7 @@ config SND_SOC_TEGRA_DAS
 
 config SND_SOC_TEGRA_I2S
 	tristate "Tegra I2S driver"
-	depends on SND_SOC_TEGRA
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
 	select SND_SOC_TEGRA_DAS
 	help
 	  Say Y or M if you want to add support for codecs attached to the
@@ -23,7 +23,7 @@ config SND_SOC_TEGRA_I2S
 
 config SND_SOC_TEGRA_SPDIF
 	tristate "Tegra SPDIF driver"
-	depends on SND_SOC_TEGRA
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
 	default m
 	help
 	  Say Y or M if you want to add support for the SPDIF interface.
@@ -41,7 +41,7 @@ config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
 	depends on SND_SOC_TEGRA && I2C
 	depends on MACH_HAS_SND_SOC_TEGRA_WM8903
-	select SND_SOC_TEGRA_I2S
+	select SND_SOC_TEGRA_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_WM8903
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -51,7 +51,7 @@ config SND_SOC_TEGRA_WM8903
 config SND_SOC_TEGRA_TRIMSLICE
 	tristate "SoC Audio support for TrimSlice board"
 	depends on SND_SOC_TEGRA && MACH_TRIMSLICE && I2C
-	select SND_SOC_TEGRA_I2S
+	select SND_SOC_TEGRA_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_TLV320AIC23
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
@@ -60,7 +60,7 @@ config SND_SOC_TEGRA_TRIMSLICE
 config SND_SOC_TEGRA_ALC5632
 	tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
 	depends on SND_SOC_TEGRA && I2C
-	select SND_SOC_TEGRA_I2S
+	select SND_SOC_TEGRA_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_ALC5632
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
-- 
1.7.0.4
