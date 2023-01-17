Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DE5C54E76
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 19:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbjAQT5s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 14:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbjAQTzm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 14:55:42 -0500
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D6E392AE;
        Tue, 17 Jan 2023 10:49:36 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1322d768ba7so32937993fac.5;
        Tue, 17 Jan 2023 10:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt+JVILd4L3+1ltru4R7Q2ivakcvcUmpRc9Jx8O+hgc=;
        b=dBMlgFlIO/VMkstapdTzufhYbSLS03sQpd7hqo/enG7gRwyXPXwxNERSwyuc64b4tR
         PzAcR2pqqvv9I2VNyuM4YwgQlH6Zn5znIrb+EgPV1Vd9W7V9RemHVqiU/kxLtwuerism
         HlcH3Tvgevc6jthaRTAW1qUnXkHsRecXS86bv3bYZmNU8E5WLsOqUZP6vvuy6i2QlQi4
         ssD+GL8uTL8ECl/iCt6CMhatxVbMzIe7BY2BYFdxRh2NqS5YZokJjbuw80DZa2tfPkOg
         YUT8VtLw1J5LDUv+AWTOYPYD91eNJ+9FoZAzYf1wV7W+i/NmchH/GvQuXh9RGdMkIMia
         Qgxw==
X-Gm-Message-State: AFqh2kpOCxgJxpwCgK31SaH1wqSaIYf1p5Rk/gaa719sUVXpcadOA2EB
        qqFPNA/OmDGi7FA1xlx4d/FZ3r3xrA==
X-Google-Smtp-Source: AMrXdXvFTgrwmcyihMrqnmdsU7P0JAEegOcRFwjVHBZxPEZd8kcDnA+SdeCcchrujcRs3CfN2ur8rg==
X-Received: by 2002:a05:6870:7997:b0:15b:9fb0:864c with SMTP id he23-20020a056870799700b0015b9fb0864cmr2551641oab.19.1673981372533;
        Tue, 17 Jan 2023 10:49:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f96-20020a9d03e9000000b00684e4d974e6sm5092762otf.24.2023.01.17.10.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:49:32 -0800 (PST)
Received: (nullmailer pid 3445817 invoked by uid 1000);
        Tue, 17 Jan 2023 18:49:31 -0000
Date:   Tue, 17 Jan 2023 12:49:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: phy: tegra-xusb: Convert to json-schema
Message-ID: <20230117184931.GA3431713-robh@kernel.org>
References: <20230113150804.1272555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113150804.1272555-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 13, 2023 at 04:08:04PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB pad controller bindings from free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - use | to keep paragraphs in multi-paragraph descriptions
> - move additionalProperties to improve readability
> - clarify that "status" can also be absent
> - drop phandle and status properties
> - remove quotes around references
> - use dual licensing
> 
> Changes in v2:
> - split up into multiple schemas
> 
>  .../phy/nvidia,tegra124-xusb-padctl.txt       | 779 -----------------
>  .../phy/nvidia,tegra124-xusb-padctl.yaml      | 654 +++++++++++++++
>  .../phy/nvidia,tegra186-xusb-padctl.yaml      | 544 ++++++++++++
>  .../phy/nvidia,tegra194-xusb-padctl.yaml      | 630 ++++++++++++++
>  .../phy/nvidia,tegra210-xusb-padctl.yaml      | 786 ++++++++++++++++++
>  5 files changed, 2614 insertions(+), 779 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml
> 

> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
> new file mode 100644
> index 000000000000..33b41b6b2fd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
> @@ -0,0 +1,654 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/nvidia,tegra124-xusb-padctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra124 XUSB pad controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  The Tegra XUSB pad controller manages a set of I/O lanes (with differential
> +  signals) which connect directly to pins/pads on the SoC package. Each lane
> +  is controlled by a HW block referred to as a "pad" in the Tegra hardware
> +  documentation. Each such "pad" may control either one or multiple lanes,
> +  and thus contains any logic common to all its lanes. Each lane can be
> +  separately configured and powered up.
> +
> +  Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
> +  super-speed USB. Other lanes are for various types of low-speed, full-speed
> +  or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
> +  contains a software-configurable mux that sits between the I/O controller
> +  ports (e.g. PCIe) and the lanes.
> +
> +  In addition to per-lane configuration, USB 3.0 ports may require additional
> +  settings on a per-board basis.
> +
> +  Pads will be represented as children of the top-level XUSB pad controller
> +  device tree node. Each lane exposed by the pad will be represented by its
> +  own subnode and can be referenced by users of the lane using the standard
> +  PHY bindings, as described by the phy-bindings.txt file in this directory.
> +
> +  The Tegra hardware documentation refers to the connection between the XUSB
> +  pad controller and the XUSB controller as "ports". This is confusing since
> +  "port" is typically used to denote the physical USB receptacle. The device
> +  tree binding in this document uses the term "port" to refer to the logical
> +  abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
> +  for the USB signal, the VBUS power supply, the USB 2.0 companion port for
> +  USB 3.0 receptacles, ...).
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra124-xusb-padctl
> +
> +      - items:
> +          - const: nvidia,tegra132-xusb-padctl
> +          - const: nvidia,tegra124-xusb-padctl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: XUSB pad controller interrupt
> +
> +  resets:
> +    items:
> +      - description: pad controller reset
> +
> +  reset-names:
> +    items:
> +      - const: padctl
> +
> +  avdd-pll-utmip-supply:
> +    description: UTMI PLL power supply. Must supply 1.8 V.
> +
> +  avdd-pll-erefe-supply:
> +    description: PLLE reference PLL power supply. Must supply 1.05 V.
> +
> +  avdd-pex-pll-supply:
> +    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> +
> +  hvdd-pex-pll-e-supply:
> +    description: High-voltage PLLE power supply. Must supply 3.3 V.
> +
> +  pads:
> +    description: A required child node named "pads" contains a list of
> +      subnodes, one for each of the pads exposed by the XUSB pad controller.
> +      Each pad may need additional resources that can be referenced in its
> +      pad node.
> +
> +      The "status" property is used to enable or disable the use of a pad.
> +      If set to "disabled", the pad will not be used on the given board. In
> +      order to use the pad and any of its lanes, this property must be set
> +      to "okay" or be absent.
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      usb2:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          clocks:
> +            items:
> +              - description: USB2 tracking clock
> +
> +          clock-names:
> +            items:
> +              - const: trk
> +
> +          lanes:
> +            type: object
> +            additionalProperties: false
> +            properties:
> +              usb2-0:

Any reason to not make this a pattern? '^usb2-[0-2]$'

Same question in several other cases.

> +                type: object
> +                additionalProperties: false
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: /schemas/types.yaml#/definitions/string
> +                    enum: [ snps, xusb, uart ]
> +
> +              usb2-1:
> +                type: object
> +                additionalProperties: false
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: /schemas/types.yaml#/definitions/string
> +                    enum: [ snps, xusb, uart ]
> +
> +              usb2-2:
> +                type: object
> +                additionalProperties: false
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: /schemas/types.yaml#/definitions/string
> +                    enum: [ snps, xusb, uart ]
