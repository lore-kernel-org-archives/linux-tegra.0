Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A016C77B61
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Apr 2023 09:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240136AbjDGJAC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Apr 2023 05:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238089AbjDGJAC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Apr 2023 05:00:02 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE8B86B9
        for <linux-tegra@vger.kernel.org>; Fri,  7 Apr 2023 02:00:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id j22so7058451ejv.1
        for <linux-tegra@vger.kernel.org>; Fri, 07 Apr 2023 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680857999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFRYoLLiAiUJ8Uj5NmQxGnUsAVpAgC+ZF9701cISMN8=;
        b=MRjUZWqzY7Z9xhZ6yVkcaMxyh6hQ4PG8Q+iyBCfDk5QWhzRXqiCd5j3M0ioZ6dq78/
         8o71sGConYzSsMbYIujWzRawUKNqV+QX99Xn6g8g/2P3JMuDKThqslO7HUYJSAql+Pgv
         qkOHncgJ0WyOT5BJp+ZCF2Vc1C4IUcuXRZAs+b4SinPvJWnhbNlxOb93F4sczyUSNaMR
         qJhvdIaio6uTYSdYmgkNMVrDB7KfVJC85g8XHGxefLERIdRMvQv94RPoJQKD+0L1L2xp
         ggcHcVXLcILavWZ0a/uAtEOHU5hABi7hbWMiQAJlTSVCuTpHnEl0X8Jf/iwpaAEJL2pk
         RX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFRYoLLiAiUJ8Uj5NmQxGnUsAVpAgC+ZF9701cISMN8=;
        b=M/Pfs/WwwKOx0gIWJ7YxJ6/bUhh/hxYH0iM5uH2aGAPCf2SyrK2T2axLPklYtaEjra
         HztJ1/OGvLoNibVhJh5TAeauCDzaFRKELXNDVOQlY+fQFk5so59uTeYbVrC+YPDTzm+q
         EI4zfN0RqrXVg9vyJwc5mB7dThkz9Z8g8t1FPano0/5XAtk9gV6x+NiS1WhIvVAbi8ly
         erV1orKcsQsvOYahA+qTOVWjxLRzFGoTGpeenvBS9jO6eopjmW6vfrg5zZYu3dn7DqFt
         J1JkNte2QjPaFtTOHFXQlEwIW8tuhTnA/H0QqG7BFF1U7ze467cY4T8qbx6slEaeVJB6
         h17A==
X-Gm-Message-State: AAQBX9fL/4BOpnxcgQ7C9tNjGQWVMy0TG8xqaEK6K9h9ClpyGuPqYVdx
        pQaHBz4/IYJnKHr7nuxSrLL4Lg==
X-Google-Smtp-Source: AKy350bsUKBzpzsI8dUYbRFz23k3elErLBMEuJpD1nI8ltpMbBcrf4/8Zg4wvAAtHG+yrz5R9y9Utg==
X-Received: by 2002:a17:906:af78:b0:92f:e7e2:b7b3 with SMTP id os24-20020a170906af7800b0092fe7e2b7b3mr1833630ejb.5.1680857998892;
        Fri, 07 Apr 2023 01:59:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id cw10-20020a170906478a00b009486efb9192sm1865736ejc.11.2023.04.07.01.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 01:59:58 -0700 (PDT)
Message-ID: <7df09672-6b7e-2f16-958c-e06909870332@linaro.org>
Date:   Fri, 7 Apr 2023 10:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] dt-bindings: tegra: Document Jetson Orin Nano
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230331163159.17145-1-thierry.reding@gmail.com>
 <20230331163159.17145-2-thierry.reding@gmail.com>
 <944bc557-7090-4b5a-e1bc-31b99fad06e5@linaro.org> <ZCwDBO6317rGsAD4@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZCwDBO6317rGsAD4@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/04/2023 12:59, Thierry Reding wrote:
> On Fri, Mar 31, 2023 at 10:20:16PM +0200, Krzysztof Kozlowski wrote:
>> On 31/03/2023 18:31, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
>>> Document the corresponding compatible strings for these devices.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
>>> index 61e638c9cad7..60c151da5e06 100644
>>> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
>>> @@ -220,6 +220,13 @@ properties:
>>>                - nvidia,p3767-0001
>>>                - nvidia,p3767-0002
>>>            - const: nvidia,tegra234
>>> +      - description: Jetson Orin Nano
>>> +        items:
>>> +          - enum:
>>> +              - nvidia,p3767-0003
>>> +              - nvidia,p3767-0004
>>> +              - nvidia,p3767-0005
>>
>> Similar questions as for patch #1. Where are the DTSes? Where are the
>> differences? If we keep documenting every SKU which is the same from
>> user/OS perspective, this list would grow crazy.
> 
> Most of the differences will be user-noticeable, even if they can be
> runtime detected. Besides the mentioned differences in DRAM size, things
> like the number of CPUs, 

You need different DTS for different number of CPUs. It's not the case
we talk here.

> GPU compute units or video encoders/decoders

I would argue that for these as well you will have different DTS.

> can vary depending on the SKU. While the OS should certainly be able to
> abstract all of that away as best as possible, on user may still end up
> with SKU 3 and another with SKU 5 and it's important for people to know
> what they have.

Depends. They know what do they have. If the DTS is the same, then it is
apparently not important to know what do they have because it is all
"the same" (in a compatible meaning).

> 
> So I think we have to find a way to both keep things simple from a DTS
> point of view (as I said, we should be able to make do with one DTS file
> for the Jetson Orin NX and one for the Jetson Orin Nano with UEFI taking
> care of fixing up the DTS per SKU), and not lying to users. If users get
> a SKU 3, then that's what we should report instead of 3 (or whatever
> ends up being the SKU that we use in the DTS).
> 
> So I want to be as complete as possible in documenting these so that
> when people go look for the part numbers, they can at least find some
> reference to them.

To Chromium guys I need to spend effort to ask to document at least
something, as they claim any board compatible bindings are useless for
them. It's one border case.

Here, I need to bring it to the middle from another side and border case
- documenting many unneeded compatibles which do not exist in DTS.

It would be much easier if you folks get together and exchange
arguments, not through me. :)

Let me be clear then for this case:
We do not document compatibles for stuff somewhere out-of-tree, just
because it is there or you want it to be there. We document the stuff in
the kernel or other SW projects.

Best regards,
Krzysztof

