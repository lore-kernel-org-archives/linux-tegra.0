Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ECBC49EA7
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 19:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BB5D613AE
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 19:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbhFVToS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 15:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbhFVToO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 15:44:14 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C56C061787;
        Tue, 22 Jun 2021 12:41:02 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id f10so491372iok.6;
        Tue, 22 Jun 2021 12:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RZRCmkPMX+LjmfJuS0z6pMpfWMHuu1/zHMzh3HkyDAU=;
        b=IYZEMtXKgYKR5PhcCD8r/he4OhDZBp8Bpu5zjSNcrPBJZLwedn53g7MsaeHc4z7ZT1
         6faMruOefvrGsfTJnIxaJeCc4f/+VS4/WjBOjYbbOH/6d8MGoBFzKmWHpZIivn0R/iEx
         wh7+yDb3p9J/oMkRFuOe9ehahGKJafa2JEqi+BaH/1QxyfruDXPhs3ZSZJ6TxMtkLBS8
         g0E+Ef6BzJF9T4yE1INRydqdoNfc3dP4FhzM3om0XRlSyR/IKXVa4kGz3mZG9XDoinjh
         W61Cnk3aPAidytJLZKFr/i/hbvXmZSamNsUA7Nj79wHQDrLglV5hyAWwoH91XnmY5ZoI
         BYFA==
X-Gm-Message-State: AOAM533C5S32QlZS9f7zfeV/7poZl62ouapayrE9OdWhOk8NozU3+ieP
        oNc/Zcn8oF2deEl5YuVHtg==
X-Google-Smtp-Source: ABdhPJzDnTr1xqCwYFyBWva3mFfN9o3Y7kYtQgNOLe+nnushdcJuyPQ1omh/skRcTG06IEhu6N7/yw==
X-Received: by 2002:a05:6638:380b:: with SMTP id i11mr5412068jav.57.1624390561800;
        Tue, 22 Jun 2021 12:36:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m13sm8260304iob.35.2021.06.22.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 12:35:56 -0700 (PDT)
Received: (nullmailer pid 3128 invoked by uid 1000);
        Tue, 22 Jun 2021 19:35:55 -0000
Date:   Tue, 22 Jun 2021 13:35:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: tegra: Convert to json-schema
Message-ID: <20210622193555.GA4190046@robh.at.kernel.org>
References: <20210621141559.2881667-1-thierry.reding@gmail.com>
 <20210621141559.2881667-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621141559.2881667-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jun 21, 2021 at 04:15:59PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the old plain-text device tree bindings for the USB EHCI
> controller found on NVIDIA Tegra SoCs to the json-schema format.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
>  .../bindings/usb/nvidia,tegra20-ehci.yaml     | 151 ++++++++++++++++++
>  2 files changed, 151 insertions(+), 23 deletions(-)
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
> index 000000000000..3d942f598eac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
> @@ -0,0 +1,151 @@
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
> +

This should reference usb-hcd.yaml.

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - nvidia,tegra210-ehci
> +          - nvidia,tegra124-ehci
> +          - nvidia,tegra114-ehci
> +        - const: nvidia,tegra30-ehci
> +      - items:
> +        - const: nvidia,tegra30-ehci
> +      - items:
> +        - const: nvidia,tegra20-ehci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phy_type:
> +    $ref: /schemas/types.yaml#/definitions/string

This is covered by usb-hcd.yaml. You may want to constrain it to only 
the types supported.

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
> +        clock-names = "usb";
> +        resets = <&tegra_car 22>;
> +        reset-names = "usb";
> +        nvidia,phy = <&phy1>;
> +    };

Seems a bit excessive to have 4 examples.

> -- 
> 2.32.0
> 
> 
