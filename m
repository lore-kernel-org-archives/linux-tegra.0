Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E19DC43334
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jul 2022 08:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbiGLIVQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jul 2022 04:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbiGLIU4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jul 2022 04:20:56 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B076A2EF2
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:20:44 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r9so4669648lfp.10
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h4aoSDO5bFwFIGc5yk/ffF1XWd97QmPgg6WjKezh/Ng=;
        b=GS82EHVtm5H+0gRrtDtWVBR/EKnfu6+LDtrIywgPwu5WwZHG3vpYKjBX2sqgEep8aF
         VELpVzbx2O4Q/dKe2FWp0bivyGXSL0/zG3duGoYK04mVUsBBkPNV7xJUk9QidfCkXv4g
         r9rCvEj2wTFsZsIs1wAp+shEyF70yp4pWacKA07FFgSXp1fZYvwa9fViUQx7Lnghj81s
         G5FIi0ZdfPXy4Kbb6R39Py7ZT2Orn1uZUiiMMG6n34vjLU9txaz3GQl/NWm+N2h9Gvfb
         OgbG2RetR6LLVxpp8WleyuM5/5TUsdiaoa8NDsWN7CF9eUfBRzofAfS7HsBJK4UIUGPF
         18yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h4aoSDO5bFwFIGc5yk/ffF1XWd97QmPgg6WjKezh/Ng=;
        b=Sfr5BdxP6FAhifZgzAYaEKZ/Qwd4rgqNKJne35rASUxsRpn4AJGhAnjirpDIypsjtI
         aQAp68wI2z41Fb9vuptcevgx6t0jNuUVCiY2HsI7lold+ZWbaPbVv/7tAq/lplBrXWOi
         s4LZcOhrWv/NdCBIkfiLdnfibEj5PdQQrsBqnDhyo/BlGyKyHqFPOw605gSujCz9/gXN
         fm336LUQvpd1cEiIWvrno6kdZcgSkF7F03K1w33URRgu91Bs06iXuvfYQFWbzJ7xX/nu
         1TFeNf2iBBGWxaGJ3nnFNNMALyC7FWs/YauO/BBpiSnuSS9zZhd++hS58DKrw4xl0z6f
         oddA==
X-Gm-Message-State: AJIora8o+VROaPMwPQ+f7CFJvqRqaeqhMraSCnNSeRjqPqN5bEkV9dSZ
        1th1rD4gN/Hq+RDDM/U+xd+HvmoZz77H6K1U
X-Google-Smtp-Source: AGRyM1vsiCwZZO6TZj24hweHxR/VY0TkHiqWbajg3NUeWQw7oUKgNegd0s+X440nXrXTNUWgawVFsg==
X-Received: by 2002:a05:6512:3d1a:b0:47f:79df:2ea8 with SMTP id d26-20020a0565123d1a00b0047f79df2ea8mr15517770lfv.610.1657614042567;
        Tue, 12 Jul 2022 01:20:42 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id j9-20020ac253a9000000b0048374164e22sm2034666lfh.193.2022.07.12.01.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:20:41 -0700 (PDT)
Message-ID: <4d5a2526-246c-8f62-5712-3f2dbd0eca4f@linaro.org>
Date:   Tue, 12 Jul 2022 10:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] dt-bindings: arm: tegra: ahb: Convert to json-schema
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220711152020.688461-1-thierry.reding@gmail.com>
 <20220711152020.688461-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711152020.688461-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/07/2022 17:20, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra AHB bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-ahb.txt | 17 --------
>  .../arm/tegra/nvidia,tegra20-ahb.yaml         | 39 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> deleted file mode 100644
> index 9a4295b54539..000000000000
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -NVIDIA Tegra AHB
> -
> -Required properties:
> -- compatible : For Tegra20, must contain "nvidia,tegra20-ahb".  For
> -  Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
> -  '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
> -  tegra132, or tegra210.
> -- reg : Should contain 1 register ranges(address and length).  For
> -  Tegra20, Tegra30, and Tegra114 chips, the value must be <0x6000c004
> -  0x10c>.  For Tegra124, Tegra132 and Tegra210 chips, the value should
> -  be be <0x6000c000 0x150>.
> -
> -Example (for a Tegra20 chip):
> -	ahb: ahb@6000c004 {
> -		compatible = "nvidia,tegra20-ahb";
> -		reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
> -	};
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml
> new file mode 100644
> index 000000000000..6d9baab76258
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.yaml

Same comment as for #1 - move to "soc", please.

> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-ahb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +title: NVIDIA Tegra AHB
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra20-ahb
> +      - const: nvidia,tegra30-ahb

These two should be an enum.

> +      - items:
> +          - enum:
> +              - nvidia,tegra114-ahb
> +              - nvidia,tegra124-ahb
> +              - nvidia,tegra210-ahb
> +          - const: nvidia,tegra30-ahb
> +
> +  reg:
> +    maxItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    ahb@6000c004 {
> +      compatible = "nvidia,tegra20-ahb";
> +      reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
> +    };

In your first patch, you used 4-spaces indentation (preferred) for DTS
example. How about using 4-space also here?


Best regards,
Krzysztof
