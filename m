Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0929BC43334
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jul 2022 10:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbiGFKHQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbiGFKG7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jul 2022 06:06:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA9E252A2
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jul 2022 03:06:58 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y16so25021800lfb.9
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jul 2022 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o/JI08us7vL24f4s2bZjdnzknLcJKDlQAeiE558KAis=;
        b=KN0X8kX9WhJxJK4/kKMKHEZoc2zJhbOciZhqDlTpiqOahrwQy59NBTHG3BxxidxG7m
         67bhQWO1Fs7NcpSyyBgrGPymXr5wZkwBcziPGklMAb5E3NBvx/p9g/iqCxn6x/VJkm1A
         PmzjaLP3ZqbE1EVYUS8Lrv8UI1sopmhz7jP7IQxJBEaI2lleD6FRmwhphOaOICEJkKn2
         7zNsDlY4gdRINoYkfsphM3/92q3sySrWB+Av6pPfwsAKt/pc5IEOttCtubLBfbg3wE0O
         q1zWJU3oGo7cirC74MKe9oyKGNSnE4CmNIaHU+X4niYJ6RYwWySoawAQM2K9XMfWBAL8
         N88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o/JI08us7vL24f4s2bZjdnzknLcJKDlQAeiE558KAis=;
        b=eNu47pLLL/YxkER9HpHEtKOfJrk9Cq52cmv3J4OyEiixq5vVVO9RKiJAu5k19GikzF
         gwUoUjCMPjCYLVdPdjR++FPcDSxNIqkMtxHOM/E+InlhI/+/cQHtteXUSCWnH9m9tu1h
         l2yYs0aDLwX2L7ZMWdQXp217kIbja3PdbVsN80czf8z4xn3r84/4RbJwEYuyY0Ff06zn
         JjKD2u1l2ibGVZpTrzo7CvSCNZ/OrQ5vzyI+ogdQ1XxAjS1a/vcQ6w5dqsO+jtEtLNJD
         dtVztWc9e3Q/avcLS+t7Wx5wraQcnro+B3jPsxjxBF5C15PZVWyIouK3VRewLPd0+5TB
         DYkg==
X-Gm-Message-State: AJIora+GqyUiIxlru0vaUeTkT6loxUK5/AGr5GuEjrIQeK9kNi25Mh3G
        lt6n8gIsTEAktsrfKqTnOJImOw==
X-Google-Smtp-Source: AGRyM1uRSIf3VLsyNglEEsS5S8MByTBNN1VD5w4WP3bbUucHWwXC/emiIf6KMm+pT6aFgJzFoOJ9cw==
X-Received: by 2002:a05:6512:31d1:b0:47f:5d39:1d9d with SMTP id j17-20020a05651231d100b0047f5d391d9dmr25517702lfe.140.1657102015414;
        Wed, 06 Jul 2022 03:06:55 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id h4-20020ac250c4000000b00483e5f0192esm769001lfm.87.2022.07.06.03.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:06:54 -0700 (PDT)
Message-ID: <2829e71b-1769-ce24-f810-d63e619aa5f0@linaro.org>
Date:   Wed, 6 Jul 2022 12:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 02/11] dt-bindings: pci: tegra: Convert to json-schema
Content-Language: en-US
To:     Vidya Sagar <vidyas@nvidia.com>, Rob Herring <robh@kernel.org>
Cc:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, kw@linux.com, p.zabel@pengutronix.de,
        mperttunen@nvidia.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com,
        Thierry Reding <treding@nvidia.com>
References: <20220629060435.25297-1-vidyas@nvidia.com>
 <20220629060435.25297-3-vidyas@nvidia.com>
 <20220630210449.GA3283899-robh@kernel.org>
 <e971a557-3387-efcf-87ec-983b998c5e93@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e971a557-3387-efcf-87ec-983b998c5e93@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/07/2022 11:53, Vidya Sagar wrote:
>>> +  nvidia,bpmp:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    description: |
>>> +      Must contain a pair of phandle to BPMP controller node followed by controller ID. Following
>>> +      are the controller IDs for each controller:
>>> +
>>> +        0: C0
>>> +        1: C1
>>> +        2: C2
>>> +        3: C3
>>> +        4: C4
>>> +        5: C5
>>> +    items:
>>> +      - items:
>>> +          - minimum: 0
>>> +            maximum: 0xffffffff
>>
>> That's already the limit. Just a description is fine.
>>
>>> +          - enum: [ 0, 1, 2, 3, 4, 5 ]
>>
>> maximum: 5
> 
> Setting the maximum to '5' is resulting in the following error.
> 
> pcie-ep@141a0000: nvidia,bpmp:0:0: 4294967295 is greater than the 
> maximum of 5
> 
> Could you please help me understand why I'm seeing this error?

Trim your replies.

Why adding minimum:5 to the phandle? Rob said add a description. Nothing
about minimum.

Best regards,
Krzysztof
