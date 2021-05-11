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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7854C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 18:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8514C61288
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 18:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhEKScD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 14:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhEKScC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 14:32:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09311C061574;
        Tue, 11 May 2021 11:30:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j10so29993080lfb.12;
        Tue, 11 May 2021 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8nyPFf4bTke6Djb3YQrmv3g7ZxykFdgAlOgsI6pSkpA=;
        b=eNiNRJkEYisXS1Z88nrZDaGjRYPxBH5ElMvu4qFs2vovT54qlY8a/WQyUPg5HiJMic
         Pf8pMohSSeFjGK6y9xSX/0o9XVKKdAeTG0dY1QyvERMpdcJki82rpU/5zlWmD7m6Rl8f
         fWkr44oxYE+yT0BFGgCWJ37AB/zq9r5EF48A6pp6RMyFAlGHygBiRfO/pFdgHE9reqgo
         7OMInPDzEAF29/A2voMCGxZXLRt/EZ7XI+VAxw63L9O5pSgijCaRX6BCAeM1RK20ns3U
         eC9w74+mDRcQcdqmKrJ+Xnvo2OtO55qGgSQwbMurK4PCbHepphA1d647oNmuCVhmm68I
         mmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8nyPFf4bTke6Djb3YQrmv3g7ZxykFdgAlOgsI6pSkpA=;
        b=cgiT1pb2/rC67gnizNddkAsbXqCpDr/LGEfjn7IVtIRCcIQXaAu35W+PhqSb5k862x
         zvwlyDk9v1KnccCMEAQZViZN5iv0BkX2VzSZZoypZJcawTdSGQd5hKUv6D7LXcKewYey
         PMJIa+hqp1qivHUqZMEYP9O7HudGAD6sJwQUaWuMK95o5+2iL/oAK7vx35izoPVms+s/
         lssq5XFipx/qG4ULP4yuoeDF5HKh4IKFzCpAVFghjVhNDteGWjRS6JSs70U3MO1Uo5Hy
         S5orY/9NXIfdLxiXv9tCZnJC3Kxdx0lfTlpyb/0fJFicOavM9ow43fxpF7lA5qHuYNXa
         vEAw==
X-Gm-Message-State: AOAM531UqyYwTiQab5B8BPi5RmpwzSimXYsMKFSK3cUZ/JQ6AOw+PPA1
        DbSuMJAPWF9nrQYIQrVqPb221l+1GQY=
X-Google-Smtp-Source: ABdhPJzNEn3o2gA8xDuzq589Gs7xfVm/8AFocK3OZHPXXF0ynTL3mcamoxykvUtd8rYhGpNzlAZelQ==
X-Received: by 2002:a05:6512:10d6:: with SMTP id k22mr20947645lfg.389.1620757854377;
        Tue, 11 May 2021 11:30:54 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id p8sm1932928lfe.224.2021.05.11.11.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 11:30:53 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all
 drivers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210510213729.7095-1-digetx@gmail.com>
 <20210510213729.7095-3-digetx@gmail.com>
 <54acffad-97c0-56cd-46ba-5ceba454ec09@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <50cd4ab0-95e2-4cf6-9092-53e1395af435@gmail.com>
Date:   Tue, 11 May 2021 21:30:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <54acffad-97c0-56cd-46ba-5ceba454ec09@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.05.2021 19:41, Krzysztof Kozlowski пишет:
> On 10/05/2021 17:37, Dmitry Osipenko wrote:
>> Enable compile testing for all Tegra memory drivers.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/tegra/Kconfig | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>> index a70967a56e52..a910f661105f 100644
>> --- a/drivers/memory/tegra/Kconfig
>> +++ b/drivers/memory/tegra/Kconfig
>> @@ -2,7 +2,7 @@
>>  config TEGRA_MC
>>  	bool "NVIDIA Tegra Memory Controller support"
>>  	default y
>> -	depends on ARCH_TEGRA
>> +	depends on (ARCH_TEGRA || COMPILE_TEST)
> 
> No need for ().

Okay

>>  	select INTERCONNECT
>>  	help
>>  	  This driver supports the Memory Controller (MC) hardware found on
>> @@ -11,7 +11,7 @@ config TEGRA_MC
>>  config TEGRA20_EMC
>>  	tristate "NVIDIA Tegra20 External Memory Controller driver"
>>  	default y
>> -	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
>> +	depends on TEGRA_MC && (ARCH_TEGRA_2x_SOC || COMPILE_TEST)
> 
> There is a lot of "depends on TEGRA_MC". How about making it a "if
> TEGRA_MC" block?

The explicit dependencies are also good to me. Either variant is fine to
me. I can implement yours suggestion in v2 if Thierry doesn't have
objections.
