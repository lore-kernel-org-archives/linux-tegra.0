Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1781C433F5
	for <linux-tegra@archiver.kernel.org>; Sat, 18 Dec 2021 11:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhLRLCN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 18 Dec 2021 06:02:13 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57056
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232785AbhLRLCM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Dec 2021 06:02:12 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C0A373F1B3
        for <linux-tegra@vger.kernel.org>; Sat, 18 Dec 2021 11:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639825330;
        bh=GUzaeCFYuvmlfIXasOI8CPD5nT7udP18GRuhsPnN/O4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=GTJNQnuh3fMVd0O5mQhkLLCgHKdyTafK9DLyNEf/rri9SM/lUnH3I5OsPjuj++wci
         6Sb2ilo5IEWw4dPszN5yr+E0gzQCMTa4rbytg2XGl36nwIleW6oSwDbvpPNRtc+ASt
         z5XBn2k/kKU6Afi3H0CdfYMSRKxh3u9DSdR66Kq/SN8ciXSw0NeXLVpCsZRR8+u6jq
         HKkaUs9Ix21AaY0LnAKCjeaxBMA4Hq39hxaLp7OucKAeb3kJc2Y2DNg2nWbFhlRKJ4
         rYL3NXAImrFP1LlxLpBKHsXrjlf+dI4IrrIE6Le0dMaJd2zHYpl61IlJX647mn82Fj
         EsUTkB1iFoC9w==
Received: by mail-lf1-f70.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso2171106lfv.7
        for <linux-tegra@vger.kernel.org>; Sat, 18 Dec 2021 03:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GUzaeCFYuvmlfIXasOI8CPD5nT7udP18GRuhsPnN/O4=;
        b=7FlfsebskYW3az8+djF6dbxwhJO9Nk/DvU5I4l9zq9pKNKNivwJklo/VzMLHJAoQxx
         x78e0mUrm8fY+0i5dsHz/ThuwWvzeqqUsltta+qqYcyWbwq8hMNbS5+OKVxt1igBHsuw
         qHipEZIMg0tLWqwHCDeO6QaFGqo5KGL6aT9jepSgIM8RHY1kHad1cYaF6yhDiEAm8dym
         DIkh2DdESRJwYPP1hCJ9noxG7MGHibU/Fu4OM+QYVcxD4DplXgH33wtqeMI3qi/KdkvM
         HJPYDSQGwY5VJQQby694XlIx9aeE2nUJ85r8gfd7qPpynY8KJpUoqa3bg4aOl/G2JVSj
         XHMQ==
X-Gm-Message-State: AOAM530I2vQaRDfyLhBuVkE+1nljY3M0fkjBdlPwqjj/xRoAXUFwyJ4z
        IURgwkq3qtGkJC9REsWR+0B5emNW0bZifj6zNMFT0IJ1lXO5bAXxUU74oK4nMtHTFgtvYrQAjq7
        WBqFCiXz/uuAgLOKYNM0CDJYi+QruWirVih7O+WoG
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr6899801lfb.118.1639825330178;
        Sat, 18 Dec 2021 03:02:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz76BRek5xxaxXK0gykfSceKpej+lAJ/MUNQimyMdvDsGknqATVKSV4qiXP216Y6DblSZl2Kw==
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr6899780lfb.118.1639825329889;
        Sat, 18 Dec 2021 03:02:09 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bu11sm917201lfb.15.2021.12.18.03.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 03:02:09 -0800 (PST)
Message-ID: <0778edf1-25c3-e375-9806-46c35c18e233@canonical.com>
Date:   Sat, 18 Dec 2021 12:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/5] dt-bindings: memory: Add Tegra114 memory controller
 bindings
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211217165919.2700920-1-thierry.reding@gmail.com>
 <20211217165919.2700920-3-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217165919.2700920-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/12/2021 17:59, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the bindings for the memory controller found on Tegra114 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra114-mc.yaml                   | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml
> new file mode 100644
> index 000000000000..2fa50eb3aadb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-mc.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra114-mc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra114 SoC Memory Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  The Tegra114 Memory Controller architecturally consists of the following parts:
> +
> +    Arbitration Domains, which can handle a single request or response per
> +    clock from a group of clients. Typically, a system has a single Arbitration
> +    Domain, but an implementation may divide the client space into multiple
> +    Arbitration Domains to increase the effective system bandwidth.
> +
> +    Protocol Arbiter, which manage a related pool of memory devices. A system
> +    may have a single Protocol Arbiter or multiple Protocol Arbiters.
> +
> +    Memory Crossbar, which routes request and responses between Arbitration
> +    Domains and Protocol Arbiters. In the simplest version of the system, the
> +    Memory Crossbar is just a pass through between a single Arbitration Domain
> +    and a single Protocol Arbiter.
> +
> +    Global Resources, which include things like configuration registers which
> +    are shared across the Memory Subsystem.
> +
> +  The Tegra114 Memory Controller handles memory requests from internal clients
> +  and arbitrates among them to allocate memory bandwidth for DDR3L and LPDDR2
> +  SDRAMs.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra114-mc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: mc
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  "#iommu-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#reset-cells"
> +  - "#iommu-cells"
> +
> +additionalProperties: false

The binding looks the same as Tegra210, Tegra 20 MC. What is the point
of having three separate binding documents which are exactly the same?


Best regards,
Krzysztof
