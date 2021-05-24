Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E644EC04FF3
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 21:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE54961411
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 21:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbhEXVEW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 May 2021 17:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbhEXVEW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 17:04:22 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1029C061574;
        Mon, 24 May 2021 14:02:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w33so34610795lfu.7;
        Mon, 24 May 2021 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=irwMKWSJAagfg+Ofas5nXturj/fYZviSVJgff4QGUcw=;
        b=bokqE08EfsD9GmHCviJCNB7W6wtOLsu37Lj6n5l3ZdcvIjBog0p5tosZHm/0EyTaFc
         IKjuHbny6PSFNX/E3fpGSIHifZmLeLry9ICYhW0C2Dgl7iZ/RVEXEV7kCukVACHM/kMJ
         LccYEFXlN7Eka35qh5aWi+4Qmeoz3yyPNuEVHEoQSFcXyYwGdMVJTHXIabfaLHNrQhJl
         apr8+DuxpvX0+dw9IM3xHifJ+cFzAgEE4P0jT00W/IgTzTVWQAWqVFl/OYROGNQfwsvk
         OYHzFHvZPXwCqUjja4YOeGgrEBpEnxgraXg0q6jVXcvjPAzfUlFW5guB3ocYMdjtY6bH
         pScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=irwMKWSJAagfg+Ofas5nXturj/fYZviSVJgff4QGUcw=;
        b=HF5/ISc93rzRfKzF0eOpTGfyT0H1mFLlmS6zKbbadkYRpvMr+0Iu7So9peb2b6aap+
         x111UPJG7NMwORiqePiYnnQonjio40pIp8AEyi9NeeAZ731yANLIAGi5UTRLqXDVce/Z
         c4fVuXhtDLVrv50wWOu1PZTW4xJMqbt4hQMEY3uJ+lPvIF3RC6WKFNvLoW7qHPUona9t
         lvm7U10eLjgjhMEWS8McuGdlSwf+2UkunB7QZ/wD5TG/1yEqGPkTMrCdhSU/LYtG+x84
         mE+3Sz5PXH28kmOyjzGNQ1foaB/0usuzQzioPiH3wWYTAxKDFVahoecoiQYiianeFdu8
         pGjQ==
X-Gm-Message-State: AOAM533IAbo+Na+NI4NdXrKQHgxifAmhtSYR7ZBKsS4L08W71CBI0mfu
        L6CdNfM8RhAS2QGsS2FJTt06QZ9MYNo=
X-Google-Smtp-Source: ABdhPJxY+of4RGjYN7vbpleGEKEpfdTUYtxIKmNk/3N7zH+jlMlrdCXfN8n+0OtIBIq/VVPrhoNr+w==
X-Received: by 2002:a05:6512:3f8d:: with SMTP id x13mr11826571lfa.278.1621890170871;
        Mon, 24 May 2021 14:02:50 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id o5sm1823577ljj.103.2021.05.24.14.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 14:02:50 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <32171079-ed4e-1147-2272-5f11bc480c6a@nvidia.com>
 <91e53907-d87d-aeeb-4644-3926d4311daa@gmail.com>
 <6bc26992-e136-ef6a-a956-382b5cae5db7@nvidia.com>
 <f9631faa-5fc8-ecdd-709b-93b58e45a1ac@gmail.com>
 <cf2ee04e-d4cf-14ba-92d0-aa113eb7b8c8@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f27b931f-3f92-32cb-cdf0-d9ae001565fc@gmail.com>
Date:   Tue, 25 May 2021 00:02:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cf2ee04e-d4cf-14ba-92d0-aa113eb7b8c8@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.05.2021 21:50, Jon Hunter пишет:
> 
> On 24/05/2021 14:40, Dmitry Osipenko wrote:
>> 24.05.2021 15:22, Jon Hunter пишет:
>>>
>>>
>>> On 21/05/2021 20:05, Dmitry Osipenko wrote:
>>>
>>> ...
>>>
>>>>>> +unsigned int tegra_asoc_machine_mclk_rate(unsigned int srate)
>>>>>> +{
>>>>>> +	unsigned int mclk;
>>>>>> +
>>>>>> +	switch (srate) {
>>>>>> +	case 64000:
>>>>>> +	case 88200:
>>>>>> +	case 96000:
>>>>>> +		mclk = 128 * srate;
>>>>>> +		break;
>>>>>> +	default:
>>>>>> +		mclk = 256 * srate;
>>>>>> +		break;
>>>>>> +	}
>>>>>> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
>>>>>> +	while (mclk < 6000000)
>>>>>> +		mclk *= 2;
>>>>>
>>>>> So this appears to be specific to the wm8903 codec or at least this is
>>>>> where it came from. And given that the switch statement is not complete
>>>>> in terms of the sample rates (ie. only has a subset), I am wondering if
>>>>> set should keep this specific to the wm8903 codec?
>>>>
>>>> The RT5631 codec of Asus Transformers will re-use this function.
>>>
>>> OK, but does it need this FIXME part? That appears to be codec specific.
>>
>> Downstream RT5631 Tegra driver has exactly the same FIXME.
> 
> What downstream branch are you referring to? I still don't think that
> that is a good reason to make this 'FIXME' the standard going forward
> and hence I would prefer that it is kept specific the wm8903. Otherwise
> people will keep using this code without understanding if this is
> needed/correct.

This is the original RT5631 driver from ASUS [1].

[1]
https://github.com/clamor-s/morpheus_kernel_asus_tf201/blob/a0b45b7e27976313c68cfbd8c7b8db021ee47ad1/sound/soc/tegra/tegra_rt5631.c#L72


I briefly looked at the RT5631 datasheet and don't see it saying
anything about the clk rate requirement >=6MHz. There are PLL tables
with the MCLK for the reference clock. For now I'm not sure what
downstream kernel tries to achieve, perhaps we should try to check
whether all audio rates work for RT5631.

>> Although, I now see that downstream RT5631 uses 384*srate for the
>> default cases.
>>
>> I also see that WM8994 driver that we have in grate-kernel for Galaxy
>> Tab and SGH-I927 also re-uses that mclk_rate function.
>>
>>>> IIUC, the default switch-case works properly for all rates below 64KHz,
>>>> at least I haven't had any problems with it. Could you please clarify
>>>> why you are saying that the switch statement appears to be incomplete?
>>>
>>> It looks a bit weird because less than 64kHz and greater than 96kHz we
>>> use 256 and for only 64kHz, 88.2kHz and 96kHz we use 128. So it is not
>>> clear to me which sample rates have actually been tested with this and
>>> if this is complete or not?
>>>
>>> Is it intended that we use 256 for sample rates greater than 96kHz?
>>
>> The 128*srate gives MCLK >6MHZ for 64/88/96, 256*srate gives MCLK >6MHZ
>> for rates below 64kHZ. Looks like the goal is to get MCLK >6MHZ.
> 
> The wm8903 supports 8kHz sample rates and 256*8000 is less than 6MHz.
> Yes the FIXME loop corrects this, but you could also extend the case
> statement to multiply by 512 for 8kHz.

But what benefits this extension will bring to us if the end result is
the same?

>>  The WM8903 datasheet says:
>>
>> "The  following  operating  frequency  limits  must  be  observed  when
>>  configuring  CLK_SYS.  Failure  to  observe   these   limits   will
>> result   in   degraded  noise   performance   and/or   incorrect
>> ADC/DAC  functionality.
>>
>> If DAC_OSR = 0 then CLK_SYS  3MHz
>> If DAC_OSR = 1 then CLK_SYS  6MHz"
>>
>> Where DAC_OSR is DAC Oversampling Control
>> 0 = Low power (normal oversample)
>> 1 = High performance (double rate)
>>
>> I see that DAC_OSR=0 by default, it can be switched to 1 by userspace
>> ALSA control.
>>
> 
> Yes that is all fine, but again this is specific to the wm8903.

Alright, I'll move it to the WM8903 driver in v4. It won't be a problem
to make that function shared once will be actually needed.
