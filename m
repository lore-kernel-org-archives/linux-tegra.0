Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE6FC64ED6
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Feb 2023 08:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjB1IPS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Feb 2023 03:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjB1IPR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Feb 2023 03:15:17 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F158829E1C
        for <linux-tegra@vger.kernel.org>; Tue, 28 Feb 2023 00:15:15 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r18so8784543wrx.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Feb 2023 00:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677572114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azxM/SMAWi+5Y+8kP4W8b45r/c639Rvk9h64PbJkv1E=;
        b=EzHU25BuMEUwIZo0ZM03zEoP1TDcjArIY7QjyqP7DDk64d455X7mVS7BLjjjX7RRZJ
         D6tRQdZ24N4rWhI037MwGUvOVAysjBvfRlnRfU3Sz0M6xUhowA2MDKy3QTMDiVOyDchi
         /uM/7RFfR5r+z300QeyaYfIcJnnLImMqnsxQVa7WISDrzMMAbCSaP95ZFx7TurlpMSaJ
         Bx+0Ysds+l6+RiqqTy5iXl2E+rvSl2AXxmffRQAkooFZ70VZkbSh5bohvxxjk9M0fLrk
         duguOisYvwhECBnF+hhJL1nXHkfkTLt0vJ0pNm5WqQs+cRj+LeeeqT8ZI3UgxFpsbciH
         1BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677572114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azxM/SMAWi+5Y+8kP4W8b45r/c639Rvk9h64PbJkv1E=;
        b=bHD4A0nQHy6Fb2DuK2dGzf+z7q3OnkY/YHR+frqgSWpQNK8Ha8txC7/xYC9FYs+Kue
         EdA4f04h09HoSn8nQnxkJ3rX2P0abd/ghGuybBFpq0XOlAyYnvmvWuu5XBXRqb+Y8tGF
         cacLT/L4XdfpS69AC0Rr4/8DlmSNfdZd6DDqADPgbOvg8bbzCA5KY+k4qatxZ7Mmx8dT
         301qN2ooCLFqqV1buO6Zey26TCTrGDCDUCz3cbSGIaf3kM/5UpVEE5qaE/pV0DFril+n
         KHOZ7hjzeMtniwU/lyZDyUpqoRHmNgQNQtl9mtmSqiiQaJWg4uHkpixjfC8/TVV4Ef2l
         HT6w==
X-Gm-Message-State: AO0yUKWKHRoK/I8iJpM403QULvPac12Run9qpYRhfeR+NWL9CKRh6+4P
        X+16z/UN3FHHYZo0LA8EP5wElA==
X-Google-Smtp-Source: AK7set9Am2h32Fsn/6toLjOljad6mPQ8tBB42OOqm1NJP0uXtXTRRGqgQTSUfJQyXOdmgvWImFuqIw==
X-Received: by 2002:adf:f204:0:b0:2c7:76a:31ff with SMTP id p4-20020adff204000000b002c7076a31ffmr1700105wro.18.1677572114389;
        Tue, 28 Feb 2023 00:15:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x6-20020adff646000000b002c56046a3b5sm8891695wrp.53.2023.02.28.00.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:15:13 -0800 (PST)
Message-ID: <43fb6355-9a94-fabe-156e-8706ece97f9f@linaro.org>
Date:   Tue, 28 Feb 2023 09:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 03/10] dt-bindings: sound: nvidia,tegra-audio: add
 RT5631 CODEC
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-4-clamor95@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221183211.21964-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/02/2023 19:32, Svyatoslav Ryhel wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add dt-binding for RT5631 CODEC.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> new file mode 100644
> index 000000000000..b347f34c47f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra audio complex with RT5631 CODEC
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: nvidia,tegra-audio-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: '^[a-z0-9]+,tegra-audio-rt5631(-[a-z0-9]+)+$'
> +      - const: nvidia,tegra-audio-rt5631
> +
> +  nvidia,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source. Valid names for sources and
> +      sinks are the pins (documented in the binding document),
> +      and the jacks on the board.
> +    minItems: 2
> +    items:
> +      enum:
> +        # Board Connectors
> +        - "Int Spk"
> +        - "Headphone Jack"
> +        - "Mic Jack"
> +        - "Int Mic"
> +
> +        # CODEC Pins
> +        - MIC1
> +        - MIC2
> +        - AXIL
> +        - AXIR
> +        - MONOIN_RXN
> +        - MONOIN_RXP
> +        - DMIC
> +        - MIC Bias1
> +        - MIC Bias2
> +        - MONO_IN
> +        - AUXO1
> +        - AUXO2
> +        - SPOL
> +        - SPOR
> +        - HPOL
> +        - HPOR
> +        - MONO
> +
> +required:
> +  - nvidia,i2s-controller

By convention we always require compatible (and your common schema does
not require it, I think). The same for your other patches.

Best regards,
Krzysztof

