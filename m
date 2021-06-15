Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD34C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 12:53:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 374D861426
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 12:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhFOMzi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 08:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbhFOMzi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 08:55:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F31C061574;
        Tue, 15 Jun 2021 05:53:33 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id n17so24928042ljg.2;
        Tue, 15 Jun 2021 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c1U1U7WWFRJoYARUYS6HMhPRMf1OckltvDZenHaEUBI=;
        b=G5hxMwnpOqxfrrPp4VNLf7uX0aqO/REvGMvAtOtWaysvkawIYYgwBCyzcMrYjbNI3m
         ZKbtl3knL+ybNayV31LMALfAuC1Gp0uBDHJ49NoUsnw4HBmt7a706lu+GU7WA6vtNixf
         RFHme9msLJxWkZonHXR6s7ktZ9ozqZ5iCiRNUd0nLnt+W8RAm/3O27liRO0IjjaMUhMP
         eJMU/wsGOB31sz9B0eV368lee2D6AA6uChoPweDDw1L26+KQuKwxwRa4IBJxKelChDan
         hrMEuHoOAh9fevQmtVYsYgH3nOaMtMbwkgNflAgfW7blBuFBhCudNPndAHBg23I1NbxX
         Ljcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c1U1U7WWFRJoYARUYS6HMhPRMf1OckltvDZenHaEUBI=;
        b=UvbdIoj7Tq/kAiIHcoxnRrIxyfFuSOJoNn4ckRpg+M3+QkESv16EqIMYagY8G1Luq8
         5hvXlbXnT2TE5UiQZqPaG4uavwUf+qgPNZyDbEbXVSiuDi575DijCOm+iJ/kMQDgG4PO
         J9zNm5tNhz42Udi+5XxrNgfFS0M5r2QFGcRxMdCbPv6vFbdSBvKs2IR1IQFL+WoA9l14
         EyoggP6gNuwim7iK/bjDpFG1qs2vwBcBGm2Yd0rakzXIyphsm0ZlXvvED/9jzWoSbtQv
         JgrAnRDRgVBIeaj/Dlgt9DE7yafnsqjjz+3jGfOhA7/gZiMQj7BqjUjQNqJTCBpUvjpS
         AQHw==
X-Gm-Message-State: AOAM5335eoVEzy/iIGC8KYdLkWr13iJyEcPjehuuSzw61PrM7x6X8UCQ
        N+wolFvrbL8Hj5uM5PL5feoJ2nDhvrw=
X-Google-Smtp-Source: ABdhPJx8us4Tn3EhUsI/Mz/K68HDmv+iMde9y5SSqCztziOgqTF+/G0AnoBuEQERwnJ9yyY7kiAalg==
X-Received: by 2002:a2e:580e:: with SMTP id m14mr17997013ljb.197.1623761611229;
        Tue, 15 Jun 2021 05:53:31 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id h4sm1807089lft.184.2021.06.15.05.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 05:53:30 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60a280c3-e67f-ff3a-9f0e-7d12fc125c5b@gmail.com>
Date:   Tue, 15 Jun 2021 15:53:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1abadc69-1dd1-5939-c089-37a84be4781b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.06.2021 21:19, Daniel Lezcano пишет:
> On 13/06/2021 02:25, Dmitry Osipenko wrote:
> 
> [ ... ]
> 
>>> You should set the trip points close to the functioning boundary
>>> temperature given in the hardware specification whatever the resulting
>>> heating effect is on the device.
>>>
>>> The thermal zone is there to protect the silicon and the system from a
>>> wild reboot.
>>>
>>> If the Nexus 7 is too hot after the changes, then you may act on the
>>> sources of the heat. For instance, set the the highest OPP to turbo or
>>> remove it, or, if there is one, change the thermal daemon to reduce the
>>> overall power consumption.
>>> In case you are interested in: https://lwn.net/Articles/839318/
>>
>> The DTPM is a very interesting approach. For now Tegra still misses some
>> basics in mainline kernel which have a higher priority, so I think it
>> should be good enough to perform the in-kernel thermal management for
>> the starter. We may consider a more complex solutions later on if will
>> be necessary.
>>
>> What I'm currently thinking to do is:
>>
>> 1. Set up the trips of SoC/CPU core thermal zones in accordance to the
>> silicon limits.
>>
>> 2. Set up the skin trips in accordance to the device limits.
>>
>> The breached skin trips will cause a mild throttling, while the SoC/CPU
>> trips will be allowed to cause the severe throttling. Does this sound
>> good to you?
> 
> The skin temperature must be managed from userspace. The kernel is
> unable to do a smart thermal management given different thermal zones
> but if the goal is to go forward and prevent the tablet to be hot
> temporarily until the other hardware support is there, I think it is
> acceptable.

The current goal is to get maximum from what we already have, thank you.
