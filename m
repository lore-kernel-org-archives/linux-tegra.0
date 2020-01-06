From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt5677: add SPI_MASTER dependency
Date: Mon, 6 Jan 2020 15:55:53 -0600
Message-ID: <9c9169cc-0da5-f247-c8f7-f6913ca2bfb5@linux.intel.com>
References: <20191210195333.648018-1-arnd@arndb.de>
 <d739240f-aaa6-c310-9c68-16c1a08ce759@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d739240f-aaa6-c310-9c68-16c1a08ce759@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: Ben Zhang <benzh@chromium.org>, Curtis Malainey <cujomalainey@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jie Yang <yang.jie@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, KaiChieh Chuang <kaichieh.chuang@mediatek.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org



On 12/11/19 4:59 AM, Jon Hunter wrote:
> 
> On 10/12/2019 19:52, Arnd Bergmann wrote:
>> When CONFIG_SPI is disabled, the newly added code for the DSP
>> firmware loading fails to link:
>>
>> ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
>> ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> 
> Would it be better if the above functions or the functions that call
> these are conditional on CONFIG_SND_SOC_RT5677_SPI?

they are already conditional, with a fallback provided:

#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
int rt5677_spi_read(u32 addr, void *rxbuf, size_t len);
int rt5677_spi_write(u32 addr, const void *txbuf, size_t len);
int rt5677_spi_write_firmware(u32 addr, const struct firmware *fw);
void rt5677_spi_hotword_detected(void);
#else
static inline int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
{
	return -EINVAL;
}
static inline int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
{
	return -EINVAL;
}
static inline int rt5677_spi_write_firmware(u32 addr, const struct 
firmware *fw)
{
	return -EINVAL;
}
static inline void rt5677_spi_hotword_detected(void){}
#endif

and since we have the following definition

config SND_SOC_RT5677_SPI
	tristate
	default SND_SOC_RT5677 && SPI

in theory if SPI is not enabled the fallback static inlines would always 
be selected?

Arnd, if you can share the .config that exposes this problem it'd be nice

FWIW, there are other missing dependencies, the SPI controller was not 
explicitly enabled so depending on the Kconfigs used by a distro the 
machine driver probe could fail with the spi-RT5677AA component never 
registered. The patch below seems to work for me (more testing needed)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b149e28a2076..cf1a2fde4c47 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -50,6 +50,9 @@ config SND_SOC_INTEL_BDW_RT5677_MACH
         depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
         depends on GPIOLIB || COMPILE_TEST
         depends on X86_INTEL_LPSS || COMPILE_TEST
+       depends on SPI_MASTER
+       select SPI_PXA2XX
+       select SND_SOC_RT5677_SPI
         select SND_SOC_RT5677
         help
           This adds support for Intel Broadwell platform based boards with
