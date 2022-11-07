Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BD6C4332F
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Nov 2022 19:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbiKGTwX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Nov 2022 14:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbiKGTwW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Nov 2022 14:52:22 -0500
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14E51FF8E;
        Mon,  7 Nov 2022 11:52:20 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id l127so13311820oia.8;
        Mon, 07 Nov 2022 11:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuylX1bTOmemuP8xGDi5WsrUv35UEHZFXSftSPBaLKM=;
        b=yuP3OCIKGwLOZHMmb/EZH4KThXVE9kSvzy9lVTh943JENa+sC4kxUyTKvBzugZJiiN
         DW4LmtLSPV3PKbtfO6lximLhAUNXF55x9GLiIIssi2vrauO6+lmTp8SQsZhv8JvAgO5m
         DZpS/geIQqUdnDxC4LZHORSPxNv9VAHIfnvF4MsRTlgBai7v4i6aui7njk4cYt2yfvcR
         /HFScwnmMvaV4yYnCxccoORtrhSMxVTvYtNFJCwr99CUYOn6RlwjxDF94HvQtlTRQ7Wq
         8V/0ydTiCsjACqHrKC1aV9RM1GKQgFeWLTcjs9tZaZBwu57u4IDMiAWl+8Gvp2KJobx/
         muZw==
X-Gm-Message-State: ACrzQf3tzxQ/K7ZvooHEoGngX6eNYQHkX1Kybex2Fqo1aH/Iwg18d4mO
        Xh1xxKTTrgF0DOGznyaS+g==
X-Google-Smtp-Source: AMsMyM5QhW7KzS03WKFmMWOeyFPTKQ4A5+EdF6vzA1IkwSR8sVi/Nq44VPf5FuFVOHrrkhhgeWmlkQ==
X-Received: by 2002:a54:4708:0:b0:35a:493e:18a0 with SMTP id k8-20020a544708000000b0035a493e18a0mr14134342oik.284.1667850739934;
        Mon, 07 Nov 2022 11:52:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s124-20020acac282000000b003458d346a60sm2738154oif.25.2022.11.07.11.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:52:19 -0800 (PST)
Received: (nullmailer pid 1483016 invoked by uid 1000);
        Mon, 07 Nov 2022 19:52:21 -0000
Date:   Mon, 7 Nov 2022 13:52:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: tegra-xusb: Convert to json-schema
Message-ID: <20221107195221.GA1462892-robh@kernel.org>
References: <20221103144200.1479640-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103144200.1479640-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 03, 2022 at 03:42:00PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB controller bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Wayne, going forward it might make sense for you to pick this up into
> your Tegra234 series and add the Tegra234 bindings on top of this.
> 
> Changes in v2:
> - use minItems/maxItems/items instead of contains/anyOf for phy-names
> - add missing compatible string to USB device example
> - drop unneeded phys property description
> - drop unneeded USB bus properties
> - add reference to usb-xhci.yaml
> 
>  .../bindings/usb/nvidia,tegra124-xusb.txt     | 132 -----------
>  .../bindings/usb/nvidia,tegra124-xusb.yaml    | 202 +++++++++++++++++
>  .../bindings/usb/nvidia,tegra186-xusb.yaml    | 181 +++++++++++++++
>  .../bindings/usb/nvidia,tegra194-xusb.yaml    | 187 ++++++++++++++++
>  .../bindings/usb/nvidia,tegra210-xusb.yaml    | 207 ++++++++++++++++++
>  5 files changed, 777 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> deleted file mode 100644
> index 5bfcc0b4d6b9..000000000000
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> +++ /dev/null
> @@ -1,132 +0,0 @@
> -NVIDIA Tegra xHCI controller
> -============================
> -
> -The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by
> -the Tegra XUSB pad controller.
> -
> -Required properties:
> ---------------------
> -- compatible: Must be:
> -  - Tegra124: "nvidia,tegra124-xusb"
> -  - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
> -  - Tegra210: "nvidia,tegra210-xusb"
> -  - Tegra186: "nvidia,tegra186-xusb"
> -- reg: Must contain the base and length of the xHCI host registers, XUSB FPCI
> -  registers and XUSB IPFS registers.
> -- reg-names: Must contain the following entries:
> -  - "hcd"
> -  - "fpci"
> -  - "ipfs"
> -- interrupts: Must contain the xHCI host interrupt and the mailbox interrupt.
> -- clocks: Must contain an entry for each entry in clock-names.
> -  See ../clock/clock-bindings.txt for details.
> -- clock-names: Must include the following entries:
> -   - xusb_host
> -   - xusb_host_src
> -   - xusb_falcon_src
> -   - xusb_ss
> -   - xusb_ss_src
> -   - xusb_ss_div2
> -   - xusb_hs_src
> -   - xusb_fs_src
> -   - pll_u_480m
> -   - clk_m
> -   - pll_e
> -- resets: Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names: Must include the following entries:
> -  - xusb_host
> -  - xusb_ss
> -  - xusb_src
> -  Note that xusb_src is the shared reset for xusb_{ss,hs,fs,falcon,host}_src.
> -- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
> -  configure the USB pads used by the XHCI controller
> -
> -For Tegra124 and Tegra132:
> -- avddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> -- dvddio-pex-supply: PCIe/USB3 digital logic power supply. Must supply 1.05 V.
> -- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> -- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
> -- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
> -- avdd-usb-ss-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> -- hvdd-usb-ss-supply: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
> -- hvdd-usb-ss-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
> -
> -For Tegra210:
> -- dvddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> -- hvddio-pex-supply: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
> -- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> -- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
> -- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
> -- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> -- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
> -
> -For Tegra210 and Tegra186:
> -- power-domains: A list of PM domain specifiers that reference each power-domain
> -  used by the xHCI controller. This list must comprise of a specifier for the
> -  XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
> -  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> -- power-domain-names: A list of names that represent each of the specifiers in
> -  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_host' which
> -  represent the power-domains XUSBA and XUSBC, respectively. See
> -  ../power/power_domain.txt for details.
> -
> -Optional properties:
> ---------------------
> -- phys: Must contain an entry for each entry in phy-names.
> -  See ../phy/phy-bindings.txt for details.
> -- phy-names: Should include an entry for each PHY used by the controller. The
> -  following PHYs are available:
> -  - Tegra124: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
> -  - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
> -  - Tegra210: usb2-0, usb2-1, usb2-2, usb2-3, hsic-0, usb3-0, usb3-1, usb3-2,
> -              usb3-3
> -  - Tegra186: usb2-0, usb2-1, usb2-2, hsic-0, usb3-0, usb3-1, usb3-2
> -
> -Example:
> ---------
> -
> -	usb@0,70090000 {
> -		compatible = "nvidia,tegra124-xusb";
> -		reg = <0x0 0x70090000 0x0 0x8000>,
> -		      <0x0 0x70098000 0x0 0x1000>,
> -		      <0x0 0x70099000 0x0 0x1000>;
> -		reg-names = "hcd", "fpci", "ipfs";
> -
> -		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
> -			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
> -			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
> -			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
> -			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
> -			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
> -			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
> -			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
> -			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
> -			 <&tegra_car TEGRA124_CLK_CLK_M>,
> -			 <&tegra_car TEGRA124_CLK_PLL_E>;
> -		clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
> -			      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
> -			      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
> -			      "clk_m", "pll_e";
> -		resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
> -		reset-names = "xusb_host", "xusb_ss", "xusb_src";
> -
> -		nvidia,xusb-padctl = <&padctl>;
> -
> -		phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
> -		       <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
> -		       <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
> -		phy-names = "usb2-1", "usb2-2", "usb3-0";
> -
> -		avddio-pex-supply = <&vdd_1v05_run>;
> -		dvddio-pex-supply = <&vdd_1v05_run>;
> -		avdd-usb-supply = <&vdd_3v3_lp0>;
> -		avdd-pll-utmip-supply = <&vddio_1v8>;
> -		avdd-pll-erefe-supply = <&avdd_1v05_run>;
> -		avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
> -		hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
> -		hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
> new file mode 100644
> index 000000000000..4a6616bf9bab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
> @@ -0,0 +1,202 @@
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
> +description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
> +  exposed by the Tegra XUSB pad controller.
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
> +    minItems: 1
> +    maxItems: 7
> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 7
> +    items:
> +      enum:
> +        - usb2-0
> +        - usb2-1
> +        - usb2-2
> +        - hsic-0
> +        - hsic-1
> +        - usb3-0
> +        - usb3-1
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
> index 000000000000..7126d137133a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
> @@ -0,0 +1,181 @@
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
> +description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
> +  exposed by the Tegra XUSB pad controller.
> +
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
> +    description: phandle to the XUSB pad controller that is used to configure
> +      the USB pads used by the XHCI controller
> +
> +  phys:
> +    minItems: 1
> +    maxItems: 7
> +
> +  phy-names:
> +    minItems: 1
> +    maxItems: 7
> +    items:
> +      enum:
> +        - usb2-0
> +        - usb2-1
> +        - usb2-2
> +        - hsic-0
> +        - usb3-0
> +        - usb3-1
> +        - usb3-2
> +
> +  power-domains:
> +    description: A list of PM domain specifiers that reference each power-
> +      domain used by the xHCI controller. This list must comprise of a
> +      specifier for the XUSBA and XUSBC power-domains.
> +
> +      See ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
> +      for details.

Drop description.

> +    items:
> +      - description: XUSBC power domain
> +      - description: XUSBA power domain
> +
> +  power-domain-names:
> +    description: A list of names that represent each of the specifiers in the
> +      'power-domains' property. See ../power/power_domain.txt for details.

ditto

And the same elsewhere.

> +    items:
> +      - const: xusb_host
> +      - const: xusb_ss

host/XUSBC and ss/XUSBA don't really correlate. It's all supposed to be 
named relative to the device rather than top-level/source/provider. 
You're stuck with the host/ss names, so maybe improve the descriptions.

With those fixes,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
