Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672E2C48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 13:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E9D161184
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 13:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhFKNnA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 09:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhFKNm7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 09:42:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A06BC061574;
        Fri, 11 Jun 2021 06:40:45 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id j2so8608680lfg.9;
        Fri, 11 Jun 2021 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nKr8pai+68Flr3AiBDNVUz9KA2i0xv72PtUutVgvQAI=;
        b=LUe09kKmrmVPBfa25N4IvIE8izJUurfh8PfnbuMeVqFAILPxB3OWdiJscPvqfC8mbf
         +wi9x9ati5hx3rO0Jl43p+3cw11XgA2TkPGSmiLjZh3c8jgo0EWnqb4vusH0DY4qnYec
         ph56Zhvq0GuKjr0RGA+EW5JsqGktY4Ij33NkT9+3D+YjASpD9fnoebUHRvLwDrNVaQX3
         HfwviDwSsqyR7oPCwKzYn9MJPtAlSajLiSZG5F60nasO56skIHUI9pVY5p53HLDnEP0d
         2P7zc1Zpzk+Q9purwn+jBSO5PXfd2e07aOkQbZe4bDqcXMHA6MWRk3k2u1owz04gbivA
         4ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nKr8pai+68Flr3AiBDNVUz9KA2i0xv72PtUutVgvQAI=;
        b=Nyd9WGgqCXI4VDT2F7105TjKVjVlJoeqYg41cn3KjDF+Cb+kAZSqG5QXFAzKST8uDx
         SuCJ+qFWLLl42YQ7qOfY/291a46PT2xMNHV/yn+BGWSDu5OOrKZVJmQ4sSQLFz4Wm2+1
         LHXEIpBoJyVbOjy+AO78Lkmnf6JrI2fJnTe2sX3Dp3+aZCPHWMbzIhP416UhsHiMLYMR
         /Kq8aThkcgz8+Ag8K3zoshJRjPN1aMJiOih7/EDjx7CoSYARvF01nj4+E24GwJqpPjDZ
         7DR8hdttS+pOHah+iqZsQcXO3Tbe0dxVJicnwPCSEdd/7fSwD+KqY+K0LmQTjYmdizcE
         NZOg==
X-Gm-Message-State: AOAM533MfY8hirbqrvjaHSGTBixWp9RCwGIRQrXv19jlhUVrAF3XnUYP
        WjA3/CADzwPYIzp4FkeJBQY=
X-Google-Smtp-Source: ABdhPJw2C9Ph2Z63IIpjqzekR8PtXKlUeN4j8W9HLwz52sihCNSyJyj7Cry/3QbWB1uVXGPZDEnLxg==
X-Received: by 2002:a05:6512:3baa:: with SMTP id g42mr2765717lfv.195.1623418843291;
        Fri, 11 Jun 2021 06:40:43 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id d22sm725537ljc.55.2021.06.11.06.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 06:40:42 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <99fb42e9-26f9-cc79-965d-989c65e7882d@gmail.com>
Date:   Fri, 11 Jun 2021 16:40:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMNCPhHx+s4W7BP3@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.06.2021 14:00, Thierry Reding пишет:
> On Fri, Jun 11, 2021 at 10:21:41AM +0300, Dmitry Osipenko wrote:
>> 11.06.2021 09:50, Krzysztof Kozlowski пишет:
>>> On 10/06/2021 18:23, Dmitry Osipenko wrote:
>>>> 10.06.2021 18:50, Dmitry Osipenko пишет:
>>>>> 10.06.2021 09:43, Krzysztof Kozlowski пишет:
>>>>>> The stubs might be good idea anyway, but the driver explicitly needs for
>>>>>> runtime working reservedmem, so it should select it.
>>>>>
>>>>> The OF and reservedmem are both selected by the ARCH for the runtime
>>>>> use. They may not be selected in the case of compile-testing.
>>>>>
>>>>> Both OF core and reservedmem provide stubs needed for compile-testing,
>>>>> it's only the RESERVEDMEM_OF_DECLARE() that is missing the stub. Adding
>>>>> the missing stub should be a more appropriate solution than adding extra
>>>>> Kconfig dependencies, IMO.
>>>
>>> Ah, in such case everything looks good. Stubs is indeed proper choice.
>>
>> Although, I see that there are only two Kconfigs that have
>> OF_RESERVED_MEM, one defines the OF_RESERVED_MEM, the other is QCOM
>> Kconfig which depends on OF_RESERVED_MEM. The OF_RESERVED_MEM is enabled
>> by default in defconfig.
>>
>> You're right, we need the Kconfig change to be entirely correct, since
>> driver won't work properly without OF_RESERVED_MEM.
>>
>> config TEGRA210_EMC
>> 	tristate "NVIDIA Tegra210 External Memory Controller driver"
>> -	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
>> +	depends on (ARCH_TEGRA_210_SOC && OF_RESERVED_MEM) || COMPILE_TEST
>>
>> I will send that change later today.
> 
> That's completely unnecessary. OF_RESERVED_MEM is enabled by default if
> OF_EARLY_FLATTREE is enabled, which it is for ARM64 and that is always
> enabled for ARCH_TEGRA_210_SOC.

But it doesn't stop you from disabling OF_RESERVED_MEM. The Kconfig
dependencies should reflect the build and runtime requirements of the
driver, otherwise only driver author knows which config options are need.

> What Krzysztof had originally proposed, as far as I understand, is to
> add "depends on OF_RESERVED_MEM" so that the dependency is always there
> (including the COMPILE_TEST case). However, that's a bit problematic, as
> I said earlier, because OF_RESERVED_MEM is not user-visible and neither
> is OF_EARLY_FLATTREE, so there's no way to enable OF_RESERVED_MEM unless
> the architecture selected it, which it doesn't on x86, so it kind of
> defeats the purpose of COMPILE_TEST.

Indeed, the QCOM driver isn't compile-tested as much as it could be.
That driver already shouldn't have any problems with compile-testing,
maybe some stubs were missing when driver was originally added.

> So I think if this really has to be compile-test enabled, the only way
> to do that is to either make this select OF_EARLY_FLATTREE, or add the
> stubs.
> 
> Another option would perhaps be to enable OF_UNITTEST along with
> COMPILE_TEST, since that also pulls in OF_EARLY_FLATTREE and would allow
> this driver to be built even on x86.

For the universal compile-testing it should be enough to fix the stub.
We may consider other options if it won't be enough, thank you for the
suggestions.
