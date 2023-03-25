Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825C5C6FD1F
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Mar 2023 11:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjCYLJ6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Mar 2023 07:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbjCYLJ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Mar 2023 07:09:57 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAA7CDF6
        for <linux-tegra@vger.kernel.org>; Sat, 25 Mar 2023 04:09:54 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b20so17446321edd.1
        for <linux-tegra@vger.kernel.org>; Sat, 25 Mar 2023 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBwqQkoxZI57Vzr0zIVnZtVc1J4mnm5f9fimCO8c5gs=;
        b=hLP5Z/Dugm3vw2Qf32RD0liUnDOnByuA17Bb3uxVp2msOftFa6Mgd1vwXq5HReohBt
         absSLHSZoTvo+IwIVWsgLG0FkR6WOEFNLP1TIQvPys6vxWrTNqVTTB/ahLSJSXetSp8k
         fdnF+NrTLi9DVtqKTVj9JP52MZv9kKlE6LXnExMd0au7j6tsIGZSWIyraVgXx/OssziR
         0yQl0uEsdbcQAvlIPs/QByTqwe0vySQU9JwdREWdT8wcCbJDPp4EYZht68baIs5cz3FJ
         HXB6sH1ykg/uuo5ssZJSAbyGeJVllC4ifXTxUgAkjgy5MR892XZ5Y8H3IR+czf/MYyN1
         1q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBwqQkoxZI57Vzr0zIVnZtVc1J4mnm5f9fimCO8c5gs=;
        b=8Qh7bJvRKwF3ZElUwC1epNm9ouExEWXOUNsp/Tu6tDSsF95aaR8PRRJhnDTXfFZTNL
         Wa82ScID/inr+I/CiGXobKJn7h+IJsnncIAb8uCGgvoJT9KNsCh+FeZ42NurzjiRYj/A
         077NXEDu8IMVs6dvdDT34Wy8Camwlk15jf4T0Cmp17lQ8DU+S7F6pKG6fqxQahc/p8Ky
         esrNPK0yY0cg6Hj8Usw6pMlQ8ZROJptdbbThO1TGYIkI9NTTgaPfyrZvJ9ljWWQTYOh/
         2MrQ+FWQum0/KmwA8IyxPIwELhDPcnV/s8n2renYsnpnolpazdJ8lUeIyPiUo7j5Yrl2
         spUw==
X-Gm-Message-State: AAQBX9esiaLSHunkuS2OsywklHjE+mk/fWotvCQ+/21gva/+fxm/YFtA
        sbGdDTkXyB8WZEa4UDv2u/sT7UewiAeNqpGdDqw=
X-Google-Smtp-Source: AKy350bcqMdxiFyTXv1+IkDaQqY/BxuBsoKAK9hcooyB1w/1DZrAM06ChGoIsGtouY+3D25R1odVfA==
X-Received: by 2002:a05:6402:1012:b0:4fb:7ccf:3b33 with SMTP id c18-20020a056402101200b004fb7ccf3b33mr5816340edu.31.1679742593294;
        Sat, 25 Mar 2023 04:09:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id k24-20020a50ce58000000b004fc9e462743sm11985137edj.91.2023.03.25.04.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:09:52 -0700 (PDT)
Message-ID: <19b71fef-614a-d678-2e73-95db8f226e61@linaro.org>
Date:   Sat, 25 Mar 2023 12:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 04/10] dt-bindings: timestamp: Add
 nvidia,gpio-controller
Content-Language: en-US
To:     Dipen Patel <dipenp@nvidia.com>, Rob Herring <robh@kernel.org>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-5-dipenp@nvidia.com>
 <20230324171329.GA2062332-robh@kernel.org>
 <7f2dc5cf-78b5-81c6-0012-26b1adce1c86@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7f2dc5cf-78b5-81c6-0012-26b1adce1c86@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/03/2023 19:51, Dipen Patel wrote:
> On 3/24/23 10:13 AM, Rob Herring wrote:
>> On Wed, Mar 22, 2023 at 06:29:23PM -0700, Dipen Patel wrote:
>>> Introducing nvidia,gpio-controller property from Tegra234 SoCs onwards.
>>> This is done to help below case.
>>>
>>> Without this property code would look like:
>>> if (of_device_is_compatible(dev->of_node, "nvidia,tegra194-gte-aon"))
>>> 	hte_dev->c = gpiochip_find("tegra194-gpio-aon",
>>> 				   tegra_get_gpiochip_from_name);
>>> else if (of_device_is_compatible(dev->of_node, "nvidia,tegra234-gte-aon"))
>>> 	hte_dev->c = gpiochip_find("tegra234-gpio-aon",
>>> 				   tegra_get_gpiochip_from_name);
>>> else
>>> 	return -ENODEV;
>>
>> Or you just put the name in match data.
> 
> Not sure I have understood this comment, but "name" the first argument is
> already there to supply to callback to match data. Also, this if else is
> needed to know which "name" to provide.

The point is that of_device_is_compatible() do not really scale and make
code more difficult to read. Your variant-customization should in
general entirely come from match/driver data.


>>
>>>
>>> This means for every future addition of the compatible string, if else
>>> condition statements have to be expanded.
>>>
>>> With the property:
>>> gpio_ctrl = of_parse_phandle(dev->of_node, "nvidia,gpio-controller", 0);
>>> ....
>>> hte_dev->c = gpiochip_find(gpio_ctrl, tegra_get_gpiochip_from_of_node);
>>>
>>> This simplifies the code significantly. The introdunction of this
>>
>> typo
> 
> ACK...
>>
>>> property/binding does not break existing Tegra194 provider driver.
>>
>> Making a new property required is an ABI break.
> The driver code for the Tegra194 binds by old binding and does not need
> this new property, the relevant code is part of this patch series.
>>
>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>> ---
>>>  .../timestamp/nvidia,tegra194-hte.yaml        | 31 +++++++++++++++++--
>>>  1 file changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
>>> index eafc33e9ae2e..841273a3d8ae 100644
>>> --- a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
>>> +++ b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
>>> @@ -51,6 +51,12 @@ properties:
>>>        LIC instance has 11 slices and Tegra234 LIC has 17 slices.
>>>      enum: [3, 11, 17]
>>>  
>>> +  nvidia,gpio-controller:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      The phandle to AON gpio controller instance. This is required to handle
>>> +      namespace conversion between GPIO and GTE.
>>
>> Explain what the GPIO controller is needed for rather than how this 
>> changes the driver.
> Doesn't "This is required..." statement addresses why GPIO controller is needed
> for part? Or do you want detail explanation which is already part of the commit?

Your bindings commit msg focused on driver and it is not really what it
should be about.

Best regards,
Krzysztof

