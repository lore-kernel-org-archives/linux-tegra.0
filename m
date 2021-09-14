Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1170AC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 15:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E770861056
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Sep 2021 15:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhINPlJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Sep 2021 11:41:09 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:35348 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbhINPlJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Sep 2021 11:41:09 -0400
Received: by mail-oi1-f172.google.com with SMTP id r26so19593670oij.2;
        Tue, 14 Sep 2021 08:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pytaBeGbluvK54KH1JDN0ESm8pJSOqwJ8yT+Ker1A6w=;
        b=sIebQQrzFb/OCPXclR9KFrdFGM3rtg1ua1pARjboJEqN1CsaaD+MVx12Y5PSKOifXi
         PgmRZL0ebeWfd73gtcB19bIEhO8rLCso0ohQW93hiDB31/9VW/tpglKSK8keuk8GWVxq
         iDvGOJXN7QZCqQDoVUt1Rxd59B+HNykteVGccDX9gbf6K9Nx5qXNwKUi10jz7/6OOJf6
         HHklEJ2PyWkJR0H85J/3bmaMJlbZmRkdO+NsrtJsB7Prv3O7OvTXjK8lgrRVivs7u2an
         8BRxe6xDTQQY6EfIqAltTsRL2cIAnOA7c8qLmGAnpEHYFURK9nlcenN7sU1JNXJ17rhk
         oc1g==
X-Gm-Message-State: AOAM531l3EO+iRhJWLyF8qQlNJJhLRtEJrhO9xz6JfyrrSo++RGZThvY
        +YPHdw+yQEl+Ltc0CBaOLfRzd/3EPQ==
X-Google-Smtp-Source: ABdhPJzVFOZqi98MrTq7YmWqyehx/3UeShkeAOC/YJdLh4OxDeJKN67Sh0NUcHVM1M6Q5MBJQclOFg==
X-Received: by 2002:a54:4383:: with SMTP id u3mr1830193oiv.149.1631633991440;
        Tue, 14 Sep 2021 08:39:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r31sm2735905otv.45.2021.09.14.08.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:39:50 -0700 (PDT)
Received: (nullmailer pid 3404699 invoked by uid 1000);
        Tue, 14 Sep 2021 15:39:49 -0000
Date:   Tue, 14 Sep 2021 10:39:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YUDCRb75pIqGZX1S@robh.at.kernel.org>
References: <20210910104247.1206716-1-mperttunen@nvidia.com>
 <20210910104247.1206716-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910104247.1206716-2-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 10, 2021 at 01:42:45PM +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Changed from nvidia,instance to nvidia,host1x-class optional
>   property.
> * Added dma-coherent
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> new file mode 100644
> index 000000000000..f1f8d083d736
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra NVDEC
> +
> +description: |
> +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> +  and newer chips. It is located on the Host1x bus and typically
> +  programmed through Host1x channels.
> +
> +maintainers:
> +  - Thierry Reding <treding@gmail.com>
> +  - Mikko Perttunen <mperttunen@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^nvdec@[0-9a-f]*$"
> +
> +  compatible:
> +    enum:
> +      - nvidia,tegra210-nvdec
> +      - nvidia,tegra186-nvdec
> +      - nvidia,tegra194-nvdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: nvdec
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: nvdec
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +
> +  interconnects:
> +    items:
> +      - description: DMA read memory client
> +      - description: DMA read 2 memory client
> +      - description: DMA write memory client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem
> +      - const: read-1
> +      - const: write
> +
> +  nvidia,host1x-class:
> +    description: Host1x class of the engine. If not specified, defaults to 0xf0.

Define what this is with more than just repeating what is in the 
property name.

> +    $ref: /schemas/types.yaml#/definitions/uint32

default: 0xf0

Is there a range or set of valid values you specify as schema?

Rob
