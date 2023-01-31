Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216F8C38142
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 16:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjAaQtt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 11:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjAaQto (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 11:49:44 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40F02BF08
        for <linux-tegra@vger.kernel.org>; Tue, 31 Jan 2023 08:49:42 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id t7so6452798wrp.5
        for <linux-tegra@vger.kernel.org>; Tue, 31 Jan 2023 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSEGD/xtm60wXblc08WxZnGDiXJW2nRLYVCmhXmbvbU=;
        b=sI6MVev051pwPuQouBouY5CRhRalEeyBc2HL3Oenf9AMJkJiruJWCxtQEUpfN0TXsy
         4AdXKyBWpql5XCFfT2FHoB8t+KmHaob7Z4DamBo1nOJWzfsyJiwPZRjIfDNq1X2fqqUS
         5IpFfIVNRtJxIqaXHGDrx2OEQwwB1uJxLDcOpg1J9X1IzgzH9gLxDKnVik1lTrE5LxR4
         tgJt4DK6d+HTmxPx35PZSArq1gbHRvbdwxzG3OvDBm8ld8evbwpmbSshxYu2EeoZ6MHd
         TIvT8p0KQaAtNo1GSBkvSmkBG0A3CtBexJK5CSDEpF5VbNrbcLncsvHtJGa8kwC46ce/
         1jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSEGD/xtm60wXblc08WxZnGDiXJW2nRLYVCmhXmbvbU=;
        b=6UtnY6JK1PZYZnHri94hqPz0z9I+HYQ1mieChkEv5qL1bh2kdAJ0mIGW9atcRO4xqD
         pNUYpI6Dowbw21gXeabZIYqLRy7SLdQjQUNSGb0afJgja7xQAoHFQxc0F0He5ZAQ97rT
         +JdYjFMeHtxfzdeuMSjWMgbRr7i0gh6/9lJ3Ptek0cf7ohI7WAoFE1DxQ+/MQkEhaAzM
         4e0jbaBcgrJBa3GkOMHekWu65o9WaDkK8S5LwlZkxnvWy32b01Z61opj36wG8WAC5lnp
         unAzI365uPmcKf+6LLC30Mtrwuxy6xJ/1VW9yeJlQny+xyJ8zRZYyUidf3yVu2jloPAc
         aM1A==
X-Gm-Message-State: AO0yUKXCxxdnyXTgUgc3FbeELERhYNn/T9eTrFMTTpUSYbAEY3FMLE2t
        R+C7EmN9fHxIz5Nk5omvemYCXg==
X-Google-Smtp-Source: AK7set8gCTTdCs4CtmgPn0TiWDEaYi9+OBM5a1Cnbi014YeUlhU/J/O2Aj/AOOfRzYg06BmxtncQwQ==
X-Received: by 2002:a5d:4f06:0:b0:2bf:dbe3:eb9c with SMTP id c6-20020a5d4f06000000b002bfdbe3eb9cmr3291839wru.4.1675183781515;
        Tue, 31 Jan 2023 08:49:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t16-20020adfe450000000b002bbdcd15e44sm14805071wrm.37.2023.01.31.08.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 08:49:41 -0800 (PST)
Message-ID: <a929d517-bbb3-fca2-71cf-6f3870969016@linaro.org>
Date:   Tue, 31 Jan 2023 17:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V9 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
 <20230127151041.65751-2-jonathanh@nvidia.com>
 <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
 <9708e6a5-1cde-425a-d463-61d82ccae232@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9708e6a5-1cde-425a-d463-61d82ccae232@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/01/2023 22:10, Jon Hunter wrote:
> 
> On 28/01/2023 10:29, Krzysztof Kozlowski wrote:
> 
> ...
> 
>>> +    $ref: /schemas/connector/usb-connector.yaml#
>>> +    unevaluatedProperties: false
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>
>> I would assume that at least one connector is required (oneOf: required:).
> 
> 
> I have been looking at this and wondered if we need the 'oneOf' in this 
> case? Shouldn't we just add 'connector@0' to the required properties?
> 
> At first I added ...
> 
> oneOf:
>      - required:
>          - connector@0
>      - required:
>          - connector@1
> 
> But this is not correct, because the above will cause warnings if both 
> connector@0 and connector@1 are present.

Right, then anyOf should do the trick.

Best regards,
Krzysztof

