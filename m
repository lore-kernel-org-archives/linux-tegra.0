Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBB2C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhLMQrw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbhLMQrw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:47:52 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC00C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:47:51 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id k37so32087908lfv.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gWGX1ucP5HloE9oZqwM5Lg1vV22Ijran58tF4FX+CSs=;
        b=MnuSwRFe/t2YP9v7V00+hoW067MtegaYz48KL9O0hBNSHwJz7Q3OFpVWimJ4a/M0TH
         vmbJbmIp5SKJCVw3J7dS2ORhwjcKcMVPcoChthmw2t8hgVEjnz/DKEYve0+dpQ0hJCwi
         fsGnJnG64hIuhx6jH8Hcz/m0aMTEwNrCsCQEXPsXIJvM22/tgzIBAeCZ+iGYBuOAI2My
         IYUcdEmLpw7yIz26PLBk2P+xrk3QQIhcUciAMypc0CxDptRVE8oZQlP+P+n4qJOigyFS
         zqUMFPo26ftFXL+bxG/4DMQGA9xDixxUQ19InQBrKBJ+9hKR+B8ITTjeT3LocPC0f69l
         V8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gWGX1ucP5HloE9oZqwM5Lg1vV22Ijran58tF4FX+CSs=;
        b=rKr5iwa/WvWNzK2cs9CQ9uTsErSyI7ZDOc1qPusr5N44IyWTxZjP3W0nXzjqoj5GdD
         xaQQNsHH8fOkdPn4/3K6foCrbnaZbIkNy0PryqBN5iX1fVoXy3lD/r5QJ1cM6GGR00rB
         TRcKhMi6jCqXxcaIo/FSznbtx8d3QbpQ44IveN5YVQscdwk2bL/77W/eFVTZhUd+kfgf
         2+n9Fjl7omeKuzdSJQu8g/JtlSRiriTA6ACOhvcUy3RHJfPJSs3oYLp12d1P4hQU2t6x
         rry+OCMqmv30DA3n6NrUMEF9WgKOHQTNpI54hYHwszAezPq1+QKeH+OrYPUqt/uayy+p
         SAww==
X-Gm-Message-State: AOAM531XqEBKxhuVntsvsMm+2eLQBaHhm01ckgFLAQ6YAU19Ay0X+2c2
        nomHvtCDs/xFJfzl5VI87JK1FHNgbbE=
X-Google-Smtp-Source: ABdhPJwHHjZUptlPkBW4wmrOZZtc3D9Vj1+XO2R5LGkAPJhP8V0TzptUYwdi5IT4s8VtWvfyWiXIug==
X-Received: by 2002:a19:5216:: with SMTP id m22mr29595681lfb.28.1639414069673;
        Mon, 13 Dec 2021 08:47:49 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id c34sm1498984lfv.83.2021.12.13.08.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:47:49 -0800 (PST)
Subject: Re: [PATCH 07/25] ARM: tegra: Add #reset-cells for Tegra114 MC
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-8-thierry.reding@gmail.com>
 <f63ccf90-2def-e241-5f86-1166ab938d8d@gmail.com> <YbNZlyjpi/i2Dph6@orome>
 <60c59ccd-eed4-3046-3ecc-b74475778a3f@gmail.com> <Ybdva8E9+vsBi0mP@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f75aff60-ac7f-bba3-c7a3-fb6b19fc107b@gmail.com>
Date:   Mon, 13 Dec 2021 19:47:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybdva8E9+vsBi0mP@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2021 19:06, Thierry Reding пишет:
> On Fri, Dec 10, 2021 at 06:28:36PM +0300, Dmitry Osipenko wrote:
>> 10.12.2021 16:43, Thierry Reding пишет:
>>> On Thu, Dec 09, 2021 at 11:34:39PM +0300, Dmitry Osipenko wrote:
>>>> 09.12.2021 20:33, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> The Tegra memory controller provides reset controls for hotflush reset,
>>>>> so the #reset-cells property must be specified.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/tegra114.dtsi | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>>>>> index 328425dba023..ce7410ee08b8 100644
>>>>> --- a/arch/arm/boot/dts/tegra114.dtsi
>>>>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>>>>> @@ -542,6 +542,7 @@ mc: memory-controller@70019000 {
>>>>>  
>>>>>  		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
>>>>>  
>>>>> +		#reset-cells = <1>;
>>>>>  		#iommu-cells = <1>;
>>>>>  	};
>>>>>  
>>>>>
>>>>
>>>> This will conflict with the patch that adds video decoder node [1].
>>>> Since the VDE patch was sent out earlier, I suggest you to drop this patch.
>>>>
>>>> [1]
>>>> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211208173609.4064-23-digetx@gmail.com/
>>>
>>> I prefer to keep this separate because it actually gives the reason for
>>> why this is added, whereas with the VDE node patch it looks like it's
>>> there by mistake.
>>
>> So the direct reference to the MC using TEGRA114_MC_RESET_VDE is a
>> mistake to you. I disagree.
> 
> That's not what I'm saying. I'm saying that it's not obvious from the
> patch description or from the rest of the content why that #reset-cells
> is added. It looks out of place.
> 
>> I don't mind if you'll keep this patch, but then please don't forget to
>> resolve the conflict, or we may have two #reset-cells entries.
> 
> Yeah, no worries, I'll take care of that.

Again, I already took care about it [1]. Please just rebase your patches ;)

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20211211211412.10791-26-digetx@gmail.com/
