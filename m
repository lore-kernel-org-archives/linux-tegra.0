Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF59C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbhLJP1M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhLJP1M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:27:12 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259CFC061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:23:37 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id u3so18756206lfl.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rPLKB8l2EZFcu1fA8n9M6ZJRW9nmDCaBTYVyMtUbqS8=;
        b=Rz+XODTdr3bK64zBCXs8xJ4KYrQW0d10+3R2zHd9EzOPHKXsKM4xKhDWQ54nABCVJk
         Yv7w8kfcrncFmQvPlFtvz/UXDBUCbP3Uc7yzq7PsKjZWNSh9YLIRqhkCUXa00hxZ4JfB
         b5IIX0LGOjEJ0xZ+06ZQZm//Dgvcj+bEFRNyY8Z6xPImTIXJW1RtWzNB2+DlcYRk+sj+
         UZbbZVWLUbc19jV429qbeYxcEP7rJpSwze5Btx/glP0F09SRyf6AbthfisSTrJNCHIX2
         oVhxO3ls2xDtlnzLnT5ZhnJV+PGH3skfmL6MBgTBhu/2ICxiz+PRK3haq/7TjOx2Jk5b
         R/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rPLKB8l2EZFcu1fA8n9M6ZJRW9nmDCaBTYVyMtUbqS8=;
        b=5evk/oU8Aaq69632pTIav2WN3nriAfaBFeQ7wFey834EWvmlDIakzuYNR9dObJBHtT
         boq/KLlzoy4cmVL0V1bIIwlc3FpZNZKGiHW0PFjKokA0XGhy2wrBZ4RFkbfZfkp9EOBW
         DkyLzH2OJMppTi/Er/yVh+SXSFM4OqLMT+Zyzr2YWJmRW1L9EuvmhfFe/E0RGWAXMgVI
         C+47Ziwu3Z4WqQnG/IwPOyW403xjnDD7aB1cgXbshE2kNbUtfoBSXQeO16o+CkJLtOOt
         ZVWyInwUApPfqc20NNkvG0BctlPqx7Ysk35TdoGu+Pbl3AW6ryRi3kc5PGMwgawlQB3q
         0+Wg==
X-Gm-Message-State: AOAM532pGvB/EQv826rio+cfihn9veO0oGx6qYnVJ1FrRz/u/Ph7H1WR
        j1dMLB1/7Q0GZEF6awEmwlAcm3I3n7s=
X-Google-Smtp-Source: ABdhPJwtdKpYJRVUqd+4pzspp+PQqA4tSuMv7/NQZIhP+PygsACsHqCi5pOgL2KHkDmL4sWmmKWKHA==
X-Received: by 2002:a05:6512:519:: with SMTP id o25mr12542694lfb.422.1639149815180;
        Fri, 10 Dec 2021 07:23:35 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id k23sm341449ljg.139.2021.12.10.07.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 07:23:34 -0800 (PST)
Subject: Re: [PATCH 06/25] ARM: tegra: Fix compatible string for Tegra30+
 timer
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-7-thierry.reding@gmail.com>
 <d7989902-a42e-1fed-d85b-ade3e160400a@gmail.com> <YbNZR9WqBiWbYn2d@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8988f759-689f-7c46-ba1e-3eab1a91de7c@gmail.com>
Date:   Fri, 10 Dec 2021 18:23:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNZR9WqBiWbYn2d@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 16:42, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 10:36:43PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The TKE (time-keeping engine) found on Tegra30 and later is not
>>> backwards compatible with the version found on Tegra20, so update the
>>> compatible string list accordingly.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra114.dtsi | 2 +-
>>>  arch/arm/boot/dts/tegra124.dtsi | 2 +-
>>>  arch/arm/boot/dts/tegra30.dtsi  | 2 +-
>>>  3 files changed, 3 insertions(+), 3 deletions(-)
...
>>>  	timer@60005000 {
>>> -		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
>>> +		compatible = "nvidia,tegra30-timer";
>>>  		reg = <0x60005000 0x400>;
>>>  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>>>  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>>>
>>
>> What exactly is incompatible? IIRC, T30+ is a superset of T20. This
>> patch should be wrong, also see [1].
> 
> As the comment in that location explains, Tegra114 and later have an
> architectural timer that is preferred over the legacy timer. So while
> this doesn't technically make Tegra114 incompatible (in terms of
> register programming, etc.) with Tegra20, in practice we don't want
> Tegra20 behaviour on Tegra114 and later.

So the T114 timer code works using the T20 code and we prefer to use the
ARCH timer on T114+ in the driver, what is the problem then? Where is
the incompatibility?

> For Tegra30, you're indeed correct, there shouldn't be a difference, so
> I can add that back in.

Please either add it back or extend the clocksource driver with the
additional compatibles.
