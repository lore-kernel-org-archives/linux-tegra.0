Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C5EC433FE
	for <linux-tegra@archiver.kernel.org>; Sun, 15 May 2022 10:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbiEOKqA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 15 May 2022 06:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbiEOKp7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 15 May 2022 06:45:59 -0400
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836EFBC98;
        Sun, 15 May 2022 03:45:55 -0700 (PDT)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id 27B9A26EA99; Sun, 15 May 2022 12:45:54 +0200 (CEST)
Date:   Sun, 15 May 2022 12:45:54 +0200
From:   Janne Grunau <j@jannau.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        asahi@lists.linux.dev
Subject: Re: [PATCH v5 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Message-ID: <20220515104554.GD26732@jannau.net>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
 <20220512190052.1152377-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512190052.1152377-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-05-12 21:00:48 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This adds the "iommu-addresses" property to reserved-memory nodes, which
> allow describing the interaction of memory regions with IOMMUs. Two use-
> cases are supported:
> 
>   1. Static mappings can be described by pairing the "iommu-addresses"
>      property with a "reg" property. This is mostly useful for adopting
>      firmware-allocated buffers via identity mappings. One common use-
>      case where this is required is if early firmware or bootloaders
>      have set up a bootsplash framebuffer that a display controller is
>      actively scanning out from during the operating system boot
>      process.
> 
>   2. If an "iommu-addresses" property exists without a "reg" property,
>      the reserved-memory node describes an IOVA reservation. Such memory
>      regions are excluded from the IOVA space available to operating
>      system drivers and can be used for regions that must not be used to
>      map arbitrary buffers.
> 
> Each mapping or reservation is tied to a specific device via a phandle
> to the device's device tree node. This allows a reserved-memory region
> to be reused across multiple devices.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../reserved-memory/reserved-memory.txt       |  1 -
>  .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++++++++
>  include/dt-bindings/reserved-memory.h         |  8 +++
>  3 files changed, 70 insertions(+), 1 deletion(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>  create mode 100644 include/dt-bindings/reserved-memory.h
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> deleted file mode 100644
> index 1810701a8509..000000000000
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -This file has been moved to reserved-memory.yaml.
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> index 7a0744052ff6..3a769aa66e1c 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> @@ -52,6 +52,30 @@ properties:
>        Address and Length pairs. Specifies regions of memory that are
>        acceptable to allocate from.
>  
> +  iommu-addresses:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: >
> +      A list of phandle and specifier pairs that describe static IO virtual
> +      address space mappings and carveouts associated with a given reserved
> +      memory region. The phandle in the first cell refers to the device for
> +      which the mapping or carveout is to be created.
> +
> +      The specifier consists of an address/size pair and denotes the IO
> +      virtual address range of the region for the given device. The exact
> +      format depends on the values of the "#address-cells" and "#size-cells"
> +      properties of the device referenced via the phandle.
> +
> +      When used in combination with a "reg" property, an IOVA mapping is to
> +      be established for this memory region. One example where this can be
> +      useful is to create an identity mapping for physical memory that the
> +      firmware has configured some hardware to access (such as a bootsplash
> +      framebuffer).
> +
> +      If no "reg" property is specified, the "iommu-addresses" property
> +      defines carveout regions in the IOVA space for the given device. This
> +      can be useful if a certain memory region should not be mapped through
> +      the IOMMU.
> +
>    no-map:
>      type: boolean
>      description: >
> @@ -97,4 +121,42 @@ oneOf:
>  
>  additionalProperties: true
>  
> +examples:
> +  - |
> +    reserved-memory {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      ranges;
> +
> +      adsp: reservation-adsp {
> +        /*
> +         * Restrict IOVA mappings for ADSP buffers to the 512 MiB region
> +         * from 0x40000000 - 0x5fffffff. Anything outside is reserved by
> +         * the ADSP for I/O memory and private memory allocations.
> +         */
> +        iommu-addresses = <0x0 0x00000000 0x00 0x40000000>,
> +                          <0x0 0x60000000 0xff 0xa0000000>;

This misses the device's phandle. One could argue it's not necessary for 
reservations but it will complicate the parsing code and the current 
parsing code is not prepared for it.

> +      };
> +
> +      fb: framebuffer@90000000 {
> +        reg = <0x0 0x90000000 0x0 0x00800000>;
> +        iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00800000>;
> +      };
> +    };
> +
> +    bus@0 {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      adsp@2990000 {
> +        reg = <0x0 0x2990000 0x0 0x2000>;
> +        memory-region = <&adsp>;
> +      };
> +
> +      display@15200000 {
> +        reg = <0x0 0x15200000 0x0 0x10000>;
> +        memory-region = <&fb>;
> +      };
> +    };
> +
>  ...
> diff --git a/include/dt-bindings/reserved-memory.h b/include/dt-bindings/reserved-memory.h
> new file mode 100644
> index 000000000000..174ca3448342
> --- /dev/null
> +++ b/include/dt-bindings/reserved-memory.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> +
> +#ifndef _DT_BINDINGS_RESERVED_MEMORY_H
> +#define _DT_BINDINGS_RESERVED_MEMORY_H
> +
> +#define MEMORY_REGION_IDENTITY_MAPPING 0x1
> +
> +#endif

This appears to be an unused leftover from a previous version.

Janne
