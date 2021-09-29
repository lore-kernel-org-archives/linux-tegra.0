Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03F7C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 10:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E986611C0
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Sep 2021 10:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245436AbhI2KeG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Sep 2021 06:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245325AbhI2KeF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Sep 2021 06:34:05 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7191EC061753
        for <linux-tegra@vger.kernel.org>; Wed, 29 Sep 2021 03:32:24 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d26so3390504wrb.6
        for <linux-tegra@vger.kernel.org>; Wed, 29 Sep 2021 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B8SE4Qs07Uj8vFUKjSYmRnx/7zYgPDRQFm1myf4KWAI=;
        b=nf5GiGAKzev1xN1vrud4xGU9j2XxjHGOIiV+9E1hL+YkANLeMX2wCYudAl4Qm7okDJ
         eIP25dvJdgjvtqmAVA1avQSm1pGX7C5xLJ/K1rjBNpLz1fbaDWncW+odv2O3CWAndCvV
         sZM2zXpIcLhqoyEbqaSKbqW+E6ORSS6SfZSfh21rBqG8aT7/CbBkCBGAyk48gU+9Oac3
         yGAWBvKQOgOKhNWz3yu4DKsIq0qlKjkhyxajrNnUKa7D2MrTkmayKnseyA5b43WREpYl
         C2Xsu0vQuv/jNu3iFAQclqmOpLhbyw6s0YxBm/9KL1zf0Zu18sPMok1IupIlQ0U80bw1
         NdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B8SE4Qs07Uj8vFUKjSYmRnx/7zYgPDRQFm1myf4KWAI=;
        b=Uft4vanVeEwGZYVzLtGZREqSlryjGq6HiUJGUbUWqaCOG4kkRNY02aONG1Q/YjeKz7
         OEvpLq3U0Lv6uyN0tO+2+J7wMNeC+P4KUFO7UlSyh7Wx6+bm0k6hsWkT4sht85vHnrmk
         4/CJQsrI8whxjyix321gU/gUaQv+EcYUqhD/1l+9yZQ1nt+6hBVjHExowL8SnloQoeUY
         TLn8yi/g6NQx6U2NyqbczFuUkkuYgDzPMf8I6gcRa19MaBMoaDhp9HhQ9WvpU50kEFCZ
         /4EP3JoaTsLyqm5QdBG5YbikyxL+qWScSFmpXCsZ/T2AX1heaH33kezfQzEju21W7tkZ
         r4aQ==
X-Gm-Message-State: AOAM530L/fl1KRrwEALSss6GcxeE2yKEdy2JjGZZPjnqLX/UwrjGMuch
        qXc5dQ/HEQo51qQ8x5UhBL6fgA==
X-Google-Smtp-Source: ABdhPJy3+m/OgwLuTvKCUes1YQGjkq06sRokD0MvaXBPUIOtxk4VJvcEiUYehspd34ToAcvRq9X8ZA==
X-Received: by 2002:a5d:5255:: with SMTP id k21mr5926487wrc.421.1632911542769;
        Wed, 29 Sep 2021 03:32:22 -0700 (PDT)
Received: from [192.168.0.46] ([82.142.20.44])
        by smtp.googlemail.com with ESMTPSA id k17sm1857232wrq.7.2021.09.29.03.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 03:32:22 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] cpuidle: tegra: Enable compile testing
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210912202907.28471-1-digetx@gmail.com>
 <20210912202907.28471-6-digetx@gmail.com>
 <8610c371-b670-8336-07b9-3ea673d3c5bc@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d86a8449-71ce-eb03-f93d-39dec10c034d@linaro.org>
Date:   Wed, 29 Sep 2021 12:32:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8610c371-b670-8336-07b9-3ea673d3c5bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27/09/2021 18:33, Dmitry Osipenko wrote:
> 12.09.2021 23:29, Dmitry Osipenko пишет:
>> Enable compile testing of tegra-cpuidle driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/cpuidle/Kconfig.arm | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
>> index 334f83e56120..599286fc0b08 100644
>> --- a/drivers/cpuidle/Kconfig.arm
>> +++ b/drivers/cpuidle/Kconfig.arm
>> @@ -99,7 +99,7 @@ config ARM_MVEBU_V7_CPUIDLE
>>  
>>  config ARM_TEGRA_CPUIDLE
>>  	bool "CPU Idle Driver for NVIDIA Tegra SoCs"
>> -	depends on ARCH_TEGRA && !ARM64
>> +	depends on (ARCH_TEGRA || COMPILE_TEST) && !ARM64 && MMU
>>  	select ARCH_NEEDS_CPU_IDLE_COUPLED if SMP
>>  	select ARM_CPU_SUSPEND
>>  	help
>>
> 
> Daniel / Rafael, could you please ack this patch to allow Thierry to
> take this whole series via the Tegra tree?
> 

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
