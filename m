Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA04AC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:23:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65CC0617C9
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhC3WXY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 18:23:24 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46852 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbhC3WXG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 18:23:06 -0400
Received: by mail-ot1-f49.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso17030532ott.13;
        Tue, 30 Mar 2021 15:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bvn2ghGc2FQDGRDPFzroRkR0YaX/tmVMYZ+gRO2PQRs=;
        b=Ml4VpYTLSuJVChqJTb1sx9AanCA7/nLk9JOtGGViOIasnn1EjNA5lJRbZB+QVdr/+N
         S/LBfXZI/ucjRUQXniVSNcUc16T68crYydymMve82NnOOY4k0Uu9biLwGiTn06WTIRoS
         Cq/WSI0Et3mBH87HaJEfdFi8XDEv2+4IE5xUCsu2EWUluGyVvqTDn+oHtZZL7H1v/4xm
         2QekuCU6zhxtXIahU3fjTaLIJ+ogc2gUEn8cm2p2vjW+edsH4a2IclKxQItkp6EfOEXe
         mkQF9JS3qSEMh3qosEt18ENq1xRCWZWwWNt2pcBjsYYi6GQtUD6UdVt/Y/mXp6LIpmg6
         QJDw==
X-Gm-Message-State: AOAM532ab/KxsSUSNoRHDp7BlCg2EoyHK+uHImOKA9MUEQTqK5P/r2+J
        PO+n7z2Y3boJ+/fituWxYg==
X-Google-Smtp-Source: ABdhPJzQoUcXN+U5IZP0wPaxtxXWx66GtDAuD4KgAj2tZYBCBJ2RKMVrKWWUs03HsxwaAZ6ns4I2vQ==
X-Received: by 2002:a05:6830:4cd:: with SMTP id s13mr115300otd.78.1617142986077;
        Tue, 30 Mar 2021 15:23:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 128sm48307oog.37.2021.03.30.15.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 15:23:05 -0700 (PDT)
Received: (nullmailer pid 820635 invoked by uid 1000);
        Tue, 30 Mar 2021 22:23:04 -0000
Date:   Tue, 30 Mar 2021 17:23:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/6] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
Message-ID: <20210330222304.GA819312@robh.at.kernel.org>
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329194602.17049-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Mar 29, 2021 at 10:45:58PM +0300, Dmitry Osipenko wrote:
> Power domain fits much better than a voltage regulator in regards to
> a proper hardware description and from a software perspective as well.
> Hence replace the core regulator with the power domain. Note that this
> doesn't affect any existing DTBs because we haven't started to use the
> regulator yet, and thus, it's okay to change it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> index 0a2e2c0d0fdd..4a2edb9b8bdc 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> @@ -39,9 +39,10 @@ properties:
>      description:
>        Phandle of the Memory Controller node.
>  
> -  core-supply:
> +  power-domains:
> +    $ref: /schemas/types.yaml#/definitions/phandle

'power-domains' already has a type. We need to know how many (maxItems).

>      description:
> -      Phandle of voltage regulator of the SoC "core" power domain.
> +      Phandle of the SoC "core" power domain.
>  
>    operating-points-v2:
>      description:
> @@ -241,7 +242,7 @@ examples:
>  
>          nvidia,memory-controller = <&mc>;
>          operating-points-v2 = <&dvfs_opp_table>;
> -        core-supply = <&vdd_core>;
> +        power-domains = <&domain>;
>  
>          #interconnect-cells = <0>;
>  
> -- 
> 2.30.2
> 
