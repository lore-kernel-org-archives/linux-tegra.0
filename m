Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9F4C001DE
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 10:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbjGYKUX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 06:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGYKUW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 06:20:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E51210CB
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 03:20:21 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9922d6f003cso914304266b.0
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 03:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690280420; x=1690885220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jIVNYaHHmeDQiXmoP9m789p3Mzn0tkwmSrMiWxE+uY=;
        b=CfsxZ9259skla4lUSHgp4lTpPTYElCjewiULtELpmzhpzegOTMrUaBaJ7OvAYXEVJK
         /pjs8RLYyuXyth4xF+5fYndWo2Om+b9t8VXOfZEMY5fWAS2uPZn3dxj4E1XnFJlFPZHZ
         ZeEHROCRal5I0OubsqBedHfYf1qjpOrKP75Svv+ZzL6rj+A16mZRZuPaTOYkStqLtj3c
         ETncB5auQfnoLJF5k+5QeaKNOl8gsK5O0MQ/h88iDtKU4xzvy2JfT6PQhzXUV8oOK/tQ
         kUwfOeVgdfQHlmZSFeSqeCuAGCA7UERCZhnRSkcg5OZR51SzLIQ770uFOgI3IXuKPSA4
         rWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280420; x=1690885220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jIVNYaHHmeDQiXmoP9m789p3Mzn0tkwmSrMiWxE+uY=;
        b=iowFq03wQ7yZm1tVN7ya2fvZ2iahqoIs8+j0oc5dQiGNlKLC1jjMO8CiFGYJ/9cMof
         E0mPjUQyAQg21t5N9OezgV16od5s1xTTk9RPxecfw7gZnnDKK9EQrTh+xPesbTJoh8Ss
         R6RIzhBNTueg3zUtjkAEwLrMUGguYw2vpe4crw/9ZuJBFUJO+9/Q6F1/Fd7ZcVCqAjug
         tIdfPkBt17fUvGOc7RZOphoW8HYY9XVcmemHlNU0CYxZNTzQ1ddFxC0bxvDYG6A9juuB
         84T4HqKTH50AS9IFj/GBA6B3eS1cOyosXpzD7OoMLmr1gtDoavwIxSUQqJOhsmG5VvGA
         djFA==
X-Gm-Message-State: ABy/qLbzJSKBbYuCXZhzLeTs8PZ5XDUuQ4PKM9k1C6LyCXP2zMtgV0X0
        nsfYJ1ayXhXGBq4GqKQSoGKw8GyVHLDYjmjByjY=
X-Google-Smtp-Source: APBJJlHY9X0+bqoFGop+ibsHnoN7/6ELpRtMC0j6aM2Jx6xFfYTFRrxPc5iTwGKP7zYcJICSUetA8Q==
X-Received: by 2002:a17:906:1059:b0:993:d6e8:2389 with SMTP id j25-20020a170906105900b00993d6e82389mr14174629ejj.26.1690280419992;
        Tue, 25 Jul 2023 03:20:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906855900b00993017b64a9sm7937211ejy.223.2023.07.25.03.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:20:19 -0700 (PDT)
Message-ID: <40b7765e-5e6a-dca9-980b-62123b3779bf@linaro.org>
Date:   Tue, 25 Jul 2023 12:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] memory: tegra: Add dummy implementation on Tegra194
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Sumit Gupta <sumitg@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230629160132.768940-1-thierry.reding@gmail.com>
 <1fd1d5d7-7296-0e62-9f65-7347ac0f0500@linaro.org> <ZKwCYjKXtuDsOF9E@orome>
 <1ebfbbec-d5cf-c6ac-2cf1-eab970903500@linaro.org>
 <cab267a2-28a0-969a-44cd-c87c8fe65218@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cab267a2-28a0-969a-44cd-c87c8fe65218@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/07/2023 12:14, Jon Hunter wrote:
> Hi Krzysztof,
> 
> On 10/07/2023 14:29, Krzysztof Kozlowski wrote:
>> On 10/07/2023 15:06, Thierry Reding wrote:
>>> On Mon, Jul 10, 2023 at 12:10:43PM +0200, Krzysztof Kozlowski wrote:
>>>> On 29/06/2023 18:01, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> With the introduction of commit 9365bf006f53 ("PCI: tegra194: Add
>>>>> interconnect support in Tegra234"), the PCI driver on Tegra194 and later
>>>>> requires an interconnect provider. However, a provider is currently only
>>>>> exposed on Tegra234 and this causes PCI on Tegra194 to defer probe
>>>>> indefinitely.
>>>>>
>>>>> Fix this by adding a dummy implementation on Tegra194. This allows nodes
>>>>> to be provided to interconnect consumers, but doesn't do any bandwidth
>>>>> accounting or frequency scaling.
>>>>>
>>>>> Fixes: 9365bf006f53 ("PCI: tegra194: Add interconnect support in Tegra234")
>>>>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>>>>
>>>> Applied with checkpatch warning. Please be sure you run checkpatch
>>>> before sending the patches.
>>>
>>> Are you referring to the Reported-by/Closes complaint?
>>
>> Yes.
>>
>>> I didn't include
>>> a URL here because this came from an internal test report and there's no
>>> corresponding public reference.
>>
>> Ah, ok, apologies for pickiness then. :)
>>
>>>
>>> I suppose I could've left out the Reported-by altogether.
>>
>> I think it is fine. Checkpatch warning is just advisory.
> 
> 
> We need this in v6.5 as a fix, because without this change PCIe support 
> is broken on Tegra194 devices. Would you be able to send as a fix for v6.5?

Thanks for letting me know. I'll send it soon.

Best regards,
Krzysztof

