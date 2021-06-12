Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6D9C48BCF
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 14:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4644561376
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Jun 2021 14:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhFLO2F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Jun 2021 10:28:05 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:45590 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhFLO2F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Jun 2021 10:28:05 -0400
Received: by mail-wr1-f52.google.com with SMTP id z8so9128014wrp.12
        for <linux-tegra@vger.kernel.org>; Sat, 12 Jun 2021 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JPvRd3I03GEmWUI3cd1cTAMqfrjwc30D61P1B9SGlkI=;
        b=WYbLrKPINcxVinRcL0M+IGG9ajz81eMgSA8Uppfa3Y2kw1X77iQpuBMwGoEQ9gzI5O
         gmA2q0ytCaCsUKK/omhbC5VTDJ47Rsx0uedi/0Y886n4+EzOrJ0y2qiP3KjAsY2RFIZl
         fFi0SjU1T6NpKCw7WucsaAObBGDgMvKzfc7rCMccTb3IUf/B31Xbt8gVw/VDU+hmNcLH
         0/IONzRb6tycedTzqHIi40pQ7oUWkX808TEeStqWmjBUZB5QQbVryhHSC5tZbon3MCEB
         UQhmYJri8lKA9qQgampft7lI2uAHzPeVbZUmJSNZG0MqdN7k6QmsIzsw4IF21kTfDAu1
         IBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JPvRd3I03GEmWUI3cd1cTAMqfrjwc30D61P1B9SGlkI=;
        b=QhVfVebL1bcbc0Ed9eAzEjQ3uxZH/b2iL7ZSSN5ypC4UmV/p4Vnnss6/xjX09bmUm9
         dUfwnRh9m41dLWJHkm5420B2aJsoxLwXIVy9+j9Y3zzd1MlUrEg36DdlVv25qwI/cpeD
         jCR3wMNJsJglrj/cHKgPqFI4D2DHkSUGEHWSkebBAvAMxQK+hkN8g7F1bBrkSRdg2d+s
         WFQzmuMb0L6iM4hT1yLwT4H2LOELKF9RkybZa7HCb7yjB9g2XZWH8n3zw3O3peNgBxoL
         EppfORuxjdqkaSZY0s+3GWMyPn+jklhhHI2yU+t+ZJ2nLqbT3JSDwv4EjVmhYt2LH2oQ
         y1ew==
X-Gm-Message-State: AOAM530SvZzhTbC+BAtfkdMvDaxAxlh+4uQElPN2vlvCE1mS6DZc3Zm1
        GoUAeXosAI797RC640qWii1ZWQ==
X-Google-Smtp-Source: ABdhPJwOnuTq+tUyB3ODOGA7NcLlE6JdvqChyny1VOTpWM/cd+gFL5d6xrd23g/V8fCP9UEf6xSgbQ==
X-Received: by 2002:adf:f985:: with SMTP id f5mr5235742wrr.201.1623507891403;
        Sat, 12 Jun 2021 07:24:51 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:15bb:2e33:aa66:1b44? ([2a01:e34:ed2f:f020:15bb:2e33:aa66:1b44])
        by smtp.googlemail.com with ESMTPSA id m7sm11265303wrv.35.2021.06.12.07.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 07:24:50 -0700 (PDT)
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
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c65a732d-b203-a1a0-e90b-0aa0664cfb55@linaro.org>
Date:   Sat, 12 Jun 2021 16:24:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <eedb5792-d3a5-78b3-ec89-b26d2e45f9c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/06/2021 12:40, Dmitry Osipenko wrote:
> 11.06.2021 12:52, Daniel Lezcano пишет:
>> On 14/05/2021 23:16, Michał Mirosław wrote:
>>> On Mon, May 10, 2021 at 11:25:53PM +0300, Dmitry Osipenko wrote:
>>>> It's possible to hit the temperature of the thermal zone in a very warm
>>>> environment under a constant load, like watching a video using software
>>>> decoding. It's even easier to hit the limit with a slightly overclocked
>>>> CPU. Bump the temperature limit by 10C in order to improve user
>>>> experience. Acer A500 has a large board and 10" display panel which are
>>>> used for the heat dissipation, the SoC is placed far away from battery,
>>>> hence we can safely bump the temperature limit.
>>>
>>> 60^C looks like a touch-safety limit (to avoid burns for users). Did you
>>> verify the touchable parts' temperature somehow after the change?
>>
>> The skin temperature and the CPU/GPU etc ... temperatures are different
>> things.
>>
>> For the embedded system there is the dissipation system and a
>> temperature sensor on it which is the skin temp. This temperature is the
>> result of the heat of all the thermal zones on the board and must be
>> below 45°C. The temperature slowly changes.
>>
>> On the CPU, the temperature changes can be very fast and you have to
>> take care of keeping it below the max temperature specified in the TRM
>> by using different techniques (freq changes, idle injection, ...) but
>> the temperature can be 75°C, 85°C or whatever the manual says.
>>
>> 50°C and 60°C are low temperature for a CPU and that will inevitably
>> impact the performances, so setting the temperature close the max
>> temperature is what will allow max performances.
>>
>> What matters is the skin temperature.
>>
>> The skin temperature must be monitored by other techniques, eg. using
>> the TDP of the system and throttle the different devices to keep them in
>> this power budget. That is the role of an thermal daemon.
> 
> Thank you for the clarification. Indeed, I wasn't sure how to make use
> of the skin temperature properly.
> 
> The skin temperature varies a lot depending on the thermal capabilities
> of a particular device. It's about 15C below CPU core at a full load on
> A500, while it's 2C below CPU core on Nexus 7. But this is expected
> since Nexus 7 can't dissipate heat efficiently.
Yeah, but it can not be directly related to the CPU because if the GPU
is intensively used and the battery is charging at the same time, the
skin temp will increase anyway.

You should set the trip points close to the functioning boundary
temperature given in the hardware specification whatever the resulting
heating effect is on the device.

The thermal zone is there to protect the silicon and the system from a
wild reboot.

If the Nexus 7 is too hot after the changes, then you may act on the
sources of the heat. For instance, set the the highest OPP to turbo or
remove it, or, if there is one, change the thermal daemon to reduce the
overall power consumption.

In case you are interested in: https://lwn.net/Articles/839318/

Hope that helps

  -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
