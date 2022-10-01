Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F90BC433FE
	for <linux-tegra@archiver.kernel.org>; Sat,  1 Oct 2022 09:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJAJxS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 1 Oct 2022 05:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiJAJxQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 1 Oct 2022 05:53:16 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494CD264A0
        for <linux-tegra@vger.kernel.org>; Sat,  1 Oct 2022 02:53:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x29so7146341ljq.2
        for <linux-tegra@vger.kernel.org>; Sat, 01 Oct 2022 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+fwQkzZtZvFhlS36WSaA8A0o1uHH5KL2v22rtnfJVo0=;
        b=Dcf5IwtiORX2shCUqlw1jskx3rBmc5N/0owLULlFHwKmjpPhadoA9AqvkcUY+Q0Qu5
         S2K4/RZre5oOnzDxdDogusYgL6QfykS0jkvo9haoRvzaBPNrPQUHmLOKMPxSLRGcmZ2G
         cSGbN51t/dg+bgd2BpRKbQ7P79ADb3rrZXuQkuP/rIojSjvIZG9rUfO71Q0UkzsM1M6Q
         RQugJfrXQr50BVzh0Ggxdkdzehbz9rfxWs6vYOBmaykN1wcYqZO+2fvbNt5Ikyvc5X36
         5/T4g+0rN7DlxoXUCVBUTSUykKw+iYfhRqLXWcSxuot/3JoQ60KCz2lL3xw5hQfah/wS
         f/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+fwQkzZtZvFhlS36WSaA8A0o1uHH5KL2v22rtnfJVo0=;
        b=5bZyMs0fST18eI7UOfBVbQs+zxezJwwGPXnc4tkcfo1e5551OGAUh1IDDZTdjgWIS1
         d5WNyaxrTK4TectdgkAIYAiAmFxr9bMOdjxr2GaGwmV3GG45n0H+7hazPp9dRb9tlKpe
         j+yyqNUwVHpUdGBt30IcYtmZVbFZhCvwclfyJSLHUxWvz5NXPutUC9SWOZN91JaprSU/
         T1wUT8L59eyjaknfTmzK1yrkY6xvk8wAv6Yj6HmN9hvMRvfAQwUwzOUsRUBeMMt2fJDx
         H5O2thi+5l2I+zIdHBh8WyR7rDrrrzvIMXhh3020r+xMBgKWi3BG8JMbDwelCgrSlL52
         1y8A==
X-Gm-Message-State: ACrzQf2JgUG6BOd2jNgmV9DDftR6Iw8335kroUEpgSQH9Vu+0q4BaGSx
        kvcMqNQDq3EHTl79Dj2HRPVNDQ==
X-Google-Smtp-Source: AMsMyM4q/BqTTKBc7GlqDk9EYxZQnJkVjNhRfDFBSRu8EDT0FNzEZxWm43M2tLKgCgbF1WY/zW0aKA==
X-Received: by 2002:a2e:a54c:0:b0:26c:6972:ccaf with SMTP id e12-20020a2ea54c000000b0026c6972ccafmr3783882ljn.11.1664617993685;
        Sat, 01 Oct 2022 02:53:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be25-20020a05651c171900b0026c1cbbf461sm392126ljb.80.2022.10.01.02.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:53:13 -0700 (PDT)
Message-ID: <a6b78a66-14ef-68bb-25df-2c2eb118a7d3@linaro.org>
Date:   Sat, 1 Oct 2022 11:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, sam@ravnborg.org,
        airlied@linux.ie, daniel@ffwll.ch,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
 <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org> <YzbPz8mL0Yo+vgSS@orome>
 <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
 <20220930211424.GA913368-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930211424.GA913368-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/09/2022 23:14, Rob Herring wrote:
>>>>> +		dc@54200000 {
>>>>> +			status = "okay";
>>>>
>>>> You should override by labels, not by full path.
>>>
>>> Why exactly is that? I've always stayed away from that (and asked others
>>> not to do so, at least on Tegra) because I find it impossible to parse
>>> for my human brain. Replicating the original full hierarchy makes it
>>> much more obvious to me where the changes are happening than the
>>> spaghetti-like mess that you get from overriding by label reference.
>>
>> Sure, it's entirely up to you. I forgot your preference.
>>
>> But it is a really nice way to have duplicated nodes and mistakes (which
>> happen from time to time).
> 
> We could have a schema or dtc check for that. We already warn for 
> duplicate unit-addresses which would catch some typos. Checking for a 
> node with only 'status' would probably work when that's the only 
> addition. Maybe status without a compatible would be better? We also 
> check for nodes without a specific schema, but child nodes in schemas 
> aren't handled.

Usually these are overrides of few properties and status=okay, so
looking for nodes without a compatible would work. Except for all the
cases where we do not have schema yet...

Best regards,
Krzysztof

