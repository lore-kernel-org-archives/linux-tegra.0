Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047B5C43334
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jul 2022 08:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbiGLI23 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jul 2022 04:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbiGLI22 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jul 2022 04:28:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F6FA0241
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:28:26 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n18so11004417lfq.1
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cchOiq76LODUE0Pw/8bM7anxWTplqEmG+iCRmfmY3qQ=;
        b=tD1EnakOErQ3ruNXTuB9YADxDOrd1ROCV4jB6bVj+N1wY2wirP8EPRyRnoeQdPVl91
         7Xk2Oe5Ua9/P/Snfh8xPugNimXCZCSvYn7c1Fbkkv/g0/H+AulOjcLkP34OGEtcoIf3e
         45op3SL1KutDH2ijc6Tq0PK4+WR3kt9aZDOw1IW/elhGuNcqTDntebqmvWgE9omz63dc
         ykc36OiFIJYAVLFXgR8M09Qatw9lMOyj/jzQl1GaN9hbfI41vg3XFOUUzOB5sChPRzAp
         O+Ebqb0+Uv92l5MBEfJXptePuE9q0NWshFUjTGvkPEAjljqa9VpWZ079z16eeX/FpsJ1
         U+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cchOiq76LODUE0Pw/8bM7anxWTplqEmG+iCRmfmY3qQ=;
        b=qfvEYdnXsU+kovEXNVCMr5ybykfuKEVzAbjCZ7v8PNHWx3KOa/c7VkysnJiOZcguUG
         PEMb3wQyf+jVuRCoQTsVnRJ011VVyRixeW74p40ukcPnnSA0qrP2gteJ7W21/ROtWHi0
         gtJ4uVZvArMD5AbFJOJVyOTwUrf+h1MtFVtwTOJFT2wn1w8Smc5JvgWs/UqlPgQ0gH0f
         VvLdpIz48X33Ot79mlCss/hcSU0vYSwKmv2vsCZ4WhgMwRAst/T9D1n9xX9/QRLVh9lr
         BhymPj26iyky6u6oVdt4im7Pryz8dMuWp9j/MlCVTGvTsnOFHtbaA+1KbK3ZMTI2Klwz
         sT5A==
X-Gm-Message-State: AJIora+6F0XVNMGvTGj0S4lo5YF/RlDDC1WZZKeuSSJ/V61CapNRSYWk
        XB6+RDtODIOn37cV69bP4yTxmw==
X-Google-Smtp-Source: AGRyM1t85sYFE5D6qmCyn6y1bxB6cA1mSPxGNxUPWBz9tmk2FYBA2wc85J62Zdw4OBIx0Yvdb+OeZQ==
X-Received: by 2002:a19:915c:0:b0:486:93d4:9fee with SMTP id y28-20020a19915c000000b0048693d49feemr13785758lfj.301.1657614504564;
        Tue, 12 Jul 2022 01:28:24 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id t21-20020a192d55000000b0047f65b60323sm2052312lft.3.2022.07.12.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:28:23 -0700 (PDT)
Message-ID: <901f0a2e-310c-368b-33de-20a00871598d@linaro.org>
Date:   Tue, 12 Jul 2022 10:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] dt-bindings: arm: tegra: Revise Tegra20 PMC bindings
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220711152020.688461-1-thierry.reding@gmail.com>
 <20220711152020.688461-4-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711152020.688461-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/07/2022 17:20, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Update the Tegra20 PMC bindings to make use of some advanced json-schema
> features such as describing list elements or validating the contents of
> string arrays.
> 
> While at it, also restructure the pad configuration node schema to make
> sure it doesn't accidentally match other properties.

Please split cosmetic changes like these around descriptions, from
functional ones.

The patch is also too big to review - I have no clue if some changes are
just for description or you move/change entire properties (like
core-domain, pinmux).

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 512 ++++++++++--------
>  1 file changed, 282 insertions(+), 230 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> index 564ae6aaccf7..6894addb3c9a 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: GPL-2.0
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-pmc.yaml#
> @@ -21,141 +21,134 @@ properties:
>  
>    reg:
>      maxItems: 1
> -    description:
> -      Offset and length of the register set for the device.
> +    description: Offset and length of the register set for the device.
>  
>    clock-names:
>      items:
>        - const: pclk
>        - const: clk32k_in
> -    description:
> -      Must includes entries pclk and clk32k_in.
> -      pclk is the Tegra clock of that name and clk32k_in is 32KHz clock
> -      input to Tegra.
> +    description: Must includes entries pclk and clk32k_in. pclk is the Tegra
> +      clock of that name and clk32k_in is 32KHz clock input to Tegra.
>  
>    clocks:
>      maxItems: 2
> -    description:
> -      Must contain an entry for each entry in clock-names.
> -      See ../clocks/clocks-bindings.txt for details.
> +    description: Must contain an entry for each entry in clock-names. See
> +      ../clocks/clocks-bindings.txt for details.

Drop entire description instead. It's useless in context of DT schema.

>  
>    '#clock-cells':
>      const: 1
> -    description:
> -      Tegra PMC has clk_out_1, clk_out_2, and clk_out_3.
> -      PMC also has blink control which allows 32Khz clock output to
> -      Tegra blink pad.
> -      Consumer of PMC clock should specify the desired clock by having
> -      the clock ID in its "clocks" phandle cell with pmc clock provider.
> -      See include/dt-bindings/soc/tegra-pmc.h for the list of Tegra PMC
> -      clock IDs.
> +    description: |
> +      Tegra PMC has clk_out_1, clk_out_2, and clk_out_3. PMC also has blink
> +      control which allows 32Khz clock output to Tegra blink pad.
> +
> +      Consumer of PMC clock should specify the desired clock by having the
> +      clock ID in its "clocks" phandle cell with PMC clock provider. See
> +      include/dt-bindings/soc/tegra-pmc.h for the list of Tegra PMC clock IDs.
>  
>    '#interrupt-cells':
>      const: 2
> -    description:
> -      Specifies number of cells needed to encode an interrupt source.
> -      The value must be 2.
> +    description: Specifies number of cells needed to encode an interrupt
> +      source.
>  
>    interrupt-controller: true
>  
>    nvidia,invert-interrupt:
>      $ref: /schemas/types.yaml#/definitions/flag
> -    description: Inverts the PMU interrupt signal.
> -      The PMU is an external Power Management Unit, whose interrupt output
> -      signal is fed into the PMC. This signal is optionally inverted, and
> -      then fed into the ARM GIC. The PMC is not involved in the detection
> -      or handling of this interrupt signal, merely its inversion.
> +    description: Inverts the PMU interrupt signal. The PMU is an external Power
> +      Management Unit, whose interrupt output signal is fed into the PMC. This
> +      signal is optionally inverted, and then fed into the ARM GIC. The PMC is
> +      not involved in the detection or handling of this interrupt signal,
> +      merely its inversion.
>  
>    nvidia,core-power-req-active-high:
>      $ref: /schemas/types.yaml#/definitions/flag
> -    description: Core power request active-high.
> +    description: core power request active-high
>  
>    nvidia,sys-clock-req-active-high:
>      $ref: /schemas/types.yaml#/definitions/flag
> -    description: System clock request active-high.
> +    description: system clock request active-high
>  
>    nvidia,combined-power-req:
>      $ref: /schemas/types.yaml#/definitions/flag
> -    description: combined power request for CPU and Core.
> +    description: combined power request for CPU and core
>  
>    nvidia,cpu-pwr-good-en:
>      $ref: /schemas/types.yaml#/definitions/flag
> -    description:
> -      CPU power good signal from external PMIC to PMC is enabled.
> +    description: CPU power good signal from external PMIC to PMC is enabled
>  
>    nvidia,suspend-mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [0, 1, 2]
> -    description:
> -      The suspend mode that the platform should use.
> -      Mode 0 is for LP0, CPU + Core voltage off and DRAM in self-refresh
> -      Mode 1 is for LP1, CPU voltage off and DRAM in self-refresh
> -      Mode 2 is for LP2, CPU voltage off
> +    description: the suspend mode that the platform should use
> +    oneOf:
> +      - description: LP0, CPU + Core voltage off and DRAM in self-refresh
> +        const: 0
> +      - description: LP1, CPU voltage off and DRAM in self-refresh
> +        const: 1
> +      - description: LP2, CPU voltage off
> +        const: 2
>  
>    nvidia,cpu-pwr-good-time:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    description: CPU power good time in uSec.
> +    description: CPU power good time in microseconds
>  
>    nvidia,cpu-pwr-off-time:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    description: CPU power off time in uSec.
> +    description: CPU power off time in microseconds
>  
>    nvidia,core-pwr-good-time:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> -    description:
> -      <Oscillator-stable-time Power-stable-time>
> -      Core power good time in uSec.
> +    description: core power good time in microseconds
> +    items:
> +      - description: oscillator stable time
> +      - description: power stable time
>  
>    nvidia,core-pwr-off-time:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    description: Core power off time in uSec.
> +    description: core power off time in microseconds
>  
>    nvidia,lp0-vec:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> -    description:
> -      <start length> Starting address and length of LP0 vector.
> -      The LP0 vector contains the warm boot code that is executed
> -      by AVP when resuming from the LP0 state.
> -      The AVP (Audio-Video Processor) is an ARM7 processor and
> -      always being the first boot processor when chip is power on
> -      or resume from deep sleep mode. When the system is resumed
> -      from the deep sleep mode, the warm boot code will restore
> -      some PLLs, clocks and then brings up CPU0 for resuming the
> -      system.
> +    description: |
> +      Starting address and length of LP0 vector. The LP0 vector contains the
> +      warm boot code that is executed by AVP when resuming from the LP0 state.
> +      The AVP (Audio-Video Processor) is an ARM7 processor and always being
> +      the first boot processor when chip is power on or resume from deep sleep
> +      mode. When the system is resumed from the deep sleep mode, the warm boot
> +      code will restore some PLLs, clocks and then brings up CPU0 for resuming
> +      the system.
> +    items:
> +      - description: starting address of LP0 vector
> +      - description: length of LP0 vector
>  
>    i2c-thermtrip:
>      type: object
> -    description:
> -      On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode exists,
> -      hardware-triggered thermal reset will be enabled.
> +    description: On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode
> +      exists, hardware-triggered thermal reset will be enabled.
>  
>      properties:
>        nvidia,i2c-controller-id:
>          $ref: /schemas/types.yaml#/definitions/uint32
> -        description:
> -          ID of I2C controller to send poweroff command to PMU.
> -          Valid values are described in section 9.2.148
> -          "APBDEV_PMC_SCRATCH53_0" of the Tegra K1 Technical Reference
> -          Manual.
> +        description: ID of I2C controller to send poweroff command to PMU.
> +          Valid values are described in section 9.2.148 "APBDEV_PMC_SCRATCH53_0"
> +          of the Tegra K1 Technical Reference Manual.
>  
>        nvidia,bus-addr:
>          $ref: /schemas/types.yaml#/definitions/uint32
> -        description: Bus address of the PMU on the I2C bus.
> +        description: bus address of the PMU on the I2C bus
>  
>        nvidia,reg-addr:
>          $ref: /schemas/types.yaml#/definitions/uint32
> -        description: PMU I2C register address to issue poweroff command.
> +        description: PMU I2C register address to issue poweroff command
>  
>        nvidia,reg-data:
>          $ref: /schemas/types.yaml#/definitions/uint32
> -        description: Poweroff command to write to PMU.
> +        description: power-off command to write to PMU
>  
>        nvidia,pinmux-id:
>          $ref: /schemas/types.yaml#/definitions/uint32
> -        description:
> -          Pinmux used by the hardware when issuing Poweroff command.
> -          Defaults to 0. Valid values are described in section 12.5.2
> -          "Pinmux Support" of the Tegra4 Technical Reference Manual.
> +        description: Pinmux used by the hardware when issuing power-off command.
> +          Defaults to 0. Valid values are described in section 12.5.2 "Pinmux
> +          Support" of the Tegra4 Technical Reference Manual.
>  
>      required:
>        - nvidia,i2c-controller-id
> @@ -165,65 +158,91 @@ properties:
>  
>      additionalProperties: false
>  
> +  core-domain:
> +    type: object
> +    description: The vast majority of hardware blocks of Tegra SoC belong to a
> +      core power domain, which has a dedicated voltage rail that powers the
> +      blocks.
> +
> +    properties:
> +      operating-points-v2:
> +        description: Should contain level, voltages and opp-supported-hw
> +          property. The supported-hw is a bitfield indicating SoC speedo or
> +          process ID mask.
> +
> +      "#power-domain-cells":
> +        const: 0
> +
> +    required:
> +      - operating-points-v2
> +      - "#power-domain-cells"
> +
> +    additionalProperties: false
> +
> +  core-supply:
> +    description: phandle to voltage regulator connected to the SoC core power
> +      rail

(...)

>  
>  required:
>    - compatible
> @@ -334,6 +341,52 @@ required:
>    - clocks
>    - '#clock-cells'
>  
> +allOf:
> +  - if:
> +      properties:

This is entirely new stuff. Don't mix with some cleanups.

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


Best regards,
Krzysztof
