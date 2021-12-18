Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3672CC4332F
	for <linux-tegra@archiver.kernel.org>; Sat, 18 Dec 2021 10:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhLRK7b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 18 Dec 2021 05:59:31 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57014
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232785AbhLRK73 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Dec 2021 05:59:29 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3BFAA3FFD6
        for <linux-tegra@vger.kernel.org>; Sat, 18 Dec 2021 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639825168;
        bh=iKwmiQLDuY8LAE9jHuz/0Vr7mjQTQyKIClva1cDuOYA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=j5fcgjHCth4uQmXJtEz666zG9K8KOD4r469Nn4RT++boTlvzzRPS/gU8dHRA0DRV4
         0wn6FdAN3zjRvHbXcBtoo8Rb6nVz9mSQI4lvnHrr9aFhnCEviNJ2LIBcRdQR97Dna3
         18k7D8QYOG9Hrl+ffICiJj+7nZYHlMFdSbv4d0n93ulU/6/flPgi2+OU7G/j6cFsch
         GDO/sgNuWf64KAVy/5KoLDEPyRIn0HxyNg5G4NsB69lczjpPVFjnVkj18/h0/xqmpc
         PfaVPnQ1FG6nCuobyVJH9CM4uqV80bQRr2wXU67H7wUlzhEDDC9sQWQ8kTgIGf0ACS
         fHojlO9vLUq9Q==
Received: by mail-lf1-f70.google.com with SMTP id j9-20020a05651231c900b004037efe9fddso2140969lfe.18
        for <linux-tegra@vger.kernel.org>; Sat, 18 Dec 2021 02:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iKwmiQLDuY8LAE9jHuz/0Vr7mjQTQyKIClva1cDuOYA=;
        b=ZcbVF8/HkpHMkZmfnwBgSAofBsEmBjSGK+DdHx/+tBrc9VF5jh58LoBRs0oIFaScYn
         A7sMYI0F0qSBxHPvzXKMI1q1dKL6R/eiR9Jv3JNmxC6BF5LVTSLZcrYV3yCqge++Ksqd
         GLHjxMqodm38H5mKDEQVqh+PH6qicEbUjHjkJHn+wVrUPMVVSlKRLovHwuy4sTFGgLed
         Sjtc8Y33/mTEMF5s8OixFrauTpLPMD6s0otw62f33FoObTJ8Rt4MHCqWp9nlsHmaVKvx
         q3gflEcPp1UIv1fj9Tf8XyM9lscqAH0l9jDqBgX5bbzqpK0mc61Kx+mxgv6lTSkLAihu
         cYIQ==
X-Gm-Message-State: AOAM532cFN1J7Elo0eRMBHthOXhK2nzulQdg4B+e71SeoZyrPOmbsy+p
        vQhu+QTY8O7wUsVSlY89Tpc+j1NPtCpxX4uudIF9Ggeh/Lc0dMZd88GR9KiBaRmrbY0CpETAb4G
        CCPlQBbKFkxU6gmJ2s6QUu5NlrKY5SpQZGn5qfs0i
X-Received: by 2002:ac2:4142:: with SMTP id c2mr6806185lfi.608.1639825167352;
        Sat, 18 Dec 2021 02:59:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2EVD6v55ZbjvTY15Qiz1fXJ3yFxwDBZMbkwGZYLQ9xoefSrFNyVjgHsqQXhV4QAt8jp/v1g==
X-Received: by 2002:ac2:4142:: with SMTP id c2mr6806172lfi.608.1639825167152;
        Sat, 18 Dec 2021 02:59:27 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x11sm142447lfr.171.2021.12.18.02.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 02:59:26 -0800 (PST)
Message-ID: <d64330da-3ced-b37e-4bc9-ba7556822f7d@canonical.com>
Date:   Sat, 18 Dec 2021 11:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/5] dt-bindings: memory: Add Tegra210 memory controller
 bindings
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211217165919.2700920-1-thierry.reding@gmail.com>
 <20211217165919.2700920-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217165919.2700920-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/12/2021 17:59, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the bindings for the memory controller found on Tegra210 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra210-mc.yaml                   | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
> new file mode 100644
> index 000000000000..ef21c11052e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-mc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra210 SoC Memory Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  The NVIDIA Tegra210 SoC features a 64 bit memory controller that is split into two 32 bit
> +  channels to support LPDDR3 and LPDDR4 with x16 subpartitions. The MC handles memory requests for
> +  34-bit virtual addresses from internal clients and arbitrates among them to allocate memory
> +  bandwidth.
> +
> +  Up to 8 GiB of physical memory can be supported. Security features such as encryption of traffic
> +  to and from DRAM via general security apertures are available for video and other secure
> +  applications.
> +
> +properties:
> +  $nodename:
> +    pattern: "^memory-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,tegra210-mc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: module clock
> +
> +  clock-names:
> +    items:
> +      - const: mc
> +
> +  "#iommu-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#iommu-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mc: memory-controller@70019000 {

If there is going to be resubmit, please skip the alias. It just adds
noise. Without resubmit, I can fix it when applying.


Best regards,
Krzysztof
