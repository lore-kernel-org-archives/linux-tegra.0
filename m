Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66F9EB64D9
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Jul 2023 15:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbjGJPOA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Jul 2023 11:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbjGJPN7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 11:13:59 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D48A7
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 08:13:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3142970df44so4413524f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689002036; x=1691594036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85ipMnKhTmCRR/+ctL9Ale6MVh3KnIeTA4oNiNxzq0Y=;
        b=ZL1I+X9kQ2ElwDmG+AEK8KwT/B08w/my8Sc4CIOHtVXTwmQ+PgCzzFJZ3Akw2b3y3T
         1fnzKN5De4XH/rii8aIyjr73nPV2T28m7SZ2fCN2RHnnhWQlkGaA9R+/rPAyUrsqjsXV
         VsAXMW2D8OlEfiPvhovXj47rzAu0Unx5urxgY/u6fxTUrilLOAq7wmavdMr1bkb+JIxt
         zVNEDySJWILQPgM1DJAHSdMOwDmDJatkQBQrsjhkDumSpBw40PtY0tZpViOIVZz+Vh+B
         CcOuj7FvNWveG1KXUD4UFxU6CAa1jGrSfaV3bI97KaGKRLEJOl8DjrPHo83nd0CXDLJ5
         1UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689002036; x=1691594036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85ipMnKhTmCRR/+ctL9Ale6MVh3KnIeTA4oNiNxzq0Y=;
        b=g70RVyRe6RfieFmxeiWwlhP1/SW6qR6UjbW2Ednjot9R5N09ImFf+kKymrK7u3HMxs
         XIBitQLgQZXKXn62ox5TvvVQRrBXJ1i3s3h8bQB3QlUVBiPLLYlj61JYDxjzoguo8/Cq
         roQCBynrLeutRFWZpl4x3srCjyCYuMFgmUwIwTTUvT4wYFmKXbDmzGZUnT+Lik+sqG5I
         mLfApevrxcL2ui3u+IU65N3bpLAlgabL4Hnk6pheL2ESrH0p3O8lSw4ME1Wyx/fhKUp6
         XYr3/KaXQbMY2+AgjLCCUmU2ZiHF4gDpsQmtp6lGaOc9BgjJexH4EY7Qhh8HgtSyg+Aw
         W5Sw==
X-Gm-Message-State: ABy/qLbSLztEPYx93e1AM+lsH4JyYqW3mMz9ID6ZhzBKHG41lQ316feg
        sabIsuY92mYyQ0i2G6E8DlayPA==
X-Google-Smtp-Source: APBJJlGNw8LoIwWE17CDwj/ZPC8coYJt6YKpgmsEOFoHFqk4VAZJrlyE7FZLzg584jpHlBes6qR02Q==
X-Received: by 2002:adf:e0cf:0:b0:314:4bf5:2c73 with SMTP id m15-20020adfe0cf000000b003144bf52c73mr636696wri.64.1689002036327;
        Mon, 10 Jul 2023 08:13:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s26-20020a056402165a00b0051df1797222sm5805120edx.11.2023.07.10.08.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 08:13:55 -0700 (PDT)
Message-ID: <a184cf8c-19c1-e2fe-d4f4-adeaf0b8d42e@linaro.org>
Date:   Mon, 10 Jul 2023 17:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: thermal: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230707133333.2998802-1-thierry.reding@gmail.com>
 <d6386a66-4cc2-9358-e65e-b09e614800c3@linaro.org> <ZKwW58xHD0cGfxvM@orome>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZKwW58xHD0cGfxvM@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/07/2023 16:34, Thierry Reding wrote:
> On Mon, Jul 10, 2023 at 10:09:18AM +0200, Krzysztof Kozlowski wrote:
>> On 07/07/2023 15:33, Thierry Reding wrote:
> [...]
>>> +          nvidia,cpu-throt-percent:
>>
>> Missing type
> 
> Isn't this already taken care of by core/property-units.yaml?

You are right, I did not notice unit suffix.


> That has
> anything matching "-percent$" marked as int32-array. I suppose I could
> override this with just uint32 to narrow it further down, but I was
> under the impression that overriding standard properties this way was
> frowned upon.

Yep.

Best regards,
Krzysztof

