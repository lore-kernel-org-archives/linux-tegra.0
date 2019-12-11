From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: rt5677: add SPI_MASTER dependency
Date: Wed, 11 Dec 2019 10:59:51 +0000
Message-ID: <d739240f-aaa6-c310-9c68-16c1a08ce759@nvidia.com>
References: <20191210195333.648018-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191210195333.648018-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: Ben Zhang <benzh@chromium.org>, Curtis Malainey <cujomalainey@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, KaiChieh Chuang <kaichieh.chuang@mediatek.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 10/12/2019 19:52, Arnd Bergmann wrote:
> When CONFIG_SPI is disabled, the newly added code for the DSP
> firmware loading fails to link:
> 
> ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!

Would it be better if the above functions or the functions that call
these are conditional on CONFIG_SND_SOC_RT5677_SPI?

> Add a dependency to prevent this configuration.
> 
> Note: the does not work with the DT probing, as there is no binding

Are you missing 'SPI' or something here?

> for the SPI half of the driver, but nothing seems to be using that
> with the mainline kernel anyway.

From a Tegra perspective, given that we don't use SPI in conjunction
with the rt5677 codec, only I2C so far, I am not sure we should make the
tegra_rt5677 driver dependent upon it. We should be able to operate
without the SPI bits enabled.

Cheers
Jon

-- 
nvpublic
