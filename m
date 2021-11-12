Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2617AC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 23:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB61961026
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 23:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhKLXIv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 18:08:51 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:37376 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbhKLXIu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 18:08:50 -0500
Received: by mail-oi1-f181.google.com with SMTP id o83so20650916oif.4;
        Fri, 12 Nov 2021 15:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=9W+PpxFEqVWQF0EOfaCCoKPjYAvhtklzhHlSkwn2vCc=;
        b=3XaJ8VEmUeom1mmbTgsAWprxiUggl0w3XHshGK/viIm9RPBeWTOFa+DyT8tIVEmC9f
         OMqSmBH4azFKKrAH3tEpP8mpeXbLXQw3MOPCQyR64ledHICF3MeTAZzhHw7OsktvFFiz
         khJBEQwN0ZBI05qh6FjqcGbkrZWzRD3keibVKS4bgaHd/pqqfc0JtK2KCKh1sS8BWi0N
         DI5iCuSqfMDUGuv8emZIMbf5trgezYpPpHZ/sbCD+jjZK0HRygl6gapY+CyVZBEmnkBR
         Mv1ISa81Rxy+jEAom/wUN5QKWQ0Wcbz7rs/NLBE/qekvooJBWxM/b1hZj1ZEl7HfMtyt
         EK5A==
X-Gm-Message-State: AOAM5327BACcAiK6SeGd9JoBkq/YnjULXLofaGCkSbGUTk/ClQRPR3Pn
        uRQfM+HmpAbgtbm2Sz0NDA==
X-Google-Smtp-Source: ABdhPJxLnvMGayW8IJqUbPfuBQ0a4bM6sayjh620QFcHzus5JcfT0Fy2eGsTaGpX9HmCj8VaRfsSDQ==
X-Received: by 2002:a05:6808:10d0:: with SMTP id s16mr23008766ois.0.1636758359013;
        Fri, 12 Nov 2021 15:05:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 64sm1488857otm.37.2021.11.12.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 15:05:58 -0800 (PST)
Received: (nullmailer pid 3548674 invoked by uid 1000);
        Fri, 12 Nov 2021 23:05:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211112130627.3682795-2-thierry.reding@gmail.com>
References: <20211112130627.3682795-1-thierry.reding@gmail.com> <20211112130627.3682795-2-thierry.reding@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: memory: tegra: Document #interconnect-cells property
Date:   Fri, 12 Nov 2021 17:05:57 -0600
Message-Id: <1636758357.459966.3548673.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 14:06:23 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The #interconnect-cells properties are required to hook up memory
> clients to the MC/EMC in interconnects properties. Add a description for
> these properties.
> 
> Also, allow multiple reg and interrupt entries required by Tegra194 and
> later.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../memory-controllers/nvidia,tegra186-mc.yaml       | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dt.yaml: memory-controller@2c00000: reg: [[0, 46137344, 0, 720896]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dt.yaml: memory-controller@2c00000: interrupts: [[0, 223, 4]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dt.yaml: memory-controller@2c00000: external-memory-controller@2c60000:reg: [[0, 46530560, 0, 327680]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1554376

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

