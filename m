Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EC1C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 13:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJGNq2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 09:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiJGNq0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 09:46:26 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E395CBBE28;
        Fri,  7 Oct 2022 06:46:24 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B92BA106F;
        Fri,  7 Oct 2022 06:46:30 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 422043F67D;
        Fri,  7 Oct 2022 06:46:22 -0700 (PDT)
Message-ID: <3fb949ad-74c4-1bac-7e14-5d056afcef5f@arm.com>
Date:   Fri, 7 Oct 2022 14:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Content-Language: en-GB
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Rob Herring <robh@kernel.org>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-2-thierry.reding@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220923123557.866972-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-09-23 13:35, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This adds the "iommu-addresses" property to reserved-memory nodes, which
> allow describing the interaction of memory regions with IOMMUs. Two use-
> cases are supported:
> 
>    1. Static mappings can be described by pairing the "iommu-addresses"
>       property with a "reg" property. This is mostly useful for adopting
>       firmware-allocated buffers via identity mappings. One common use-
>       case where this is required is if early firmware or bootloaders
>       have set up a bootsplash framebuffer that a display controller is
>       actively scanning out from during the operating system boot
>       process.
> 
>    2. If an "iommu-addresses" property exists without a "reg" property,
>       the reserved-memory node describes an IOVA reservation. Such memory
>       regions are excluded from the IOVA space available to operating
>       system drivers and can be used for regions that must not be used to
>       map arbitrary buffers.

Bah, I've only just realised: don't we also need to change the "oneOf: 
required: ..." schema to permit "iommu-addresses" without "reg" or "size"?

Thanks,
Robin.

> Each mapping or reservation is tied to a specific device via a phandle
> to the device's device tree node. This allows a reserved-memory region
> to be reused across multiple devices.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v9:
> - add Reviewed-by tags
> 
> Changes in v8:
> - include validation warnings that had crept into an unrelated patch
> 
> Changes in v7:
> - keep reserved-memory.txt to avoid broken references
> 
> Changes in v6:
> - add device phandle to iommu-addresses property in examples
> - remove now unused dt-bindings/reserved-memory.h header
> 
>   .../reserved-memory/reserved-memory.yaml      | 70 +++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> index 44f72bcf1782..fb48d016e368 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> @@ -52,6 +52,30 @@ properties:
>         Address and Length pairs. Specifies regions of memory that are
>         acceptable to allocate from.
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
>     no-map:
>       type: boolean
>       description: >
> @@ -97,4 +121,50 @@ oneOf:
>   
>   additionalProperties: true
>   
> +examples:
> +  - |
> +    / {
> +      compatible = "foo";
> +      model = "foo";
> +
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        adsp_resv: reservation-adsp {
> +          /*
> +           * Restrict IOVA mappings for ADSP buffers to the 512 MiB region
> +           * from 0x40000000 - 0x5fffffff. Anything outside is reserved by
> +           * the ADSP for I/O memory and private memory allocations.
> +           */
> +          iommu-addresses = <&adsp 0x0 0x00000000 0x00 0x40000000>,
> +                            <&adsp 0x0 0x60000000 0xff 0xa0000000>;
> +        };
> +
> +        fb: framebuffer@90000000 {
> +          reg = <0x0 0x90000000 0x0 0x00800000>;
> +          iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00800000>;
> +        };
> +      };
> +
> +      bus@0 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +        adsp: adsp@2990000 {
> +          reg = <0x2990000 0x2000>;
> +          memory-region = <&adsp_resv>;
> +        };
> +
> +        dc0: display@15200000 {
> +          reg = <0x15200000 0x10000>;
> +          memory-region = <&fb>;
> +        };
> +      };
> +    };
>   ...
