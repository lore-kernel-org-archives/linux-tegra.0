Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1C9EB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 20:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbjGEUrk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjGEUri (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 16:47:38 -0400
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C0519BB;
        Wed,  5 Jul 2023 13:47:26 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-783544a1c90so355876639f.1;
        Wed, 05 Jul 2023 13:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688590046; x=1691182046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT9ERIhttod45/G9/q/vDpmlo8ZldOGs2NKvFpafpZU=;
        b=ESV4UL03pQIG99Mc0dYzrQe4L2lh6PZemRXrgD0WE0BYBXQ2+48fGvU4gHWcZa3TGB
         fF+p5wc6NoWNzgLpH9bz8XVKBMBRNI9FUJHZ+Jbi0v8NDiDWobXVkhgM7wE9BJ74Y1e0
         QUfwtP7+KnTQhP8ecRzfsqCcp9dQmVvauMsdWhg+LcYTqv7qv2YtnIpSGytSnbDDNt+O
         GuiHab791UDbLsgEg2h5D81798qgVZ/Q26bfMdC4Tcc5r9JAegtflrKYNHjHQFoYvn/p
         ceeEVbWDl99R7bA3XXQfsNTPOyLnPQb+UHYj4iP4Gtx4SYio7rV6adcZEJdbLGvK4QO1
         JgQg==
X-Gm-Message-State: ABy/qLa49lD7RpD/QBoQzR6wI/YDu5Xmsp/3+hZVNzDWyBQbIjzy9y18
        KybEYDdZ9At4NiixXackPA==
X-Google-Smtp-Source: APBJJlFhSU9C4oAh85i0J75n5e6LSWMrtccmo3achqp6EtdO+OJGK8RSs4WhQ2ACmx+ETK5RTOsc6w==
X-Received: by 2002:a92:c688:0:b0:345:dcc1:a1c4 with SMTP id o8-20020a92c688000000b00345dcc1a1c4mr302274ilg.4.1688590045769;
        Wed, 05 Jul 2023 13:47:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u16-20020a02cbd0000000b004165ac64e0asm6444jaq.40.2023.07.05.13.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 13:47:25 -0700 (PDT)
Received: (nullmailer pid 1870325 invoked by uid 1000);
        Wed, 05 Jul 2023 20:47:23 -0000
Date:   Wed, 5 Jul 2023 14:47:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: tegra: Convert to json-schema
Message-ID: <20230705204723.GA1866650-robh@kernel.org>
References: <20230705153056.2514908-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705153056.2514908-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jul 05, 2023 at 05:30:56PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra timer bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/timer/nvidia,tegra20-timer.yaml  | 121 ++++++++++++++++++
>  .../bindings/timer/nvidia,tegra210-timer.yaml |  70 ++++++++++
>  2 files changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml
>  create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml

Convert? Where's the removal?

> 
> diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml b/Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml
> new file mode 100644
> index 000000000000..d57663d73095
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nvidia,tegra20-timer.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/nvidia,tegra20-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 (and later) Timer
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: The Tegra20 timer provides four 29-bit timer channels and a single 32-bit free
> +  running counter. The first two channels may also trigger a watchdog reset.
> +
> +  The timer found on Tegra30 provides ten 29-bit timer channels, a single 32-bit free running
> +  counter, and 5 watchdog modules. The first two channels may also trigger a legacy watchdog
> +  reset.

Needs a '|' if you care about the formatting.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - nvidia,tegra114-timer
> +              - nvidia,tegra124-timer
> +          - const: nvidia,tegra30-timer
> +
> +      - items:
> +          - const: nvidia,tegra30-timer
> +          - const: nvidia,tegra20-timer
> +
> +      - const: nvidia,tegra20-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 4
> +    maxItems: 6
> +
> +  clocks:
> +    items:
> +      - description: module clock
> +
> +  clock-names:
> +    items:
> +      - const: timer
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,tegra30-timer
> +    then:
> +      properties:
> +        interrupts:
> +          description: One interrupt per each of timer channels 1 through 5 and one shared
> +            interrupt for the remaining channels.
> +          minItems: 6
> +    else:
> +      properties:
> +        interrupts:
> +          description: One interrupt for each timer channel.
> +          maxItems: 4
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    timer@60005000 {
> +        compatible = "nvidia,tegra20-timer";
> +        reg = <0x60005000 0x60>;
> +        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA20_CLK_TWD>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    timer@60005000 {
> +        compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> +        reg = <0x60005000 0x400>;
> +        interrupts = <GIC_SPI 0   IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 1   IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 41  IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42  IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA30_CLK_TWD>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra114-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    timer@60005000 {
> +      compatible = "nvidia,tegra114-timer", "nvidia,tegra30-timer";
> +      reg = <0x60005000 0x400>;
> +      interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&tegra_car TEGRA114_CLK_TIMER>;
> +    };
> diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml
> new file mode 100644
> index 000000000000..2b42d8d03b7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/nvidia,tegra210-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra210 Timer
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: The Tegra210 timer provides fourteen 29-bit timer counters and one 32-bit timestamp
> +  counter. The TMRs run at either a fixed 1 MHz clock rate derived from the oscillator clock
> +  (TMR0-TMR9) or directly at the oscillator clock (TMR10-TMR13). Each TMR can be programmed to
> +  generate one-shot, periodic, or watchdog interrupts.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra210-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: One interrupt per each timer channels 0 through 13.
> +    minItems: 14
> +    maxItems: 14
> +
> +  clocks:
> +    items:
> +      - description: module clock
> +
> +  clock-names:
> +    items:
> +      - const: timer
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    timer@60005000 {
> +        compatible = "nvidia,tegra210-timer";
> +        reg = <0x60005000 0x400>;
> +        interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA210_CLK_TIMER>;
> +        clock-names = "timer";
> +    };
> -- 
> 2.41.0
> 
