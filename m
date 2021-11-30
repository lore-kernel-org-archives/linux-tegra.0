Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4EEC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236814AbhK3BpO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:45:14 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:42864 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhK3BpO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:45:14 -0500
Received: by mail-ot1-f51.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so28058096otv.9;
        Mon, 29 Nov 2021 17:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YkwFlEZGvudsbMIGRd7AY0Qjqf7PmrDHT71U00aQHx0=;
        b=1AspxksMMnFRCbuCiVP6D3z96RjRU55iTSODyBp7Gwb//9ScZk2kVUmWI834u3h+IO
         l77MCUw2bUotLQs95T3MA4MUCLuaB+GZ5qlyDufAzMOVfBsfwmIroNE9ygLrLkpKKJ2g
         IJcTWY5DHU6nYeBCUrfmwRXhZaDBKs4FChJd3hy2uMiSQhEzC/zPuOEnHRdlm8NzlKfW
         YUkhttdzErS1MtpMa668lsiewqVJluA1bIpaovL50nE/4f8EOFGlRgMcbhA0PT+218k7
         9cdKB9Gqa/yz5CZeahjKzPfpneSUZR8Y3Z3XMXVO4PPYVcA+MvhH/gRvCflAZrTiokm3
         IV4g==
X-Gm-Message-State: AOAM532uEKx3vCdKGSC64mHrwnw6yShxLKowLhZwb4DN5ao7mLAVk17G
        /Y0FgNF799a3FLRMTeoUKo79Cs1Wrw==
X-Google-Smtp-Source: ABdhPJyrln3t6NZ6Rlw1TW49FMGArRyJFMemh+FN6HPsX0TcrRXT1ldTBifKYsywMX6jf+RDE4nU9Q==
X-Received: by 2002:a05:6830:439f:: with SMTP id s31mr46344134otv.272.1638236515458;
        Mon, 29 Nov 2021 17:41:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g7sm2579003oon.27.2021.11.29.17.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:41:54 -0800 (PST)
Received: (nullmailer pid 993621 invoked by uid 1000);
        Tue, 30 Nov 2021 01:41:54 -0000
Date:   Mon, 29 Nov 2021 19:41:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 11/16] dt-bindings: tegra: pmc: Convert to json-schema
Message-ID: <YaWBYtP+/Y+rLVp8@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-12-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-12-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 19, 2021 at 03:38:34PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) PMC bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra186-pmc.txt         | 133 ------------
>  .../arm/tegra/nvidia,tegra186-pmc.yaml        | 199 ++++++++++++++++++
>  2 files changed, 199 insertions(+), 133 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
> deleted file mode 100644
> index 576462fae27f..000000000000
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -NVIDIA Tegra Power Management Controller (PMC)
> -
> -Required properties:
> -- compatible: Should contain one of the following:
> -  - "nvidia,tegra186-pmc": for Tegra186
> -  - "nvidia,tegra194-pmc": for Tegra194
> -  - "nvidia,tegra234-pmc": for Tegra234
> -- reg: Must contain an (offset, length) pair of the register set for each
> -  entry in reg-names.
> -- reg-names: Must include the following entries:
> -  - "pmc"
> -  - "wake"
> -  - "aotag"
> -  - "scratch"
> -  - "misc" (Only for Tegra194 and later)
> -
> -Optional properties:
> -- nvidia,invert-interrupt: If present, inverts the PMU interrupt signal.
> -- interrupt-controller: Identifies the node as an interrupt controller.
> -- #interrupt-cells: Specifies the number of cells needed to encode an
> -  interrupt source. The value must be 2.
> -
> -Example:
> -
> -SoC DTSI:
> -
> -	pmc@c3600000 {
> -		compatible = "nvidia,tegra186-pmc";
> -		reg = <0 0x0c360000 0 0x10000>,
> -		      <0 0x0c370000 0 0x10000>,
> -		      <0 0x0c380000 0 0x10000>,
> -		      <0 0x0c390000 0 0x10000>;
> -		reg-names = "pmc", "wake", "aotag", "scratch";
> -	};
> -
> -Board DTS:
> -
> -	pmc@c360000 {
> -		nvidia,invert-interrupt;
> -	};
> -
> -== Pad Control ==
> -
> -On Tegra SoCs a pad is a set of pins which are configured as a group.
> -The pin grouping is a fixed attribute of the hardware. The PMC can be
> -used to set pad power state and signaling voltage. A pad can be either
> -in active or power down mode. The support for power state and signaling
> -voltage configuration varies depending on the pad in question. 3.3 V and
> -1.8 V signaling voltages are supported on pins where software
> -controllable signaling voltage switching is available.
> -
> -Pad configurations are described with pin configuration nodes which
> -are placed under the pmc node and they are referred to by the pinctrl
> -client properties. For more information see
> -Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
> -
> -The following pads are present on Tegra186:
> -csia		csib		dsi		mipi-bias
> -pex-clk-bias	pex-clk3	pex-clk2	pex-clk1
> -usb0		usb1		usb2		usb-bias
> -uart		audio		hsic		dbg
> -hdmi-dp0	hdmi-dp1	pex-cntrl	sdmmc2-hv
> -sdmmc4		cam		dsib		dsic
> -dsid		csic		csid		csie
> -dsif		spi		ufs		dmic-hv
> -edp		sdmmc1-hv	sdmmc3-hv	conn
> -audio-hv	ao-hv
> -
> -Required pin configuration properties:
> -  - pins: A list of strings, each of which contains the name of a pad
> -	  to be configured.
> -
> -Optional pin configuration properties:
> -  - low-power-enable: Configure the pad into power down mode
> -  - low-power-disable: Configure the pad into active mode
> -  - power-source: Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> -    TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages.
> -    The values are defined in
> -    include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
> -
> -Note: The power state can be configured on all of the above pads except
> -      for ao-hv. Following pads have software configurable signaling
> -      voltages: sdmmc2-hv, dmic-hv, sdmmc1-hv, sdmmc3-hv, audio-hv,
> -      ao-hv.
> -
> -Pad configuration state example:
> -	pmc: pmc@7000e400 {
> -		compatible = "nvidia,tegra186-pmc";
> -		reg = <0 0x0c360000 0 0x10000>,
> -		      <0 0x0c370000 0 0x10000>,
> -		      <0 0x0c380000 0 0x10000>,
> -		      <0 0x0c390000 0 0x10000>;
> -		reg-names = "pmc", "wake", "aotag", "scratch";
> -
> -		...
> -
> -		sdmmc1_3v3: sdmmc1-3v3 {
> -			pins = "sdmmc1-hv";
> -			power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
> -		};
> -
> -		sdmmc1_1v8: sdmmc1-1v8 {
> -			pins = "sdmmc1-hv";
> -			power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
> -		};
> -
> -		hdmi_off: hdmi-off {
> -			pins = "hdmi";
> -			low-power-enable;
> -		}
> -
> -		hdmi_on: hdmi-on {
> -			pins = "hdmi";
> -			low-power-disable;
> -		}
> -	};
> -
> -Pinctrl client example:
> -	sdmmc1: sdhci@3400000 {
> -		...
> -		pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
> -		pinctrl-0 = <&sdmmc1_3v3>;
> -		pinctrl-1 = <&sdmmc1_1v8>;
> -	};
> -
> -	...
> -
> -	sor0: sor@15540000 {
> -		...
> -		pinctrl-0 = <&hdmi_off>;
> -		pinctrl-1 = <&hdmi_on>;
> -		pinctrl-names = "hdmi-on", "hdmi-off";
> -	};
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
> new file mode 100644
> index 000000000000..6946df96ec81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra186-pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Power Management Controller (PMC)
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra186-pmc
> +      - nvidia,tegra194-pmc
> +      - nvidia,tegra234-pmc
> +
> +  reg:
> +    minItems: 4
> +    maxItems: 5
> +
> +  reg-names:
> +    minItems: 4
> +    maxItems: 5

maxItems is not needed (and should warn now).

With that fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    items:
> +      - const: pmc
> +      - const: wake
> +      - const: aotag
> +      - const: scratch
> +      - const: misc
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    description: Specifies the number of cells needed to encode an
> +      interrupt source. The value must be 2.
> +    const: 2
> +
> +  nvidia,invert-interrupt:
> +    description: If present, inverts the PMU interrupt signal.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: nvidia,tegra186-pmc
> +then:
> +  properties:
> +    reg:
> +      maxItems: 4
> +
> +    reg-names:
> +      maxItems: 4
> +else:
> +  properties:
> +    reg:
> +      minItems: 5
> +
> +    reg-names:
> +      minItems: 5
> +
> +patternProperties:
> +  "^[a-z0-9]+-[a-z0-9]+$":
> +    if:
> +      type: object
> +    then:
> +      description: |
> +        These are pad configuration nodes. On Tegra SoCs a pad is a set of
> +        pins which are configured as a group. The pin grouping is a fixed
> +        attribute of the hardware. The PMC can be used to set pad power
> +        state and signaling voltage. A pad can be either in active or
> +        power down mode. The support for power state and signaling voltage
> +        configuration varies depending on the pad in question. 3.3 V and
> +        1.8 V signaling voltages are supported on pins where software
> +        controllable signaling voltage switching is available.
> +
> +        Pad configurations are described with pin configuration nodes
> +        which are placed under the pmc node and they are referred to by
> +        the pinctrl client properties. For more information see
> +
> +          Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +        The following pads are present on Tegra186:
> +
> +          csia, csib, dsi, mipi-bias, pex-clk-bias, pex-clk3, pex-clk2,
> +          pex-clk1, usb0, usb1, usb2, usb-bias, uart, audio, hsic, dbg,
> +          hdmi-dp0, hdmi-dp1, pex-cntrl, sdmmc2-hv, sdmmc4, cam, dsib,
> +          dsic, dsid, csic, csid, csie, dsif, spi, ufs, dmic-hv, edp,
> +          sdmmc1-hv, sdmmc3-hv, conn, audio-hv, ao-hv
> +
> +        The following pads are present on Tegra194:
> +
> +          csia, csib, mipi-bias, pex-clk-bias, pex-clk3, pex-clk2,
> +          pex-clk1, eqos, pex-clk-2-bias, pex-clk-2, dap3, dap5, uart,
> +          pwr-ctl, soc-gpio53, audio, gp-pwm2, gp-pwm3, soc-gpio12,
> +          soc-gpio13, soc-gpio10, uart4, uart5, dbg, hdmi-dp3, hdmi-dp2,
> +          hdmi-dp0, hdmi-dp1, pex-cntrl, pex-ctl2, pex-l0-rst,
> +          pex-l1-rst, sdmmc4, pex-l5-rst, cam, csic, csid, csie, csif,
> +          spi, ufs, csig, csih, edp, sdmmc1-hv, sdmmc3-hv, conn,
> +          audio-hv, ao-hv
> +
> +      properties:
> +        pins:
> +          $ref: /schemas/types.yaml#/definitions/string
> +          description: Must contain the name of the pad(s) to be
> +            configured.
> +
> +        low-power-enable:
> +          description: Configure the pad into power down mode.
> +          $ref: /schemas/types.yaml#/definitions/flag
> +
> +        low-power-disable:
> +          description: Configure the pad into active mode.
> +          $ref: /schemas/types.yaml#/definitions/flag
> +
> +        power-source:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description: |
> +            Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
> +            TEGRA_IO_PAD_VOLTAGE_3V3 to select between signalling
> +            voltages.
> +
> +            The values are defined in
> +
> +              include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
> +
> +            The power state can be configured on all of the above pads
> +            except for ao-hv. Following pads have software configurable
> +            signaling voltages: sdmmc2-hv, dmic-hv, sdmmc1-hv, sdmmc3-hv,
> +            audio-hv, ao-hv.
> +
> +        phandle: true
> +
> +      required:
> +        - pins
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +dependencies:
> +  interrupt-controller: ['#interrupt-cells']
> +  "#interrupt-cells":
> +    required:
> +      - interrupt-controller
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    pmc@c3600000 {
> +        compatible = "nvidia,tegra186-pmc";
> +        reg = <0x0c360000 0x10000>,
> +              <0x0c370000 0x10000>,
> +              <0x0c380000 0x10000>,
> +              <0x0c390000 0x10000>;
> +        reg-names = "pmc", "wake", "aotag", "scratch";
> +        nvidia,invert-interrupt;
> +
> +        sdmmc1_3v3: sdmmc1-3v3 {
> +            pins = "sdmmc1-hv";
> +            power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
> +        };
> +
> +        sdmmc1_1v8: sdmmc1-1v8 {
> +            pins = "sdmmc1-hv";
> +            power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
> +        };
> +    };
> +
> +    sdmmc1: mmc@3400000 {
> +        compatible = "nvidia,tegra186-sdhci";
> +        reg = <0x03400000 0x10000>;
> +        interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&bpmp TEGRA186_CLK_SDMMC1>,
> +                 <&bpmp TEGRA186_CLK_SDMMC_LEGACY_TM>;
> +        clock-names = "sdhci", "tmclk";
> +        resets = <&bpmp TEGRA186_RESET_SDMMC1>;
> +        reset-names = "sdhci";
> +        interconnects = <&mc TEGRA186_MEMORY_CLIENT_SDMMCRA &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_SDMMCWA &emc>;
> +        interconnect-names = "dma-mem", "write";
> +        iommus = <&smmu TEGRA186_SID_SDMMC1>;
> +        pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
> +        pinctrl-0 = <&sdmmc1_3v3>;
> +        pinctrl-1 = <&sdmmc1_1v8>;
> +    };
> -- 
> 2.33.1
> 
> 
