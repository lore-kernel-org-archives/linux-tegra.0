Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D2FC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 13:46:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C76B3610CB
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 13:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbhJUNs0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 09:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbhJUNsZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 09:48:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B88EC0613B9;
        Thu, 21 Oct 2021 06:46:09 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x192so265662lff.12;
        Thu, 21 Oct 2021 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OcLEmon3huoFtTqikuWLweLy0kSSEWL4ItX6Q2ztG2w=;
        b=P6Kq9Cy59Zy2Q9Duq/DvpzoruhIyljNMHwkqHq63cxTsK7770RsHhIPqtuzZn3UR2F
         fOYbf3iDsR+wZNtTZCocFqUvJ7lEL4VjxO3uTJ/uABJEyBP8RUD4e0l9eDO/V5+EEXCx
         HOcoH1+tJeUB9SOT3EDsszff2iGBUDHhAAo4f+0Ac6qKC/tsrxENeTitfpqILvzLGoHT
         KpNj+RlLgyPTduGkGWYPUOX4Cw5jA5cVNJvrAwc4UUQkF/2iRar/jDDtkqIoBaCa5THG
         r+tky73BizYOps/UNms/QzEy5gfnsUjmyfDwLFG5Q739HKt/1ZrbGFzG1AXfHtH1YmVy
         erRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OcLEmon3huoFtTqikuWLweLy0kSSEWL4ItX6Q2ztG2w=;
        b=mxfvG0hDGePU3/wQedpOD8UPOg/RuyFg9fuWFOp56v5Qf3awPRTd5Om+c36YPSmCi9
         e14/hOgNwEma6jjWoNgaIz0rE6iX1OqXIi2BrNtoiDcU6k+AvplTCddZVd1GtgMWqTzs
         4fkfj9nrD+q1inxhq1jjiuWaSt+dwFDSE9M1+SAj6VmeAmJLLIB5oW2V4Gza4/py7BhU
         1elYK1+6PlqBMAVDu8tT72zdq1xkzD/69AINop9SkRsrI2TrWycuQwgRZ3fyZrwxy2OO
         nEMMkktnA73BEyVu5h0ZX9ph4ysbIu+/mY/3VGnDcFxGFkN6VvPgCrwraV7ti0bI8W+B
         iBMQ==
X-Gm-Message-State: AOAM532yrvAmwkiEJGkHE2Bz9X/uf913TJWIjeXgBaR2PmHMA8Jq+5Pc
        lVw64THPJFdQBBWBOnGcpbvRGZuFYQc=
X-Google-Smtp-Source: ABdhPJwqeSfuBgiXSoeEQb1DIbUQ7ozBqcLVFTYr96PsfgtQpPnWe5RmEY+6J8cKhMrgYkeWybODTA==
X-Received: by 2002:a05:6512:ace:: with SMTP id n14mr5397280lfu.460.1634823967482;
        Thu, 21 Oct 2021 06:46:07 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.googlemail.com with ESMTPSA id x24sm546293ljd.89.2021.10.21.06.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 06:46:07 -0700 (PDT)
Subject: Re: [PATCH v1] regulator: Don't error out fixed regulator in
 regulator_sync_voltage()
To:     Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211021110707.20416-1-digetx@gmail.com>
 <YXFnIPXwPuNWM4XG@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7ee0ccd7-8ac5-8a9e-7f55-31fac944a5d2@gmail.com>
Date:   Thu, 21 Oct 2021 16:46:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXFnIPXwPuNWM4XG@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.10.2021 16:12, Mark Brown пишет:
> On Thu, Oct 21, 2021 at 02:07:07PM +0300, Dmitry Osipenko wrote:
> 
>> Fixed regulator can't change voltage and regulator_sync_voltage() returns
>> -EINVAL in this case. Make regulator_sync_voltage() to succeed for a fixed
>> regulator.
> 
>> +++ b/drivers/regulator/core.c
>> @@ -4249,6 +4249,9 @@ int regulator_sync_voltage(struct regulator *regulator)
>>  	struct regulator_voltage *voltage = &regulator->voltage[PM_SUSPEND_ON];
>>  	int ret, min_uV, max_uV;
>>  
>> +	if (rdev->desc->fixed_uV && rdev->desc->n_voltages == 1)
>> +		return 0;
>> +
>>  	regulator_lock(rdev);
> 
> It's unclear why this is checking both fixed_uV and n_voltages.

It's unclear to me either. I borrowed this variant from the  preexisting
code [1][2].

[1]
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/regulator/core.c#L3075

[2]
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/regulator/core.c#L4319

>  TBH
> this feels like a higher level issue - with normal voltage configuration
> we would have noticed that our constraints prevent the voltage changing
> and not go as far as trying to actually apply a new configuration.  I
> would expect a similar thing to be happening here.
> 

This works for a normal regulator_set_voltage() because it checks
whether current voltage equals to the requested and then succeeds [3].
The higher level code relies on this behaviour of the regulator core, in
particular OPP core won't work without it and that's why voltage changes
work for a fixed regulator.

[3]
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/regulator/core.c#L3619

This doesn't work for the regulator_sync_voltage() because it uses a
different code path and the whole point is to re-apply the current
voltage. Hence the extra check is actually needed for the fixed
regulators in order to be consistent with the behaviour of
regulator_set_voltage().
