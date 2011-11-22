From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Tegra: Add support of tegra boards basedon ALC5632 codec
Date: Tue, 22 Nov 2011 14:30:47 +0100
Message-ID: <2859567.Mz2G74lSW9@fb07-iapwap2>
References: <1321906088-29964-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321906088-29964-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

added Cc: linux-tegra, Stephen Warren, Olof Johansson

Hi Leon,

I still don't see how the hp gpio detect comes in. Can you explain this?

Marc


Am Montag, 21. November 2011, 22:08:08 schrieb Leon Romanovsky:
> At this stage only Toshiba AC100/Dynabook supported.
> 
> Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
> Signed-off-by: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
> ---
>  sound/soc/tegra/Kconfig         |    9 ++
>  sound/soc/tegra/Makefile        |    2 +
>  sound/soc/tegra/tegra_alc5632.c |  298 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 309 insertions(+), 0 deletions(-)
>  create mode 100644 sound/soc/tegra/tegra_alc5632.c
> 
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index c6af1fd..f8fcda3 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -47,3 +47,12 @@ config SND_SOC_TEGRA_TRIMSLICE
>  	help
>  	  Say Y or M here if you want to add support for SoC audio on the
>  	  TrimSlice platform.
> +
> +config SND_SOC_TEGRA_ALC5632
> +	tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
> +	depends on SND_SOC_TEGRA && I2C
> +	select SND_SOC_TEGRA_I2S
> +	select SND_SOC_ALC5632
> +	help
> +	  Say Y or M here if you want to add support for SoC audio on the
> +	  Toshiba AC100 netbook.
> diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
> index 4d943b3..8e584b8 100644
> --- a/sound/soc/tegra/Makefile
> +++ b/sound/soc/tegra/Makefile
> @@ -14,6 +14,8 @@ obj-$(CONFIG_SND_SOC_TEGRA_SPDIF) += snd-soc-tegra-spdif.o
>  # Tegra machine Support
>  snd-soc-tegra-wm8903-objs := tegra_wm8903.o
>  snd-soc-tegra-trimslice-objs := trimslice.o
> +snd-soc-tegra-alc5632-objs := tegra_alc5632.o
> 
>  obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
>  obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
> +obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
> diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
> new file mode 100644
> index 0000000..b8828c1
> --- /dev/null
> +++ b/sound/soc/tegra/tegra_alc5632.c
> @@ -0,0 +1,298 @@
> +/*
> +* tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver

										^^^ you may replace this with "Tegra machine ASoC 
driver for boards using ALC5332 codec"

> +*
> +* Copyright (C) 2011 The AC100 Kernel Team <ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org>
> +*
> +* Authors:  Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
> +*           Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
> +*           Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> +*
> +* This program is free software; you can redistribute it and/or modify
> +* it under the terms of the GNU General Public License version 2 as
> +* published by the Free Software Foundation.
> +*/
> +
> +#include <asm/mach-types.h>
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/gpio.h>
> +
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +
> +#include "../codecs/alc5632.h"
> +
> +#include "tegra_das.h"
> +#include "tegra_i2s.h"
> +#include "tegra_pcm.h"
> +#include "tegra_asoc_utils.h"
> +
> +#define DRV_NAME "tegra-alc5632"
> +
> +struct tegra_alc5632 {
> +	struct tegra_asoc_utils_data util_data;
> +};
> +
> +static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> +	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct snd_soc_card *card = codec->card;
> +	struct tegra_alc5632 *alc5632 = snd_soc_card_get_drvdata(card);
> +	int srate, mclk;
> +	int err;
> +
> +	srate = params_rate(params);
> +	switch (srate) {
> +	case 64000:
> +	case 88200:
> +	case 96000:
> +		mclk = 128 * srate;
> +		break;
> +	default:
> +		mclk = 512 * srate;
> +		break;
> +	}
> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
> +	while (mclk < 6000000)
> +		mclk *= 2;
> +
> +	err = tegra_asoc_utils_set_rate(&alc5632->util_data, srate, mclk);
> +	if (err < 0) {
> +		dev_err(card->dev, "Can't configure clocks\n");
> +		return err;
> +	}
> +
> +	err = snd_soc_dai_set_fmt(codec_dai,
> +					SND_SOC_DAIFMT_I2S |
> +					SND_SOC_DAIFMT_NB_NF |
> +					SND_SOC_DAIFMT_CBS_CFS);
> +	if (err < 0) {
> +		dev_err(card->dev, "codec_dai fmt not set\n");
> +		return err;
> +	}
> +
> +	err = snd_soc_dai_set_fmt(cpu_dai,
> +					SND_SOC_DAIFMT_I2S |
> +					SND_SOC_DAIFMT_NB_NF |
> +					SND_SOC_DAIFMT_CBS_CFS);
> +	if (err < 0) {
> +		dev_err(card->dev, "cpu_dai fmt not set\n");
> +		return err;
> +	}
> +
> +	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
> +					SND_SOC_CLOCK_IN);
> +	if (err < 0) {
> +		dev_err(card->dev, "codec_dai clock not set\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_ops tegra_alc5632_asoc_ops = {
> +	.hw_params = tegra_alc5632_asoc_hw_params,
> +};
> +
> +static struct snd_soc_jack tegra_alc5632_hs_jack;
> +
> +static struct snd_soc_jack_pin tegra_alc5632_hs_jack_pins[] = {
> +	{
> +		.pin = "Headset Mic",
> +		.mask = SND_JACK_MICROPHONE,
> +	},
> +	{
> +		.pin = "Headset Stereophone",
> +		.mask = SND_JACK_HEADPHONE,
> +	},
> +};
> +
> +static struct snd_soc_jack_gpio tegra_alc5632_hs_jack_gpios[] = {
> +	{
> +		.name = "Headset Detect",
> +		.report = SND_JACK_HEADSET,
> +		.debounce_time = 150,
> +	}
> +};
> +
> +static const struct snd_soc_dapm_widget tegra_alc5632_dapm_widgets[] = {
> +	SND_SOC_DAPM_SPK("Int Spk", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_HP("Headset Stereophone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +};
> +
> +static const struct snd_soc_dapm_route tegra_alc5632_audio_map[] = {
> +	/* Internal Mic */
> +	{"MIC2", NULL, "Mic Bias 2"},
> +	{"Mic Bias 2", NULL, "Int Mic"},
> +
> +	/* Internal Speaker */
> +	{"Int Spk", NULL, "SPKOUT"},
> +	{"Int Spk", NULL, "SPKOUTN"},
> +
> +	/* Headset Mic */
> +	{"MIC1", NULL, "Mic Bias 1"},
> +	{"Mic Bias 1", NULL, "Headset Mic"},
> +
> +	/* Headset Stereophone */
> +	{"Headset Stereophone", NULL, "HPR"},
> +	{"Headset Stereophone", NULL, "HPL"},
> +};
> +
> +static const struct snd_kcontrol_new tegra_alc5632_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Int Spk"),
> +};
> +
> +static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_codec *codec = rtd->codec;
> +	struct snd_soc_dapm_context *dapm = &codec->dapm;
> +	int ret;
> +
> +	ret = snd_soc_add_controls(codec, tegra_alc5632_controls,
> +				   ARRAY_SIZE(tegra_alc5632_controls));
> +	if (ret < 0)
> +		return ret;
> +
> +	snd_soc_dapm_new_controls(dapm, tegra_alc5632_dapm_widgets,
> +		ARRAY_SIZE(tegra_alc5632_dapm_widgets));
> +
> +	snd_soc_dapm_add_routes(dapm, tegra_alc5632_audio_map,
> +		ARRAY_SIZE(tegra_alc5632_audio_map));
> +
> +	snd_soc_jack_new(codec, "Headset Jack", SND_JACK_HEADSET,
> +			 &tegra_alc5632_hs_jack);
> +	snd_soc_jack_add_pins(&tegra_alc5632_hs_jack,
> +			ARRAY_SIZE(tegra_alc5632_hs_jack_pins),
> +			tegra_alc5632_hs_jack_pins);
> +	snd_soc_jack_add_gpios(&tegra_alc5632_hs_jack,
> +			ARRAY_SIZE(tegra_alc5632_hs_jack_gpios),
> +			tegra_alc5632_hs_jack_gpios);
> +
> +	snd_soc_dapm_nc_pin(dapm, "AUXOUT");
> +	snd_soc_dapm_nc_pin(dapm, "LINEINL");
> +	snd_soc_dapm_nc_pin(dapm, "LINEINR");
> +	snd_soc_dapm_nc_pin(dapm, "PHONEP");
> +	snd_soc_dapm_nc_pin(dapm, "PHONEN");
> +	snd_soc_dapm_nc_pin(dapm, "MIC2");
> +
> +	snd_soc_dapm_sync(dapm);
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_dai_link tegra_alc5632_dai = {
> +	.name = "ALC5632",
> +	.stream_name = "ALC5632 PCM",
> +	.codec_name = "alc5632.0-001e",
> +	.platform_name = "tegra-pcm-audio",
> +	.cpu_dai_name = "tegra-i2s.0",
> +	.codec_dai_name = "alc5632-hifi",
> +	.init = tegra_alc5632_asoc_init,
> +	.ops = &tegra_alc5632_asoc_ops,
> +};
> +
> +static struct snd_soc_card snd_soc_tegra_alc5632 = {
> +	.name = "tegra-alc5632",
> +	.dai_link = &tegra_alc5632_dai,
> +	.num_links = 1,
> +};
> +
> +static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = &snd_soc_tegra_alc5632;
> +	struct tegra_alc5632 *alc5632;
> +	int ret;
> +
> +	if (!machine_is_paz00()) {
> +		dev_err(&pdev->dev, "Not running on Toshiba AC100!\n");
> +		return -ENODEV;
> +	}
> +
> +	alc5632 = kzalloc(sizeof(struct tegra_alc5632), GFP_KERNEL);
> +	if (!alc5632) {
> +		dev_err(&pdev->dev, "Can't allocate tegra_alc5632\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
> +	if (ret)
> +		goto err_free_tegra_alc5632;
> +
> +	card->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, card);
> +	snd_soc_card_set_drvdata(card, alc5632);
> +
> +	ret = snd_soc_register_card(card);
> +	if (ret) {
> +		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
> +			ret);
> +		goto err_clear_drvdata;
> +	}
> +
> +	return 0;
> +
> +err_clear_drvdata:
> +	snd_soc_card_set_drvdata(card, NULL);
> +	platform_set_drvdata(pdev, NULL);
> +	card->dev = NULL;
> +	tegra_asoc_utils_fini(&alc5632->util_data);
> +err_free_tegra_alc5632:
> +	kfree(alc5632);
> +	return ret;
> +}
> +
> +static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +	struct tegra_alc5632 *alc5632 = snd_soc_card_get_drvdata(card);
> +
> +	snd_soc_unregister_card(card);
> +
> +	snd_soc_card_set_drvdata(card, NULL);
> +	platform_set_drvdata(pdev, NULL);
> +	card->dev = NULL;
> +
> +	tegra_asoc_utils_fini(&alc5632->util_data);
> +
> +	kfree(alc5632);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver tegra_alc5632_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +		.owner = THIS_MODULE,
> +		.pm = &snd_soc_pm_ops,
> +	},
> +	.probe = tegra_alc5632_probe,
> +	.remove = __devexit_p(tegra_alc5632_remove),
> +};
> +
> +static int __init tegra_alc5632_init(void)
> +{
> +	return platform_driver_register(&tegra_alc5632_driver);
> +}
> +module_init(tegra_alc5632_init);
> +
> +static void __exit tegra_alc5632_exit(void)
> +{
> +	platform_driver_unregister(&tegra_alc5632_driver);
> +}
> +module_exit(tegra_alc5632_exit);
> +
> +MODULE_AUTHOR("Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>");
> +MODULE_DESCRIPTION("Tegra+ALC5632 machine ASoC driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);
