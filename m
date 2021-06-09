Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C81AC48BCF
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 13:19:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D8F6613C5
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 13:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbhFINVK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:21:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42762 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbhFINVJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 09:21:09 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lqy6z-0006Wc-8p
        for linux-tegra@vger.kernel.org; Wed, 09 Jun 2021 13:19:13 +0000
Received: by mail-wr1-f69.google.com with SMTP id s8-20020adff8080000b0290114e1eeb8c6so10753948wrp.23
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jun 2021 06:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K7ukFOcIqlMyCwfcpS6HoUWpF/8CQogyFh7SodyrFVo=;
        b=OFEuuwFjbL/GB3G37SpVmKW3T2/53mDjDwODIoAw6Pk64LiJdWwelE8dmtnhSwnMRi
         PikKKwuK5R3aBPgD+tXY0QPMw7A8xX/nZyeN4QIwrzOEONrJaQDPUpOmqO94KW3UdnL4
         Vyy6Vj7ZDnOU8JA75ehVZPI/Y9C+Mo/7LFi5sY4wXcqKWzi0LJg0j4OyrmKXipW8FGQJ
         Um0N5uqoDoMA35J9/T4J7eOY1VFh6K02bLPlMKQleEw62TSX3yjIbH6J9ro9Tjg256CC
         PCsqOQgEEZlgsN3GL9WGqfl0QtaWw4gMk17rTSrVRwkWeMTPz0FQjqV05wxd3pxecbax
         zOww==
X-Gm-Message-State: AOAM533V9t7ZmbxLOZMffeedqud0t2jPxJSjVwvkbmzTSTV7XzoK9Iju
        svNGXUcp23zr+NNRRBFQcMD9GPHKVOudy0Zg+9Vcd1qo4D8oQ83pXGmkBhagyciy12FXMEr4uv2
        P1QOveuDnTtcssSIwcT0WMiX0VkyqZW0w2OG1S2vY
X-Received: by 2002:a5d:6382:: with SMTP id p2mr29405307wru.338.1623244753068;
        Wed, 09 Jun 2021 06:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJkaKG91SyeYUwwhszmOE+6jjkQPDwARKcdf4a5gIWrDST/QYGzNQpTMcJFkRaPMUNnLuOFg==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr29405291wru.338.1623244752943;
        Wed, 09 Jun 2021 06:19:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id h9sm20533941wmb.35.2021.06.09.06.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 06:19:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
 <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
Date:   Wed, 9 Jun 2021 15:19:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/06/2021 13:58, Dmitry Osipenko wrote:
> 09.06.2021 14:28, Thierry Reding пишет:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> When enabling the COMPILE_TEST Kconfig option, the Tegra memory
>> controller can be built without ARCH_TEGRA being selected. However, the
>> driver implicitly depends on some symbols pulled in via ARCH_TEGRA,
>> which causes the build to break.
>>
>> Add explicit dependencies for OF_EARLY_FLATTREE and OF_RESERVED_MEM to
>> the Tegra MC Kconfig option to make sure they are selected even if
>> ARCH_TEGRA is not.
>>
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/memory/tegra/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>> index f9bae36c03a3..ecfb071fc4f4 100644
>> --- a/drivers/memory/tegra/Kconfig
>> +++ b/drivers/memory/tegra/Kconfig
>> @@ -48,6 +48,8 @@ config TEGRA124_EMC
>>  config TEGRA210_EMC_TABLE
>>  	bool
>>  	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
>> +	select OF_EARLY_FLATTREE
>> +	select OF_RESERVED_MEM
>>  
>>  config TEGRA210_EMC
>>  	tristate "NVIDIA Tegra210 External Memory Controller driver"
>>
> 
> Will this work if CONFIG_OF is disabled?

Yeah, good question. That's why I propose "depends on". No issues with
unmet or circular dependencies.


Best regards,
Krzysztof
