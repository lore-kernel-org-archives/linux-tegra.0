Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8353BC2B9F8
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 15:40:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BC0361360
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 15:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhEYPmX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 May 2021 11:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhEYPmX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 May 2021 11:42:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CB4C061574;
        Tue, 25 May 2021 08:40:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v8so41776626lft.8;
        Tue, 25 May 2021 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IFrntmU7PddzAkDzge96jDF8ouDIB5cnkfcWeXlAZik=;
        b=K2h+JZ6tueBFtMBPM5XxRFuUDrQNTec6uhRy/PaD/OY3S1U41weJT0i4140LWU4UEn
         VDmaJf+wGs/eEaqkP5IO7WoEJXl4NujIRKImmo9DacvCQwxCYBVMMmH11Ctr1KBjJfpV
         cRdbthGrtTEKt/JDatjDpKFZcTaer2cfixBrpMAexU4h48+DalqGUkR30/fE9HUMz9xF
         LXjh8xzJCtrQx0KPjEd5DqzjQX7E/iSVi3wSxwDDqrUinxLaA9t7LuJ08kCcKLsT71qV
         syODkVSAsyNolmv+uHxOzNhtIsxcd749ddNC2Qdoza1P+qNfwWDmiOOMYPiTgCabQzaB
         nhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IFrntmU7PddzAkDzge96jDF8ouDIB5cnkfcWeXlAZik=;
        b=VHd3/oMJzRkBKjuwkKBtpUf1891/dLl5zJzwwbUcCfro0+JkPoYKIGNY211R3bA35p
         4sVX/3JnV/j+ARvd6eeWrfSwLiKbvCffn9cmC/06M53pqnXEX6WW+kpbhCHTCZnDpWTs
         LZ9Jq9DJfkGejj0bHX2xX+SVBRZmY+P/3akeD23KIoe9E/2LV89DC95GmokMZXkG44Zt
         rFE7Bs+jiGJVyjZNFbjWGav55J2lwOL8wgFWPwz8uY5/JoTobsToPsM52HKgYprFsh5Z
         tSSTZNiIU/YE3jxLP4hXY0e88nDUoB26026jy6pZYG3oQLEzfUiTEM0IEbOvkdOaEwdj
         cpaQ==
X-Gm-Message-State: AOAM532+G3zMV6qjk4mXEEuvVczwvMilxHNgm/i36ntQ2F6rEgW0yH4v
        oFs6oNdWqgoN2yfP7wgPZyDKIdM6cKE=
X-Google-Smtp-Source: ABdhPJycwwa0af6h45l1eZwV4E8v2zg65tkgOnJuFEGrufqa2gh1wXA3dsK+vfv4FkUdj3VPMwyomg==
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr13095593lfg.124.1621957250144;
        Tue, 25 May 2021 08:40:50 -0700 (PDT)
Received: from [192.168.2.145] (46-138-180-236.dynamic.spd-mgts.ru. [46.138.180.236])
        by smtp.googlemail.com with ESMTPSA id p14sm2126434ljc.58.2021.05.25.08.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 08:40:49 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
 <03775d09-f3ff-ff7a-626a-812163d6871d@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d8ee8f62-6046-f7d8-5a27-0626f2eaeb80@gmail.com>
Date:   Tue, 25 May 2021 18:40:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <03775d09-f3ff-ff7a-626a-812163d6871d@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.05.2021 11:40, Jon Hunter пишет:
> 
> On 24/05/2021 00:44, Dmitry Osipenko wrote:
>> Specify components string for Nexus 7 using the Intel BayTrail components
>> format. This may allow us to create a more generic UCM for RT5640 codec.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
>> index a81f2ebfc00c..87e0a47040a5 100644
>> --- a/sound/soc/tegra/tegra_asoc_machine.c
>> +++ b/sound/soc/tegra/tegra_asoc_machine.c
>> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>>  	.add_hp_jack = true,
>>  };
>>  
>> +/*
>> + * Speaker: Connected to SPO L/R P/N pins, stereo.
>> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
>> + * Headphones: Connected to HPOL/R pins.
>> + * Headset Microphone: Unconnected.
>> + *
>> + * IF2_DAC/ADC are unpopulated.
>> + */
>> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
>> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
>> +	.mclk_rate = tegra_machine_mclk_rate_256,
>> +	.card = &snd_soc_tegra_rt5640,
>> +	.add_common_dapm_widgets = true,
>> +	.add_common_controls = true,
>> +	.add_common_snd_ops = true,
>> +	.add_hp_jack = true,
>> +};
>> +
>>  /* RT5632 machine */
>>  
>>  SND_SOC_DAILINK_DEFS(rt5632_hifi,
>> @@ -712,6 +730,7 @@ static const struct of_device_id tegra_machine_of_match[] = {
>>  	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
>>  	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
>>  	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
>> +	{ .compatible = "nvidia,tegra-audio-rt5640-grouper", .data = &tegra_rt5640_grouper_data },
> 
> 
> Is there any harm always populating the components data for rt5640? I
> did not see any existing UCM support for Tegra+rt5640 platforms in ALSA.

The previous patch sets components for each card, including RT5640. This
patch sets individual components configuration that is unique to the
Nexus 7, it overrides the default components string of the card that was
set by the previous patch. Other devices may have a different h/w
configuration.

The universal UCM needs to know the full h/w configuration, otherwise it
doesn't know how to set up mixers and switches properly. The exact
bytcr-rt5640 UCM works on Tegra if couple switches that unique to
BayTrail are made conditional in the UCM.
