Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EDCC83F14
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Aug 2023 17:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237806AbjH2RUm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Aug 2023 13:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237808AbjH2RUW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Aug 2023 13:20:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F911731
        for <linux-tegra@vger.kernel.org>; Tue, 29 Aug 2023 10:19:32 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977e0fbd742so599267966b.2
        for <linux-tegra@vger.kernel.org>; Tue, 29 Aug 2023 10:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329563; x=1693934363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juVcysWXiJ/IJ4XG8a/dh2JBDDWgv7UxtX06Nd3Bu5o=;
        b=vIB7/WjV13mXf8IEdBSj7q429vNlf5MbILTti/7wVSghbI8W3XKjf9LrUTsqv67Z50
         UN9MjQ/TefegBGrPsT/FgQIX/Jtt+vvdhoSU/K9P5kNth9xWmVqYSg7CGtxz8QgPz/cb
         mtTzsWg427ETPl3Q3LwNQEk956u8zgUq4/ifiHGWVKb5QIwRepZ6Bw7bYYXAzEuUrQZ4
         MhsOn7ocGGn9P/wS4a82P5dKNboarB8LVyNBlpzDuCcd9IQGQHUMWp2JfaKUl6fg8REJ
         Gl3qEKB+qdqFl0xVhrnPgHzUdEdFrmXG3LGj5snpfj0kECRxDtSiVQJV7O52dJ6/4pNX
         OD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329563; x=1693934363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juVcysWXiJ/IJ4XG8a/dh2JBDDWgv7UxtX06Nd3Bu5o=;
        b=SVjrHrMDroRkJrzu00Vp0aQfkU1tFCXNroYE9weZ6uAuQcnVPjNOw1g2gGz+VE0aGL
         sHX3tMKcYO7fxQecG3wzcIJ/St/pu3aD/3Gg7ZMVDMdYITgjGoqY4QkI5iwnOk4upKb3
         rnC/lZqHl+d7Exi5ndQEwgrfvf7/qy3yfFszjkU83MeFncMRBwg/JhCqapQE6G+5cwsn
         626myjZ+7WUcuRDCgUJDErymtovXh61MEZ/fyynf75DiD2uIL1NjxNni/IvP6Dqt4kmL
         tNJgCIInCxmcihB0Ng6v4Eyx/vf7By8IPT2cKmbHAAdUkaRiLm13aJub8DJaAQkQNTKS
         LZtA==
X-Gm-Message-State: AOJu0Yz7ntpWvhP8oncsaTVRqDKP0D7yrcbjqA+H6xggMY51aMUVGZl4
        f2Sm7zhB24+uZc9LYwIhVMgN3A==
X-Google-Smtp-Source: AGHT+IG99CKE3yBiVqT98dSbvGV23AfrwdP7P4Als9sQJYd8EfGlKW/+udUM12v8mOqkUEYSZHlsXw==
X-Received: by 2002:a17:906:3094:b0:9a1:fda6:2e26 with SMTP id 20-20020a170906309400b009a1fda62e26mr13591155ejv.55.1693329562869;
        Tue, 29 Aug 2023 10:19:22 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id j16-20020a170906051000b0099cc402d3ddsm6145756eja.202.2023.08.29.10.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:19:22 -0700 (PDT)
Message-ID: <3aa9067e-8341-5e72-ccee-1c474692fbb2@linaro.org>
Date:   Tue, 29 Aug 2023 19:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 2/4] dt-bindings: hwmon: ina3221: Add summation-bypass
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-3-nmalwade@nvidia.com>
 <7595f0d3-7a59-9837-ef6b-627be3688667@linaro.org>
 <ef17206a-aaab-5a13-fdc1-7a8d9d04c6dd@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ef17206a-aaab-5a13-fdc1-7a8d9d04c6dd@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/08/2023 14:48, Jon Hunter wrote:
> 
> 
> On 26/08/2023 09:56, Krzysztof Kozlowski wrote:
>> On 25/08/2023 18:42, Ninad Malwade wrote:
>>> The INA3221 has a critical alert pin that can be controlled by the
>>> summation control function. This function adds the single
>>> shunt-voltage conversions for the desired channels in order to
>>> compare the combined sum to the programmed limit. The Shunt-Voltage
>>> Sum Limit register contains the programmed value that is compared
>>> to the value in the Shunt-Voltage Sum register in order to
>>> determine if the total summed limit is exceeded. If the
>>> shunt-voltage sum limit value is exceeded, the critical alert pin
>>> pulls low.
>>>
>>> For the summation limit to have a meaningful value, it is necessary
>>> to use the same shunt-resistor value on all included channels. Add a
>>> new property, 'summation-bypass', to allow specific channels to be
>>> excluded from the summation control function if the shunt resistor
>>> is different to other channels.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
>>> ---
>>>   .../devicetree/bindings/hwmon/ti,ina3221.yaml  | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>>> index 0c6d41423d8c..20c23febf575 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>>> @@ -55,6 +55,24 @@ patternProperties:
>>>         shunt-resistor-micro-ohms:
>>>           description: shunt resistor value in micro-Ohm
>>>   
>>> +      summation-bypass:
>>
>> What is the type? There is no vendor prefix here, so you added it as a
>> generic property. Which other devices use or can use it?
>>
>>> +        description: |
>>> +          The INA3221 has a critical alert pin that can be controlled by the
>>> +          summation control function. This function adds the single
>>> +          shunt-voltage conversions for the desired channels in order to
>>> +          compare the combined sum to the programmed limit. The Shunt-Voltage
>>> +          Sum Limit register contains the programmed value that is compared
>>> +          to the value in the Shunt-Voltage Sum register in order to
>>> +          determine if the total summed limit is exceeded. If the
>>> +          shunt-voltage sum limit value is exceeded, the critical alert pin
>>> +          pulls low.
>>> +
>>> +          For the summation limit to have a meaningful value, it is necessary
>>> +          to use the same shunt-resistor value on all included channels. If
>>> +          this is not the case for specific channels, then the
>>> +          'summation-bypass' can be populated for a specific channel to

"populated" is confusing here. I guess you wanted "can be used"?

>>> +          exclude from the summation control function.
>>
>> I don't understand what this property does. You described feature in the
>> device, that's good, but how does it map to the property? Bypass means
>> disable?
> 
> 
> Yes it means 'disable'. I kept as 'bypass' to align with the original 
> patch [0], but if it is clearer, we could change this to be 
> 'summation-disable'.

Sounds better, but the description could also start with it, e.g.
"Disable the summation on specific channel. .... "

Best regards,
Krzysztof

