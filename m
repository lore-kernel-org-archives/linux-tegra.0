Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5AAC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Oct 2022 10:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiJUKls (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Oct 2022 06:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiJUKlk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Oct 2022 06:41:40 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F271D25E89F
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 03:41:38 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r14so4194700edc.7
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Wds6EmEDWnjWadbCZz/IqJvjUs/Znvf6K3VMrNRmD0=;
        b=GFa7MdOY6kvLGA+kA27qjY1/mEKJlMuM/YNP6qKH8fuTYDqQLjmS255d51snsENyHv
         10Si92guwi7NpdnzzFgSHZyyoKyUgnI8kMsZZrld+V5XqGb3bxLHMmYbV4Zhq4RMT59y
         /xlfrq8vonlRE+C/zzxdluQgWdVrYd8YkmZR4vSlamnEnxZ8lGThpXr3Ov3Cx62pFXKv
         St4F50O6qthbbSxpeYn1aqNlRbs6PsKcvgT5SV6Vkf4gO4yB0Rf9fUf0hgIror/w37TQ
         HMF1HkxS7BbRsUUvV9cqc5tH6g/+fPpBu3UkXsXZsKdZk4tB1gYrP4K2xIyqCyHvZrL4
         0BUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Wds6EmEDWnjWadbCZz/IqJvjUs/Znvf6K3VMrNRmD0=;
        b=5MI6HSaCP7Rv6gl8vRv2BlhnCwvCuQiYrXEuLLNpVFnEB3pNw2iF7X9zcQSYoO+YLc
         DEtjCcBXVe69iciGjTeCDT23wGvXDca43Li1218YC0NhCUFFVsRWsXrYZnYHphim+x2P
         IBiyqkrIgEMqCFZIR5+nut4jUkwbaCxhGCgj1nsnbaf7tEJuhbqVkSLQeCMUQgY++M/X
         G0oxtLLjjvFyVBUF99Rl+AhW5BKZbe5huGUTb4qBlTjJ7bPV/ChX4IR8M+M7FspNno9i
         eUgUEMTwWTA/wKSOyBDH8qPKrVH3FQXQodF/nIUMS0LeRNlgWCqW/k62IGiQuJO+rjRX
         nXbg==
X-Gm-Message-State: ACrzQf3aCT3nRTXfQ3IEQFzJRz3gMnvHacyTAnupbNbXGuUjC/tNv6OM
        f9Ws5MMZeXZgjSLZkJkWn4WLOw==
X-Google-Smtp-Source: AMsMyM55oxaMdBexQcxK0v/CJ5c7lABgb0QzdYpynu+J+J3jtLkfCI5N60P1sNhac9N1+CT393qGnw==
X-Received: by 2002:a17:907:a429:b0:78d:b517:735 with SMTP id sg41-20020a170907a42900b0078db5170735mr15052211ejc.318.1666348897396;
        Fri, 21 Oct 2022 03:41:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:25b:e73e:85eb:ae6e? ([2a05:6e02:1041:c10:25b:e73e:85eb:ae6e])
        by smtp.googlemail.com with ESMTPSA id h9-20020a05640250c900b004591e6f7f47sm13736594edb.42.2022.10.21.03.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 03:41:36 -0700 (PDT)
Message-ID: <cbc7685a-2ab4-2c3f-2936-dc7b63dcfb87@linaro.org>
Date:   Fri, 21 Oct 2022 12:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] thermal/drivers/tegra: Fix crash when getting critical
 temp
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221010150311.40384-1-jonathanh@nvidia.com>
 <afe68b2d-72a4-3fa2-af63-4f71fa36f846@nvidia.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <afe68b2d-72a4-3fa2-af63-4f71fa36f846@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/10/2022 11:49, Jon Hunter wrote:
> Hi Rafael,
> 
> On 10/10/2022 16:03, Jon Hunter wrote:
>> Commit 13bea86623be ("thermal/of: Remove of_thermal_get_crit_temp()")
>> removed the function of_thermal_get_crit_temp() and this is causing a
>> NULL pointer deference crash when attempting to call the 'get_crit_temp'
>> function pointer because this function pointer is no longer initialised.
>> Fix this by replacing the call to the 'get_crit_temp' function pointer
>> with a call to the function thermal_zone_get_crit_temp() instead.
>>
>> Fixes: 13bea86623be ("thermal/of: Remove of_thermal_get_crit_temp()")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/thermal/tegra/soctherm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/tegra/soctherm.c 
>> b/drivers/thermal/tegra/soctherm.c
>> index d2e454902689..4203e74e2f79 100644
>> --- a/drivers/thermal/tegra/soctherm.c
>> +++ b/drivers/thermal/tegra/soctherm.c
>> @@ -742,7 +742,7 @@ static int tegra_soctherm_set_hwtrips(struct 
>> device *dev,
>>       /* Get thermtrips. If missing, try to get critical trips. */
>>       temperature = tsensor_group_thermtrip_get(ts, sg->id);
>>       if (min_low_temp == temperature)
>> -        if (tz->ops->get_crit_temp(tz, &temperature))
>> +        if (thermal_zone_get_crit_temp(tz, &temperature))
>>               temperature = max_high_temp;
>>       ret = thermtrip_program(dev, sg, temperature);
> 

I'll take it


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
