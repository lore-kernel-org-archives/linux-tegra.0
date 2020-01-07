From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: rt5677: add SPI_MASTER dependency
Date: Tue, 7 Jan 2020 09:16:31 +0100
Message-ID: <CAK8P3a1it2a1CmkkOfVqhLE33jmKWhHEtria+ESoz6uSkcP8_w@mail.gmail.com>
References: <20191210195333.648018-1-arnd@arndb.de> <d739240f-aaa6-c310-9c68-16c1a08ce759@nvidia.com>
 <9c9169cc-0da5-f247-c8f7-f6913ca2bfb5@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9c9169cc-0da5-f247-c8f7-f6913ca2bfb5@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, Ben Zhang <benzh@chromium.org>, Curtis Malainey <cujomalainey@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jie Yang <yang.jie@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, KaiChieh Chuang <kaichieh.chuang@mediatek.com>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, moderated li
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 6, 2020 at 10:55 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 12/11/19 4:59 AM, Jon Hunter wrote:
> >
> > On 10/12/2019 19:52, Arnd Bergmann wrote:
> >> When CONFIG_SPI is disabled, the newly added code for the DSP
> >> firmware loading fails to link:
> >>
> >> ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> >> ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> >
> > Would it be better if the above functions or the functions that call
> > these are conditional on CONFIG_SND_SOC_RT5677_SPI?
>
> they are already conditional, with a fallback provided:
>
> #if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
> int rt5677_spi_read(u32 addr, void *rxbuf, size_t len);

Right, this fixed the problem.

> in theory if SPI is not enabled the fallback static inlines would always
> be selected?
>
> Arnd, if you can share the .config that exposes this problem it'd be nice

I just tried it again and it seems that the issue was already fixed by
commit fb3194413d1e ("ASoC: rt5677: Fix build error without CONFIG_SPI"),
which had not been merged by the time I created my patch as an
alternative workaround.

      Arnd
