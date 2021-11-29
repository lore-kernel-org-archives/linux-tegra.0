Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38813C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 21:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhK2VIo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 16:08:44 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:40536 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhK2VGo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 16:06:44 -0500
Received: by mail-oi1-f170.google.com with SMTP id bk14so37053888oib.7;
        Mon, 29 Nov 2021 13:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WIr5+cJhpJp25U0PIV6j9kvUDudzJu8gP7H4qjx4440=;
        b=5ESL7Ozge3iPHGAyPAfukw9oVMCntsg+dxK3I2k1Hm6F+ZvNMZKclDgCVg77SeAxep
         sOiFy9qHfarcInPXSc7CzaAEPAAHosX8p+UgqoBGC8rCFz96aj3Yo5POYVlO+3JgGaKb
         7nVrLV34uXgF7vvnw1QxGk9LF/dw+0SB5/j+wBHUg8luWz0FsD9kK6PhWFT5F2mJKNgA
         kuhH4vcxIG4j3PvXAAR4WNssWHUjuiYf4UmHmx3D35zNTv2n+uPExOz018mCZPYETaTx
         U80fQ5k7BcMnoNebmYXg5KRDiuBFEaZ3YDWKPFiMcdvnajgGwhKsJGOiRnwXfIuGSFoO
         v2TQ==
X-Gm-Message-State: AOAM530rvuIi+1WZHeGUX28L700fRFD0J59H5tLbeUC4yCxF8DUj5C8l
        hZg3LBd1zjJTrFMYqYkiLw==
X-Google-Smtp-Source: ABdhPJyHkwMvOrebHRlLhxyXq6Y1AW58fccLfFKwmowNesf7NO9AMidcfpraDVsx9FQuRbMFaXXjzQ==
X-Received: by 2002:a05:6808:144f:: with SMTP id x15mr414851oiv.157.1638219806008;
        Mon, 29 Nov 2021 13:03:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v19sm2817356ott.13.2021.11.29.13.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 13:03:25 -0800 (PST)
Received: (nullmailer pid 604956 invoked by uid 1000);
        Mon, 29 Nov 2021 21:03:24 -0000
Date:   Mon, 29 Nov 2021 15:03:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: arm-smmu: Document
 nvidia,memory-controller property
Message-ID: <YaVAHNXpQS8gG+l0@robh.at.kernel.org>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
 <20211112131231.3683098-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112131231.3683098-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 12, 2021 at 02:12:28PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> On NVIDIA SoC's the ARM SMMU needs to interact with the memory
> controller in order to map memory clients to the corresponding stream
> IDs. Document how the nvidia,memory-controller property can be used to
> achieve this.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index f66a3effba73..cf32a7955475 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -155,6 +155,12 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  nvidia,memory-controller:
> +    description: A phandle to the memory controller on NVIDIA Tegra186
> +      and later SoCs. The memory controller needs to be programmed with
> +      a mapping of memory client IDs to ARM SMMU stream IDs.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>  required:
>    - compatible
>    - reg
> @@ -177,6 +183,9 @@ allOf:
>          reg:
>            minItems: 1
>            maxItems: 2
> +
> +      required:
> +        - nvidia,memory-controller

That's not a compatible change. Document why it is necessary if that's 
intended.

>      else:
>        properties:
>          reg:
> -- 
> 2.33.1
> 
> 
