Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DBDC43334
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jul 2022 08:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiGLIYf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jul 2022 04:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiGLIY0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jul 2022 04:24:26 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEFE564DB
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:24:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bf9so12661806lfb.13
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m7hedtSWDQ867s7l5qfIKehJj9CfNd+4IkEiHaNTlmc=;
        b=qk506d1CKhKHsHR4QkR5XzX0f1UElblecNgNQffqwJkmWs/xoGnzMw+TyJlflsHR50
         Tauue7Gth9gquFTWcFJqB0nZb2b+4YKxBq81qMoQL5+algmi1ZVtSmp5BjPzDQThVc4u
         4Tby+Ve4FfTWXOwLoSiaU9wYZEDX3SHOStzjI9LLZsSuEIkFySkJKdoHMXgnPqvZfi3m
         MZlRoepQm5eCTnjjzKmEPCmFkUkKxQZJU/o1f1CC8a2eXShhJdhrbZPXy7alnEn8jkU7
         sxe9W9yGrISE1SdgPFDs7H3UgSxqbWRhV5/w7hcnTlbH0sn8X3OVVzyXvvwdZ1NvdmaE
         Jr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m7hedtSWDQ867s7l5qfIKehJj9CfNd+4IkEiHaNTlmc=;
        b=l1eKNaPN4uVSolEZyvQqb3saoPW5VP9gtUOQmsxtQ3AtGMfECPgZBzU/R3X3Fbz7Ar
         oJnX/sJo+sucf3D5S5FKFL5Ac2KfrZgldpF1w3PtpSLyveEh4JDQhTA3EVX7ImpqlMKj
         fggxfs+y2fRf5kZRpn9mqifL+ilWnGfA2IOHRjplBbXgF7QlB81vQYuXk6fceZrGgqsB
         AzDROco5vHA6mQdUzvFTuv/5y9kh51X5NIxDp+m11fMxo+lIlBGfl/VxQl8lMix+pFID
         JW4ru2JcsSvtE1AawoL2OEYkiqoRsdDnuwh0avWAlLr8E9jcg8cW+OsVzO579TiY3nM/
         fz8Q==
X-Gm-Message-State: AJIora+OaMTq/kFnWIyyKUR/dKEC1kYKQ+URg1ULfhKBMJ2hIkU4KbsK
        merLGaUIzVlMR6Ja7W3GI3HpRg==
X-Google-Smtp-Source: AGRyM1tXimD+CV4nNwGxeFKbgccG6uDU5XfBWdeD3xfgzgajnY/UiGmn85KfU7rmVNcwSJD0bJyzdA==
X-Received: by 2002:a05:6512:3d8a:b0:489:c93c:5970 with SMTP id k10-20020a0565123d8a00b00489c93c5970mr11310121lfv.575.1657614263171;
        Tue, 12 Jul 2022 01:24:23 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id a28-20020a2eb17c000000b0025d3c2e6b8dsm2215853ljm.105.2022.07.12.01.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:24:22 -0700 (PDT)
Message-ID: <d7970587-d403-4c7e-f00c-3a304c2688cc@linaro.org>
Date:   Tue, 12 Jul 2022 10:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/5] dt-bindings: arm: tegra: nvec: Convert to json-schema
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Dietrich <marvin24@gmx.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220711152020.688461-1-thierry.reding@gmail.com>
 <20220711152020.688461-3-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711152020.688461-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/07/2022 17:20, Thierry Reding wrote:
> +---
> +$id: http://devicetree.org/schemas/arm/tegra/nvidia,nvec.yaml#

Same comment -> under soc.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA compliant embedded controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,nvec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: divider clock
> +      - description: fast clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: div-clk
> +      - const: fast-clk
> +
> +  resets:
> +    items:
> +      - description: module reset
> +
> +  reset-names:
> +    items:
> +      - const: i2c
> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

No need for ref, standard property (from core schema).

> +    description: frequency of the I2C bus
> +
> +  request-gpios:


Best regards,
Krzysztof
