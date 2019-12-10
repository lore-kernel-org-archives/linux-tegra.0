From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ASoC: rt5677: add SPI_MASTER dependency
Date: Tue, 10 Dec 2019 20:52:26 +0100
Message-ID: <20191210195333.648018-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ben Zhang <benzh@chromium.org>, Curtis Malainey <cujomalainey@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, KaiChieh Chuang <kaichieh.chuang@mediatek.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

When CONFIG_SPI is disabled, the newly added code for the DSP
firmware loading fails to link:

ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!

Add a dependency to prevent this configuration.

Note: the does not work with the DT probing, as there is no binding
for the SPI half of the driver, but nothing seems to be using that
with the mainline kernel anyway.

Fixes: 461c623270e4 ("ASoC: rt5677: Load firmware via SPI using delayed work")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig       | 1 +
 sound/soc/intel/boards/Kconfig | 1 +
 sound/soc/mediatek/Kconfig     | 2 +-
 sound/soc/tegra/Kconfig        | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 71b7286d14f2..8e9c461a84f8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1047,6 +1047,7 @@ config SND_SOC_RT5670
 
 config SND_SOC_RT5677
 	tristate
+	depends on SPI_MASTER
 	select REGMAP_I2C
 	select REGMAP_IRQ
 
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index ef20316e83d1..da7f9111f3d3 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -34,6 +34,7 @@ if SND_SOC_INTEL_HASWELL || SND_SOC_SOF_BROADWELL
 config SND_SOC_INTEL_BDW_RT5677_MACH
 	tristate "Broadwell with RT5677 codec"
 	depends on I2C
+	depends on SPI_MASTER
 	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
 	depends on GPIOLIB || COMPILE_TEST
 	depends on X86_INTEL_LPSS || COMPILE_TEST
diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index a656d2014127..4699787c93ed 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -97,7 +97,7 @@ config SND_SOC_MT8173_RT5650_RT5514
 
 config SND_SOC_MT8173_RT5650_RT5676
 	tristate "ASoC Audio driver for MT8173 with RT5650 RT5676 codecs"
-	depends on SND_SOC_MT8173 && I2C
+	depends on SND_SOC_MT8173 && I2C && SPI_MASTER
 	select SND_SOC_RT5645
 	select SND_SOC_RT5677
 	select SND_SOC_HDMI_CODEC
diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index addadc827b91..df36e84c0116 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -122,7 +122,7 @@ config SND_SOC_TEGRA_MAX98090
 
 config SND_SOC_TEGRA_RT5677
 	tristate "SoC Audio support for Tegra boards using a RT5677 codec"
-	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB && SPI_MASTER
 	select SND_SOC_RT5677
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
-- 
2.20.0
