From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Add GPIOLIB dependencies
Date: Tue, 16 Jul 2013 18:50:21 +0100
Message-ID: <1373997021-28995-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

For build coverage.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 sound/soc/tegra/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index cd168a7..68fd6d0 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -61,7 +61,7 @@ config SND_SOC_TEGRA30_I2S
 
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
-	depends on SND_SOC_TEGRA && I2C
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
 	select SND_SOC_RT5640
@@ -71,7 +71,7 @@ config SND_SOC_TEGRA_RT5640
 
 config SND_SOC_TEGRA_WM8753
 	tristate "SoC Audio support for Tegra boards using a WM8753 codec"
-	depends on SND_SOC_TEGRA && I2C
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
 	select SND_SOC_WM8753
@@ -81,7 +81,7 @@ config SND_SOC_TEGRA_WM8753
 
 config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
-	depends on SND_SOC_TEGRA && I2C
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_TEGRA30_I2S if ARCH_TEGRA_3x_SOC
 	select SND_SOC_WM8903
@@ -92,7 +92,7 @@ config SND_SOC_TEGRA_WM8903
 
 config SND_SOC_TEGRA_WM9712
 	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
-	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC
+	depends on SND_SOC_TEGRA && ARCH_TEGRA_2x_SOC && GPIOLIB
 	select SND_SOC_TEGRA20_AC97
 	select SND_SOC_WM9712
 	help
@@ -110,7 +110,7 @@ config SND_SOC_TEGRA_TRIMSLICE
 
 config SND_SOC_TEGRA_ALC5632
 	tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
-	depends on SND_SOC_TEGRA && I2C
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
 	select SND_SOC_TEGRA20_I2S if ARCH_TEGRA_2x_SOC
 	select SND_SOC_ALC5632
 	help
-- 
1.8.3.2
