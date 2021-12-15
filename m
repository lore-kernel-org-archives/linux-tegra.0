Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F9AC433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Dec 2021 19:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhLOTs5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Dec 2021 14:48:57 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:35425 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhLOTsu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Dec 2021 14:48:50 -0500
Received: by mail-ot1-f47.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso26234093otr.2;
        Wed, 15 Dec 2021 11:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wjtQHmxWIM2KPw/2GCRujiYZLGIBrZfnlM825/goAD8=;
        b=g1I3L0qU62+1QPV8FVzje7pr5Yn+waepd9ekp9teCCTWgn8yl68hqF9qMKpQsglXLs
         JnCcvACWD8bIXIBvvjVzyFC4qKBVV+9aurGX4Kaef4dUkp+ZuyJButK7pfHDKlDEftqb
         0XMU51ywcTzWing4ebJ1F9gJoJ7nQ075FY/ZqhpN4WIgaVeLyfKnG5rw4XuViRbY2g0Z
         4NDQkV3+ZbbydRTUg5g/zS1xTBDkne1XrewTAtfWCnZuNWeoG2z3GSRcaBhmOHWQdbdO
         9ME9qBg5tP+HA9GBsuRTo+/slRM5cwJNkZefao/30qXOttX74yMLkfVr3/lA1VnalnU5
         8tDg==
X-Gm-Message-State: AOAM530hsZn3y6ioEpjU4jDAluMxLlZm49d31o8/OkQsZLTc4Whtt1bq
        2wLDtAAYBBcM+Cw8ELlx6A==
X-Google-Smtp-Source: ABdhPJwAPXitXAkulJ4tyvzNfAF4l/902558YEYpjrxT+JMxAh7soQQU5ANWpmQe0ZgndTyVt/CA0w==
X-Received: by 2002:a9d:6b87:: with SMTP id b7mr10260279otq.204.1639597729449;
        Wed, 15 Dec 2021 11:48:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k8sm657990oon.2.2021.12.15.11.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:48:48 -0800 (PST)
Received: (nullmailer pid 1722035 invoked by uid 1000);
        Wed, 15 Dec 2021 19:48:47 -0000
Date:   Wed, 15 Dec 2021 13:48:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: usb: tegra-xusb: Convert to json-schema
Message-ID: <YbpGn7A5SDBqgS5O@robh.at.kernel.org>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
 <20211209165339.614498-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209165339.614498-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 09, 2021 at 05:53:38PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB controller bindings from the free-form text
> format to json-schema.

Seems like the dtbs_check warnings need to be addressed.

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra124-xusb.txt     | 132 -----------
>  .../bindings/usb/nvidia,tegra124-xusb.yaml    | 201 +++++++++++++++++
>  .../bindings/usb/nvidia,tegra186-xusb.yaml    | 182 +++++++++++++++
>  .../bindings/usb/nvidia,tegra194-xusb.yaml    | 188 ++++++++++++++++
>  .../bindings/usb/nvidia,tegra210-xusb.yaml    | 210 ++++++++++++++++++
>  5 files changed, 781 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml


> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
> new file mode 100644
> index 000000000000..0b636a3b918b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
> @@ -0,0 +1,201 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/nvidia,tegra124-xusb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra124 xHCI controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by the Tegra
> +  XUSB pad controller.
> +
> +properties:
> +  # required
> +  compatible:
> +    oneOf:
> +      - description: NVIDIA Tegra124
> +        const: nvidia,tegra124-xusb
> +
> +      - description: NVIDIA Tegra132
> +        items:
> +          - const: nvidia,tegra132-xusb
> +          - const: nvidia,tegra124-xusb
> +
> +  reg:
> +    items:
> +      - description: base and length of the xHCI host registers
> +      - description: base and length of the XUSB FPCI registers
> +      - description: base and length of the XUSB IPFS registers
> +
> +  reg-names:
> +    items:
> +      - const: hcd
> +      - const: fpci
> +      - const: ipfs
> +
> +  interrupts:
> +    items:
> +      - description: xHCI host interrupt
> +      - description: mailbox interrupt
> +
> +  clocks:
> +    items:
> +      - description: XUSB host clock
> +      - description: XUSB host source clock
> +      - description: XUSB Falcon source clock
> +      - description: XUSB SuperSpeed clock
> +      - description: XUSB SuperSpeed clock divider
> +      - description: XUSB SuperSpeed source clock
> +      - description: XUSB HighSpeed clock source
> +      - description: XUSB FullSpeed clock source
> +      - description: USB PLL
> +      - description: reference clock
> +      - description: I/O PLL
> +
> +  clock-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_host_src
> +      - const: xusb_falcon_src
> +      - const: xusb_ss
> +      - const: xusb_ss_div2
> +      - const: xusb_ss_src
> +      - const: xusb_hs_src
> +      - const: xusb_fs_src
> +      - const: pll_u_480m
> +      - const: clk_m
> +      - const: pll_e
> +
> +  resets:
> +    items:
> +      - description: reset for the XUSB host controller
> +      - description: reset for the SuperSpeed logic
> +      - description: shared reset for xusb_{ss,hs,fs,falcon,host}_src.
> +
> +  reset-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_ss
> +      - const: xusb_src
> +
> +  nvidia,xusb-padctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the XUSB pad controller that is used to configure
> +      the USB pads used by the XHCI controller
> +
> +  # optional
> +  phys:
> +    description: Must contain an entry for each entry in phy-names. See
> +      ../phy/phy-bindings.txt for details.

Drop generic descriptions.

> +
> +  phy-names:
> +    description: Should include an entry for each PHY used by the controller.
> +    contains:
> +      anyOf:
> +        - const: usb2-0
> +        - const: usb2-1
> +        - const: usb2-2
> +        - const: hsic-0
> +        - const: hsic-1
> +        - const: usb3-0
> +        - const: usb3-1

Can you at least do:

minItems: 1
maxItems: ??
items:
  enum:
    - the list above...

> +
> +  avddio-pex-supply:
> +    description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> +
> +  dvddio-pex-supply:
> +    description: PCIe/USB3 digital logic power supply. Must supply 1.05 V.
> +
> +  avdd-usb-supply:
> +    description: USB controller power supply. Must supply 3.3 V.
> +
> +  avdd-pll-utmip-supply:
> +    description: UTMI PLL power supply. Must supply 1.8 V.
> +
> +  avdd-pll-erefe-supply:
> +    description: PLLE reference PLL power supply. Must supply 1.05 V.
> +
> +  avdd-usb-ss-pll-supply:
> +    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> +
> +  hvdd-usb-ss-supply:
> +    description: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
> +
> +  hvdd-usb-ss-pll-e-supply:
> +    description: High-voltage PLLE power supply. Must supply 3.3 V.
> +
> +allOf:
> +  - $ref: usb-xhci.yaml
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - nvidia,xusb-padctl
> +  - phys
> +  - phy-names
> +  - avddio-pex-supply
> +  - dvddio-pex-supply
> +  - avdd-usb-supply
> +  - hvdd-usb-ss-supply
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra124-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@70090000 {
> +        compatible = "nvidia,tegra124-xusb";
> +        reg = <0x70090000 0x8000>,
> +              <0x70098000 0x1000>,
> +              <0x70099000 0x1000>;
> +        reg-names = "hcd", "fpci", "ipfs";
> +
> +        interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
> +                 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
> +                 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
> +                 <&tegra_car TEGRA124_CLK_XUSB_SS>,
> +                 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
> +                 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
> +                 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
> +                 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
> +                 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
> +                 <&tegra_car TEGRA124_CLK_CLK_M>,
> +                 <&tegra_car TEGRA124_CLK_PLL_E>;
> +        clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
> +                      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
> +                      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
> +                      "clk_m", "pll_e";
> +        resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
> +        reset-names = "xusb_host", "xusb_ss", "xusb_src";
> +
> +        nvidia,xusb-padctl = <&padctl>;
> +
> +        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
> +               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
> +               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
> +        phy-names = "usb2-1", "usb2-2", "usb3-0";
> +
> +        avddio-pex-supply = <&vdd_1v05_run>;
> +        dvddio-pex-supply = <&vdd_1v05_run>;
> +        avdd-usb-supply = <&vdd_3v3_lp0>;
> +        avdd-pll-utmip-supply = <&vddio_1v8>;
> +        avdd-pll-erefe-supply = <&avdd_1v05_run>;
> +        avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
> +        hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
> +        hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
> new file mode 100644
> index 000000000000..4d896ac2afe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/nvidia,tegra186-xusb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra186 xHCI controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by the Tegra
> +  XUSB pad controller.
> +

Needs a reference to usb-xhci.yaml.

> +properties:
> +  compatible:
> +    const: nvidia,tegra186-xusb
> +
> +  reg:
> +    items:
> +      - description: base and length of the xHCI host registers
> +      - description: base and length of the XUSB FPCI registers
> +
> +  reg-names:
> +    items:
> +      - const: hcd
> +      - const: fpci
> +
> +  interrupts:
> +    items:
> +      - description: xHCI host interrupt
> +      - description: mailbox interrupt
> +
> +  clocks:
> +    items:
> +      - description: XUSB host clock
> +      - description: XUSB Falcon source clock
> +      - description: XUSB SuperSpeed clock
> +      - description: XUSB SuperSpeed source clock
> +      - description: XUSB HighSpeed clock source
> +      - description: XUSB FullSpeed clock source
> +      - description: USB PLL
> +      - description: reference clock
> +      - description: I/O PLL
> +
> +  clock-names:
> +    items:
> +      - const: xusb_host
> +      - const: xusb_falcon_src
> +      - const: xusb_ss
> +      - const: xusb_ss_src
> +      - const: xusb_hs_src
> +      - const: xusb_fs_src
> +      - const: pll_u_480m
> +      - const: clk_m
> +      - const: pll_e
> +
> +  interconnects:
> +    items:
> +      - description: read client
> +      - description: write client
> +
> +  interconnect-names:
> +    items:
> +      - const: dma-mem # read
> +      - const: write
> +
> +  iommus:
> +    maxItems: 1
> +
> +  nvidia,xusb-padctl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the XUSB pad controller that is used to configure the USB pads used by
> +      the XHCI controller
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 7
> +
> +  phy-names:
> +    contains:
> +      anyOf:
> +        - const: usb2-0
> +        - const: usb2-1
> +        - const: usb2-2
> +        - const: hsic-0
> +        - const: usb3-0
> +        - const: usb3-1
> +        - const: usb3-2
> +
> +  power-domains:
> +    description: A list of PM domain specifiers that reference each power-domain used by the xHCI
> +      controller. This list must comprise of a specifier for the XUSBA and XUSBC power-domains.
> +      See ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> +    items:
> +      - description: XUSBC power domain
> +      - description: XUSBA power domain
> +
> +  power-domain-names:
> +    description: A list of names that represent each of the specifiers in the 'power-domains'
> +      property. See ../power/power_domain.txt for details.
> +    items:
> +      - const: xusb_host
> +      - const: xusb_ss
> +
> +  dvddio-pex-supply:
> +    description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> +
> +  hvddio-pex-supply:
> +    description: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
> +
> +  avdd-usb-supply:
> +    description: USB controller power supply. Must supply 3.3 V.
> +
> +  avdd-pll-utmip-supply:
> +    description: UTMI PLL power supply. Must supply 1.8 V.
> +
> +  avdd-pll-uerefe-supply:
> +    description: PLLE reference PLL power supply. Must supply 1.05 V.
> +
> +  dvdd-usb-ss-pll-supply:
> +    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> +
> +  hvdd-usb-ss-pll-e-supply:
> +    description: High-voltage PLLE power supply. Must supply 1.8 V.
> +
> +  # USB bus
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +additionalProperties:
> +  description: USB device nodes
> +  type: object
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +    #include <dt-bindings/power/tegra186-powergate.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    usb@3530000 {
> +        compatible = "nvidia,tegra186-xusb";
> +        reg = <0x03530000 0x8000>,
> +              <0x03538000 0x1000>;
> +        reg-names = "hcd", "fpci";
> +        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&bpmp TEGRA186_CLK_XUSB_HOST>,
> +                 <&bpmp TEGRA186_CLK_XUSB_FALCON>,
> +                 <&bpmp TEGRA186_CLK_XUSB_SS>,
> +                 <&bpmp TEGRA186_CLK_XUSB_CORE_SS>,
> +                 <&bpmp TEGRA186_CLK_CLK_M>,
> +                 <&bpmp TEGRA186_CLK_XUSB_FS>,
> +                 <&bpmp TEGRA186_CLK_PLLU>,
> +                 <&bpmp TEGRA186_CLK_CLK_M>,
> +                 <&bpmp TEGRA186_CLK_PLLE>;
> +        clock-names = "xusb_host", "xusb_falcon_src", "xusb_ss",
> +                      "xusb_ss_src", "xusb_hs_src", "xusb_fs_src",
> +                      "pll_u_480m", "clk_m", "pll_e";
> +        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_XUSBC>,
> +                        <&bpmp TEGRA186_POWER_DOMAIN_XUSBA>;
> +        power-domain-names = "xusb_host", "xusb_ss";
> +        interconnects = <&mc TEGRA186_MEMORY_CLIENT_XUSB_HOSTR &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_XUSB_HOSTW &emc>;
> +        interconnect-names = "dma-mem", "write";
> +        iommus = <&smmu TEGRA186_SID_XUSB_HOST>;
> +        nvidia,xusb-padctl = <&padctl>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
> +               <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
> +               <&{/padctl@3520000/pads/usb3/lanes/usb3-0}>;
> +        phy-names = "usb2-0", "usb2-1", "usb3-0";
> +    };

Similar comments on the rest.

Rob
