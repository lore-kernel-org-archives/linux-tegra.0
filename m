Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EA7EB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 20:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjGEUuV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjGEUuU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 16:50:20 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8FC10E2;
        Wed,  5 Jul 2023 13:50:17 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-345df4e68afso28993885ab.0;
        Wed, 05 Jul 2023 13:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688590216; x=1691182216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P5dasWcK4nVr7hRqDT8Rvs1lLmA2YCik/oeVBcmjUE=;
        b=XXdDozZ/bLz9AfHEsIkQxbnPg4fB4gXpOe3esFEMAdRN1MKlddKBMAfJGjv5wkpXvX
         CPpqhz+3R1GODnnXQ6JKrzm87nBXqwkQ2twrVuz7fZ/L6GXIxrgrUJILlsv7eO2WtXWP
         kJX++UgaD8hbQkZEUkJOa6bLqkayKs7cE3+bSElkocxSRXL+lSRWfrQG9TOMvUhM6UUL
         +RLdOftOODaEJnur6NJ77Pkg5WWsdzZ25dOHKvteKGstb4faKSQvZe4fF1LyxYz97zf0
         6y/K/q+M2pvmxFI3p90Kq4Phi83MoGTZ15mB4xit5O7F/wSMEIaLwoIMQYTX1nbmgJGF
         W4NQ==
X-Gm-Message-State: ABy/qLZI5mfIMtTJ9foi6Ema+JUIK/HrFjRCHG4SFCAbgvB9QQ8JyncC
        LHo7cVQzDk+hy8eLDBH3oLarAUPXyw==
X-Google-Smtp-Source: APBJJlFbOi2EMHL2pFbvpZI2N1AgSgQaFGQ5J0p+ZIJcs9iMMXCIdXDdTjv+TjinDfn2hCwQvpjwJg==
X-Received: by 2002:a92:c8c8:0:b0:345:a629:83ff with SMTP id c8-20020a92c8c8000000b00345a62983ffmr224849ilq.17.1688590216633;
        Wed, 05 Jul 2023 13:50:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id eh11-20020a056638298b00b0042ad6abe0bbsm10313jab.20.2023.07.05.13.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 13:50:15 -0700 (PDT)
Received: (nullmailer pid 1874425 invoked by uid 1000);
        Wed, 05 Jul 2023 20:50:13 -0000
Date:   Wed, 5 Jul 2023 14:50:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: tegra: nvec: Convert to
 json-schema
Message-ID: <20230705205013.GA1871916-robh@kernel.org>
References: <20230705155222.2519728-1-thierry.reding@gmail.com>
 <20230705155222.2519728-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705155222.2519728-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jul 05, 2023 at 05:52:22PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA embedded controller bindings from the free-form text
> format to json-schema.
> 
> Acked-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop $ref for standard clock-frequency property
> - use 4 spaces for indentation in example
> - move to soc/tegra directory
> 
>  .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
>  .../bindings/soc/tegra/nvidia,nvec.yaml       | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
> deleted file mode 100644
> index 5ae601e7f51f..000000000000
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -NVIDIA compliant embedded controller
> -
> -Required properties:
> -- compatible : should be "nvidia,nvec".
> -- reg : the iomem of the i2c slave controller
> -- interrupts : the interrupt line of the i2c slave controller
> -- clock-frequency : the frequency of the i2c bus
> -- gpios : the gpio used for ec request
> -- slave-addr: the i2c address of the slave controller
> -- clocks : Must contain an entry for each entry in clock-names.
> -  See ../clocks/clock-bindings.txt for details.
> -- clock-names : Must include the following entries:
> -  Tegra20/Tegra30:
> -  - div-clk
> -  - fast-clk
> -  Tegra114:
> -  - div-clk
> -- resets : Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names : Must include the following entries:
> -  - i2c
> diff --git a/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
> new file mode 100644
> index 000000000000..0b4f898b2a1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/tegra/nvidia,nvec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA compliant embedded controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,nvec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: divider clock
> +      - description: fast clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: div-clk
> +      - const: fast-clk
> +
> +  resets:
> +    items:
> +      - description: module reset
> +
> +  reset-names:
> +    items:
> +      - const: i2c
> +
> +  clock-frequency: true
> +
> +  request-gpios:
> +    description: phandle to the GPIO used for EC request
> +
> +  slave-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: I2C address of the slave controller
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

You don't have any child nodes defined, so these 2 properties are 
pointless.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - clock-frequency
> +  - request-gpios
> +  - slave-addr
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/gpio/tegra-gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    nvec@7000c500 {
> +        compatible = "nvidia,nvec";
> +        reg = <0x7000c500 0x100>;
> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clock-frequency = <80000>;
> +        request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
> +        slave-addr = <138>;
> +        clocks = <&tegra_car TEGRA20_CLK_I2C3>,
> +                 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
> +        clock-names = "div-clk", "fast-clk";
> +        resets = <&tegra_car 67>;
> +        reset-names = "i2c";
> +    };
> -- 
> 2.41.0
> 
