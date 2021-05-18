Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E58FC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB32861209
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhERSLL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 May 2021 14:11:11 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:41817 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhERSLL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 May 2021 14:11:11 -0400
Received: by mail-ot1-f44.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so9426735oth.8;
        Tue, 18 May 2021 11:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FkuvQrSQFUpcINK14j2wFhP0462nBtLGLd1FHV4P3x0=;
        b=I5LkQXU5LBy2vSOZex4kHXTNaj0xwTYdhIIqPkAImW4+1PLelZGY2JF4ISYC6or/Hu
         DYsHpSKSZe+asvWPfAaSS0mEKwyHOSFlRrgQVwlhGlrex0BxgEtVfD2VXan3WDgzTSxN
         qWMYQiVfTyEJIeKeJH6vDpDQB/U3VeF0i/dUfRaiQYujzfgqbatMCm3qVrDyCTcxQmlM
         9+YShqWx8ua75ZkqAHky/v+y5Uyp5I9WHpo83zckxnGEDKgQjk1DOnlOBKkYzKD/TW24
         4Hcg2sSGv9y2iisJYYzzQT7rX1U5nFdMi6nDMp53Uyegoj+s9zA1ClOhEuZS3gw2Juo/
         kiiA==
X-Gm-Message-State: AOAM5319nXZpWHb1qvtpfg9HvMQVKYjekfsnicwUPLkg5wCsvl3m5xXi
        WXZOGiOGUdKyOIw0oEXt5A==
X-Google-Smtp-Source: ABdhPJy83vorwZ946H+siNqyaTQi794cgapVkhtLojUJKGMSukubOgZuoLBbq9vciBwGECDWOkjSaQ==
X-Received: by 2002:a9d:4a85:: with SMTP id i5mr5360010otf.102.1621361391485;
        Tue, 18 May 2021 11:09:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 77sm2940360otc.54.2021.05.18.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 11:09:50 -0700 (PDT)
Received: (nullmailer pid 961183 invoked by uid 1000);
        Tue, 18 May 2021 18:09:49 -0000
Date:   Tue, 18 May 2021 13:09:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210518180949.GA949047@robh.at.kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518001356.19227-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 18, 2021 at 03:13:56AM +0300, Dmitry Osipenko wrote:
> Squash all machine drivers into a single-universal one. This reduces
> code duplication, eases addition of a new drivers and upgrades older
> code to a modern Linux kernel APIs.

Nice, I never understood why each codec needed it's own machine driver 
(and typically in turn compatible string).

>
> Suggested-by: Jonathan Hunter <jonathanh@nvidia.com>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

[...]

> diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
> index e4863fa37b0c..fdf74bfd728e 100644
> --- a/sound/soc/tegra/tegra_wm8903.c
> +++ b/sound/soc/tegra/tegra_wm8903.c
> @@ -14,192 +14,80 @@
>   *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
>   */
>  
> +#include <linux/gpio/consumer.h>
> +#include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/gpio.h>
> -#include <linux/of_gpio.h>
>  
>  #include <sound/core.h>
>  #include <sound/jack.h>
> -#include <sound/pcm.h>
> -#include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  
>  #include "../codecs/wm8903.h"
>  
> -#include "tegra_asoc_utils.h"
> +#include "tegra_asoc_machine.h"
>  
> -#define DRV_NAME "tegra-snd-wm8903"
> +static struct snd_soc_jack_pin tegra_wm8903_mic_jack_pins[] = {
> +	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
> +};
>  
> -struct tegra_wm8903 {
> -	int gpio_spkr_en;
> -	int gpio_hp_det;
> -	int gpio_hp_mute;
> -	int gpio_int_mic_en;
> -	int gpio_ext_mic_en;
> -	struct tegra_asoc_utils_data util_data;
> +static const char * const tegra_active_low_hp_compats[] = {
> +	"ad,tegra-audio-plutux",
> +	"ad,tegra-audio-wm8903-medcom-wide",
> +	"ad,tegra-audio-wm8903-tec",
> +	"nvidia,tegra-audio-wm8903-cardhu",
> +	"nvidia,tegra-audio-wm8903-harmony",
> +	"nvidia,tegra-audio-wm8903-picasso",
> +	"nvidia,tegra-audio-wm8903-seaboard",
> +	"nvidia,tegra-audio-wm8903-ventana",
> +	NULL,

I think this list should be added to the main match table below with 
data having a flag for active low HP. Then you only match once, don't 
need the exported function and the next difference is much easier to 
add.

>  };
>  
> -static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
> -					struct snd_pcm_hw_params *params)
> +static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
>  {
> -	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> -	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
> +	struct device_node *np = rtd->card->dev->of_node;
>  	struct snd_soc_card *card = rtd->card;
> -	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
> -	int srate, mclk;
>  	int err;
>  
> -	srate = params_rate(params);
> -	switch (srate) {
> -	case 64000:
> -	case 88200:
> -	case 96000:
> -		mclk = 128 * srate;
> -		break;
> -	default:
> -		mclk = 256 * srate;
> -		break;
> -	}
> -	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
> -	while (mclk < 6000000)
> -		mclk *= 2;
> +	/*
> +	 * Older version of machine driver was ignoring GPIO polarity,
> +	 * forcing it to active-low.  This means that all older device-trees
> +	 * which set the polarity to active-high are wrong and we need to fix
> +	 * up them.
> +	 */
> +	if (of_device_compatible_match(np, tegra_active_low_hp_compats)) {
> +		bool active_low = gpiod_is_active_low(machine->gpiod_hp_det);

[...]

> +static const struct tegra_asoc_data tegra_wm8903_data = {
> +	.mclk_rate = tegra_asoc_machine_mclk_rate,
> +	.card = &snd_soc_tegra_wm8903,
> +	.add_common_dapm_widgets = true,
> +	.add_common_controls = true,
> +	.add_common_soc_ops = true,
> +	.add_mic_jack = true,
> +	.add_hp_jack = true,
> +};
>  
>  static const struct of_device_id tegra_wm8903_of_match[] = {
> -	{ .compatible = "nvidia,tegra-audio-wm8903", },
> +	{ .compatible = "nvidia,tegra-audio-wm8903", .data = &tegra_wm8903_data },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
>  
>  static struct platform_driver tegra_wm8903_driver = {
>  	.driver = {
> -		.name = DRV_NAME,
> -		.pm = &snd_soc_pm_ops,
> +		.name = "tegra-wm8903",
>  		.of_match_table = tegra_wm8903_of_match,
> +		.pm = &snd_soc_pm_ops,
>  	},
> -	.probe = tegra_wm8903_driver_probe,
> +	.probe = tegra_asoc_machine_probe,
>  };
>  module_platform_driver(tegra_wm8903_driver);
>  
>  MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra+WM8903 machine ASoC driver");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:" DRV_NAME);
> -MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
