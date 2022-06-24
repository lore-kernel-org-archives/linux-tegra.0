Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5B1C43334
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jun 2022 17:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbiFXRMq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jun 2022 13:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbiFXRMp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jun 2022 13:12:45 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAE7522E6
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 10:12:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q9so3953632wrd.8
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=S1enbfspzMYdsg8aLcCCE6tVeP2Nz6635Lj1zrxNDvo=;
        b=fTK+IFWkefY1750lr/cELH860S2T1skNE/I48GKN1yHBXl5MnjftqDuw4DBNfrRL4e
         8PqoLq3x+vFEW+pUf8bz9WWSrvD7YwmyCdKwg2h96SFAPYdGJZCSAiJ/hC8xhzPqpBJv
         jvOznwmQT5fCL67U+XjRXztPqJIRI4UIgY0F4yQ45LaJtHCoShb+3uqdvm984lTdjWb2
         YBvjd4YRFKI8nKvzmiM/+o1VsGoSGe2Bj8jw98dd/6so7pX5oHZoSiEHAJ0j3C3KH2S1
         hz/nfxnmp+bd/XHxpBRN9uzCdSiKJVf4tBwz0gRnApaP4p5yUUMgktxeIwOGcqLl82sz
         3yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=S1enbfspzMYdsg8aLcCCE6tVeP2Nz6635Lj1zrxNDvo=;
        b=Oui4hfRWwMFJ8ntnOzn0TCx+55KQRaajHaXj6AorydaTMO7yx1egCUq5JjTt+6srEl
         f5Gl41QeB6vXUbB+VEajHCEJwDC0JMJSJ2dotaMjeK7Iel/FvvibU3CB2wjFKPVIEERO
         CFB28QWh9Y0sTla+8fDmuV38gC2Qt5Ch6WPg/BzKRTgptTggcXZwFY7z2kEgTiA9BUFP
         XledpnKzFwkks7IYpmnYpYz0bbfBnaSACY6Jqx9BtKLI3JNtG7mz3v47ADcaBNJu+Zns
         43PCnIQg6n4NrRawJpNN/Sk8ls0O/DVB3BSboVjI/RQqrTPlG/7av+7DC2R+X2uWHbi0
         g47g==
X-Gm-Message-State: AJIora/bQRnz7gmQsEQDPSlsxd5sVNIVVjNgA81blYAZhJPaxfKGmDLj
        LIWZ2fZtU7jBEo3pYabgVWdBhw==
X-Google-Smtp-Source: AGRyM1ukgR0OpkdFo6A2uHwXamZLQR8RW4cLRijXAiSEjqw/+r2pulA3xRBZgK7698u6EU50UchjKA==
X-Received: by 2002:a05:6000:223:b0:21b:b95e:a522 with SMTP id l3-20020a056000022300b0021bb95ea522mr196783wrz.46.1656090762538;
        Fri, 24 Jun 2022 10:12:42 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h6-20020adffd46000000b0021b96cdf68fsm2770955wrs.97.2022.06.24.10.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:12:41 -0700 (PDT)
Message-ID: <d8fa1d0e-99cd-9bcf-3e17-7673553c875e@linaro.org>
Date:   Fri, 24 Jun 2022 19:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH net-next v1 2/9] dt-bindings: Add Tegra234 MGBE clocks and
 resets
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, kuba@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, Thierry Reding <treding@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com>
 <20220623074615.56418-2-vbhadram@nvidia.com>
 <53e8aa2f-f5f6-43d9-c167-ec5c5818dfb0@linaro.org> <YrXkpiaxqjzJdaL9@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YrXkpiaxqjzJdaL9@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/06/2022 18:21, Thierry Reding wrote:
> On Fri, Jun 24, 2022 at 06:02:58PM +0200, Krzysztof Kozlowski wrote:
>> On 23/06/2022 09:46, Bhadram Varka wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Add the clocks and resets used by the MGBE Ethernet hardware found on
>>> Tegra234 SoCs.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
>>> ---
>>>  include/dt-bindings/clock/tegra234-clock.h | 101 +++++++++++++++++++++
>>>  include/dt-bindings/reset/tegra234-reset.h |   8 ++
>>>  2 files changed, 109 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
>>> index bd4c3086a2da..bab85d9ba8cd 100644
>>> --- a/include/dt-bindings/clock/tegra234-clock.h
>>> +++ b/include/dt-bindings/clock/tegra234-clock.h
>>> @@ -164,10 +164,111 @@
>>>  #define TEGRA234_CLK_PEX1_C5_CORE		225U
>>>  /** @brief PLL controlled by CLK_RST_CONTROLLER_PLLC4_BASE */
>>>  #define TEGRA234_CLK_PLLC4			237U
>>> +/** @brief RX clock recovered from MGBE0 lane input */
>>
>> The IDs should be abstract integer incremented by one, without any
>> holes. I guess the issue was here before, so it's fine but I'll start
>> complaining at some point :)
> 
> These IDs originate from firmware and therefore are more like hardware
> IDs rather than an arbitrary enumeration. These will be used directly in
> IPC calls with the firmware to reference individual clocks and resets.

If they are actually shared with firmware, it's fine. Thanks for
explanation.

> We've adopted these 1:1 in order to avoid adding an extra level of
> indirection (via some lookup table) in the kernel.

This if fine, but some folks (including myself once...) define in
bindings register values and offsets without any actual need. I was
afraid that's the case here.

Best regards,
Krzysztof
