Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED0EC48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 07:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A272613AE
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 07:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhFKHYl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 03:24:41 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:40478 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhFKHYk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 03:24:40 -0400
Received: by mail-lj1-f182.google.com with SMTP id x14so8321837ljp.7;
        Fri, 11 Jun 2021 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=11DN3KsSo4/80RPJTDsiyxtNdND4c0Ujrb4zwDX8jnY=;
        b=D1To7pa+GKDxor4wJaJL3aAg6YvrNvkyLPjX8wmEXC9ovHFYc0VOzSfMeSpJww8PqQ
         sXzi30BPekZdL23kLoeS+Oj0/FPXqxO6KRQi5LvILc08bh7kszn0Q9YJ+He3A2ozTLhR
         OIqLMF3LDqW26w1P4AHZF3jgw3jFbd/UIkj/9nODa1S1O5dvKF/Iudt34iONYIzOGTfn
         5DGia1rHtnp2pB755a33YW38XArSJIJ3vLH5zuoVhIQo6ZuCDlBT+dd5LiroUW+2Ha0k
         ejNrrj5k95DWsHAavYrVXlY+6YCZFu+S75gRBZaqg9hXrSesQc5mZQ7ju/g1PKuHuTBb
         IxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=11DN3KsSo4/80RPJTDsiyxtNdND4c0Ujrb4zwDX8jnY=;
        b=lk+4T8PVihBsFnWpsQjJb8KNT6p/vwo46QY8+7xYvJN1kvwBF11lpx+YOTGHRyjOpu
         9vziRA5cnXqS1zPqDjQBbEqMewA+ZYZycLosB0xKCTXoRxXO5MAX7QN9WdFIIJZspab1
         OWPeQ1g1ahpYSeoCkQCvACXSHKaRFK12QNqXKex5+0td18G2ZJenSkSe3FBwpvrLAQX1
         KRUrBdSi6V7zr0PZu9t2uYS8W5Ss/5Qi4OBpgXBf7KE2TYRzDHj0AopOmDMzg0yBkXYA
         n5thLpKcMNcFvKpu5iCl+l6RTrfx+SqJSHyTBYhWIF5UfOcCQxIKZjersNRRLcnpLXW5
         0rLA==
X-Gm-Message-State: AOAM533YVYykElA4rGZo2OUyn9QdzU6C7mxwGyr/0frOAJffkiwHaJak
        9hxc/mgk71P8ATcw+JlA930=
X-Google-Smtp-Source: ABdhPJwYzfZlCV/RoIxcurSHFnchRiDyBAbSa6uhmz7mqDAUgOx/s5ZEhBGtlXTmNWVNk/rK0sOHCQ==
X-Received: by 2002:a2e:390b:: with SMTP id g11mr1850313lja.505.1623396102320;
        Fri, 11 Jun 2021 00:21:42 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id u15sm509188lfs.129.2021.06.11.00.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 00:21:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
 <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
 <ee2846c0-9274-0888-90ac-dac72d2ab5fd@canonical.com>
 <a3110fbd-c4af-0317-5a6d-1f780f1dac91@gmail.com>
 <1400979c-c7a7-9618-1168-70185ed10546@canonical.com>
 <8d8d019a-34c1-50bd-5eba-ce361c263d35@gmail.com>
 <57f8e55d-d708-f304-cf35-3036ec2e64f5@gmail.com>
 <99f98088-fed4-45bf-b0a1-241bfc896487@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f5112945-1b07-8760-4180-4d7152b7dcba@gmail.com>
Date:   Fri, 11 Jun 2021 10:21:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <99f98088-fed4-45bf-b0a1-241bfc896487@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.06.2021 09:50, Krzysztof Kozlowski пишет:
> On 10/06/2021 18:23, Dmitry Osipenko wrote:
>> 10.06.2021 18:50, Dmitry Osipenko пишет:
>>> 10.06.2021 09:43, Krzysztof Kozlowski пишет:
>>>> The stubs might be good idea anyway, but the driver explicitly needs for
>>>> runtime working reservedmem, so it should select it.
>>>
>>> The OF and reservedmem are both selected by the ARCH for the runtime
>>> use. They may not be selected in the case of compile-testing.
>>>
>>> Both OF core and reservedmem provide stubs needed for compile-testing,
>>> it's only the RESERVEDMEM_OF_DECLARE() that is missing the stub. Adding
>>> the missing stub should be a more appropriate solution than adding extra
>>> Kconfig dependencies, IMO.
> 
> Ah, in such case everything looks good. Stubs is indeed proper choice.

Although, I see that there are only two Kconfigs that have
OF_RESERVED_MEM, one defines the OF_RESERVED_MEM, the other is QCOM
Kconfig which depends on OF_RESERVED_MEM. The OF_RESERVED_MEM is enabled
by default in defconfig.

You're right, we need the Kconfig change to be entirely correct, since
driver won't work properly without OF_RESERVED_MEM.

config TEGRA210_EMC
	tristate "NVIDIA Tegra210 External Memory Controller driver"
-	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
+	depends on (ARCH_TEGRA_210_SOC && OF_RESERVED_MEM) || COMPILE_TEST

I will send that change later today.
