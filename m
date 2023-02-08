Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D27BC636D7
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Feb 2023 12:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjBHMBf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Feb 2023 07:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBHMBe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Feb 2023 07:01:34 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E80648A09
        for <linux-tegra@vger.kernel.org>; Wed,  8 Feb 2023 04:01:30 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id j23so1309746wra.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Feb 2023 04:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qad9qfr6xeRM+umDGpr9M+cfEjndgPjP7JWCYE+lXA=;
        b=OYDGtqEigsQkH3blONz2B4KtY/XEJ89esODLrNCJekrtR9MKWl/pUI1Y2CX0YUElah
         Dqeq+FVBV1ZoQ+n0lQiBO8Yx+97Q8Qk5ujkS7nA5S95XwYjSqNMORX6G9t0x/gIDCaFw
         S8JRnvkIGiCUZDdOJ5efntDM3fyioJwb54hyRBF/8/P9/m3xoaECVJgTFNp4mEYhWwi0
         tB4YFQMz3MWOQ7PVrgPpZAGqbVPFIb7WFMpUenOFhWXwLG3Gt3r8MqYSqkS8rZ+/nBxu
         7ZQ9SzWZHsXjWj2ttFP65G17aO/zqZmo8wH3PM4zUwKGQtp/dklJ9ACwQyB0PZyYC5tK
         frIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qad9qfr6xeRM+umDGpr9M+cfEjndgPjP7JWCYE+lXA=;
        b=ac6rSC9W6J+UeFNe9KMy0OKu2h+OV0KnwK36ur0/qcU467IfBaTo3IXm3oB3W5LLxG
         +rppPOILIy1/ZAkicZlpaOORZ/SdhDgdyjb7LJG7ZokCSrOLHdKziHP74cYvtxBDEGUn
         S/ybhMeznehnySkGborCfKeoVKFGCt5WDpfwH41T7552zQLo/df3f/tgkS7ON7SaOoV6
         ED73ZvRWXVnHxEdah4RY09y+RQBBOvFWaCHbuWM28402eq3pJu07k6v6vKiHuZi8odI+
         gdVOqcQLoRcmBLeOtlo153kXXeGh+nZK9JEb+BQ2gnYycrFo59IdfwgxV3MWQetBv21n
         msWA==
X-Gm-Message-State: AO0yUKXO5xPYiViBl1W/1vlGClSFqQOKOp325z6IPnxJeg2M/IGXhHEJ
        bqbuw5K4RLvkAUgwfLD/O55PDw==
X-Google-Smtp-Source: AK7set+xgJ6WrfTLrSZ0x7p/NvqlO7QbXsza7mf18Q5eO28H3/W9GsfeBeIyt6eeYsdSXFIb8afm+A==
X-Received: by 2002:adf:f344:0:b0:2c3:ff6c:ea5 with SMTP id e4-20020adff344000000b002c3ff6c0ea5mr1540941wrp.68.1675857688691;
        Wed, 08 Feb 2023 04:01:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d4572000000b002c3e7474b0fsm7861604wrc.13.2023.02.08.04.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 04:01:28 -0800 (PST)
Message-ID: <7bb3e201-954d-c8eb-9430-19626c43fe75@linaro.org>
Date:   Wed, 8 Feb 2023 13:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] arm64: tegra: Add Tegra234 pinmux device
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Prathamesh Shete <pshete@nvidia.com>, jonathanh@nvidia.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        smangipudi@nvidia.com
References: <20230207115617.12088-1-pshete@nvidia.com>
 <20230207115617.12088-3-pshete@nvidia.com>
 <f0d58e5b-74df-26cf-592e-302a00d08eee@linaro.org> <Y+OAthBgds9InvKp@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+OAthBgds9InvKp@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/02/2023 12:00, Thierry Reding wrote:
> On Tue, Feb 07, 2023 at 04:33:42PM +0100, Krzysztof Kozlowski wrote:
>> On 07/02/2023 12:56, Prathamesh Shete wrote:
>>> This change adds pinmux node for Tegra234.
>>>
>>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> index eaf05ee9acd1..c91b88bc56d1 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> @@ -701,6 +701,13 @@
>>>  			interrupt-controller;
>>>  			#gpio-cells = <2>;
>>>  			gpio-controller;
>>> +			gpio-ranges = <&pinmux 0 0 164>;
>>> +		};
>>> +
>>> +		pinmux: pinmux@2430000 {
>>> +			compatible = "nvidia,tegra234-pinmux";
>>> +			reg = <0x2430000 0x19100>;
>>> +			status = "okay";
>>
>> Why? Anything disabled it?
>>
>>>  		};
>>>  
>>>  		mc: memory-controller@2c00000 {
>>> @@ -1664,6 +1671,13 @@
>>>  			interrupt-controller;
>>>  			#gpio-cells = <2>;
>>>  			gpio-controller;
>>> +			gpio-range = <&pinmux_aon 0 0 32>;
>>> +		};
>>> +
>>> +		pinmux_aon: pinmux@c300000 {
>>> +			compatible = "nvidia,tegra234-pinmux-aon";
>>> +			reg = <0xc300000 0x4000>;
>>> +			status = "okay";
>>
>> Also why?
> 
> These are probably copy-pasted from Tegra194 where these snuck in. I can
> drop those when applying. I'll also prepare a patch to drop these from
> the tegra194.dtsi.
> 
> I wonder if there's a good way to detect these. We'd have to run checks
> on the DT source files, so that's a bit difficult. I do have an
> experimental script that tries to capture some common pitfalls on
> sources but it's quite ugly and slow, but I guess I could add something
> like this. But perhaps there are better ways?

One way to easy spot them is to override always by label, thus every
node defined like above is a new node. However I think we talked about
this and you do not follow this practice, thus there is no way to tell -
is the status reasonable or not.

Automated tools could help here as well - run fdtdump on DTB and look
for status=okay.

Best regards,
Krzysztof

