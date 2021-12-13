Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CCBC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbhLMQow (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhLMQow (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:44:52 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91671C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:44:51 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b1so31902362lfs.13
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aL1Bkwkm4K7uXp1mzh9+uIwwElltoFnomk07fJEg1KI=;
        b=MMi3qpzG35ObhP8n3pNiHVHNNZTfyM1C1I0iXDkT46IK5kOD0xh95Q6gRd/CEnOX4V
         RfQPCxcpDapaO1vTDeI3bgeK5qUGuz4zGFtokSCVlLab8A+QMN6Ype/8PNtXgbyXIke/
         hNo+l+OM0lwMywQT7287txlNm/3YOsIvptHIgB2zdnr46pt8aEjP1Ko2EHsmqUY2g/kF
         cCsM59Q4feDnIBcakdDXBwJTHOfK0DtyLn5Vj+pqeX9oMMpAJe0ffGPO+A+XfBzc5+2H
         u+Y4kTe3m7zhscMgTSZo9vI9mgeNipeVgBNgKT653ALqmgD4ALkKK0lX2wQi9LF1Gd22
         UWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aL1Bkwkm4K7uXp1mzh9+uIwwElltoFnomk07fJEg1KI=;
        b=6WOjc1IPDlRRDjGBL6Zv/Ilzbas/dj1hrbEMDRJBYpjRxp8I8t/zJUk6caOznW7eNR
         qYgTHMUUGySKvEBPA8T5p0w9Vi5uZrQRwCA3m3RjtWqfYBg75d2oiJ+ex5cRXhIJ8VTh
         zlUR0xFhl5e8r0gbvh5fFBBJSd/gQ8v4syRWFFKPvLByOMatc+Q4/0cQEJXjBQinvp5y
         no+nyHWFiK32Y/hbV1DxPlF33a2sLW5zi33Bjfs+brm88U0/udSYPO1DGdkIl03SUPNg
         SbS3rQerDrW78mb19TjCCURYbjzRpd1iSbTvO4/MmkH71bnCTlK9w9cXPj6R6l7jPEte
         XxYg==
X-Gm-Message-State: AOAM5316tzE71Fg3vovQnIGQLG14Rhu4Ywcvk/zllD1lI7n7oWWMbyQH
        dOHHVsNLMYm/0zORzF/Zfw3RoGCaZM0=
X-Google-Smtp-Source: ABdhPJyZMhb96R83TKxUkqgCSiMH0cXDA9tQzDT5xtS9XpqJQPXyuezoN7IKc9N/Z0bcivcEDu1nYQ==
X-Received: by 2002:a05:6512:e9a:: with SMTP id bi26mr28502729lfb.480.1639413889741;
        Mon, 13 Dec 2021 08:44:49 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id w10sm1488552lfn.308.2021.12.13.08.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:44:49 -0800 (PST)
Subject: Re: [PATCH 06/25] ARM: tegra: Fix compatible string for Tegra30+
 timer
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-7-thierry.reding@gmail.com>
 <d7989902-a42e-1fed-d85b-ade3e160400a@gmail.com> <YbNZR9WqBiWbYn2d@orome>
 <8988f759-689f-7c46-ba1e-3eab1a91de7c@gmail.com> <Ybdu9RjWZxL325xz@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0be69e6b-bec4-faf9-ce1a-ce513a217622@gmail.com>
Date:   Mon, 13 Dec 2021 19:44:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybdu9RjWZxL325xz@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2021 19:04, Thierry Reding пишет:
> On Fri, Dec 10, 2021 at 06:23:34PM +0300, Dmitry Osipenko wrote:
>> 10.12.2021 16:42, Thierry Reding пишет:
>>> On Thu, Dec 09, 2021 at 10:36:43PM +0300, Dmitry Osipenko wrote:
>>>> 09.12.2021 20:33, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> The TKE (time-keeping engine) found on Tegra30 and later is not
>>>>> backwards compatible with the version found on Tegra20, so update the
>>>>> compatible string list accordingly.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/tegra114.dtsi | 2 +-
>>>>>  arch/arm/boot/dts/tegra124.dtsi | 2 +-
>>>>>  arch/arm/boot/dts/tegra30.dtsi  | 2 +-
>>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>> ...
>>>>>  	timer@60005000 {
>>>>> -		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
>>>>> +		compatible = "nvidia,tegra30-timer";
>>>>>  		reg = <0x60005000 0x400>;
>>>>>  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>>>>>  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>>>>>
>>>>
>>>> What exactly is incompatible? IIRC, T30+ is a superset of T20. This
>>>> patch should be wrong, also see [1].
>>>
>>> As the comment in that location explains, Tegra114 and later have an
>>> architectural timer that is preferred over the legacy timer. So while
>>> this doesn't technically make Tegra114 incompatible (in terms of
>>> register programming, etc.) with Tegra20, in practice we don't want
>>> Tegra20 behaviour on Tegra114 and later.
>>
>> So the T114 timer code works using the T20 code and we prefer to use the
>> ARCH timer on T114+ in the driver, what is the problem then? Where is
>> the incompatibility?
> 
> It's the priority that's set differently for Tegra20 and Tegra30. On
> Tegra114 and later, the Tegra timer has lower priority so that the
> architected timer takes precedence. It's not exactly an
> incompatibilitity, but there's no good way to describe it otherwise.


Priority is a property of the Linux kernel driver, it's not a hardware
property. This whole patch is incorrect and should be dropped, IMO.
