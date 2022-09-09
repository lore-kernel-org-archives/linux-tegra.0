Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A7AECAAD3
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Sep 2022 12:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiIIM5N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Sep 2022 08:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiIIM5M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Sep 2022 08:57:12 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7974A12B362
        for <linux-tegra@vger.kernel.org>; Fri,  9 Sep 2022 05:57:10 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 9so805028ljr.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Sep 2022 05:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xjl34rYNHyzwI8AGw+QEfoD2CLfjnWkvOp8SHIHfMAA=;
        b=ppdq+3NKnpLqYuDGizbeywE53b6E+v75GPWavVRWMgRwIyOyf5i4q2GnmRaW0aM8JS
         N7cZNSDo2jF+osWbql6TfKfpgP3gkP12Hw564zsGbpJLUzDPO40gDfBLJJOp+Y8CsqcP
         cGpMAsjjwSailbQaDHHaydAbtWBhMr217X1R9+ualWnd4SHl02ZL31mWDd7lY4bu33v6
         pI6s08rVYY2WJZf7q5uIwzbbLUoVLjo8iYf1/tHTC4KVFZ7TrUkmkRrMtZYStUh6fnAY
         q5WNSdGPeyRQL8JIq9R5OPFhyD/B0TYSGH1u/qg6gONSGdPTPQERNmNgNJW7CdO8ZII8
         u9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xjl34rYNHyzwI8AGw+QEfoD2CLfjnWkvOp8SHIHfMAA=;
        b=w0W0QxpKWRIQnSY+OvdAXtUeCV4IWcsszPs/O4uiNP+lMV1NObaRTopzms8x2g3UHS
         lEzoX0tv6Ybx0feW0uJtq2LscYROrKMh6U2WpXGQ9MBxFsjwl7RuAhl/ZYoQrVM2G6l6
         bFtxQbrlLFhlFqorKQIG8tIReutUP57gEi8iuDYKC23eeZxse1Bf9JFPqtEcVsS7G+iS
         JLOp94czxntpIfsZJEoMElZf+YRs4f2qrYUZoT5lCn68HsoOm7iU1VZAFyJ4iqkYl6JQ
         CMH6qXgMIaGhiFwURQ7rC8dA2DQ6f/vYGogEXXKdBNnNkOQwVpi+NHh3c1Ks8Px4mA9S
         QcPg==
X-Gm-Message-State: ACgBeo0oZvUqVOxYT4NWffejONN5RZDUDbQjoH6MkJn0IjOg9edBDskp
        2EGA/oPJmII+NFkkMSXNGdH94A==
X-Google-Smtp-Source: AA6agR6U2CMVwoey/OclWMOBFNvpqtguBqtkLYyUE8lwJ/NnSyNHyaW6UM37P8AY5+QEmsMMIBvf8A==
X-Received: by 2002:a2e:944:0:b0:26b:e068:1304 with SMTP id 65-20020a2e0944000000b0026be0681304mr1323362ljj.407.1662728228839;
        Fri, 09 Sep 2022 05:57:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g15-20020a2eb5cf000000b0026a9c8833d3sm64017ljn.129.2022.09.09.05.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 05:57:08 -0700 (PDT)
Message-ID: <72ed9df4-4bec-b9e5-c14d-3e998d83a102@linaro.org>
Date:   Fri, 9 Sep 2022 14:57:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] dt-bindings: pwm: tegra: Add compatible string for
 Tegra234
Content-Language: en-US
To:     Sandipan Patra <spatra@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Bibek Basu <bbasu@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
References: <20220907062545.30203-1-spatra@nvidia.com>
 <75d5e29e-7418-3b8f-f549-6a69fd479852@linaro.org>
 <DM5PR12MB16283364646CBD853C89B425AD439@DM5PR12MB1628.namprd12.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM5PR12MB16283364646CBD853C89B425AD439@DM5PR12MB1628.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/09/2022 13:17, Sandipan Patra wrote:
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, September 8, 2022 5:44 PM
>> To: Sandipan Patra <spatra@nvidia.com>; thierry.reding@gmail.com;
>> Jonathan Hunter <jonathanh@nvidia.com>; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; devicetree@vger.kernel.org; linux-
>> tegra@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: Bibek Basu <bbasu@nvidia.com>; Krishna Yarlagadda
>> <kyarlagadda@nvidia.com>
>> Subject: Re: [PATCH 1/3] dt-bindings: pwm: tegra: Add compatible string for
>> Tegra234
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 07/09/2022 08:25, Sandipan Patra wrote:
>>> Tegra234 has 8 different PWM controllers and each controller has only
>>> one output. Add a device tree compatible string for Tegra234.
>>>
>>> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
>>> ---
>>>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
>>> b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
>>> index 74c41e34c3b6..331c1e66e8fa 100644
>>> --- a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
>>> +++ b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
>>> @@ -9,7 +9,7 @@ Required properties:
>>>    - "nvidia,tegra132-pwm", "nvidia,tegra20-pwm": for Tegra132
>>>    - "nvidia,tegra210-pwm", "nvidia,tegra20-pwm": for Tegra210
>>>    - "nvidia,tegra186-pwm": for Tegra186
>>> -  - "nvidia,tegra194-pwm": for Tegra194
>>> +  - "nvidia,tegra194-pwm": for Tegra194, Tegra234
>>
>> The commit msg suggest it is different. Are you sure they are exactly the
>> same? If not the same, but compatible, you should use fallback.
> 
> Tegra194 and Tegra234 are 2 different chips using exactly same pwm module and dt node.
> This change is to convey that same compatible is used for Tegra234 as well.

Then recommended is to have Tegra234 specific compatible with fallback
to 194.


Best regards,
Krzysztof
