Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89C8EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 22:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGGWfI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGGWfH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 18:35:07 -0400
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6ACE211F;
        Fri,  7 Jul 2023 15:35:05 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-77a62a84855so87455639f.1;
        Fri, 07 Jul 2023 15:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688769305; x=1691361305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO6B4WfoHB202WFNMRLcpyamtqIH+vvmnNxYhZpAnVU=;
        b=MUZMZxPGSjHgTB/7RFmhjPkZm0xsBhkbNKQHi9Ur5mM1JRk6sDxDzZbmUjOBCFvMRK
         k1lKhKpMmwU8rkEX56FbIdlf4UvTTypd6UjOTakiKSikl93Wdlb+YBdvsSlr7cpBBHiE
         b2qnBckwU7xOajXRH5liTy0pn9eePZgI0ioTl/2P0UltP1GlPbjgGOZ/08kMa25fBRgS
         0k1PjD0oIqrJRwcB39owoXMxL94/xzTzKaXAlC8Gtz6wRRkdZZrSO3xxqAtmrDiFAsso
         1f8V8QYSlehphE3NMcJXOTdIIbcimpI1yCTiOs9INS9mraREJyqVa6kLktAvqUs63Byj
         gjnw==
X-Gm-Message-State: ABy/qLZoOl5idkcdPw1N5vGyYmPMXiPuIDVP0bALgcb6lGG08iaqxTyz
        0r19QAC2bHYXcFY6UiQHbw==
X-Google-Smtp-Source: APBJJlGQjNeQHl2YxeN4tV2o/2Vp9VxUFJ6VBdW8s9glgwuWo/5ZSv/GXn9GW6euzFWEP3Xcgu5KRQ==
X-Received: by 2002:a6b:fd02:0:b0:783:69e0:57a7 with SMTP id c2-20020a6bfd02000000b0078369e057a7mr6780032ioi.16.1688769304900;
        Fri, 07 Jul 2023 15:35:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id v2-20020a02b902000000b00428722c1c51sm1533271jan.32.2023.07.07.15.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:35:04 -0700 (PDT)
Received: (nullmailer pid 1091226 invoked by uid 1000);
        Fri, 07 Jul 2023 22:35:03 -0000
Date:   Fri, 7 Jul 2023 16:35:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: arm: tegra: pmc: Restructure pad
 configuration node schema
Message-ID: <20230707223503.GA1087110-robh@kernel.org>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707131711.2997956-5-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 07, 2023 at 03:17:09PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The pad configuration node schema in its current form can accidentally
> match other properties as well. Restructure the schema to better match
> how the device trees are using these.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 181 ++++++++++++------
>  1 file changed, 120 insertions(+), 61 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> index 82070d47ac7c..271aa8f80a65 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> @@ -245,69 +245,82 @@ properties:
>            - resets
>            - '#power-domain-cells'
>  
> -patternProperties:
> -  "^[a-f0-9]+-[a-f0-9]+$":
> +  pinmux:
>      type: object
> -    description:
> -      This is a Pad configuration node. On Tegra SOCs a pad is a set of
> -      pins which are configured as a group. The pin grouping is a fixed
> -      attribute of the hardware. The PMC can be used to set pad power state
> -      and signaling voltage. A pad can be either in active or power down mode.
> -      The support for power state and signaling voltage configuration varies
> -      depending on the pad in question. 3.3V and 1.8V signaling voltages
> -      are supported on pins where software controllable signaling voltage
> -      switching is available.
> -
> -      The pad configuration state nodes are placed under the pmc node and they
> -      are referred to by the pinctrl client properties. For more information
> -      see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
> -      The pad name should be used as the value of the pins property in pin
> -      configuration nodes.
> -
> -      The following pads are present on Tegra124 and Tegra132
> -      audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, hdmi, hsic,
> -      hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2, pex-cntrl,
> -      sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2, usb_bias.
> -
> -      The following pads are present on Tegra210
> -      audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
> -      debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpio, hdmi,
> -      hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl, sdmmc1,
> -      sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias.
> -
>      properties:
> -      pins:
> -        $ref: /schemas/types.yaml#/definitions/string
> -        description: Must contain name of the pad(s) to be configured.
> -
> -      low-power-enable:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description: Configure the pad into power down mode.
> -
> -      low-power-disable:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description: Configure the pad into active mode.
> -
> -      power-source:
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        description:
> -          Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> -          TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages.
> -          The values are defined in
> -          include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
> -          Power state can be configured on all Tegra124 and Tegra132
> -          pads. None of the Tegra124 or Tegra132 pads support signaling
> -          voltage switching.
> -          All of the listed Tegra210 pads except pex-cntrl support power
> -          state configuration. Signaling voltage switching is supported
> -          on below Tegra210 pads.
> -          audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1,
> -          sdmmc3, spi, spi-hv, and uart.
> -
> -    required:
> -      - pins
> -
> -    additionalProperties: false
> +      status: true

If you need this, that's a bug in dtschema.

> +
> +    additionalProperties:
> +      type: object
> +      description: |
> +        This is a pad configuration node. On Tegra SoCs a pad is a set of pins
> +        which are configured as a group. The pin grouping is a fixed attribute
> +        of the hardware. The PMC can be used to set pad power state and
> +        signaling voltage. A pad can be either in active or power down mode.
> +        The support for power state and signaling voltage configuration varies
> +        depending on the pad in question. 3.3V and 1.8V signaling voltages are
> +        supported on pins where software controllable signaling voltage
> +        switching is available.
> +
> +        The pad configuration state nodes are placed under the pmc node and
> +        they are referred to by the pinctrl client properties. For more
> +        information see:
> +
> +          Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +        The pad name should be used as the value of the pins property in pin
> +        configuration nodes.
> +
> +        The following pads are present on Tegra124 and Tegra132:
> +
> +          audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, hdmi,
> +          hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2,
> +          pex-cntrl, sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2,
> +          usb_bias
> +
> +        The following pads are present on Tegra210:
> +
> +          audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
> +          debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpio,
> +          hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl,
> +          sdmmc1, sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias
> +      additionalProperties: false
> +      properties:
> +        pins:
> +          $ref: /schemas/types.yaml#/definitions/string-array
> +          description: Must contain name of the pad(s) to be configured.
> +
> +        low-power-enable:
> +          $ref: /schemas/types.yaml#/definitions/flag
> +          description: Configure the pad into power down mode.
> +
> +        low-power-disable:
> +          $ref: /schemas/types.yaml#/definitions/flag
> +          description: Configure the pad into active mode.
> +
> +        power-source:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description: |
> +            Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> +            TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages. The
> +            values are defined in:
> +
> +              include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
> +
> +            Power state can be configured on all Tegra124 and Tegra132 pads.
> +            None of the Tegra124 or Tegra132 pads support signaling voltage
> +            switching. All of the listed Tegra210 pads except pex-cntrl support
> +            power state configuration. Signaling voltage switching is supported
> +            on the following Tegra210 pads:
> +
> +              audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1, sdmmc3,
> +              spi, spi-hv, uart
> +
> +        phandle:
> +          $ref: /schemas/types.yaml#/definitions/uint32

ditto

> +
> +      required:
> +        - pins
>  
>  required:
>    - compatible
> @@ -316,6 +329,52 @@ required:
>    - clocks
>    - '#clock-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra124-pmc
> +    then:
> +      properties:
> +        pinmux:
> +          properties:
> +            status: true
> +
> +          additionalProperties:
> +            type: object
> +            properties:
> +              pins:
> +                items:
> +                  enum: [ audio, bb, cam, comp, csia, csb, cse, dsi, dsib,
> +                          dsic, dsid, hdmi, hsic, hv, lvds, mipi-bias, nand,
> +                          pex-bias, pex-clk1, pex-clk2, pex-cntrl, sdmmc1,
> +                          sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2,
> +                          usb_bias ]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra210-pmc
> +    then:
> +      properties:
> +        pinmux:
> +          properties:
> +            status: true
> +
> +          additionalProperties:
> +            type: object
> +            properties:
> +              pins:
> +                items:
> +                  enum: [ audio, audio-hv, cam, csia, csib, csic, csid, csie,
> +                          csif, dbg, debug-nonao, dmic, dp, dsi, dsib, dsic,
> +                          dsid, emmc, emmc2, gpio, hdmi, hsic, lvds, mipi-bias,
> +                          pex-bias, pex-clk1, pex-clk2, pex-cntrl, sdmmc1,
> +                          sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3,
> +                          usb-bias ]
> +
>  additionalProperties: false
>  
>  dependencies:
> -- 
> 2.41.0
> 
