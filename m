Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80285C54E76
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 17:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjAQRyi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 12:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjAQRvW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 12:51:22 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A514E516
        for <linux-tegra@vger.kernel.org>; Tue, 17 Jan 2023 09:40:55 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id q8so11082004wmo.5
        for <linux-tegra@vger.kernel.org>; Tue, 17 Jan 2023 09:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqO/4CUlcaKUI+N6KnEcGa9fUpEwBq1b3sCSTWRwANE=;
        b=CCYflS9OWadCGythNwcsIH095kmmg1EaF7VVyr3LZSCyaKTDrrlj3ybj6DQ7bVEyBS
         7/51F6N85JybrK21y0Wn6GBmbFycAEKJpXjgBybirdVkomE/i6NdK3r6lBBPei9lK9Rr
         aE69iCuPNVk3BAvctOxIkjOuuiqSjebXYJviPfKBjfkRdLpCTnyzPaBqVW+Jh2Tf2mth
         Wx+W2tjF4NIutdq4kqC6VHISOCWHkvgjscW01EI+7EeNrbx9Sl7ridat1QkfYx4o4zFd
         lmLfbi6DK7GjWwyG+j250ygKeqSJfTedbBrAXpvRuZzuB3eMGZE2Tof1GHrN1H3g9A2A
         JQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqO/4CUlcaKUI+N6KnEcGa9fUpEwBq1b3sCSTWRwANE=;
        b=U6FhN8gBEeY5bpBzk2cD7eFC9OqktYbp0lKRmJS0zRonPpkh/Di0uYmqiV60jAdWCI
         dQhar2sOzDVk6n/S2Ef/QlwKPBpJf0xkfRQnz6rlmsuZtzZYrkhenYUg3lRu7kZXAxI4
         CpMwr70CRUqku3tM63Dm9Tum6e5JXzlgbfY0VQ2DCXM2rAPCftETbIja9BNU6ERZBPff
         njfYC5eNL9lqy0aBKrUk1tL+aaIVFDTODmFjK1G4u/IgNgpSM6VM6eMxWvINT+QARTVd
         1ED5hVRoSAfcl4nUHKy04j7cboxAp5DFxsBlWbxNcWi+M9vEbZkwHpRYjyHCb3y6rBBz
         FCxw==
X-Gm-Message-State: AFqh2kqXX5mjONzZa+OQDLuYDH5ajzw50YHH3HXdQeIS6XxJSWsGRxa+
        hCzSAQCv904Z1ibjxlHW3DOEBQ==
X-Google-Smtp-Source: AMrXdXtPJ0H4IQzPRAtiAcVDL7dHFldlWsjygqlFx59R1RpfJof8pcsnd2i8Yi932s8YHd3dxkXsEA==
X-Received: by 2002:a05:600c:3acd:b0:3cf:5583:8b3f with SMTP id d13-20020a05600c3acd00b003cf55838b3fmr3867429wms.20.1673977254391;
        Tue, 17 Jan 2023 09:40:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003d974076f13sm40187828wmo.3.2023.01.17.09.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 09:40:53 -0800 (PST)
Message-ID: <00d0e406-034f-d634-4475-a6c84a4928ac@linaro.org>
Date:   Tue, 17 Jan 2023 18:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V4 1/5] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-2-jonathanh@nvidia.com>
 <de5cb562-e45e-aed4-508f-2d23f114a01e@linaro.org>
 <dbb0cc82-4b15-b99c-bfbe-0f6af8f2e8dc@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dbb0cc82-4b15-b99c-bfbe-0f6af8f2e8dc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/01/2023 18:16, Jon Hunter wrote:
> 
> On 16/01/2023 19:03, Krzysztof Kozlowski wrote:
>> On 16/01/2023 16:50, Jon Hunter wrote:
>>> From: Wayne Chang <waynec@nvidia.com>
>>>
>>> add device-tree binding documentation for Cypress cypd4226 type-C
>>> controller's I2C interface. It is a standard i2c slave with GPIO
>>> input as IRQ interface.
>>>
>>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>> V3 -> V4: no changes
>>> V2 -> V3: fix additionalProperties warning on new schema
>>> V1 -> V2: based on the review comments. Fix some addressed issues on
>>>
>>>   .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>>>   1 file changed, 86 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>> new file mode 100644
>>> index 000000000000..5ac28ab4e7a1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>> @@ -0,0 +1,86 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cypress cypd4226 UCSI I2C Type-C Controller
>>> +
>>> +maintainers:
>>> +  - Wayne Chang <waynec@nvidia.com>
>>> +
>>> +description: |
>>> +  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
>>> +  controller.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: cypress,cypd4226
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +  reg:
>>> +    const: 0x08
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  cypress,firmware-build:
>>> +    enum:
>>> +      - nv
>>> +      - gn
>>> +    description: |
>>> +      the name of the CCGx firmware built for product series.
>>> +      should be set one of following:
>>> +      - "nv" for the RTX product series
>>> +      - "gn" for the Jetson product series
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
> 
> 
> Thanks. Apologies for this. I will sort this out in the next revision.

These could have been comments from Rob about this property.

Best regards,
Krzysztof

