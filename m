Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ED6C433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 13:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC5A861363
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 13:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhESNRG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 May 2021 09:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235765AbhESNRG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 May 2021 09:17:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E488C06175F;
        Wed, 19 May 2021 06:15:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a2so18979899lfc.9;
        Wed, 19 May 2021 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9RcQ9v9QPlq03Y26uBjbqA7L/wB0h2ultT6e+0JtppE=;
        b=T5nB4YJNlamqRp4SvsAcy8JKObamBWOsiCQRt+EFUPpScmK3beaXK7G9gmFoG9XJO0
         1jMwc7JMw9fMX6Bwd3y+d59vrVdrRjD0nBwL+qZuNNf2waw8jWJIWtK0sYw+21BCuQZ9
         CXq1oGOChiaJjG4Oqztagnf7iQM+5Ib6H5f+jga1YfQXBe5pYGUd9tPst+T72NLVWLDm
         tFL3YCknrwyPiveDKWFoZZiyn8OunU1n3d72tM62tQYmS2Zexkq9uFXCrv6KDLEbHwPX
         AZUwhkzSZAi08yWac0ItMHZ/8/+wHMgQoK/sKytfInxnsacauCFFRRuvXD5gEXl8qL35
         XBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9RcQ9v9QPlq03Y26uBjbqA7L/wB0h2ultT6e+0JtppE=;
        b=X3yHGoovhIOu1d/HYLcbQFB9oq5nA1V9YDrXA1JZO6wvD7qDbSIbcRH89x+qcay6Dl
         BnvPWLGPqgb4prnFi69A1rNc8Le7suvhOweDKTBmjk9H7YBYk4VA0Yh5SY0iUcj0X4ax
         slrhrG+4mvAIkI9ri7vxoZaRjFia+9rwySD3LQ0cY3AWHU1qPJgjsRpTjOYM9/9VWW3k
         41hexQyFa4iH/hACHyd+OvDGtwublDA+gIcx+3p+k9K4D0r5CNUuaRgpk8ZDNYFqLvqj
         7t/5vHnYNVnexf7uW7kCU2nXvx8tJwC/3ahUnwLhiBNeNTmUWADPnYgWArv34SnfiFAn
         yDZw==
X-Gm-Message-State: AOAM531LRFkWnXwobaGOqq3NIhpsOKF7Ku/4IJEdNuSyY2Aly9u8xpCC
        bPFgmH4K+0zRK0Mfo+WRLL4=
X-Google-Smtp-Source: ABdhPJy0QFH+MbToxjV7XSE4yKRM7FG24t3G2GHywRQOcMMQ0RSq/bRfX66NLC10V0zEVYnT5YxhKQ==
X-Received: by 2002:a05:6512:3d2:: with SMTP id w18mr8489263lfp.573.1621430144965;
        Wed, 19 May 2021 06:15:44 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-55.dynamic.spd-mgts.ru. [109.252.193.55])
        by smtp.googlemail.com with ESMTPSA id c7sm2612193lfv.27.2021.05.19.06.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:15:44 -0700 (PDT)
Subject: Re: Question about Tegra UCMs
To:     Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
 <562efe35-dd91-12a0-96a5-b8f4f34ea153@perex.cz>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d5944fc0-4f8a-9881-c336-b418d76540c5@gmail.com>
Date:   Wed, 19 May 2021 16:15:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <562efe35-dd91-12a0-96a5-b8f4f34ea153@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.05.2021 14:13, Jaroslav Kysela пишет:
> Dne 19. 05. 21 v 0:31 Dmitry Osipenko napsal(a):
>> Mark, could you please help me to understand the UCM naming scheme that ALSA uses..
>>
>> About a year ago I tried to complain to Jaroslav Kysela in a comment to the UCM change [1] that it should be breaking the naming scheme of Tegra UCMs, but haven't got a meaningful reply and moved on to other things.
>>
>> [1] https://github.com/alsa-project/alsa-ucm-conf/commit/8ff2d50745efbb6959324f672460e413f0b618b8
> 
> I'm sorry about that, but it's better to create a tracked ticket (issue or
> pull request).
> 
>> Today I noticed that the naming scheme changed again and I still don't understand what to do about it.
>>
>> I have two devices:
>>
>>  1. Acer Picasso tablet that uses "Acer Iconia Tab A500 WM8903" for the card model name.
>>
>>  2. Google Nexus 7 that uses "ASUS Google Nexus 7 ALC5642".
>>
>> Previously UCMs were picked up by pulseaudio from these paths:
>>
>>  1. /usr/share/alsa/ucm2/Acer Iconia Tab A500 WM8903/
>>  2. /usr/share/alsa/ucm2/ASUS Google Nexus 7 ALC5642/
>>
>> Now the lookup paths are changed to:
>>
>>  1. /usr/share/alsa/ucm2/Acer_Iconia_Tab/
>>  2. /usr/share/alsa/ucm2/ASUS_Google_Nex/
> 
> Yes, it's based on the driver name (which is incorrectly set /or not set/ in
> your case).
> 
> Lookup paths (with description):
> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/ucm.conf
> 
> The latest scheme is even different - lookups were moved to ucm2/conf.d with
> redirection to the more descriptive layered configuration tree structure, so
> the other developers can immediately identify the hardware which is
> configured. See Qualcomm examples. The long card names does not help us so much.
> 
>> Strace shows that pulseaudio searches UCMs only at these paths.
>>
>> The output of /proc/asound/cards:
>>
>>  0 [WM8903         ]: Acer_Iconia_Tab - Acer Iconia Tab A500 WM8903
>>                       Acer Iconia Tab A500 WM8903
>>
>>  0 [ALC5642        ]: ASUS_Google_Nex - ASUS Google Nexus 7 ALC5642
>>                       ASUS Google Nexus 7 ALC5642
> 
> Fields are explained in:
> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/README.md
> 
>> Is there anything on the kernel side that I could change to get a working naming scheme? If yes, I may try to do something about it in the v2, thanks in advance.
> 
> Try to set a meaningful driver name (usually the code handling the ASoC card
> creation). It should be very close to the kernel module name (but more user
> friendly). The current code for your hardware use the auto-generated driver
> name from the ALSA long name.

The current name isn't auto-generated, it's specified via the
nvidia,model device-tree property.

> Then try to reuse the existing configs - for example your Nexus 7 config has
> many blocks from codecs/rt5640/* .
> 
> Anyway, create a PR so we can discuss the details.

I will create the PR, thank you very much. It's important problem which
can't be postponed anymore since sound doesn't work without UCMs on
Tegra devices.
