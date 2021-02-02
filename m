Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F5C433E0
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 13:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29BEA64F6E
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 13:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhBBNXf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 08:23:35 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3718 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhBBNXc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Feb 2021 08:23:32 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6019522b0000>; Tue, 02 Feb 2021 05:22:51 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb
 2021 13:22:46 +0000
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
To:     Ion Agorria <AG0RRIA@yahoo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephen Warren <swarren@nvidia.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
Date:   Tue, 2 Feb 2021 13:22:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210131184101.651486-3-AG0RRIA@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612272171; bh=Iq0AzrLFDFzDddODCgO12naMUdTv4HBQm/D07VRDLro=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=fUX6HBGVmRlZxViLtneNugtFM2iKguJW/5KPmf6Qr7ienb9mcoTcfVdXBYNK5QUue
         mG1Xg4RK5AbqeonfJwVYKH+21EoUoFzDjMip/ArGz92576Uf0gOrmCZ92Qous9Ky/i
         UMmTF/9nRn3q2jk1BCgKGLQKsB/XYMLAuDdlG3mITHLoYXeFEJrVTOQXR4tfqDgA2T
         Vl+zcOnPZrEBKbTpwUhXrhIFbFhrUD4EhkgOItG/7Aegc1Zi3sn6h60WU8Gx+s3l0V
         LuUiKXhlDdyUfF3kqzBQbDrqGp88tnm0wlyl8b82R+ntOqH/RJKNPboc+4wdoXvpda
         TdkMW62kuD2HQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 31/01/2021 18:41, Ion Agorria wrote:
> From: Svyatoslav Ryhel <clamor95@gmail.com>
> 
> Add Tegra ASoC driver for Realtek ALC5631/RT5631 codec. The RT5631
> codec is found on devices like ASUS Transformer TF201, TF700T and other
> Tegra-based Android tablets.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> ---
>  sound/soc/tegra/Kconfig        |   8 +
>  sound/soc/tegra/Makefile       |   2 +
>  sound/soc/tegra/tegra_rt5631.c | 261 +++++++++++++++++++++++++++++++++
>  3 files changed, 271 insertions(+)
>  create mode 100644 sound/soc/tegra/tegra_rt5631.c
> 
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index acaf7339168d..449a858f155d 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -126,6 +126,14 @@ config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
>  	  few things for Tegra audio. Most of the code is re-used from
>  	  audio graph driver and the same DT bindings are used.
>  
> +config SND_SOC_TEGRA_RT5631
> +	tristate "SoC Audio support for Tegra boards using an RT5631 codec"
> +	depends on SND_SOC_TEGRA && I2C && GPIOLIB
> +	select SND_SOC_RT5631
> +	help
> +	  Say Y or M here if you want to add support for SoC audio on Tegra
> +	  boards using the RT5631 codec, such as Transformer.
> +
>  config SND_SOC_TEGRA_RT5640
>  	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
>  	depends on SND_SOC_TEGRA && I2C && GPIOLIB
> diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
> index af0b9889306c..11debfc03bc4 100644
> --- a/sound/soc/tegra/Makefile
> +++ b/sound/soc/tegra/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
>  obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
>  
>  # Tegra machine Support
> +snd-soc-tegra-rt5631-objs := tegra_rt5631.o
>  snd-soc-tegra-rt5640-objs := tegra_rt5640.o
>  snd-soc-tegra-rt5677-objs := tegra_rt5677.o
>  snd-soc-tegra-wm8753-objs := tegra_wm8753.o
> @@ -41,6 +42,7 @@ snd-soc-tegra-max98090-objs := tegra_max98090.o
>  snd-soc-tegra-sgtl5000-objs := tegra_sgtl5000.o
>  snd-soc-tegra-audio-graph-card-objs := tegra_audio_graph_card.o
>  
> +obj-$(CONFIG_SND_SOC_TEGRA_RT5631) += snd-soc-tegra-rt5631.o
>  obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
>  obj-$(CONFIG_SND_SOC_TEGRA_RT5677) += snd-soc-tegra-rt5677.o
>  obj-$(CONFIG_SND_SOC_TEGRA_WM8753) += snd-soc-tegra-wm8753.o
> diff --git a/sound/soc/tegra/tegra_rt5631.c b/sound/soc/tegra/tegra_rt5631.c
> new file mode 100644
> index 000000000000..9034f48bcb26
> --- /dev/null
> +++ b/sound/soc/tegra/tegra_rt5631.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * tegra_rt5631.c - Tegra machine ASoC driver for boards using RT5631 codec.
> + *
> + * Copyright (c) 2020, Svyatoslav Ryhel and Ion Agorria

2021 now :-)

> + *
> + * Based on code copyright/by:
> + *
> + * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + * Author: Stephen Warren <swarren@nvidia.com>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +
> +#include "tegra_asoc_utils.h"
> +
> +#include "../codecs/rt5631.h"
> +
> +struct tegra_rt5631 {
> +	struct tegra_asoc_utils_data util_data;
> +	struct gpio_desc *gpiod_hp_mute;
> +	struct gpio_desc *gpiod_hp_det;
> +};
> +
> +static int tegra_rt5631_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
> +	struct tegra_rt5631 *machine = snd_soc_card_get_drvdata(card);
> +	unsigned int srate, mclk;
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
> +		mclk = 256 * srate;
> +		break;
> +	}
> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
> +	while (mclk < 6000000)
> +		mclk *= 2;

I don't understand that above. You say greater or equal to 3MHz, but
then compare against 6MHz. Please explain and elborate a bit more in the
comment.

> +
> +	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
> +	if (err < 0) {
> +		dev_err(card->dev, "Can't configure clocks\n");
> +		return err;
> +	}
> +
> +	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk, SND_SOC_CLOCK_IN);
> +	if (err < 0) {
> +		dev_err(card->dev, "codec_dai clock not set\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_ops tegra_rt5631_ops = {
> +	.hw_params = tegra_rt5631_hw_params,
> +};
> +
> +static struct snd_soc_jack tegra_rt5631_hp_jack;
> +
> +static struct snd_soc_jack_pin tegra_rt5631_hp_jack_pins[] = {
> +	{
> +		.pin = "Headphone Jack",
> +		.mask = SND_JACK_HEADPHONE,
> +	},
> +};
> +
> +static struct snd_soc_jack_gpio tegra_rt5631_hp_jack_gpio = {
> +	.name = "Headphone detection",
> +	.report = SND_JACK_HEADPHONE,
> +	.debounce_time = 150,
> +};
> +
> +static int tegra_rt5631_event_hp(struct snd_soc_dapm_widget *w,
> +				 struct snd_kcontrol *k, int event)
> +{
> +	struct snd_soc_dapm_context *dapm = w->dapm;
> +	struct snd_soc_card *card = dapm->card;
> +	struct tegra_rt5631 *machine = snd_soc_card_get_drvdata(card);
> +
> +	gpiod_set_value_cansleep(machine->gpiod_hp_mute,
> +				 !SND_SOC_DAPM_EVENT_ON(event));
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget tegra_rt5631_dapm_widgets[] = {
> +	SND_SOC_DAPM_SPK("Int Spk", NULL),
> +	SND_SOC_DAPM_HP("Headphone Jack", tegra_rt5631_event_hp),
> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +};
> +
> +static const struct snd_kcontrol_new tegra_rt5631_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Int Spk"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +};
> +
> +static int tegra_rt5631_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct tegra_rt5631 *machine = snd_soc_card_get_drvdata(rtd->card);
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(rtd->card, "Headphone Jack",
> +				    SND_JACK_HEADPHONE,
> +				    &tegra_rt5631_hp_jack,
> +				    tegra_rt5631_hp_jack_pins,
> +				    ARRAY_SIZE(tegra_rt5631_hp_jack_pins));
> +	if (ret) {
> +		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (machine->gpiod_hp_det) {
> +		tegra_rt5631_hp_jack_gpio.desc = machine->gpiod_hp_det;
> +
> +		ret = snd_soc_jack_add_gpios(&tegra_rt5631_hp_jack, 1,
> +					     &tegra_rt5631_hp_jack_gpio);
> +		if (ret)
> +			dev_err(rtd->dev, "Jack GPIOs not added: %d\n", ret);
> +	}
> +
> +	return 0;
> +}
> +
> +SND_SOC_DAILINK_DEFS(hifi,
> +	DAILINK_COMP_ARRAY(COMP_EMPTY()),
> +	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
> +	DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +
> +static struct snd_soc_dai_link tegra_rt5631_dai = {
> +	.name = "RT5631",
> +	.stream_name = "RT5631 PCM",
> +	.init = tegra_rt5631_init,
> +	.ops = &tegra_rt5631_ops,
> +	.dai_fmt = SND_SOC_DAIFMT_I2S |
> +		   SND_SOC_DAIFMT_NB_NF |
> +		   SND_SOC_DAIFMT_CBS_CFS,
> +	SND_SOC_DAILINK_REG(hifi),
> +};
> +
> +static struct snd_soc_card snd_soc_tegra_rt5631 = {
> +	.name = "tegra-rt5631",
> +	.owner = THIS_MODULE,
> +	.dai_link = &tegra_rt5631_dai,
> +	.num_links = 1,
> +	.controls = tegra_rt5631_controls,
> +	.num_controls = ARRAY_SIZE(tegra_rt5631_controls),
> +	.dapm_widgets = tegra_rt5631_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(tegra_rt5631_dapm_widgets),
> +	.fully_routed = true,
> +};
> +
> +static int tegra_rt5631_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = &snd_soc_tegra_rt5631;
> +	struct device_node *np_codec, *np_i2s;
> +	struct tegra_rt5631 *machine;
> +	struct gpio_desc *gpiod;
> +	int ret;
> +
> +	machine = devm_kzalloc(&pdev->dev, sizeof(*machine), GFP_KERNEL);
> +	if (!machine)
> +		return -ENOMEM;
> +
> +	card->dev = &pdev->dev;
> +	snd_soc_card_set_drvdata(card, machine);
> +
> +	gpiod = devm_gpiod_get_optional(&pdev->dev, "nvidia,hp-mute",
> +					GPIOD_OUT_HIGH);
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +
> +	machine->gpiod_hp_mute = gpiod;
> +
> +	gpiod = devm_gpiod_get_optional(&pdev->dev, "nvidia,hp-det",
> +					GPIOD_IN);
> +	if (IS_ERR(gpiod))
> +		return PTR_ERR(gpiod);
> +
> +	machine->gpiod_hp_det = gpiod;
> +
> +	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
> +	if (ret)
> +		return ret;
> +
> +	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
> +	if (ret)
> +		return ret;
> +
> +	np_codec = of_parse_phandle(pdev->dev.of_node, "nvidia,audio-codec", 0);
> +	if (!np_codec) {
> +		dev_err(&pdev->dev,
> +			"Property 'nvidia,audio-codec' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	np_i2s = of_parse_phandle(pdev->dev.of_node, "nvidia,i2s-controller", 0);
> +	if (!np_i2s) {
> +		dev_err(&pdev->dev,
> +			"Property 'nvidia,i2s-controller' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	tegra_rt5631_dai.cpus->of_node = np_i2s;
> +	tegra_rt5631_dai.codecs->of_node = np_codec;
> +	tegra_rt5631_dai.platforms->of_node = np_i2s;
> +
> +	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tegra_rt5631_of_match[] = {
> +	{ .compatible = "nvidia,tegra-audio-rt5631", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tegra_rt5631_of_match);
> +
> +static struct platform_driver tegra_rt5631_driver = {
> +	.driver = {
> +		.name = "tegra-snd-rt5631",
> +		.pm = &snd_soc_pm_ops,
> +		.of_match_table = tegra_rt5631_of_match,
> +	},
> +	.probe = tegra_rt5631_probe,
> +};
> +module_platform_driver(tegra_rt5631_driver);
> +
> +MODULE_DESCRIPTION("Tegra+RT5631 machine ASoC driver");
> +MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
> +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> +MODULE_AUTHOR("Ion Agorria <ion@agorria.com>");
> +MODULE_LICENSE("GPL");


So this is very similar to tegra_rt5677, is it not possible to support
both codecs with the same machine driver?

Jon

-- 
nvpublic
