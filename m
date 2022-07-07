Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46915C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Jul 2022 06:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbiGGG4y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Jul 2022 02:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233538AbiGGG4x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Jul 2022 02:56:53 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8543C2D1E4
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jul 2022 23:56:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id y18so10225471ljj.6
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jul 2022 23:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9wXlm4lPLW3CJ6vyNpa4ZS9pyU5VZ9VajYi0GJLaRq0=;
        b=CukCozSBMD4d641X4DnmQFSVGgdyLaC4lf0G4XTKANN+rpW1wFUKoS2cFPr4oDrXBp
         vJgmhofUYnIuK9EetgnecxbFdnLYDiyHxvrDZUS9uC86pTrJBzWKflSOVMZUgT19eMfS
         rPEw4R0OnDTgCSNqdHYG1xKYN9+zfa/rmzeDc2GZlNbsD0ZMbbgXmDB6gHVonIomTrEW
         ulOzK0l5d+0ZHoNPQpRvcgjCx4I8hDYANQdd/XG3M/vLM5nzE0+pZyxKG8LC9U4moPOB
         lJSYxpBIXrwcilWUlvpRbeURfopWAM1ZUlsYpEnEz+21xO7D5mFBUzIbBs3tQqTqSSc5
         BM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9wXlm4lPLW3CJ6vyNpa4ZS9pyU5VZ9VajYi0GJLaRq0=;
        b=gYk8Bt3d+VISuN9J7F59VTYtajnSPy9GThZJp6epwB9V6i7NLXdRAXxkwIWsfZHQJD
         gam1RYkGPzFTQxfpTrGIFx8ktcVGuOGMfj+DxQU4Z6IwTR1Y4kbTPwseZQzUkqFRDUXW
         2Z2ff/LrrH+DadqT8BxdwBi4W30+n4FcFH5wVVwD/yqlPJcbGNpZaUNHG6GH6gz+kEmb
         dCDMpQGAKhSheDQGT8Oa99wPF29s7NirYhLRe4PMXpMN5O31979RC2/Kn/hUUrGpDVK3
         1ZWQ/GGaUBFeIkncDTGtJeyTfAe+6JCK/POP8fSXHUZtgRYb5JOHNRTnuAqnjzUNguCH
         FSZw==
X-Gm-Message-State: AJIora+ofKvRJ88Iut0QCxFO1KGaKEiG9G5XYxTPX9g//3YMJ2B0isBi
        7Ai/uGHfO9w3YQqMMhmH6I4DTw==
X-Google-Smtp-Source: AGRyM1tO6tU6CDqHQwH/DJfuXG74dwHM+0w3s7XfbfoenJFE/rkjxYonxj6TEoWmqFHf4HIknfsYJA==
X-Received: by 2002:a2e:8e8c:0:b0:25a:76d6:7580 with SMTP id z12-20020a2e8e8c000000b0025a76d67580mr24748693ljk.461.1657177010939;
        Wed, 06 Jul 2022 23:56:50 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id d6-20020a2e96c6000000b0025bdd6af056sm4993902ljj.45.2022.07.06.23.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:56:50 -0700 (PDT)
Message-ID: <f85d59ba-4f2c-130f-2455-bc28ac060f8c@linaro.org>
Date:   Thu, 7 Jul 2022 08:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/9] dt-bindings: net: Add Tegra234 MGBE
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bhadram Varka <vbhadram@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        netdev@vger.kernel.org
References: <20220706213255.1473069-1-thierry.reding@gmail.com>
 <20220706213255.1473069-6-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706213255.1473069-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/07/2022 23:32, Thierry Reding wrote:
> From: Bhadram Varka <vbhadram@nvidia.com>
> 
> Add device-tree binding documentation for the Multi-Gigabit Ethernet
> (MGBE) controller found on NVIDIA Tegra234 SoCs.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - add macsec and macsec-ns interrupt names
> - improve mdio bus node description
> - drop power-domains description
> - improve bindings title
> 
> Changes in v2:
> - add supported PHY modes
> - change to dual license
> 
>  .../bindings/net/nvidia,tegra234-mgbe.yaml    | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> new file mode 100644
> index 000000000000..3d242ef1ca57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra234 MGBE Multi-Gigabit Ethernet Controller
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +

Drop the blank line.

> +  compatible:
> +    const: nvidia,tegra234-mgbe
> +
> +  reg:
> +    minItems: 3

Drop minitems (equal to maxItems)

> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: hypervisor
> +      - const: mac
> +      - const: xpcs
> +
> +  interrupts:
> +    minItems: 1

You need maxItems:3

> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: common
> +      - const: macsec-ns
> +      - const: macsec
> +
> +  clocks:
> +    minItems: 12

Drop minItems

> +    maxItems: 12
> +
> +  clock-names:
> +    minItems: 12
> +    maxItems: 12

Drop min/max and instead list the clocks in fixed order.. The order is
always fixed, so below enum is not correct.

> +    contains:
> +      enum:
> +        - mgbe
> +        - mac
> +        - mac-divider
> +        - ptp-ref
> +        - rx-input-m
> +        - rx-input
> +        - tx
> +        - eee-pcs
> +        - rx-pcs-input
> +        - rx-pcs-m
> +        - rx-pcs
> +        - tx-pcs
> +
> +  resets:
> +    minItems: 2

Drop minItems.

> +    maxItems: 2
> +
> +  reset-names:
> +    contains:
> +      enum:

Same problem.

> +        - mac
> +        - pcs
> +
> +  interconnects:
> +    items:
> +      - description: memory read client
> +      - description: memory write client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read

I propose to drop the comment - it is obvious from "interconnects" above.


Best regards,
Krzysztof
