Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16474C04FF3
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 13:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2F676108D
	for <linux-tegra@archiver.kernel.org>; Mon, 24 May 2021 13:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhEXNmD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 May 2021 09:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbhEXNmC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 09:42:02 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5077C061574;
        Mon, 24 May 2021 06:40:33 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p20so33644940ljj.8;
        Mon, 24 May 2021 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+9LDxds78ZpBu8bZ2YStDaoNow/+xEuqsaqJfEUvzSs=;
        b=qu+hXeFuBGul/Wj3lSSso0pa0MhS9lqMA8CmDT6sB9XlIbhj+tB0N+7fUwaWqxVvEb
         t2XuhasWUa6of9i/F93O8IFlWMTmF1fyWQg/xbozp6wMpWPEelbV7SqrcX0/yrK8u21L
         NS8MtIWVaUGmVmBvXH+tuzqLz9dsY2/iRF0Y6NCOWsoKanKrhcT4Thik9efLJzOExrM1
         ToS3oO4dJ7apJrn5s+ZlFEPLH8bc6d80sLIf9g62Wc1huqAPu1+XktJVxY1MY/qK4qnk
         6Cvgl8f3piNBc5MD17ZePmaqWLV60+t3xdj/omYmTDtGmry4AIhgl4zR/s+HGIwP/dEr
         7t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+9LDxds78ZpBu8bZ2YStDaoNow/+xEuqsaqJfEUvzSs=;
        b=QSK/dXzE5R8+PzsowIyMD4T19WhYWOU60xXqq2N746yFuUQebi2OrHpE4uDJZuks3p
         mwNfep1YkoffRAtL2J3zUFTpl9i4X9LSgdA+TRVTdUvsDiPe+jnD38pejVisMYd2fCE3
         hCChja3ri2MbrnuTyW5rH2dea8Tpf0ViiqAgWPGXFtLmhrDG9o+mYt+hLSTonI3Qn44P
         1asor4ku4GRGt0htfkm37/w46/Pn7qDOCRvdkf/vSVXxcCebH6tztTMF0wC1UeHO6PzW
         g4Fq3573V34+RUk0LBUv3tD1LBOl4bwXirHLXNs7B9CRnLDNTN/JWNvNlIDKCPd9KbN0
         wcMA==
X-Gm-Message-State: AOAM530ogxL2gLrAeE1Wd4whBI6MNSz7dnAZQs9cmWXRfaj0PBPw7bBq
        hASKQnpsfda1DTNjvZ4TdeobPyFLJZw=
X-Google-Smtp-Source: ABdhPJz19QS4VATXDdLjkED1I3EhP/WMd2gSaZB1z7bN/6gA9RCnGUzDhmUQrvWEMhAsQt89FnoWGg==
X-Received: by 2002:a2e:a553:: with SMTP id e19mr16915323ljn.280.1621863631965;
        Mon, 24 May 2021 06:40:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id w17sm203610lfp.300.2021.05.24.06.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 06:40:31 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f9631faa-5fc8-ecdd-709b-93b58e45a1ac@gmail.com>
Date:   Mon, 24 May 2021 16:40:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6bc26992-e136-ef6a-a956-382b5cae5db7@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.05.2021 15:22, Jon Hunter пишет:
> 
> 
> On 21/05/2021 20:05, Dmitry Osipenko wrote:
> 
> ...
> 
>>>> +unsigned int tegra_asoc_machine_mclk_rate(unsigned int srate)
>>>> +{
>>>> +	unsigned int mclk;
>>>> +
>>>> +	switch (srate) {
>>>> +	case 64000:
>>>> +	case 88200:
>>>> +	case 96000:
>>>> +		mclk = 128 * srate;
>>>> +		break;
>>>> +	default:
>>>> +		mclk = 256 * srate;
>>>> +		break;
>>>> +	}
>>>> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
>>>> +	while (mclk < 6000000)
>>>> +		mclk *= 2;
>>>
>>> So this appears to be specific to the wm8903 codec or at least this is
>>> where it came from. And given that the switch statement is not complete
>>> in terms of the sample rates (ie. only has a subset), I am wondering if
>>> set should keep this specific to the wm8903 codec?
>>
>> The RT5631 codec of Asus Transformers will re-use this function.
> 
> OK, but does it need this FIXME part? That appears to be codec specific.

Downstream RT5631 Tegra driver has exactly the same FIXME.

Although, I now see that downstream RT5631 uses 384*srate for the
default cases.

I also see that WM8994 driver that we have in grate-kernel for Galaxy
Tab and SGH-I927 also re-uses that mclk_rate function.

>> IIUC, the default switch-case works properly for all rates below 64KHz,
>> at least I haven't had any problems with it. Could you please clarify
>> why you are saying that the switch statement appears to be incomplete?
> 
> It looks a bit weird because less than 64kHz and greater than 96kHz we
> use 256 and for only 64kHz, 88.2kHz and 96kHz we use 128. So it is not
> clear to me which sample rates have actually been tested with this and
> if this is complete or not?
> 
> Is it intended that we use 256 for sample rates greater than 96kHz?

The 128*srate gives MCLK >6MHZ for 64/88/96, 256*srate gives MCLK >6MHZ
for rates below 64kHZ. Looks like the goal is to get MCLK >6MHZ.

 The WM8903 datasheet says:

"The  following  operating  frequency  limits  must  be  observed  when
 configuring  CLK_SYS.  Failure  to  observe   these   limits   will
result   in   degraded  noise   performance   and/or   incorrect
ADC/DAC  functionality.

If DAC_OSR = 0 then CLK_SYS  3MHz
If DAC_OSR = 1 then CLK_SYS  6MHz"

Where DAC_OSR is DAC Oversampling Control
0 = Low power (normal oversample)
1 = High performance (double rate)

I see that DAC_OSR=0 by default, it can be switched to 1 by userspace
ALSA control.
