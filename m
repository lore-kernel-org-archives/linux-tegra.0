From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] ASoC: tegra: TrimSlice machine support
Date: Thu, 21 Apr 2011 10:01:05 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04973BB84D@HQMAIL01.nvidia.com>
References: <1303381618-19730-1-git-send-email-mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303381618-19730-1-git-send-email-mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike Rapoport wrote at Thursday, April 21, 2011 4:27 AM:
> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> ---
> v2 changes:
> * address Stephen and Mark comments
> * rebase against Mark's for-next branch

I don't want to step on Mark's toes and recommend the wrong thing, so
double-check this with him: However, since this is new functionality
rather than a bug-fix, I believe Mark will apply the changes to his
for-2.6.40 branch not for-next branch. Hence, you'll want to rebase
on top of that instead.

> * switch to data based specification of widgets and routes
> * explicitly disable unused codec pins
> 
>  sound/soc/tegra/Kconfig     |    9 ++
>  sound/soc/tegra/Makefile    |    2 +
>  sound/soc/tegra/trimslice.c |  228
> +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 239 insertions(+), 0 deletions(-)
>  create mode 100644 sound/soc/tegra/trimslice.c
> 
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index 14f7119..183b118 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -26,3 +26,12 @@ config SND_SOC_TEGRA_WM8903
>  	  boards using the WM8093 codec. Currently, the supported boards are
>  	  Harmony, Ventana, Seaboard, Kaen, and Aebl.
> 
> +config SND_TEGRA_SOC_TRIMSLICE

FYI, in Mark's for-2.6.40 branch, these have just very recently been
renamed to SND_SOC_TEGRA_* (Actually, I notice the context in your diff
has SND_SOC_TEGRA_WM8903 already renamed; I'm not sure how that happened;
perhaps you manually applied some of the patches I posted in order to
avoid merge conflicts?)

Same comment for the next 5 or so lines.

> +	tristate "SoC Audio support for TrimSlice board"
> +	depends on SND_SOC_TEGRA && MACH_TRIMSLICE && I2C
> +	default m

Mark just removed all the "default" lines from Kconfig, to allow Kconfig
to determine default policy.

> +	select SND_TEGRA_SOC_I2S
> +	select SND_SOC_TLV320AIC23
> +	help
> +	  Say Y or M here if you want to add support for SoC audio on the
> +	  TrimSlice platform.
> diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
> index 13bef8d..0a3d981 100644
> --- a/sound/soc/tegra/Makefile
> +++ b/sound/soc/tegra/Makefile
> @@ -11,5 +11,7 @@ obj-$(CONFIG_SND_SOC_TEGRA_I2S) += snd-soc-tegra-i2s.o
> 
>  # Tegra machine Support
>  snd-soc-tegra-wm8903-objs := tegra_wm8903.o
> +snd-soc-tegra-trimslice-objs := trimslice.o
> 
>  obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
> +obj-$(CONFIG_SND_TEGRA_SOC_TRIMSLICE) += snd-soc-tegra-trimslice.o

Same renaming comment.

... (parts of patch elided)

> +static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct snd_soc_card *card = codec->card;
> +	struct tegra_trimslice *trimslice = snd_soc_card_get_drvdata(card);
> +	int srate, mclk;
> +	int err;
> +
> +	srate = params_rate(params);
> +	mclk = 128 * srate;

OK, that looks nicer to me than the last version.

... (rest of patch elided)

-- 
nvpublic
