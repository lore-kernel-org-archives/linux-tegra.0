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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0500EC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 13:23:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCD4261A21
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 13:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhCZNWx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 09:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhCZNW0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 09:22:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C923C0613AA;
        Fri, 26 Mar 2021 06:22:26 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o126so7706037lfa.0;
        Fri, 26 Mar 2021 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3ra1p1BekCYOvDZxKQ00j5y4D2v1EvgiitNiy5nUGWQ=;
        b=u0bDybivcG5Gz7Q/UCqiAeDjb/KPEg82tQNdJnXdjCAtMCzU6aDRNtGyAuxAucocIA
         EWyGOLaPpSeTAIz325Z7Bv0vgddRMLsHrP871A0H1ALsoBcBnscVe7rMNPWO+MkiThrP
         IUT3K3XAXZgiWwRgfzuhDz5WPsgdC+WFeJxZFa2C/NUsHqDQwuDXVmfswvjvWRNyPJ2q
         cmXxiXjFVw1s8AlxfwmBhzWUg30+Eiufw0Aec1A8InY+rR6wXMf9bCxzQiHpNCTLzbcj
         PHZvr/6SX5TlWs/9aGzzjXrdXlfImQ9wbILdSKdsqsTbZxwrxdnYPqq0A0ajQEGLBZZJ
         4OhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3ra1p1BekCYOvDZxKQ00j5y4D2v1EvgiitNiy5nUGWQ=;
        b=UBe6qUgsgu8hw06qUsUySoQuQDVbVVrVgIHrlV/lEd+498/+Mngdb3tzLCwnh32HA1
         7TaqYItpmTc2Um1Ol3oNp2ANlYjwPueBoE3IRmdQK65oKfejBNngzM/x/fJG1vxKkrLp
         wkkVkJXL0/GuHXlnJ/ME/3oqFcdDuypjj0BVREx2wMvGOAkud6Rtd1OMQgjxU7aNQxDF
         0S21cLx05kzm7vktRZvZveenk2pnCUzvfbduEEIR0BnIRnl2ll5qe0BfIZ73OO+C4TJ0
         9LBB6uCdo/qmBhryDkpHFDBhSLT3837z14bOtU12vBYpUHY+lAnMV7cAbwsoRgWSS3E1
         QDsA==
X-Gm-Message-State: AOAM531s9Rdu2SaPNUHowwOSgblPfHDXlNYd7gTkkEWSHwOh89MuwXbw
        GQStooDKj3/YwurQG5hmYwWsbnsjFBz8Gw==
X-Google-Smtp-Source: ABdhPJwFdNq9+rvweR9VbHEddLUaxIR+TBgLyrSt/hZTwximiHD9GQjfXhuRhtaFywJ0zSQ+lICw5g==
X-Received: by 2002:a19:7402:: with SMTP id v2mr8030374lfe.58.1616764944556;
        Fri, 26 Mar 2021 06:22:24 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id q3sm871200lfp.233.2021.03.26.06.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 06:22:24 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] memory: tegra20: Correct comment to MC_STAT
 registers writes
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210323210446.24867-1-digetx@gmail.com>
 <799f54f6-6023-338f-4e8f-cc0dfbac30d8@gmail.com>
 <63a3225e-7cae-8592-653e-04a76b7cf9c1@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <93d5c6db-5ac3-fcc0-41c7-44c146bdccfe@gmail.com>
Date:   Fri, 26 Mar 2021 16:22:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <63a3225e-7cae-8592-653e-04a76b7cf9c1@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.03.2021 10:38, Krzysztof Kozlowski пишет:
> On 25/03/2021 18:20, Dmitry Osipenko wrote:
>> 24.03.2021 00:04, Dmitry Osipenko пишет:
>>> The code was changed multiple times and the comment to MC_STAT
>>> registers writes became slightly outdated. The MC_STAT programming
>>> now isn't hardcoded to the "bandwidth" mode, let's clarify this in
>>> the comment.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/memory/tegra/tegra20.c | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
>>> index 14caf5b9324c..4659c0cea30d 100644
>>> --- a/drivers/memory/tegra/tegra20.c
>>> +++ b/drivers/memory/tegra/tegra20.c
>>> @@ -451,9 +451,8 @@ static void tegra20_mc_stat_gather(struct tegra20_mc_stat *stat)
>>>  	control_1 = tegra20_mc_stat_gather_control(&stat->gather1);
>>>  
>>>  	/*
>>> -	 * Reset statistic gathers state, select bandwidth mode for the
>>> -	 * statistics collection mode and set clocks counter saturation
>>> -	 * limit to maximum.
>>> +	 * Reset statistic gathers state, select statistics collection mode
>>> +	 * and set clocks counter saturation limit to maximum.
>>>  	 */
>>>  	mc_writel(mc, 0x00000000, MC_STAT_CONTROL);
>>>  	mc_writel(mc,  control_0, MC_STAT_EMC_CONTROL_0);
>>>
>>
>> Krzysztof, please feel free to squash these 2 minor follow up patches
>> into the original patch which added the the debug support, if you prefer
>> this way more. I happened to notice these small itches only after you
>> already picked up the previous patch.
> 
> No problem, in general I prefer to have incremental improvements.

Thank you.
