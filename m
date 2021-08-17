Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9F2C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 21:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 503D56102A
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 21:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhHQVVR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 17:21:17 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:38544 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhHQVVQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 17:21:16 -0400
Received: by mail-oi1-f175.google.com with SMTP id u25so1227717oiv.5;
        Tue, 17 Aug 2021 14:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eCXPgeE54uSJrkBMXZBCaQAwfnK0FBzk/itLBzBmeoc=;
        b=mpt9E1f8TDubwrKWJh6rxr1g7Kj+mTTw+az5z2d9H0bkzvipvO7nm8j2qG+3La1oF/
         9Z7pOTtFr4PBUmqKQLSW+0UbUYVAqrE7h/R8EoorL379Ybv615U1OBK3TZEgbal6WwA5
         VoTvslX7hxIc5y7yGZ5SwUy8Uph3WdMR93eFdlKeNsjYdUUlu3PKLpU0acbA52K89eFa
         1CkPjhlO2gAL8trygyZ+wn2PnNiVtbD0rYVSFXja063GKyIYT7Sr8rnYkY/vSxqP8FS9
         qOocPU0Y4TJWx6pxk85s336npg9+orEne+u22SIURT+TaBygVqJ71ijSFEqmR1SieAme
         iaRg==
X-Gm-Message-State: AOAM533XWbjdqS3MraouQ7yQuGyv9QUFNtf+n9s1+txr+DS4iLi3eKU9
        oQAIV9LlCemCXHROzPocHA==
X-Google-Smtp-Source: ABdhPJxGcmgNfXGXRqvUVG0Uxf3PdVGDZR7OfnAFYrzZW6zrd13jd0hXY5ZwFvAsIMGi3LjuIiuFgg==
X-Received: by 2002:a05:6808:20e:: with SMTP id l14mr4087131oie.87.1629235242406;
        Tue, 17 Aug 2021 14:20:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y138sm732191oie.22.2021.08.17.14.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 14:20:42 -0700 (PDT)
Received: (nullmailer pid 860581 invoked by uid 1000);
        Tue, 17 Aug 2021 21:20:41 -0000
Date:   Tue, 17 Aug 2021 16:20:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: Add YAML bindings for NVDEC
Message-ID: <YRwoKW4nOc52MAQV@robh.at.kernel.org>
References: <20210811105030.3458521-1-mperttunen@nvidia.com>
 <20210811105030.3458521-2-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811105030.3458521-2-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 11, 2021 at 01:50:28PM +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
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
> index 000000000000..571849625da8
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
> +        const: nvidia,tegra194-host1x

host1x? This will never be true as the schema is only applied to nodes 
with the nvdec compatible.

> +then:
> +  properties:
> +    nvidia,instance:
> +      items:
> +        - description: 0 for NVDEC0, or 1 for NVDEC1

What's this for? We generally don't do indices in DT.

> +
> +additionalProperties: true

This should be false or 'unevaluatedProperties: false'

Rob
