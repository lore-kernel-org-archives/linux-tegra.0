Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8F7EB64DD
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 00:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjGYALG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Jul 2023 20:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjGYALG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Jul 2023 20:11:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2B5171E;
        Mon, 24 Jul 2023 17:11:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4532961467;
        Tue, 25 Jul 2023 00:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8DCC433C8;
        Tue, 25 Jul 2023 00:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690243863;
        bh=0f2ttxObuYH3kDd/r78eCuJHpxg65FCD42MXIUNZc1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZG6+w9Zc367Oayte8zOqmiLKktK09ZHAtOC3feJuhjcl1WBJmurVXc/GJ+MEoYAGC
         RC2InksF1As6MvGjkbS3Spks37kC/0ed7n6CTFNzvAjzVDZrChyXUZqiO6KWhW9IbE
         +lICHsSpoKxezQOxDnqsfd1IZ+Q53aW4DEKnuyaITbCAQRQEuWhbFVRl9ACyezHEvk
         oFO7Cf8AmR81/rNbgG6LMwUM/JgTTGwLCH/v43SyOPdzaRw/IBRaeK+6j2RG6bCRra
         Tm70Sv6PN5IkVaXcU3rcfswJ0DtP4oP2gGApgS9yBt6rlFdD0Jl7clqCJ7Gejmeb1d
         Xl8+ojaRjLCmA==
Received: (nullmailer pid 1209990 invoked by uid 1000);
        Tue, 25 Jul 2023 00:11:01 -0000
Date:   Mon, 24 Jul 2023 18:11:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 5/7] dt-bindings: arm: tegra: pmc: Restructure pad
 configuration node schema
Message-ID: <20230725001101.GA1125953-robh@kernel.org>
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
 <20230721135759.2994770-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721135759.2994770-5-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 21, 2023 at 03:57:57PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The pad configuration node schema in its current form can accidentally
> match other properties as well. Restructure the schema to better match
> how the device trees are using these.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - highlight quirks working around possible core schema
> - use phandle: true instead of fully redefining it
> - drop unneeded status property definition
> 
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 184 ++++++++++++------
>  1 file changed, 122 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> index a336a75d8b82..0cbc16ec4267 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> @@ -244,69 +244,79 @@ properties:
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
> -    properties:
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
> +        # XXX why is this needed?

It shouldn't be and is a bug. I have a fix. Will test some more and 
commit it tomorrow.

> +        phandle: true
> +
> +      required:
> +        - pins
>  
>  required:
>    - compatible
> @@ -315,6 +325,56 @@ required:
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
> +          # XXX shouldn't be needed, but the DT validator complains about
> +          # "additionalProperties" if "properties" doesn't exist
> +          properties:
> +            status: true

'type: object' should work here too. That may need the same fix as above 
though.

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
> +          # XXX shouldn't be needed, but the DT validator complains about
> +          # "additionalProperties" if "properties" doesn't exist
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
