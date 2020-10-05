Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0426C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B14D22078A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVgtpS2I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgJEO34 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJEO3z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 10:29:55 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC0AC0613CE;
        Mon,  5 Oct 2020 07:29:55 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y11so11137725lfl.5;
        Mon, 05 Oct 2020 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/DTk/l8h0Z59twinYldLgQdELHZ5yboeSG3Q/928A38=;
        b=YVgtpS2Im87NBVvYDWqYZ54DiFB/wcXshV0rK6D8siVfVSTFPWMpoQJkq6SyVreIVq
         p7K1YLsSmpitiXqK/QKV8QRpJSaOiAr6r9xbwRRFn6usbS3sSBeCATuxh7O9+zjwjLEz
         NvpnztuMdZoSdY6oawmG7FoWBXSN6Zme9vKL92s2AhNYZKU5OpNzbifBwyZ0j5VBE4VD
         +oPQslZrBXCluUnmzBl3zNlf68Ez4KJwT44p1s8ixjF+sSjOsjcnoS58k3JGiKPZNVOA
         dtYcc/Yc//9u5+5ZdyPbfa9LAHDvFlKwIDnk/eXVnAMba+5PsHwt45ctlKlRBfCiLcUM
         87Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/DTk/l8h0Z59twinYldLgQdELHZ5yboeSG3Q/928A38=;
        b=H5n/R0M/xsRjORqwwZnBn715x1QOtd8zlccgwIq4VipXbkWIJ8jrdOTcLmy3/r6/UT
         cXYAnGf4JhSlppgOdfqiySY9IvcV9m9aT8mxsjTKoeellGd0TOrmF+XHxQtRY6RspDDH
         sbdXbkNNQmjpqpNqFJ0StKzoy7Zw2SofihckSi5m++8KL010i1wmejQIwV74RbJVUevA
         2tIysSj1ZXk4LLwpY9mGDDsTwvVl0x8Seoxw/LZPJX0jeRGgyX3/2rmPnbzqZ06p4xMp
         7DFwglgO61LOfVpWeZsGefLaAoO9LfGu7OB7j7Xhp30PnRTpXsJ28b/INF28443z+n85
         uizA==
X-Gm-Message-State: AOAM531oVmKV6JUtsTEqGzQ4DZlr8U/Y8uUk2OhUA+8K31hJ0dxHrtVW
        lbLwLE0z0Kov1EEOKpNQedY4gcsBSIM=
X-Google-Smtp-Source: ABdhPJxIrZogsyKGAUY1w8GgqkwMMlAYHTV8eXOniWiONEhcOn7JRNYtKQYQvkqYkqveJwsxgDe1WA==
X-Received: by 2002:ac2:4944:: with SMTP id o4mr6162418lfi.374.1601908193378;
        Mon, 05 Oct 2020 07:29:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id 26sm175912ljg.30.2020.10.05.07.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 07:29:52 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] ARM: tegra: Add device-tree for Ouya
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <20201004133114.845230-2-pgwipeout@gmail.com>
 <b3b99578-73c8-17e1-81ff-4b3fdf1b58f3@gmail.com>
 <CAMdYzYoKYzTsdWd=99LbwJ4-dG1WOJLo=hxsu_h=Hwrtybiw9A@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6f5fad13-d570-a923-ff40-45071709c296@gmail.com>
Date:   Mon, 5 Oct 2020 17:29:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMdYzYoKYzTsdWd=99LbwJ4-dG1WOJLo=hxsu_h=Hwrtybiw9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2020 17:22, Peter Geis пишет:
> On Mon, Oct 5, 2020 at 10:02 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 04.10.2020 16:31, Peter Geis пишет:
>>> +     thermal-zones {
>>> +             cpu_thermal: cpu-thermal {
>>> +                     polling-delay = <5000>;
>>> +                     polling-delay-passive = <5000>;
>>> +
>>> +                     thermal-sensors = <&cpu_temp 1>;
>>> +
>>> +                     trips {
>>> +                             cpu_alert0: cpu-alert0 {
>>> +                                     temperature = <50000>;
>>> +                                     hysteresis = <10000>;
>>
>> Hello, Peter!
>>
>> A day ago I was tuning thermal zones for Nexus 7 because found that the
>> current variant is a bit too unpractical. In particular temperature
>> hysteresis should be small, otherwise cpufreq could get throttled
>> enormously to the point that device becomes unusable. This is an
>> active-cooling zone, but it looks to me that hysteresis is a bit too
>> high and should make Ouya much noisier than it could be.
>>
>> I suggest to try to set hysteresis to 0.2C here, i.e. hysteresis = <200>.
>>
>> I also suggest to bump the temperature threshold to 55C in order to
>> ignore temporal temperature spikes because CPU temp should be about 40C
>> during idle and then it may raise quickly for a brief moments during
>> average usage.
> 
> Good Morning,
> 
> The Ouya has a rather large heatsink with poor conductivity and a
> single stage fan.
> The fan is not terribly loud, as it runs at a rather low rpm.
> The temperature at the cpu tends to be much higher than observed at
> the heatsink.
> I've found that a low hysteresis value leads to a situation where the
> fan is constantly toggling on and off.
> I actually burned out the power transistor driving the fan on my first
> Ouya this way.
> The high hysteresis value provides a good balance of fan on/off time
> under most loads.
> The temperature threshold was chosen for this as well.
> 
>>
>>> +                                     type = "active";
>>> +                             };
>>> +                             cpu_alert1: cpu-alert1 {
>>> +                                     temperature = <70000>;
>>> +                                     hysteresis = <5000>;
>>> +                                     type = "passive";
>>> +                             };
>>
>> And here to 0.2C as well.
> 
> This value was chosen to protect the CPU in case of fan failure.
> Again, with the large heatsink and poor conductivity we need to
> maintain throttling for longer.
> Otherwise the cpu temp will overshoot and risk thermal shutdown before
> throttling can prevent it.

Alright! Then I don't have any more comments for now, thanks :)
