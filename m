Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4CFC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Jul 2022 06:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbiGGGxi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Jul 2022 02:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbiGGGxi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Jul 2022 02:53:38 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367A82CC94
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jul 2022 23:53:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m18so11076125lfg.10
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jul 2022 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mt7zIclzGYwiZtrdDDRxf+U0w9aqap2nhLKvDAss8Mw=;
        b=lgZ9SC3QhzW82Gje3PKw/6IDYppvXW6kp7PSJeCAvEtWxnv6GIYAo06xvSRoPH4vJa
         I1TOl2/tE4KFqrrvhpD4kGZ3X3o7juqMFVfwtv/k3HoMAUEm6P1GlEhQvf34qv966KoA
         iHmOI0ECROGSx91SbNWcbWYxIZlHqE2d41D3qnXkwqnO2IKFx7hsF7GVKW09H87z04YF
         DMJSF8ckU2O4emC9UqGfvqY9ybC0usgGA5E3iQzmiuE3guth2VSIsJjVyptCbsgya6Hm
         p3zAiyPg6ZLgEpYapTBaKe//26LJKfUOlpbARa/N0q//mQ6MM5ZQIXsNpFNJZVEwc1E0
         8JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mt7zIclzGYwiZtrdDDRxf+U0w9aqap2nhLKvDAss8Mw=;
        b=sDR8KUC8XOw/lUcHWU+RjATAi0ZPbuL1nqw75wEAH/qx2MoZcHIlpgruTM0CKIVDGP
         X1MhlDkmgZANUcuXVN8aKUnppiJrhoCgLlvv+37uZTKd7aRmUfB7nsaMzOHYHvLtkC8F
         R1Ld9gWjeSAmTI1cT5IVeDkx++aA3iN+aNyXNvEwUKFpXDSmP0LVZjOeyuU/42qOxee2
         4jElLCx3UARXtOYLpQIWqzqPGpz77AZ9dujgdnX2W4jbuXgo8tsVFgSlGDAxKTa4UYaT
         QY+9SzUAsFI7V7DMwXS3HDzOMMGzojGflsZ5ExxDYhW4vA27Hauny5QWm1w6T2SOWM2/
         ooSA==
X-Gm-Message-State: AJIora9U4gKms/BIxDwtcR6sBTu2Xj/MHXLGFut9GUGX/EzPk1mxhPLb
        4+hzkOpp/CXAJlpc76uqvDIQsA==
X-Google-Smtp-Source: AGRyM1vUxKVCvQTTNhom6XBQrzdSmST4HFRlymepgf9hEeHqiMzRJHyaK/fTR4aqUKPh89ZUf1kPXQ==
X-Received: by 2002:a05:6512:3f1c:b0:488:8c74:5f2f with SMTP id y28-20020a0565123f1c00b004888c745f2fmr993562lfa.285.1657176814570;
        Wed, 06 Jul 2022 23:53:34 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id m10-20020a19710a000000b0047f68b11329sm6643797lfc.266.2022.07.06.23.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:53:34 -0700 (PDT)
Message-ID: <173a9087-6a55-13f8-3fc9-897c7f51a09e@linaro.org>
Date:   Thu, 7 Jul 2022 08:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/9] dt-bindings: net: Add Tegra234 MGBE
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>,
        Bhadram Varka <vbhadram@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org
References: <20220706213255.1473069-1-thierry.reding@gmail.com>
 <20220706213255.1473069-6-thierry.reding@gmail.com>
 <1657169989.827036.709503.nullmailer@robh.at.kernel.org>
 <YsZ6fus1yNcf/H/Q@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsZ6fus1yNcf/H/Q@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/07/2022 08:17, Thierry Reding wrote:
> On Wed, Jul 06, 2022 at 10:59:49PM -0600, Rob Herring wrote:
>> On Wed, 06 Jul 2022 23:32:51 +0200, Thierry Reding wrote:
>>> From: Bhadram Varka <vbhadram@nvidia.com>
>>>
>>> Add device-tree binding documentation for the Multi-Gigabit Ethernet
>>> (MGBE) controller found on NVIDIA Tegra234 SoCs.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>> Changes in v3:
>>> - add macsec and macsec-ns interrupt names
>>> - improve mdio bus node description
>>> - drop power-domains description
>>> - improve bindings title
>>>
>>> Changes in v2:
>>> - add supported PHY modes
>>> - change to dual license
>>>
>>>  .../bindings/net/nvidia,tegra234-mgbe.yaml    | 169 ++++++++++++++++++
>>>  1 file changed, 169 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Error: Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.example.dts:53.34-35 syntax error
>> FATAL ERROR: Unable to parse input tree
> 
> This is an error that you'd get if patch 3 is not applied. Not sure if I
> managed to confuse the bot somehow, but I cannot reproduce this if I
> apply the series on top of v5.19-rc1 or linux-next.

Patch number 3 does not apply on v5.19-rc1 or linux-next, so maybe the
bot (which applies on rc1) did not have it.

Best regards,
Krzysztof
