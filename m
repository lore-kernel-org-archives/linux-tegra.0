From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH 3/3] sound: ASoC: tegra: Select tegra30 i2s and ahub for tegra124 SoC
Date: Tue, 18 Apr 2017 17:11:59 +0200
Message-ID: <20170418151159.31843-1-contact@paulk.fr>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This selects the tegra30 i2s and ahub controllers for the tegra124 SoC.
These are needed when building without ARCH_TEGRA_3x_SOC set.

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
---
 sound/soc/tegra/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index efbe8d4c019e..bcd18d2cf7a7 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -46,7 +46,7 @@ config SND_SOC_TEGRA20_SPDIF
 
 config SND_SOC_TEGRA30_AHUB
 	tristate
-	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
+	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC || ARCH_TEGRA_124_SOC)
 	help
 	  Say Y or M if you want to add support for the Tegra20 AHUB module.
 	  You will also need to select the individual machine drivers to
@@ -54,7 +54,7 @@ config SND_SOC_TEGRA30_AHUB
 
 config SND_SOC_TEGRA30_I2S
 	tristate
-	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
+	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC || ARCH_TEGRA_124_SOC)
 	select SND_SOC_TEGRA30_AHUB
 	help
 	  Say Y or M if you want to add support for codecs attached to the
@@ -123,7 +123,7 @@ config SND_SOC_TEGRA_MAX98090
 	tristate "SoC Audio support for Tegra boards using a MAX98090 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
-	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
+	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC || ARCH_TEGRA_124_SOC
 	select SND_SOC_MAX98090
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
-- 
2.12.2
