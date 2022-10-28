Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800A1ECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 13:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiJ1NIC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 09:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiJ1NHs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 09:07:48 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C976C74B
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 06:07:31 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id z6so3387320qtv.5
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftkqot10AQcXQdqV/Jbl/9CtC9aRi/Jqm3fJZzs9lj8=;
        b=i0yI4Ug+Z1ysX4/bnftGptzijoHqXCS6WRhD038+LsxdPz7E0ThoG4tlNtTThFCHbR
         ASl+or5ag7lRFgPCqxkO31DpQ3+PRFaki8lLE27Z/4I4v8FcdahfKS9IL4RMXm22aXxm
         hBvYE9Bzk6H2DuSw9q6/fYdS2s5dFu+eLVe2GHdQUkkeVFZrV9QJ7ZdT1XPU++F4jB6A
         t+Bx1Dw3unAtPbBniY1qeBFX4crCQHR9MNTNvAH53sSgKBB0AzDCg/0ioBHqwsXPTnys
         bV484SK6UqfDgScP8cnUrOU+5DwkCVvbKA7t6nSq8VgNhdUFadESwMgDD0JsewS0Shf3
         r8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftkqot10AQcXQdqV/Jbl/9CtC9aRi/Jqm3fJZzs9lj8=;
        b=RMRlvSkgNGrLEFF4XPHK2ZFZhxFA0LoZ4VGpW9UGxmCCWV8zCK018pXZLsADalaX9z
         FuvKTU1m6ShPLsoeONla+Is+lqYNxQMBnTYY1HoRzZ8IsAiBRppBEHxPZVE54RuC3QGs
         HV4/4M4NvzZBcYMla7u7mYmmXtKAcIKEy1LyjFm/LrZrFK/U01F3Lf4wcPPPA605U8Mm
         KV8FqZptiDVcn5hItJxq6PNZh7fv89md3l3ej3SBau2utliO8O3vY1kAx2AXtSfXcwxP
         ZUZS+OZCE7SFHq02RR/n59Vxxme69Qfrl9leKhLcgDY2O21gmOJiSEL/oaheFRQqKSYE
         r8KA==
X-Gm-Message-State: ACrzQf2sFYBMjB7Moc1hnGZOnGExnEYAXWoMa2riUZ1v7uNJDBJIX/LY
        7FKoPvwMdu4DPbWSfdGU4MdxKQ==
X-Google-Smtp-Source: AMsMyM69J8NXxr8evm2/tJLL/IA+Uh85w9MU4UpxQfO/PLJBf1vpzopr/ycomAQtDwCRHdjtHbxrSg==
X-Received: by 2002:a05:622a:120c:b0:39c:c7e7:bec3 with SMTP id y12-20020a05622a120c00b0039cc7e7bec3mr45618758qtx.648.1666962450378;
        Fri, 28 Oct 2022 06:07:30 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id t18-20020a37ea12000000b006af0ce13499sm2854849qkj.115.2022.10.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 06:07:29 -0700 (PDT)
Message-ID: <4a4c2b3d-79e5-1f34-a031-77d1d1941000@linaro.org>
Date:   Fri, 28 Oct 2022 09:07:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] memory: tegra: Add DLA clients for Tegra234
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221028123741.134880-1-jonathanh@nvidia.com>
 <20221028123741.134880-2-jonathanh@nvidia.com>
 <ce3fdd20-248f-4fdd-fe83-2aa79fd297c5@linaro.org>
 <073073ae-d921-e11f-8ff4-67f1a61760d0@nvidia.com>
 <c1465ec3-a903-f1d1-621f-2cbe95ae53e7@linaro.org>
 <1c22af7f-fa73-6f79-ad12-d460b7c534c8@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1c22af7f-fa73-6f79-ad12-d460b7c534c8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28/10/2022 09:05, Jon Hunter wrote:
> 
> On 28/10/2022 13:52, Krzysztof Kozlowski wrote:
>> On 28/10/2022 08:51, Jon Hunter wrote:
>>>
>>> On 28/10/2022 13:46, Krzysztof Kozlowski wrote:
>>>> On 28/10/2022 08:37, Jon Hunter wrote:
>>>>> Add the memory clients on Tegra234 which are needed for initialising the
>>>>> SMMU for the Deep Learning Accelerator (DLA).
>>>>>
>>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>>> ---
>>>>>    drivers/memory/tegra/tegra234.c | 160 ++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 160 insertions(+)
>>>>>
>>>>> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
>>>>> index a9e8fd99730f..9bdaf8af8c97 100644
>>>>> --- a/drivers/memory/tegra/tegra234.c
>>>>> +++ b/drivers/memory/tegra/tegra234.c
>>>>> @@ -170,6 +170,166 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
>>>>>    				.security = 0x504,
>>>>>    			},
>>>>>    		},
>>>>> +	}, {
>>>>> +		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA,
>>>>> +		.name = "dla0rda",
>>>>> +		.sid = TEGRA234_SID_NVDLA0,
>>>>
>>>> This is now not applicable because you sent dependencies separate, mixed
>>>> with other subsystems... Split pieces based on subsystems.
>>>
>>> Sorry I don't understand. This patch is dependent upon the first. I have
>>> not sent anything separate.
>>
>> You sent mixed between subsystems patches adding TEGRA234_SID_NVDLA0.
>> That one should have been sent separate so maintainers can pick it up.
> 
> The original patch [0] I sent had no dependencies and so Thierry picked 
> this up. However, when adding patch 2/2 here, I noticed a typo in the 
> definition for TEGRA234_MEMORY_CLIENT_DLA0WRB so thought I would fix 
> this up while I am at it.
> 
>> Now, it's not possible for me to pick this patch.
> 
> Yes now you cannot simply pick this up. We have had similar problems 
> before. I am not sure if it is easiest for Thierry to pick these up.
> 

And there is simple solution as I said - split the patches per
subsystem. Why the dependency was combining multiple subsystems into one?

Best regards,
Krzysztof

