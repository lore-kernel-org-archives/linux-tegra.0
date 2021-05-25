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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF416C47086
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 21:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA96D6140F
	for <linux-tegra@archiver.kernel.org>; Tue, 25 May 2021 21:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhEYVKl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 May 2021 17:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhEYVKk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 May 2021 17:10:40 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B20C061574;
        Tue, 25 May 2021 14:09:10 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id w15so40003871ljo.10;
        Tue, 25 May 2021 14:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZD+vlbnCmCd0+YdhT3Kf05pgMEL8yn/TGh5XC3e9yC4=;
        b=EDoW110KV9wcfQ30kqQ1ZybqTTE/mSj56bdcleLHZ9K1K65hsPrg9IrsZJ6lqu84SD
         RuaswPbLyuqVCWQ0oyQgm36Uwfqs9e5USUOw4l22hAuVIBSi0CxekIhx1On8J1Hu+9gv
         ZF/G3WukVhsQGoQEbSwWKl3XJU0aQWLmoFLDB9+NMilvdBo/Qey7m+ScBsh60Vs9X/G7
         tfb5FLBY2sQ88qOQom7PT3Kg3cN7B+TXWhT2uw9rcBT1brIlb6UFMfndAakABXqJf3k7
         tLK3gwnMhy1IclNyskN3N65WqXKwIJcrHn7YXSf4BCWEbttcrpt+SDK+SbYFSu7o0Doj
         XGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZD+vlbnCmCd0+YdhT3Kf05pgMEL8yn/TGh5XC3e9yC4=;
        b=toDXCmVLCfYk9AdEmsKlXDqeeZb5kfh4DqNEwEmPQkHGD1yAWkzlC582QE9AbRv16X
         zEHWQ/Rrc6D72XLy6hZNr1reoVtW7G/1oFBhjFKMfhOfZUuVfBxHnd6TrbOXMdclaj0a
         PuXiBh/fvVFzYpHE/59mOVKImETvOX26P8wIKq82k47C9RHjYG5N7aL+F5TTlAhMV8HE
         mZvwhlebqqYu/nGLH0XHi35ogTPjagBwurPOLovHHkEg3HBwaFeg19DMPqd3ot+7UjNd
         5MSx7KJfMxgBpwhQUn8ahr1vKmNtAEs0DHYj/YRuPAD0rrSjAV7KRCpT1nf8+c6VPuts
         znxg==
X-Gm-Message-State: AOAM532IrwAN4KHl+oL+M3cDuWP0lSBxNXp+lfG33u0MK7hsyNuBy4ME
        TCYWJWVzUSPKHjNSPeFAfQ2kA/SCmlU=
X-Google-Smtp-Source: ABdhPJw6PtppkMwP73a5yk5EfcfAd6aWAG1Me5VORks/eZaK+4hqHBA3sKD4WyW5pJwPIO0LUKzKEA==
X-Received: by 2002:a2e:5045:: with SMTP id v5mr22264105ljd.270.1621976948326;
        Tue, 25 May 2021 14:09:08 -0700 (PDT)
Received: from [192.168.2.145] (46-138-180-236.dynamic.spd-mgts.ru. [46.138.180.236])
        by smtp.googlemail.com with ESMTPSA id w3sm2207406lji.25.2021.05.25.14.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 14:09:07 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To:     Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
 <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
 <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
 <bc99da2b-1eb2-8f73-9e92-184cf172ef6f@perex.cz>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea7730f6-9ca0-ae06-b610-703f9715ffa2@gmail.com>
Date:   Wed, 26 May 2021 00:09:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bc99da2b-1eb2-8f73-9e92-184cf172ef6f@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.05.2021 19:24, Jaroslav Kysela пишет:
> On 24. 05. 21 16:00, Dmitry Osipenko wrote:
>> 24.05.2021 13:54, Jaroslav Kysela пишет:
>>> Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
>>>> Specify components string for Nexus 7 using the Intel BayTrail components
>>>> format. This may allow us to create a more generic UCM for RT5640 codec.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>>>>  1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
>>>> index a81f2ebfc00c..87e0a47040a5 100644
>>>> --- a/sound/soc/tegra/tegra_asoc_machine.c
>>>> +++ b/sound/soc/tegra/tegra_asoc_machine.c
>>>> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>>>>  	.add_hp_jack = true,
>>>>  };
>>>>  
>>>> +/*
>>>> + * Speaker: Connected to SPO L/R P/N pins, stereo.
>>>> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
>>>> + * Headphones: Connected to HPOL/R pins.
>>>> + * Headset Microphone: Unconnected.
>>>> + *
>>>> + * IF2_DAC/ADC are unpopulated.
>>>> + */
>>>> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
>>>> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
>>>
>>> Perhaps, it may be better to handle this string via the DT config (create new
>>> function like snd_soc_of_parse_card_name()).
>>>
>>> The "codec:rt5640" should be set in the driver (it's fixed), but the
>>> "cfg-spk:2 cfg-mic:dmic1 aif:1" part is suitable for the DT config.
>>
>> Not sure that this is possible. The DT is an ABI, while components
>> string has no specification. Any changes to the components string will
>> require DT update.
>>
>> I think it's much more feasible to have a database of components within
>> kernel driver, like Intel sound driver does it for ACPI devices.
> 
> There is no other possibility for ACPI. And while the components string is
> part of the ALSA ABI, it should not be changed in an incompatible way. Only
> new information should be added. The DT solution seems more flexible to me.
> For example the stereo/mono speaker or the AIF number can be set without the
> driver modification for rt5640.

Everything that goes into device-tree needs a firm specification. We
can't add it into device-tree since there is no specification for the
components string other than something that Intel driver made up for its
own needs. So either we could add the components string to the kernel
driver right now or not add it.

I think the best option would be to drop this patch for now.
