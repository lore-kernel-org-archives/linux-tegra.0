Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6A0C07E9A
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 18:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56D0E613C5
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 18:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhGNSEb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 14:04:31 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:34496 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhGNSEb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 14:04:31 -0400
Received: by mail-io1-f41.google.com with SMTP id g22so3241841iom.1;
        Wed, 14 Jul 2021 11:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=na9wNolD/elx+L0Xys11BQ42knQcqp0Yf0/ie6kUcz0=;
        b=SEozEvVRwh+eNPltnRaj8hqr1yB3A4tVspLzh6egQm6I6VdMqbAHkcTLsYKUhP1eIt
         7tOT7a297kbF5XiJ48N9okuH4IIVIK8oJogB4hqwq0HZvK16YmzcaX4C04SP/fz1/VUv
         FOtsIMjOcwN7haXFpLkDiQltBOUvBDp5HO09myFIDYXHdtxmkQiCMCWulYjNw1CEw7kQ
         JSYg/5BPwBOHkNHkOf+onS2cyYWz1N4EtfqX1OGf//1nkIy909/XAr6znJzgGLXt9WJ7
         hSZFX3uAAcqB8ZPc1In6s52qjpqRM5/pAXsbl9g1gZVX94Or/17Hs2TlhLH3GPUuHTnq
         RThQ==
X-Gm-Message-State: AOAM532Gb6XDeB8ggsCFuLwCOu5/Cbv5HCYsZOb9oBosNS3rlZPhSgZM
        qGwzy0j4vHbhapTHyOCknA==
X-Google-Smtp-Source: ABdhPJywQd7j6MLKchw6NwruX/x2oZvJnaGwnkg9sEn4xhhsOR87Y3iJP57IR5jWQbiabDP46eGYBA==
X-Received: by 2002:a02:866b:: with SMTP id e98mr10138783jai.48.1626285698248;
        Wed, 14 Jul 2021 11:01:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h10sm1643971ioe.43.2021.07.14.11.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:01:36 -0700 (PDT)
Received: (nullmailer pid 2848211 invoked by uid 1000);
        Wed, 14 Jul 2021 18:01:34 -0000
Date:   Wed, 14 Jul 2021 12:01:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: tegra: Convert to json-schema
Message-ID: <20210714180134.GA2840485@robh.at.kernel.org>
References: <20210622142436.4014610-1-thierry.reding@gmail.com>
 <20210622142436.4014610-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622142436.4014610-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 22, 2021 at 04:24:36PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the old plain-text device tree bindings for the USB EHCI
> controller found on NVIDIA Tegra SoCs to the json-schema format.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop unneeded clock-names property
> - fix indentation issues
> 
>  .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
>  .../bindings/usb/nvidia,tegra20-ehci.yaml     | 150 ++++++++++++++++++
>  2 files changed, 150 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
> deleted file mode 100644
> index f60785f73d3d..000000000000
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Tegra SOC USB controllers
> -
> -The device node for a USB controller that is part of a Tegra
> -SOC is as described in the document "Open Firmware Recommended
> -Practice : Universal Serial Bus" with the following modifications
> -and additions :
> -
> -Required properties :
> - - compatible : For Tegra20, must contain "nvidia,tegra20-ehci".
> -   For Tegra30, must contain "nvidia,tegra30-ehci".  Otherwise, must contain
> -   "nvidia,<chip>-ehci" plus at least one of the above, where <chip> is
> -   tegra114, tegra124, tegra132, or tegra210.
> - - nvidia,phy : phandle of the PHY that the controller is connected to.
> - - clocks : Must contain one entry, for the module clock.
> -   See ../clocks/clock-bindings.txt for details.
> - - resets : Must contain an entry for each entry in reset-names.
> -   See ../reset/reset.txt for details.
> - - reset-names : Must include the following entries:
> -   - usb
> -
> -Optional properties:
> - - nvidia,needs-double-reset : boolean is to be set for some of the Tegra20
> -   USB ports, which need reset twice due to hardware issues.
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
> new file mode 100644
> index 000000000000..079cae44b8d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/nvidia,tegra20-ehci.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree binding for NVIDIA Tegra USB controllers
> +
> +description: |
> +  The device node for a USB controller that is part of a Tegra SOC is as
> +  described in the document "Open Firmware Recommended Practice : Universal
> +  Serial Bus". Modifications and additions are detailed in this document.
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +  - Jon Hunter <jonathanh@nvidia.com>

allOf:
  - $ref: usb-hcd.yaml#

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - nvidia,tegra210-ehci
> +              - nvidia,tegra124-ehci
> +              - nvidia,tegra114-ehci
> +          - const: nvidia,tegra30-ehci
> +      - items:
> +          - const: nvidia,tegra30-ehci
> +      - items:
> +          - const: nvidia,tegra20-ehci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phy_type:
> +    $ref: /schemas/types.yaml#/definitions/string

Already has a type (usb.yaml). You support all the possible modes? If 
not, list what is supported.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: usb
> +
> +  nvidia,phy:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle of the PHY that the controller is connected to
> +
> +  nvidia,needs-double-reset:
> +    type: boolean
> +    description:
> +      This must be set for some instances of the USB controller found on
> +      Tegra20 that need to be reset twice due to some hardware issue.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +  - reset-names
> +  - phy_type
> +  - nvidia,phy
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@c5000000 {
> +        compatible = "nvidia,tegra20-ehci";
> +        reg = <0xc5000000 0x4000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        phy_type = "utmi";
> +        clocks = <&tegra_car TEGRA20_CLK_USBD>;
> +        resets = <&tegra_car 22>;
> +        reset-names = "usb";
> +        nvidia,needs-double-reset;
> +        nvidia,phy = <&phy1>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@7d000000 {
> +        compatible = "nvidia,tegra30-ehci";
> +        reg = <0x7d000000 0x4000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        phy_type = "utmi";
> +        clocks = <&tegra_car TEGRA30_CLK_USBD>;
> +        resets = <&tegra_car 22>;
> +        reset-names = "usb";
> +        nvidia,needs-double-reset;
> +        nvidia,phy = <&phy1>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra114-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@7d000000 {
> +        compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci";
> +        reg = <0x7d000000 0x4000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        phy_type = "utmi";
> +        clocks = <&tegra_car TEGRA114_CLK_USBD>;
> +        resets = <&tegra_car 22>;
> +        reset-names = "usb";
> +        nvidia,phy = <&phy1>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra124-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@7d000000 {
> +        compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
> +        reg = <0x7d000000 0x4000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        phy_type = "utmi";
> +        clocks = <&tegra_car TEGRA124_CLK_USBD>;
> +        resets = <&tegra_car 22>;
> +        reset-names = "usb";
> +        nvidia,phy = <&phy1>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@7d000000 {
> +        compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci";
> +        reg = <0x7d000000 0x4000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        phy_type = "utmi";
> +        clocks = <&tegra_car TEGRA210_CLK_USBD>;
> +        resets = <&tegra_car 22>;
> +        reset-names = "usb";
> +        nvidia,phy = <&phy1>;
> +    };
> -- 
> 2.32.0
> 
> 
