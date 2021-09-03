Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8329C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 16:34:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C139260F12
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 16:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235714AbhICQfS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 12:35:18 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:42742 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350057AbhICQfO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Sep 2021 12:35:14 -0400
Received: by mail-ot1-f46.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so7163040otk.9;
        Fri, 03 Sep 2021 09:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2Y5mrqQnqvq07Z9zXOS5rtmgsshLEMXJhvEEySrxvJY=;
        b=OH1wsrf4YUFOOL/J/Hc4TPOo9kHc0v1w4UYVy5U9UodQkvFWgGOgrUmcshWOeH8HtD
         z3GOrO3mxkqmPYDkXuqf60OrRqdmF0ak04PnOgg7aVSMatuKAv4Ar/xnsR37LEx1NNMC
         AOHBjpAtfhfRxBEdrwdG+bXiCGd1LaXUdzo1i2PekG81KYHWa886PT7Rb+IInhCptBFI
         PknTFA6q+iXLyp2n5H/VDvTJ6pDSjYNhewqeWzZtBO376fflQ8FhPfuS+Yc3t1varSmZ
         oYVuV2vmPYla1k9KIiDkK3gF/2OGwez/2a3p3Pb2sIZxf/mhaAAkj8fVx20s6E5Q7+3e
         BISA==
X-Gm-Message-State: AOAM530poXAqT6ll7alxdEvRCRPDkjFEWjKbbsBUr3ASlltJ3XrT5XQD
        i5Q8g7cupUwIsk4ZSCIeYA==
X-Google-Smtp-Source: ABdhPJw3QqvTVyU04obGewaPwkkuDmmtTBXovMxoLzArJhwJw012zKJVMhfB0lUR6r2SSUk89tbpEQ==
X-Received: by 2002:a05:6830:241d:: with SMTP id j29mr3896516ots.47.1630686853689;
        Fri, 03 Sep 2021 09:34:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q13sm1012232ota.17.2021.09.03.09.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 09:34:12 -0700 (PDT)
Received: (nullmailer pid 3060628 invoked by uid 1000);
        Fri, 03 Sep 2021 16:34:11 -0000
Date:   Fri, 3 Sep 2021 11:34:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YTJOg1oHJq848ZlE@robh.at.kernel.org>
References: <20210903083155.690022-1-mperttunen@nvidia.com>
 <20210903083155.690022-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903083155.690022-2-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 03, 2021 at 11:31:53AM +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> new file mode 100644
> index 000000000000..33d01c7dc759
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> @@ -0,0 +1,109 @@
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
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: nvidia,tegra194-nvdec
> +then:
> +  properties:
> +    nvidia,instance:
> +      items:
> +        - description: 0 for NVDEC0, or 1 for NVDEC1

I still don't understand what this is needed for. What is the difference 
between the instances? There must be some reason you care. We should 
describe that difference, not some made up index.

I'm not suggesting using the base address either. That's fragile too.

> +
> +additionalProperties: true

'true' here is not allowed unless the schema is not complete and 
intended to be included in a complete schema or unconditionally applied 
(i.e. 'select: true'). This case is neither. As pointed out previously,
'unevaluatedProperties' is what you'd want here.

However, I looked into supporting defining properties in if/then/else 
schemas as you have done and I don't think we will support that soon. 
It's problematic because we can't validate the schema under the if/then 
completely. The reason is properties under if/then schemas don't have to 
be complete as we expect a top level definition that is complete (e.g. 
vendor properties must have 'description'). To solve this, we'd have to 
only apply meta-schema checks if the property doesn't appear at the top 
level. That's more complicated than I care to implement ATM.

Rob
