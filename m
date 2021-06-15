Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06CBC48BDF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 13:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9297261468
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 13:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhFONH3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 09:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhFONH3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 09:07:29 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F09C061574
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 06:05:24 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id c9so18253833wrt.5
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N/4p05McK2faiVXwCk4BFsV+8YmMH/7iKQXdzhdqhek=;
        b=rDAIoqWfSw65j3/N6CwfdhwRjuBCt8ablOBGx5/JQgSOx6doHcIdhLL06iMwLeyjIz
         8NMq90YBAr/5zaULjf31VSICil7K3OTIpDza/pkGD4UaQg3AtYkbCfsbhmd6aJn9h82N
         g8apN9SiPWXQrP/+h2RA06bFFPtfwEa/2Pbk3sYOEOp2IaMl0+wM010Sgwss1uTSJUau
         eaUCu9zua7iWSzKUUFp6iCOeBNmrwAL9rq8PO15dXAb0uHnXwU5ZeMGNM9SbBd3WuBmi
         EYtUXhXL4JciRpVaKOdtspbu0xUxXXV5MQdHRMkxoNZP2HgaoG3JzdLD0wwjnPnTGLtm
         0ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N/4p05McK2faiVXwCk4BFsV+8YmMH/7iKQXdzhdqhek=;
        b=U9DnhLcETx4MJ5RYzY+vNSEmd9UNI9uvPhhmLIUzTGdLFcy6XBAxUHNf6Z6FqLRAji
         2Dow0onX9zKGHH5m1CkbDkyOir9iPJoAhO1/vRFbkhGzTTSsxEUZm5Hx0o+FdAC2A6GD
         17TINFtBukcQRmnJhBn+1AajkIMYief9tVhU0TYkhyXkRV2Vfrn0dB4mPVvNjHXFbIxE
         X76dXGNZMEwnF+JvIkWJtbySVA0SAyn0+pkSjbkynkm8WoriwYr4MygvwMkPR/Udadl/
         PyJJ5meFAc0yTw9GkHNx5NYSUOdpIsJcGglva1Y3kobmIZIZbXA9OETP4dikoN1IExg/
         BIpw==
X-Gm-Message-State: AOAM532GcuhDXgnjkCJz5QOJkSDCCa9MtdgkDW9xGu1Sanz/ym9s53hn
        EEVfVPFGl8Re2dPu2ULSNauU3A==
X-Google-Smtp-Source: ABdhPJy/KBp9eREgdz30fSRAhTAtvzNFrgFTO9OzbgvuLnw8zjLz3DJoVty/4+5esfDgoX8vcg5nig==
X-Received: by 2002:a5d:4401:: with SMTP id z1mr25444259wrq.149.1623762322905;
        Tue, 15 Jun 2021 06:05:22 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:613a:6939:5f7f:dceb? ([2a01:e34:ed2f:f020:613a:6939:5f7f:dceb])
        by smtp.googlemail.com with ESMTPSA id 6sm15715941wmg.17.2021.06.15.06.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 06:05:22 -0700 (PDT)
Subject: Re: [PATCH v1 03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
To:     Dmitry Osipenko <digetx@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-4-digetx@gmail.com>
 <20210514211601.GA1969@qmqm.qmqm.pl>
 <ecc89faf-97f5-65e9-0eb8-93c8414c69e5@linaro.org>
 <eedb5792-d3a5-78b3-ec89-b26d2e45f9c4@gmail.com>
 <c65a732d-b203-a1a0-e90b-0aa0664cfb55@linaro.org>
 <e73b64b2-77a8-3671-1fc6-0bf77e2287c4@gmail.com>
 <1abadc69-1dd1-5939-c089-37a84be4781b@linaro.org>
 <60a280c3-e67f-ff3a-9f0e-7d12fc125c5b@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8091014b-fe1b-9c4c-7a91-6aae5b4037e5@linaro.org>
Date:   Tue, 15 Jun 2021 15:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60a280c3-e67f-ff3a-9f0e-7d12fc125c5b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 15/06/2021 14:53, Dmitry Osipenko wrote:
> 13.06.2021 21:19, Daniel Lezcano пишет:
>> On 13/06/2021 02:25, Dmitry Osipenko wrote:
>>
>> [ ... ]
>>
>>>> You should set the trip points close to the functioning boundary
>>>> temperature given in the hardware specification whatever the resulting
>>>> heating effect is on the device.
>>>>
>>>> The thermal zone is there to protect the silicon and the system from a
>>>> wild reboot.
>>>>
>>>> If the Nexus 7 is too hot after the changes, then you may act on the
>>>> sources of the heat. For instance, set the the highest OPP to turbo or
>>>> remove it, or, if there is one, change the thermal daemon to reduce the
>>>> overall power consumption.
>>>> In case you are interested in: https://lwn.net/Articles/839318/
>>>
>>> The DTPM is a very interesting approach. For now Tegra still misses some
>>> basics in mainline kernel which have a higher priority, so I think it
>>> should be good enough to perform the in-kernel thermal management for
>>> the starter. We may consider a more complex solutions later on if will
>>> be necessary.
>>>
>>> What I'm currently thinking to do is:
>>>
>>> 1. Set up the trips of SoC/CPU core thermal zones in accordance to the
>>> silicon limits.
>>>
>>> 2. Set up the skin trips in accordance to the device limits.
>>>
>>> The breached skin trips will cause a mild throttling, while the SoC/CPU
>>> trips will be allowed to cause the severe throttling. Does this sound
>>> good to you?
>>
>> The skin temperature must be managed from userspace. The kernel is
>> unable to do a smart thermal management given different thermal zones
>> but if the goal is to go forward and prevent the tablet to be hot
>> temporarily until the other hardware support is there, I think it is
>> acceptable.
> 
> The current goal is to get maximum from what we already have, thank you.

maximum of performance or maximum of mitigation ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
