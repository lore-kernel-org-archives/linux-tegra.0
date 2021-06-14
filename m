Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A7DC2B9F4
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Jun 2021 11:51:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C399C611AB
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Jun 2021 11:51:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhFNLxu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Jun 2021 07:53:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49728 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236318AbhFNLwu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Jun 2021 07:52:50 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lsl78-0002IY-6N
        for linux-tegra@vger.kernel.org; Mon, 14 Jun 2021 11:50:46 +0000
Received: by mail-ed1-f69.google.com with SMTP id y16-20020a0564024410b0290394293f6816so2741730eda.20
        for <linux-tegra@vger.kernel.org>; Mon, 14 Jun 2021 04:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t0dV2CveSWXDPDG10XhzKUv4TjAs1WSjH0kt/ZAYYX8=;
        b=D8nKD3tGNGqn2bGwImuPnNZlhwGDX/OS+z9ke1A+5v/66uqoGdntSKTzXyG29ulCn3
         VVQ8uXK+uljp/5qE/JjqRGLxENYzbUAAv+fR2S7NwvlLWSmvQTo8zritwMLTCnjhByHg
         q0rrgIOQswZ/YzmzjmTO6brVj6T+9OdlOLpA6PX1FW4+b4VRM4YV6UgpiQnLS7kSoIVb
         wdIN6igVASf7XVonVplLyhzaZUEt2qIiWy22yzd3SXBXqzo2TGVQ2fXPr2KRDv2Gx7of
         gwLwGUbumMgivzUkqGoYX0YPG+WPOHWkKf4OBLumhrbLjIgyFJYMobh5tC3m63zCiJ0z
         7lvA==
X-Gm-Message-State: AOAM533ONOafHnZ8y8bzKydcmvGd8CmWcrHoNwtCm0TBwk9f1oKmLfam
        qQWX4iTaAabhvxjjXFzPeBMPjve6GgW6Wadv6i1+DRJlbCGLvjUl/6Tkp0I8d3XJ4uvvQriB9PI
        MoknEN+oqt++pz2yXbCR0WLqHW0KoynuU2yTPfg5V
X-Received: by 2002:a50:ee16:: with SMTP id g22mr16863255eds.27.1623671445934;
        Mon, 14 Jun 2021 04:50:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwnG71K5JQKZBmM8MfgVH2wDhvnYAtRWeQ3dKZqxj1NJAs3jT1m242dzLs8K8inYaWJA/z1Q==
X-Received: by 2002:a50:ee16:: with SMTP id g22mr16863241eds.27.1623671445762;
        Mon, 14 Jun 2021 04:50:45 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id q5sm4567312ejc.117.2021.06.14.04.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 04:50:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
To:     Dmitry Osipenko <digetx@gmail.com>,
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
 <f5112945-1b07-8760-4180-4d7152b7dcba@gmail.com>
 <YMNCPhHx+s4W7BP3@orome.fritz.box>
 <99fb42e9-26f9-cc79-965d-989c65e7882d@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8efc327c-1321-4e04-36de-4b52b2b8fcf7@canonical.com>
Date:   Mon, 14 Jun 2021 13:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <99fb42e9-26f9-cc79-965d-989c65e7882d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/06/2021 15:40, Dmitry Osipenko wrote:
> 11.06.2021 14:00, Thierry Reding пишет:
>> On Fri, Jun 11, 2021 at 10:21:41AM +0300, Dmitry Osipenko wrote:
>>> 11.06.2021 09:50, Krzysztof Kozlowski пишет:
>>>> On 10/06/2021 18:23, Dmitry Osipenko wrote:
>>>>> 10.06.2021 18:50, Dmitry Osipenko пишет:
>>>>>> 10.06.2021 09:43, Krzysztof Kozlowski пишет:
>>>>>>> The stubs might be good idea anyway, but the driver explicitly needs for
>>>>>>> runtime working reservedmem, so it should select it.
>>>>>>
>>>>>> The OF and reservedmem are both selected by the ARCH for the runtime
>>>>>> use. They may not be selected in the case of compile-testing.
>>>>>>
>>>>>> Both OF core and reservedmem provide stubs needed for compile-testing,
>>>>>> it's only the RESERVEDMEM_OF_DECLARE() that is missing the stub. Adding
>>>>>> the missing stub should be a more appropriate solution than adding extra
>>>>>> Kconfig dependencies, IMO.
>>>>
>>>> Ah, in such case everything looks good. Stubs is indeed proper choice.
>>>
>>> Although, I see that there are only two Kconfigs that have
>>> OF_RESERVED_MEM, one defines the OF_RESERVED_MEM, the other is QCOM
>>> Kconfig which depends on OF_RESERVED_MEM. The OF_RESERVED_MEM is enabled
>>> by default in defconfig.
>>>
>>> You're right, we need the Kconfig change to be entirely correct, since
>>> driver won't work properly without OF_RESERVED_MEM.
>>>
>>> config TEGRA210_EMC
>>> 	tristate "NVIDIA Tegra210 External Memory Controller driver"
>>> -	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
>>> +	depends on (ARCH_TEGRA_210_SOC && OF_RESERVED_MEM) || COMPILE_TEST
>>>
>>> I will send that change later today.
>>
>> That's completely unnecessary. OF_RESERVED_MEM is enabled by default if
>> OF_EARLY_FLATTREE is enabled, which it is for ARM64 and that is always
>> enabled for ARCH_TEGRA_210_SOC.
> 
> But it doesn't stop you from disabling OF_RESERVED_MEM. The Kconfig
> dependencies should reflect the build and runtime requirements of the
> driver, otherwise only driver author knows which config options are need.

OF_RESERVED_MEM is not selectable, so it cannot be disabled for regular
builds.

When I proposed to add dependencies, I indeed did not check whether
these are selectable symbols. My advise was not accurate.

Usually we do not add dependencies to each driver on each kernel
non-selectable feature. It would be too much (depends on HAS_IOMEM,
REGMAP, OF, MFD_SYSCON, OF_RESERVED_MEM and probably many more)... There
are of course exceptions and mistakes (I think I should not add
OF_ADDRESS to OMAP_GPMC).

If such features are non-selectable, usually architecture enforces them
so the driver does not need to. For compile testing, these features
should come with stubs. If there are no stubs, the dependency for
compile testing could be added:
ARCH_TEGRA_210_SOC || (COMPILE_TEST && OF_RESERVED_MEM)

We add the dependencies for selectable options which driver needs, e.g.
DEVFREQ, CPUFREQ, PM_xxx

Since you proposed already to add stubs for OF_RESERVED_MEM, adding
dependency on it does not bring any benefit.

Best regards,
Krzysztof
