Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851CCC433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Mar 2022 08:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbiCVIsR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Mar 2022 04:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbiCVIsI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Mar 2022 04:48:08 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CF34C417
        for <linux-tegra@vger.kernel.org>; Tue, 22 Mar 2022 01:46:41 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B2AE3F1DD
        for <linux-tegra@vger.kernel.org>; Tue, 22 Mar 2022 08:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647938800;
        bh=Ns6x5qMhMdYQ14F/6CRmR+MC5tPxoh9wJPntlRcRYM8=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=wUFtA8l+E8nk2aaP2/RCRT4b863ouogexQKsEbMTKmzw6LLZznKAqoMuaThBRUVHm
         IvHmuci/Jl8ArcRy6Jein6ySuOmDDOJ8VxYIgkOeR3W9L8hhq+k+nTZv0d3gU6orm+
         gGtWKAMFa/GUYEHp/1p31eBadThPLAmqSXCG9UePcZCOqarJS1rn6LwwJ41Vb58HwS
         L8eqRx5MIjaweFRHTQM3IzHR2hhCwZeJ40AVMTLBLzQ9Wl2u8smwMJVC3lo3gu2QE3
         yJ0pXAdyoXcZguM3Jo7ieZhavOemtSD8fArEC5ktV7kPe42tJcKQ35d7KWAfbIzTwO
         0xSJHX10CcxEg==
Received: by mail-lj1-f199.google.com with SMTP id v9-20020a2e9909000000b00247ecf60956so7208819lji.12
        for <linux-tegra@vger.kernel.org>; Tue, 22 Mar 2022 01:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Ns6x5qMhMdYQ14F/6CRmR+MC5tPxoh9wJPntlRcRYM8=;
        b=el+DEyHFP9pdxqEVxUqsWlQwb0M6iHJvVdulVLiVpwEQPDdb0DOrVidVUIC0VbIYm+
         KxVVeU2NQ4buRDJY+bjSmtZRg4JA3rPvPmc1hrnBkTRdRJwd+xa2T8VC8FvgpmEGvbM8
         xmyGbqtdC2hB1UTBwb73SXZHWwSG1TS7CJRFJ4ZhQHTMJym7qAcIzecLnugAdAVhTKC+
         rgjRMjTyPnKuLXd6E1wL5COU2SgN4B62bhbKVqLht+aaIhVHG9KNfmu7/mlVIGL8nrgC
         lIw2xL7hdOar4BDtf/3yBwLJdIotf76YvasZsgZovi93gtzaEtGFG6ZSv7oT3CpUgFmt
         D7bw==
X-Gm-Message-State: AOAM532Rflc0FWzR6h8ZAi3qcgBMeqxMwDjZtOdmC1Jk6u0xaUCKsROg
        s0V/1NgqUK+oKlek5n3wnDmddenMf+r3po5Gs/AyeODIp5JovtOEvP1qoFFqir3ANvawIXLt8jv
        OJ8P23lyLrzsB0P9Jk8zbK4NaG5C2nhlnjuqo17Nv
X-Received: by 2002:a5d:47a7:0:b0:203:d1b4:8f6 with SMTP id 7-20020a5d47a7000000b00203d1b408f6mr22185081wrb.36.1647938788911;
        Tue, 22 Mar 2022 01:46:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhYewicFouwHmI7LoZatc4e5+uyx8QH11LnUERCGbNVF6UFm3eYkF8CEUxLw1D82wG8LV7FA==
X-Received: by 2002:a5d:47a7:0:b0:203:d1b4:8f6 with SMTP id 7-20020a5d47a7000000b00203d1b408f6mr22185047wrb.36.1647938788647;
        Tue, 22 Mar 2022 01:46:28 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0038ca92f175csm2416313wmq.32.2022.03.22.01.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 01:46:27 -0700 (PDT)
Message-ID: <13878c88-487b-2546-0af8-3031fdc8e308@canonical.com>
Date:   Tue, 22 Mar 2022 09:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] dt-bindings: clock: drop useless consumer example
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jesse Taube <mr.bossman075@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Alexander Shiyan <shc_work@mail.ru>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20220316130858.93455-1-krzysztof.kozlowski@canonical.com>
 <20220316130858.93455-2-krzysztof.kozlowski@canonical.com>
 <YjjCpQ9vwFoEmFFi@robh.at.kernel.org>
 <ca6c4fe5-93c5-9ad4-0c9f-86ec3213d44e@gmail.com>
 <a8290aa4-8a2c-68c3-bc55-82abcd27385e@canonical.com>
In-Reply-To: <a8290aa4-8a2c-68c3-bc55-82abcd27385e@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/03/2022 09:45, Krzysztof Kozlowski wrote:
> On 22/03/2022 02:45, Jesse Taube wrote:
>>
>>
>> On 3/21/22 14:23, Rob Herring wrote:
>>> On Wed, Mar 16, 2022 at 02:08:58PM +0100, Krzysztof Kozlowski wrote:
>>>> Consumer examples in the bindings of resource providers are trivial,
>>>> useless and duplication of code.  Remove the example code for consumer
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> ---
>>>>   .../bindings/clock/bitmain,bm1880-clk.yaml           | 12 ------------
>>>>   .../devicetree/bindings/clock/idt,versaclock5.yaml   |  7 -------
>>>>   .../devicetree/bindings/clock/imx1-clock.yaml        |  9 ---------
>>>>   .../devicetree/bindings/clock/imx21-clock.yaml       |  9 ---------
>>>>   .../devicetree/bindings/clock/imx23-clock.yaml       |  9 ---------
>>>>   .../devicetree/bindings/clock/imx25-clock.yaml       |  8 --------
>>>>   .../devicetree/bindings/clock/imx27-clock.yaml       |  9 ---------
>>>>   .../devicetree/bindings/clock/imx28-clock.yaml       |  9 ---------
>>>>   .../devicetree/bindings/clock/imx31-clock.yaml       |  8 --------
>>>>   .../devicetree/bindings/clock/imx35-clock.yaml       |  8 --------
>>>>   .../devicetree/bindings/clock/imx7ulp-pcc-clock.yaml | 11 -----------
>>>>   .../devicetree/bindings/clock/imx7ulp-scg-clock.yaml | 11 -----------
>>>>   .../devicetree/bindings/clock/imx8qxp-lpcg.yaml      | 11 -----------
>>>>   .../devicetree/bindings/clock/imxrt1050-clock.yaml   |  8 --------
>>>>   .../bindings/clock/nvidia,tegra124-car.yaml          |  7 -------
>>>>   .../bindings/clock/nvidia,tegra20-car.yaml           |  7 -------
>>>>   16 files changed, 143 deletions(-)
>>>
>>> Doesn't apply to my tree (no imxrt1050-clock.yaml), so
>> merge against linux-next I can submit another patch if needed.
>>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Let me send it after the merge window - all dependencies should be there.

Optionally this could be picked up by Stephen/Michael (clock).


Best regards,
Krzysztof
