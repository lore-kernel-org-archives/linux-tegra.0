Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87370C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 07:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BB9B60200
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 07:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCZHi0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 03:38:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56498 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhCZHiF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 03:38:05 -0400
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lPh2h-0004q5-Ti
        for linux-tegra@vger.kernel.org; Fri, 26 Mar 2021 07:38:03 +0000
Received: by mail-wm1-f72.google.com with SMTP id o9-20020a05600c4fc9b029010cea48b602so2022988wmq.0
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 00:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dRtqa7yLsQvFT2lpOj4EynM8RgSn4Vk0wfShrT8ILwQ=;
        b=IVuNbJ/fZKak7ijgUk6HBjjehW42jRHXNxotjTvwjRmwXAc6pzYLUl7aWl8e2XT5R7
         5KjoUv6oBl3/bxZhjhJ4ITfjBHoxLZNV+hE+JiQkJhQzWJBnIEMqWPlzbQhEjNF93Dih
         jVYQ7OccXPvxr3oystU8iv0GTuHyKk/j52wtm5AG86Il69VhSxuf7UEP731ghgD0ICcC
         cIyWycXE56OYcd9KvOYSwShqNTXrL49okVMv4QkAeIeg1C8rd14Y01Hj3Xp7EFzhU+xI
         prFBqezk0UwHb2rLmb4f2Tp8sj0xQxdixh5i38eXbSnWPItjByN4MOtUtMAq5rTtw7Uv
         kNOg==
X-Gm-Message-State: AOAM531E4jKlVz7PEstrHqmQDYk6JV1YAQwOvM9X/faHF39hW5wNm3Nd
        KYAqZpouINy2izWB2ne5gSHJFKbQSXdPZnh/AMReW514owsHIm9CSPRreQ+5RnyRM+vpOVC3VZ/
        MaEYjZGAv2Wzc08WLvEeVzKmEhKoNH+4iqWCBf7ax
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr12732357wra.103.1616744283163;
        Fri, 26 Mar 2021 00:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYcIF96pDeU5oc+LG7wrlIU/oMqagEKGvMa3QKpMiYqcmsN21wshw8dnjUa8GuRloLw8gKpQ==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr12732344wra.103.1616744283011;
        Fri, 26 Mar 2021 00:38:03 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id j12sm11449357wrx.59.2021.03.26.00.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 00:38:02 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] memory: tegra20: Correct comment to MC_STAT
 registers writes
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210323210446.24867-1-digetx@gmail.com>
 <799f54f6-6023-338f-4e8f-cc0dfbac30d8@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <63a3225e-7cae-8592-653e-04a76b7cf9c1@canonical.com>
Date:   Fri, 26 Mar 2021 08:38:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <799f54f6-6023-338f-4e8f-cc0dfbac30d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/03/2021 18:20, Dmitry Osipenko wrote:
> 24.03.2021 00:04, Dmitry Osipenko пишет:
>> The code was changed multiple times and the comment to MC_STAT
>> registers writes became slightly outdated. The MC_STAT programming
>> now isn't hardcoded to the "bandwidth" mode, let's clarify this in
>> the comment.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/tegra/tegra20.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
>> index 14caf5b9324c..4659c0cea30d 100644
>> --- a/drivers/memory/tegra/tegra20.c
>> +++ b/drivers/memory/tegra/tegra20.c
>> @@ -451,9 +451,8 @@ static void tegra20_mc_stat_gather(struct tegra20_mc_stat *stat)
>>  	control_1 = tegra20_mc_stat_gather_control(&stat->gather1);
>>  
>>  	/*
>> -	 * Reset statistic gathers state, select bandwidth mode for the
>> -	 * statistics collection mode and set clocks counter saturation
>> -	 * limit to maximum.
>> +	 * Reset statistic gathers state, select statistics collection mode
>> +	 * and set clocks counter saturation limit to maximum.
>>  	 */
>>  	mc_writel(mc, 0x00000000, MC_STAT_CONTROL);
>>  	mc_writel(mc,  control_0, MC_STAT_EMC_CONTROL_0);
>>
> 
> Krzysztof, please feel free to squash these 2 minor follow up patches
> into the original patch which added the the debug support, if you prefer
> this way more. I happened to notice these small itches only after you
> already picked up the previous patch.

No problem, in general I prefer to have incremental improvements.

Best regards,
Krzysztof
