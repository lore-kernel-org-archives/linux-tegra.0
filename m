Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2AFECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 12:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiJ1MxC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ1MxB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 08:53:01 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49EE1D5872
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 05:52:59 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id h10so3972861qvq.7
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SvMIyVrlfo0PpbnIiKoJgiYaRHpIFVaYpSA/Hr/fnK4=;
        b=ApG6HXRY3Xmw3jBNfYhpgBF+5HWTCTCb7v+aKr2BCJsRWKieCj5+OLT0KtgwJ7k0DB
         cS/YW6r/GVqVasapGU7ZW/AEdEhKVM6qv4x4S2LsKrXVXAzJHUGVXvFxAbi1Asd3fw4i
         K4BeNtEoC7LWjPbLyJQmW7Jb52NL9+8eJMV9qw+LeMVzSLvxgYKMp5P5Ku7l/tcQmal3
         6klkY1D0xRxtM2+o388eH4m4czmsEG3/rpQxBWm+myJ45Rq5ENSHaGie9V9VxTF4CZmb
         SoeD4L4hlp0Qhwk788zVD0ObzpqVCtuixcIlpynW1lCimERjwclK9hd8OlCb/M7x1+1h
         kfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvMIyVrlfo0PpbnIiKoJgiYaRHpIFVaYpSA/Hr/fnK4=;
        b=eTPxhKGldKmiCJ/tyNNN5sYzil+qm5m2n/d3t/AIEDN0701VzAucmdCQeHKKyJpKEI
         axPAFeZtywIpaodWoTaypZ7W2VkgONEYjdtg0hhEFwbRXZKJWVT6E1XjRX0kMYwNyO5x
         XZjibKDlVmb+gLmQLhiJ0v6ds6SuEL8mWc/7uyrnItN/9rmBKt2d70klvLcXj6ncyKyX
         srQjKJmCC5GgEVzU8lofDND7IlvFiLAZy8fQ5l2lsP6XeYLaG7SVEJ8ehF4koCzj4+TJ
         yx0vtNG+cFSQ3bhxeVqej5JLC/E0OI/7A/wYT9fLmV9yQ/5lOHoxUax/tQoO0/kFB0+h
         cW8A==
X-Gm-Message-State: ACrzQf3fa6lfeCSlY4+/4SCFGukv4JHD7Qcwiu93pq8+GA/y0OmmE3B/
        18vC0Nw3c0/8lHMIG8pwCkb6YYHtEIHniA==
X-Google-Smtp-Source: AMsMyM7NZUJbRL3RhB7eEJMFnW4vuxNDkSL7kCSrHLMyPoPgahOvBZv3KdQ1EFEgrSHVL82Kq/tHoA==
X-Received: by 2002:a0c:b295:0:b0:4ba:b9b4:5159 with SMTP id r21-20020a0cb295000000b004bab9b45159mr32471128qve.19.1666961578957;
        Fri, 28 Oct 2022 05:52:58 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id l20-20020a05620a28d400b006ce813bb306sm2898090qkp.125.2022.10.28.05.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 05:52:58 -0700 (PDT)
Message-ID: <c1465ec3-a903-f1d1-621f-2cbe95ae53e7@linaro.org>
Date:   Fri, 28 Oct 2022 08:52:56 -0400
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <073073ae-d921-e11f-8ff4-67f1a61760d0@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28/10/2022 08:51, Jon Hunter wrote:
> 
> On 28/10/2022 13:46, Krzysztof Kozlowski wrote:
>> On 28/10/2022 08:37, Jon Hunter wrote:
>>> Add the memory clients on Tegra234 which are needed for initialising the
>>> SMMU for the Deep Learning Accelerator (DLA).
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>   drivers/memory/tegra/tegra234.c | 160 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 160 insertions(+)
>>>
>>> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
>>> index a9e8fd99730f..9bdaf8af8c97 100644
>>> --- a/drivers/memory/tegra/tegra234.c
>>> +++ b/drivers/memory/tegra/tegra234.c
>>> @@ -170,6 +170,166 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
>>>   				.security = 0x504,
>>>   			},
>>>   		},
>>> +	}, {
>>> +		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA,
>>> +		.name = "dla0rda",
>>> +		.sid = TEGRA234_SID_NVDLA0,
>>
>> This is now not applicable because you sent dependencies separate, mixed
>> with other subsystems... Split pieces based on subsystems.
> 
> Sorry I don't understand. This patch is dependent upon the first. I have 
> not sent anything separate.

You sent mixed between subsystems patches adding TEGRA234_SID_NVDLA0.
That one should have been sent separate so maintainers can pick it up.

Now, it's not possible for me to pick this patch.

Best regards,
Krzysztof

