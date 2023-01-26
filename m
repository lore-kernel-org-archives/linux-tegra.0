Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35193C05027
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Jan 2023 15:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjAZPho (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 Jan 2023 10:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjAZPhn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Jan 2023 10:37:43 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1931A1555D
        for <linux-tegra@vger.kernel.org>; Thu, 26 Jan 2023 07:37:41 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d14so2162581wrr.9
        for <linux-tegra@vger.kernel.org>; Thu, 26 Jan 2023 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIu+mxWdNJUsrvi9xRNkt+BBymodGN7DZvnTku8FBhM=;
        b=yD5BTlXOpJ6Hzs9Dck91DU4pOh8K0FDaUZ0KEcFsMKwptBaB1nnp881ttyXkeb0DqG
         dXw8jxGQ14PHAlHOmO1OldRwCuQJgd8vuiGXA0Bcbk+iCHc+nUaLjvijC0TmTfFiUx89
         V5RC7wgpQnLljOUkaRrwN3WqPrvyZ5gYL9vH0ucG0FeGAg8wB6I00pEntBuefheucGRG
         1KpVbsGiuDt5nyJmy/Vh2zXsMOxX5FNNaOF+Xb5UAEoCkB0LzIJ8SboWftAB7QWyZ3ub
         kQVzOFd582ywmdOwyH/ynIi5atSvc3bZP0MonE+fhVekLPFPWDk/jQ6xK6zmVgxRCMKz
         vrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIu+mxWdNJUsrvi9xRNkt+BBymodGN7DZvnTku8FBhM=;
        b=wJ6qi1twoEELrgr02Uqr0MJ/MczNly1JqKCrS3rdm6vZGFH1dBs9yrqS7S7yha+Wzd
         +5ubHjWcGL8kiAC5Fdg4scJsj26drfwT0nYx08V8+hWdNT5wZTRDfiJRZB9tBlMJq7cI
         T+78hrlwfKZNQsLQbU4t6w8Gfn0Hv4nnulAUhqxOmwofPPsnkE1z+wN893yrHyQ4k+g9
         b+4BUeb1poBU02unDqHEqQL7HBLOLScucw9TeyU/TY0KiI4CSilRWmtJDCCn1NTqocD7
         ULeiHbfpwGHFo5ZuQ0jwslpXUoXmKrWtYb8AP0nU4wBQEQzXEUyxtrSwA/1VsMVqWtQI
         kysw==
X-Gm-Message-State: AFqh2kos8MuRyYxHUqCRndcERigG8rdehSAxa/NA3yiaSp92/h3EDxih
        pirwADZpl5+sQD5jOo96gEQzgQ==
X-Google-Smtp-Source: AMrXdXtaC7G8MzUnGzoywTq1B88ssXXh0aT8RJOiRHsHPA1jxPZmEt45aPHQpEHi0LPaBuEulQRAPw==
X-Received: by 2002:a5d:61c5:0:b0:2bf:9608:57ee with SMTP id q5-20020a5d61c5000000b002bf960857eemr21204904wrv.21.1674747459452;
        Thu, 26 Jan 2023 07:37:39 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id j5-20020adff005000000b002bddd75a83fsm1649521wro.8.2023.01.26.07.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:37:39 -0800 (PST)
Message-ID: <810bf9e9-1428-be68-3bcf-93c332987959@linaro.org>
Date:   Thu, 26 Jan 2023 16:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: thermal/drivers/tegra: Getting rid of the get_thermal_instance()
 usage
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wei Ni <wni@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linux PM mailing list <linux-pm@vger.kernel.org>
References: <fa2bd92a-f2ae-a671-b537-87c0f3c03dbd@linaro.org>
 <Y9J4WAFyXyV/nqlG@orome>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Y9J4WAFyXyV/nqlG@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/01/2023 13:55, Thierry Reding wrote:
> On Tue, Jan 24, 2023 at 08:57:23PM +0100, Daniel Lezcano wrote:
>>
>> Hi,
>>
>> does anyone know what is the purpose of the get_thermal_instance() usage in
>> this code:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/drivers/thermal/tegra/soctherm.c?h=thermal/linux-next#n623
>>
>> The driver is using a function which is reserved for the thermal core. It
>> should not.
>>
>> Is the following change ok ?
>>
>> diff --git a/drivers/thermal/tegra/soctherm.c
>> b/drivers/thermal/tegra/soctherm.c
>> index 220873298d77..5f552402d987 100644
>> --- a/drivers/thermal/tegra/soctherm.c
>> +++ b/drivers/thermal/tegra/soctherm.c
>> @@ -620,9 +620,8 @@ static int tegra_thermctl_set_trip_temp(struct
>> thermal_zone_device *tz, int trip
>>   				continue;
>>
>>   			cdev = ts->throt_cfgs[i].cdev;
>> -			if (get_thermal_instance(tz, cdev, trip_id))
>> -				stc = find_throttle_cfg_by_name(ts, cdev->type);
>> -			else
>> +			stc = find_throttle_cfg_by_name(ts, cdev->type);
>> +			if (!stc)
>>   				continue;
>>
>>   			return throttrip_program(dev, sg, stc, temp);
>> @@ -768,9 +767,9 @@ static int tegra_soctherm_set_hwtrips(struct device
>> *dev,
>>   			continue;
>>
>>   		cdev = ts->throt_cfgs[i].cdev;
>> -		if (get_thermal_instance(tz, cdev, trip))
>> -			stc = find_throttle_cfg_by_name(ts, cdev->type);
>> -		else
>> +
>> +		stc = find_throttle_cfg_by_name(ts, cdev->type);
>> +		if (!stc)
>>   			continue;
>>
>>   		ret = throttrip_program(dev, sg, stc, temperature);
> 
> There's a small difference in behavior after applying this patch. Prior
> to this I get (on Tegra210):
> 
> 	[   12.354091] tegra_soctherm 700e2000.thermal-sensor: missing thermtrips, will use critical trips as shut down temp
> 	[   12.379009] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when cpu reaches 102500 mC
> 	[   12.388882] tegra_soctherm 700e2000.thermal-sensor: programming throttle for cpu to 102500
> 	[   12.401007] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when cpu reaches 102500 mC
> 	[   12.471041] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when gpu reaches 103000 mC
> 	[   12.482852] tegra_soctherm 700e2000.thermal-sensor: programming throttle for gpu to 103000
> 	[   12.482860] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when gpu reaches 103000 mC
> 	[   12.485357] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when pll reaches 103000 mC
> 	[   12.501774] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when mem reaches 103000 mC
> 
> and after these changes, it turns into:
> 
> 	[   12.447113] tegra_soctherm 700e2000.thermal-sensor: missing thermtrips, will use critical trips as shut down temp
> 	[   12.472300] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when cpu reaches 102500 mC
> 	[   12.481789] tegra_soctherm 700e2000.thermal-sensor: programming throttle for cpu to 102500
> 	[   12.495447] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when cpu reaches 102500 mC
> 	[   12.496514] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when gpu reaches 103000 mC
> 	[   12.510353] tegra_soctherm 700e2000.thermal-sensor: programming throttle for gpu to 103000
> 	[   12.526856] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when gpu reaches 103000 mC
> 	[   12.528774] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when pll reaches 103000 mC
> 	[   12.569352] tegra_soctherm 700e2000.thermal-sensor: programming throttle for pll to 103000
> 	[   12.577635] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when pll reaches 103000 mC
> 	[   12.590952] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when mem reaches 103000 mC
> 	[   12.600783] tegra_soctherm 700e2000.thermal-sensor: programming throttle for mem to 103000
> 	[   12.609204] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when mem reaches 103000 mC
> 
> The "programming throttle ..." messages are something I've added locally
> to trace what gets called. So it looks like for "pll" and "mem" thermal
> zones, we now program trip points whereas we previously didn't.

Hmm, yeah. I did go into the details of the driver but if there is no 
cooling device associated with a trip point it will result in a noop 
from the thermal framework POV. The check is done in the governors by 
going through the thermal zone device list and cdev.


> I'll take a closer look to see if we can replace the calls to
> get_thermal_instance() by something else.

That is great, thanks !



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

