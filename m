Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A277C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 13:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8E7A61464
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 13:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFON2s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 09:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhFON2q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 09:28:46 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F1DC0613A3;
        Tue, 15 Jun 2021 06:26:38 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id r5so27055663lfr.5;
        Tue, 15 Jun 2021 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9HvxVYMyqvCV0x9W883eCIZ13wMRf8cylhu7PNwXAR4=;
        b=PXeokba/hMpZquDHF8BjKdeV/fK3ppLU5sQNQuEBYes6BQIPsVu6/23DUFZ4Esu6yk
         B3QZQ0MwBgUI892uok+j5Bfau+/M74FhrxwG8LedJUAjIbORYmEelY+n7Pb7B1UiYuiA
         N4477LDPl36e10y95F+vSHMZEG22UW5mpbfk5LuxGv0PO62Bz8gViNpPIXOVI5r/+0Ja
         hdzqsePpw/n+Wf+9X97ZPMLGzOVvnHw9rGIexj3c1HMoheAsgJEbdHw3PaMph89E/g+W
         /fGC+003DZQObylZ0BAzK4cVGR0+viMh3Wm2rqzZn4xSSFtdjs46+dH/9uO7iffgYKoJ
         y0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9HvxVYMyqvCV0x9W883eCIZ13wMRf8cylhu7PNwXAR4=;
        b=DGozaTsBGwcBHD65/zuN7AAmDCArLkv55P+bzLSOO/fHA9qPUyVYCGwokCUGIrWl02
         6ERat432OqckWtX4iFUUDa+Y4clwRwTJ6Uc5Z8Zl2eGG8gZYgfphD1B+oWWN0x07i7Gl
         DyQZH7lP2tibUu/Hol/Z5wxGX4oE9vjDKHiHHdVSQDTMhWLbDlftBZrj71di3WZ1uRW3
         YOA+/rgGLZLacMSCehI//dOmwUlyvzIW/0i2PfPN2cLuqOQCWT6N7m3V2rgS0yoW0ugt
         l36aW/mmxEu7KJKXwJ7Sf5CloPiB2y0/A+6SIo/A5NtUbsim6YNMjywMzMtbccfUzwgm
         LWEA==
X-Gm-Message-State: AOAM531/jfMBi2Uo4Re6zLePIvjSn73jKUKIrCzpJWCVCi0RmPnfW8yh
        BilOXMYqsoCcOgPi15lMo8xVjUuZlOY=
X-Google-Smtp-Source: ABdhPJzbWJugA7ORfj/DabW4obeg6otmqxkKzg0iJ3rPlUAInL30kMRPms2h8HMKoSMSFNx983kK9w==
X-Received: by 2002:a19:c34a:: with SMTP id t71mr15641415lff.499.1623763596983;
        Tue, 15 Jun 2021 06:26:36 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id e21sm2156796ljl.26.2021.06.15.06.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 06:26:36 -0700 (PDT)
Subject: Re: [PATCH v1 03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
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
 <8091014b-fe1b-9c4c-7a91-6aae5b4037e5@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <53edd54a-4aa4-2100-c902-d1c8bde64a1a@gmail.com>
Date:   Tue, 15 Jun 2021 16:26:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8091014b-fe1b-9c4c-7a91-6aae5b4037e5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.06.2021 16:05, Daniel Lezcano пишет:
> On 15/06/2021 14:53, Dmitry Osipenko wrote:
>> 13.06.2021 21:19, Daniel Lezcano пишет:
>>> On 13/06/2021 02:25, Dmitry Osipenko wrote:
>>>
>>> [ ... ]
>>>
>>>>> You should set the trip points close to the functioning boundary
>>>>> temperature given in the hardware specification whatever the resulting
>>>>> heating effect is on the device.
>>>>>
>>>>> The thermal zone is there to protect the silicon and the system from a
>>>>> wild reboot.
>>>>>
>>>>> If the Nexus 7 is too hot after the changes, then you may act on the
>>>>> sources of the heat. For instance, set the the highest OPP to turbo or
>>>>> remove it, or, if there is one, change the thermal daemon to reduce the
>>>>> overall power consumption.
>>>>> In case you are interested in: https://lwn.net/Articles/839318/
>>>>
>>>> The DTPM is a very interesting approach. For now Tegra still misses some
>>>> basics in mainline kernel which have a higher priority, so I think it
>>>> should be good enough to perform the in-kernel thermal management for
>>>> the starter. We may consider a more complex solutions later on if will
>>>> be necessary.
>>>>
>>>> What I'm currently thinking to do is:
>>>>
>>>> 1. Set up the trips of SoC/CPU core thermal zones in accordance to the
>>>> silicon limits.
>>>>
>>>> 2. Set up the skin trips in accordance to the device limits.
>>>>
>>>> The breached skin trips will cause a mild throttling, while the SoC/CPU
>>>> trips will be allowed to cause the severe throttling. Does this sound
>>>> good to you?
>>>
>>> The skin temperature must be managed from userspace. The kernel is
>>> unable to do a smart thermal management given different thermal zones
>>> but if the goal is to go forward and prevent the tablet to be hot
>>> temporarily until the other hardware support is there, I think it is
>>> acceptable.
>>
>> The current goal is to get maximum from what we already have, thank you.
> 
> maximum of performance or maximum of mitigation ?

The best balance of both. Maximum performance + no risk of damaging
hardware + pleasant body temperature from a user perspective.
