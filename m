Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62068C48BCF
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Jun 2021 00:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 341CD61181
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Jun 2021 00:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhFMA1G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Jun 2021 20:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbhFMA1G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Jun 2021 20:27:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C181EC061574;
        Sat, 12 Jun 2021 17:25:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t6so1289697lfk.2;
        Sat, 12 Jun 2021 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KIwbG53ecWl77WVsi2ropmqeb/Fl2ifGF7YYQIbAPD4=;
        b=Cu1R1EbM6rac6aVxHGFvmMiYgMKPS2Hz0D3jGkIkgBiR3lV/GSsBOjlmQDJku0/O6Q
         qfEfhR4p0ieyhSSG/XdrtgDcEtm3dwFZ/ELH9OsEBCTsGr4MVsExyIPyLYSmHihdtewg
         Lrvwt9LiZNkKhZLeRRjiCtgI2qpJa/tsy0nkS7TLXQfTtnLekfTcYJwDMAAaj6Omfoyt
         vni4EcToXIeiOsqXdypmXETVKgOBxy1gcbEFDpog2DHYn48RjZzOAZF3tl9QQq0lkhQa
         l5eXhuyKZCk13P4idIWH9IGjhXRjmOJVtbm78hwT0W+nlqI94F1Bl2b5yEKpeO1ig5yH
         RY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KIwbG53ecWl77WVsi2ropmqeb/Fl2ifGF7YYQIbAPD4=;
        b=p89iWNMI7zJ9XiXqN7Dli8Jir2P+XHMbNIKmVmFWNmETRFKlUWFtildBgEKFgQkMCz
         uvld+lq+Wq82s9jFhIJiuQghjSdzTIkRhC7YzsRY/VWwfdyhHSzOuZLfRU8ZeYTdXA6U
         YoC2VXaV4j8n3+vx9zeZGIOVyw3G+tSjXtMRV8UjxXGZ0IbkmrmUApFB+gRDUsO7mbL2
         j9j1GMIo8qRh6L35Onjqkh24iDSiVS2r4+gn66Rs/sk2prLq2ziPh5RIHYKnqpkFf38L
         vQj1LzP89hAXqc8hfxYSrSPArWhp9yTbBwcac2VZZlDu31TyRkT0tyQTElfl3HoHusp1
         Ly9g==
X-Gm-Message-State: AOAM531EJk2q5H0wJvvlGK5+otwgyHyJ6coyIEbGfqmXH3tzi06+HbeF
        pj5IaYZC283RMFjIt3Pxa7uLrhxNxOs=
X-Google-Smtp-Source: ABdhPJzu8AnTInHWsGBbHE66gMIhly8XL6gg8cIJBn2KKEDEv8y/ZNCBh54zTTLJCH97wJrrZ/A8Vg==
X-Received: by 2002:a19:ef0a:: with SMTP id n10mr7101704lfh.352.1623543904010;
        Sat, 12 Jun 2021 17:25:04 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-201.dynamic.spd-mgts.ru. [94.29.10.201])
        by smtp.googlemail.com with ESMTPSA id f6sm325008lfm.28.2021.06.12.17.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 17:25:03 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e73b64b2-77a8-3671-1fc6-0bf77e2287c4@gmail.com>
Date:   Sun, 13 Jun 2021 03:25:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c65a732d-b203-a1a0-e90b-0aa0664cfb55@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.06.2021 17:24, Daniel Lezcano пишет:
> On 12/06/2021 12:40, Dmitry Osipenko wrote:
>> 11.06.2021 12:52, Daniel Lezcano пишет:
>>> On 14/05/2021 23:16, Michał Mirosław wrote:
>>>> On Mon, May 10, 2021 at 11:25:53PM +0300, Dmitry Osipenko wrote:
>>>>> It's possible to hit the temperature of the thermal zone in a very warm
>>>>> environment under a constant load, like watching a video using software
>>>>> decoding. It's even easier to hit the limit with a slightly overclocked
>>>>> CPU. Bump the temperature limit by 10C in order to improve user
>>>>> experience. Acer A500 has a large board and 10" display panel which are
>>>>> used for the heat dissipation, the SoC is placed far away from battery,
>>>>> hence we can safely bump the temperature limit.
>>>>
>>>> 60^C looks like a touch-safety limit (to avoid burns for users). Did you
>>>> verify the touchable parts' temperature somehow after the change?
>>>
>>> The skin temperature and the CPU/GPU etc ... temperatures are different
>>> things.
>>>
>>> For the embedded system there is the dissipation system and a
>>> temperature sensor on it which is the skin temp. This temperature is the
>>> result of the heat of all the thermal zones on the board and must be
>>> below 45°C. The temperature slowly changes.
>>>
>>> On the CPU, the temperature changes can be very fast and you have to
>>> take care of keeping it below the max temperature specified in the TRM
>>> by using different techniques (freq changes, idle injection, ...) but
>>> the temperature can be 75°C, 85°C or whatever the manual says.
>>>
>>> 50°C and 60°C are low temperature for a CPU and that will inevitably
>>> impact the performances, so setting the temperature close the max
>>> temperature is what will allow max performances.
>>>
>>> What matters is the skin temperature.
>>>
>>> The skin temperature must be monitored by other techniques, eg. using
>>> the TDP of the system and throttle the different devices to keep them in
>>> this power budget. That is the role of an thermal daemon.
>>
>> Thank you for the clarification. Indeed, I wasn't sure how to make use
>> of the skin temperature properly.
>>
>> The skin temperature varies a lot depending on the thermal capabilities
>> of a particular device. It's about 15C below CPU core at a full load on
>> A500, while it's 2C below CPU core on Nexus 7. But this is expected
>> since Nexus 7 can't dissipate heat efficiently.
> Yeah, but it can not be directly related to the CPU because if the GPU
> is intensively used and the battery is charging at the same time, the
> skin temp will increase anyway.

Sure, we just added the memory devfreq throttling as a cooling device to
Nexus 7 and Ouya DTs in addition to the CPU throttling.

The GPU and other h/w units are on the pending list. For the starter we
need to add GENPD and runtime PM support to all drivers, which solves
the overheating problem of idling systems. We have Tegra30 Ouya game
console that is getting hot during idle without the runtime PM support.
Afterwards we can add the devfreq support to improve the active cooling.
I'm already working on it.

> You should set the trip points close to the functioning boundary
> temperature given in the hardware specification whatever the resulting
> heating effect is on the device.
> 
> The thermal zone is there to protect the silicon and the system from a
> wild reboot.
> 
> If the Nexus 7 is too hot after the changes, then you may act on the
> sources of the heat. For instance, set the the highest OPP to turbo or
> remove it, or, if there is one, change the thermal daemon to reduce the
> overall power consumption.
> In case you are interested in: https://lwn.net/Articles/839318/

The DTPM is a very interesting approach. For now Tegra still misses some
basics in mainline kernel which have a higher priority, so I think it
should be good enough to perform the in-kernel thermal management for
the starter. We may consider a more complex solutions later on if will
be necessary.

What I'm currently thinking to do is:

1. Set up the trips of SoC/CPU core thermal zones in accordance to the
silicon limits.

2. Set up the skin trips in accordance to the device limits.

The breached skin trips will cause a mild throttling, while the SoC/CPU
trips will be allowed to cause the severe throttling. Does this sound
good to you?

> Hope that helps

Helps a lot, thank you very much.
