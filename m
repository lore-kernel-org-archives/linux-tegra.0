Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE14C43462
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 13:35:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14D8361059
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 13:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhEQNhI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 09:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237379AbhEQNhH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 09:37:07 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03EF4C061756;
        Mon, 17 May 2021 06:35:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id v6so7280082ljj.5;
        Mon, 17 May 2021 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WQqDABHDGgDQCU0WnTFwCSsQA9jF51qzAZtjkZ18AOU=;
        b=I1RXfaR+fQaCMswosSWi6tpGukzhRb3nEIRrgwDshVD4JWgGPCaYncHyUcfiGgpTYv
         q8+LYoXpZ4yUAJdPJgbAxMAx0Xompgtm5vMgehYbmlEdmBPghejbOxbr1iO9JTrznqdQ
         FRDLcCYbmyeis2gIfFsnoM06Vb4a4meVjfQ9kz24/DlNHeSlugf6YMpg7O6VS8DIjcLU
         oLce8CT73ZVcZMdAisEVg6rID4detd8vdc1giOQUDmDTZArfjJeFyrZt/0/l+c9djIiZ
         mOJLullq7A1zmTyNWeJnbos7uQPPgldvpBRugOfsSSvdCronpcATZjBfntWkAIyLv9yt
         MTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WQqDABHDGgDQCU0WnTFwCSsQA9jF51qzAZtjkZ18AOU=;
        b=PndERzeBVDFftRGNhF/KLCSizDrgp0wxfb1gMLfXCcsV1HB2HmHhn1tah7IRFmY5KE
         PkYxaJSw6KfG5lO0zES67OY5LGd6j0g5jqqkzsHqeJ93kSL4mCtBnJtFsuwzfZoBLJ3F
         IBmfLK3pbVkV4EOrzfAYBJp3+YaeR9WNsAVsDNJDEOJxrEovJNO295/qP6ohoFcfJueJ
         gzxuGckLLNeIUkaRMIDJlXnvHW4AaLFC0+S9drJQOVOH4apRJfwB26lfDLtodxdm8Ywt
         JYzXnNmMHLHvi+znjacnGWGJNXxAuajnjU+s6ennYJ4HtGlBGcRlE4bxytcdx3i3vmbI
         DzTA==
X-Gm-Message-State: AOAM531tcWK8kXr8FfLQfsjGdUarqnVI+TH5Bj6Iy02qALJJXVnINvet
        bbmmiOQ906AB+YFon7NI6wfNlfgFJ0I=
X-Google-Smtp-Source: ABdhPJxLvlETmFTqcDLi1Mn2/MUIK3cxp4Q7EAzvHXI+H41aZhEIHklSeJOjZvMqbABjHI51UQb9IA==
X-Received: by 2002:a2e:b4b1:: with SMTP id q17mr41060196ljm.40.1621258548300;
        Mon, 17 May 2021 06:35:48 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id a9sm145819ljb.73.2021.05.17.06.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 06:35:47 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on
 64bit platforms
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-4-digetx@gmail.com>
 <936cfc7d-737e-a582-ea60-ad2ba5b4ca72@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1d80ee0f-de4c-24d0-154f-20841874bf20@gmail.com>
Date:   Mon, 17 May 2021 16:35:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <936cfc7d-737e-a582-ea60-ad2ba5b4ca72@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.05.2021 14:28, Krzysztof Kozlowski пишет:
> On 16/05/2021 12:12, Dmitry Osipenko wrote:
>> Fix compilation warning on 64bit platforms caused by implicit promotion
>> of 32bit signed integer to a 64bit unsigned value which happens after
>> enabling compile-testing of the driver.
>>
>> Suggested-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/tegra/tegra124-emc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
>> index 5699d909abc2..c9eb948cf4df 100644
>> --- a/drivers/memory/tegra/tegra124-emc.c
>> +++ b/drivers/memory/tegra/tegra124-emc.c
>> @@ -272,8 +272,8 @@
>>  #define EMC_PUTERM_ADJ				0x574
>>  
>>  #define DRAM_DEV_SEL_ALL			0
>> -#define DRAM_DEV_SEL_0				(2 << 30)
>> -#define DRAM_DEV_SEL_1				(1 << 30)
>> +#define DRAM_DEV_SEL_0				(2u << 30)
>> +#define DRAM_DEV_SEL_1				(1u << 30)
> 
> Why not using BIT()? This would make even this 2<<30 less awkard...

The bitfield 31:30 is a enum, 3 is a wrong value. Formally it's
incorrect to use the BIT() macro here.
