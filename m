Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33498C77B78
	for <linux-tegra@archiver.kernel.org>; Wed,  3 May 2023 14:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjECOHW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 May 2023 10:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjECOHV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 May 2023 10:07:21 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194F35B84
        for <linux-tegra@vger.kernel.org>; Wed,  3 May 2023 07:07:20 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so7189038a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 03 May 2023 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683122838; x=1685714838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPZd8mQM4MQ3mCONjF5npeqWZMaRA165Vw2srGHcbL0=;
        b=My9PY/hCKy0PGEszhf3Kry5JFFR66CEiNTxHxyBD6k2H7fp31EzRk0vg66fDn9U75u
         RLoqXeQTKaZQPmvywJAVJBj0WscQx7OM8U1cPwPyehCRAvpjVe7ZnXUa/hbiS+BYhXRf
         2xTrbOgFWbsr+3bKSVs8Q6VNV4erqzMYpKMkWXckkkv+OjFfOA22yuJvzo+2YPPyMzHf
         iFcJSII4aY13lwHaNGQHNC1EGhNzyvuxqJx/GUqgHU2L0UEdlG/yhzI0HY3e3WvDLErb
         kVzJJnLTngRFWCfb9Q9OwOrQZaioYfZo0OskV4aPuTtO23OgSdGUu6sAKEiUMzeOZl5R
         Ly+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683122838; x=1685714838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPZd8mQM4MQ3mCONjF5npeqWZMaRA165Vw2srGHcbL0=;
        b=S4Rmliiq/FZP2MAyXhRHhGIV2XntyVnuaUQdVWjmQET0gyCSyX1oLjPCwbiEC6ykbF
         dPVcAEMdvY8R/CCIgXoGFho04z1wlRRcy7Y9FFnFto9ap3aCHpkxMmFkeal3JBYwUYNc
         NBdJtiBo2n0YMUkMDDdg0UlEFCN5krCFU22AfOgWc9crXGc4+zq9i7xtFa3+j/uLyInh
         ay4N02+ue8q1A0jKuZ7VoWf2VqzfcO9EmprsHqwV8gKVPSa7BTNGF3ZA4XT3N80DP8NI
         I2b6QyvBZJYBkzYB/oQT9tjIPo6vDbTtCeeQzeq+E1FLT24t5rzaKrDFHDEnnfXoLLMZ
         xVrQ==
X-Gm-Message-State: AC+VfDy0xTkRdP0DN/tYVq7R+qYcN8VtGeMAxrW50bb9dOACUndnbAZa
        73qphxUkNpm9Grht2UW2/e8Ymw==
X-Google-Smtp-Source: ACHHUZ49xuctmLyncdAFpBTUlj1RpxAea7lDh+1gFfdwPZ+9f3T7S3WLwRxhfXuO9fPmvwq5u7zU/g==
X-Received: by 2002:a05:6402:3490:b0:50b:caf8:ddad with SMTP id v16-20020a056402349000b0050bcaf8ddadmr1920559edc.19.1683122838515;
        Wed, 03 May 2023 07:07:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:db42:e3d0:c55a:8cf1? ([2a02:810d:15c0:828:db42:e3d0:c55a:8cf1])
        by smtp.gmail.com with ESMTPSA id n20-20020a056402515400b00509d1c6dcefsm756452edd.13.2023.05.03.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 07:07:17 -0700 (PDT)
Message-ID: <8c142bc5-de77-2561-35a1-2358f0565ecf@linaro.org>
Date:   Wed, 3 May 2023 16:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 1/2] dt-bindings: tegra: Document compatible for IGX
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Shubhi Garg <shgarg@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230502150249.773425-1-shgarg@nvidia.com>
 <664379bf-96c4-b66c-6b0b-7b848ae6000c@linaro.org> <ZFIm-nDpMZog9aOr@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZFIm-nDpMZog9aOr@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03/05/2023 11:18, Thierry Reding wrote:
> On Wed, May 03, 2023 at 08:22:21AM +0200, Krzysztof Kozlowski wrote:
>> On 02/05/2023 17:02, Shubhi Garg wrote:
>>> Document the compatible strings used for Nvidia IGX Orin Development
>>> kit which uses P3701 SKU8 and P3740 carrier board.
>>>
>>> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
>>> index 0df41f5b7e2a..34523b8b5d1f 100644
>>> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
>>> @@ -176,5 +176,10 @@ properties:
>>>            - const: nvidia,p3768-0000+p3767-0000
>>>            - const: nvidia,p3767-0000
>>>            - const: nvidia,tegra234
>>> +      - description: NVIDIA IGX Orin Development Kit
>>> +        items:
>>> +          - const: nvidia,p3740-0002+p3701-0008
>>> +          - const: nvidia,p3701-0008
>>> +          - const: nvidia,tegra234
>>>  
>>
>> Don't stuff things to the end, but put in some logical order. For
>> example 'I' could be before 'N'.
> 
> Sorting these alphabetically doesn't work well because it's not very
> deterministic. So far we've always grouped these by SoC family and
> within each group they are sorted chronologically. Chronologically
> here being determined by the upstream activity. We could perhaps make
> that a bit more formal by sorting by part number. Those are usually
> assigned at design time (i.e. p3740 was designed prior to p3768), so
> in that case the IGX would be sorted after the AGX Orin.
> 
> The NVIDIA in the description is something we haven't been very strict
> about. It'd probably be a good idea to add that wherever relevant since
> other vendors make products with these modules.
> 
> We could also add comments to the list to visually separate the SoC
> family groups. That's something for another patch, though.
> 
> Would you agree with chronological (by part number) sorting? In practice
> this would tend towards new things getting added to the end, but I think
> it's the least confusing for people looking at these lists. For instance
> if I buy a very recent device, I would expect it to show up somewhere
> close to the end of a list rather than potentially very high up.

Yeah, this works as well. I assumed something around this. Probably this
should should go then one step up.

Best regards,
Krzysztof

