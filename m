Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB6DC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Nov 2021 20:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58F1961077
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Nov 2021 20:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhKAUp3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Nov 2021 16:45:29 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44664 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhKAUp3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 1 Nov 2021 16:45:29 -0400
Received: by mail-ot1-f52.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so21166382otj.11;
        Mon, 01 Nov 2021 13:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6XmLD1tf33R8zNulmrEx9TFPuJ2K8guHdhHllFjxLyA=;
        b=aOvXG804jZdVrwsCFdEoelrYS7Edi/zRUhGI2/0ZvYMd4MGJBoCiTA+mAwiCtGowgb
         3XFC3T7L4G7TdaJ7zst1JEUOHjBjWvfKtdyY7ttKNuHytqkZDmlK1fhU8g521ZY69k03
         8o3U+0gDRPXKHIFyPLZkE17hbNRG3AXy/2mpE4IfLpIHyb3IF0/vA0S1pRXx1jmEMrel
         4MyAX1HcwM1qh/q/xds0XVQI9pXCZUvPS4hmlZ7oGnO+4PU11VWdtqQpE/WRyPqaYnpC
         jgTPCJ4fj1LXhF6E1WljOKl2Yi3a7hH1YWmcFWvKGfC9ABzsHg1pZdrrnIKTrt16ymKS
         jDLA==
X-Gm-Message-State: AOAM530tnvRC5Oae0tGfnE44R6Fic+/OOYMTOUbwmC9bKt03GAMXLH3O
        gBEPq5tebBFds6H9LaMgSg==
X-Google-Smtp-Source: ABdhPJxscEje9FZjKPre0A3wtKEBLzMUwMMLeisaDEey4x+MSqQ4+ZrEmkgbh0Cx6okZG9gaLaDGfA==
X-Received: by 2002:a05:6830:4410:: with SMTP id q16mr7253707otv.322.1635799374825;
        Mon, 01 Nov 2021 13:42:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 62sm1017437ooa.47.2021.11.01.13.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:42:54 -0700 (PDT)
Received: (nullmailer pid 1013431 invoked by uid 1000);
        Mon, 01 Nov 2021 20:42:52 -0000
Date:   Mon, 1 Nov 2021 15:42:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        ~okias/devicetree@lists.sr.ht, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound: nvidia,tegra-audio: Convert multiple
 txt bindings to yaml
Message-ID: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
References: <20211025171927.92332-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025171927.92332-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 25, 2021 at 07:19:25PM +0200, David Heidelberg wrote:
> Convert Tegra audio complex with the
>  * ALC5632
>  * MAX98090
>  * RT5640
>  * RT5677
>  * SGTL5000
>  * TrimSlice
>  * WM8753
>  * WM8903
>  * WM9712
> codec to the YAML format.

Perhaps say why they can all be combined.

I don't think that really works because the properties which are valid 
varies. Specifically, the GPIO lines vary.

Instead, define a schema with all the common properties and then 
reference it.

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../sound/nvidia,tegra-audio-alc5632.txt      |  48 -----
>  .../sound/nvidia,tegra-audio-max98090.txt     |  53 -----
>  .../sound/nvidia,tegra-audio-rt5640.txt       |  52 -----
>  .../sound/nvidia,tegra-audio-rt5677.txt       |  67 ------
>  .../sound/nvidia,tegra-audio-sgtl5000.txt     |  42 ----
>  .../sound/nvidia,tegra-audio-trimslice.txt    |  21 --
>  .../sound/nvidia,tegra-audio-wm8753.txt       |  40 ----
>  .../sound/nvidia,tegra-audio-wm8903.txt       |  62 ------
>  .../sound/nvidia,tegra-audio-wm9712.txt       |  60 ------
>  .../bindings/sound/nvidia,tegra-audio.yaml    | 190 ++++++++++++++++++
>  10 files changed, 190 insertions(+), 445 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml
> new file mode 100644
> index 000000000000..6b8876bfa40f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/nvidia,tegra-audio.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: NVIDIA Tegra audio complex
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-alc5632(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-alc5632
> +      - items:
> +          - enum:
> +              - nvidia,tegra-audio-max98090-nyan-big
> +              - nvidia,tegra-audio-max98090-nyan-blaze
> +          - const: nvidia,tegra-audio-max98090-nyan
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-max98090(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-max98090
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt56(39|40)(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5640
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-rt5677(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-rt5677
> +      - items:
> +          - enum:
> +              - toradex,tegra-audio-sgtl5000-apalis_t30
> +              - toradex,tegra-audio-sgtl5000-colibri_t30
> +              - toradex,tegra-audio-sgtl5000-apalis_tk1
> +          - const: nvidia,tegra-audio-sgtl5000
> +      - const: nvidia,tegra-audio-trimslice
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm8753(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm8753
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-(plutux|wm8903(-[a-z0-9])+)'
> +          - const: nvidia,tegra-audio-wm8903
> +      - items:
> +          - pattern: '^[a-z0-9]+,tegra-audio-wm9712(-[a-z0-9])+'
> +          - const: nvidia,tegra-audio-wm9712
> +
> +  clocks:
> +    items:
> +      - description: PLL A clock
> +      - description: PLL A OUT0 clock
> +      - description: The Tegra cdev1/extern1 clock, which feeds the card's mclk
> +
> +  clock-names:
> +    items:
> +      - const: pll_a
> +      - const: pll_a_out0
> +      - const: mclk
> +

> +  assigned-clocks: true
> +
> +  assigned-clock-parents: true
> +
> +  assigned-clock-rates: true

These properties are always allowed when 'clocks' is present. So you 
don't have to list them.

> +
> +  nvidia,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +
> +  nvidia,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source. Valid names for sources and
> +      sinks are the pins (documented in the binding document),
> +      and the jacks on the board:
> +        ALC5632:
> +          * Headset Stereophone
> +          * Int Spk
> +          * Headset Mic
> +          * Digital Mic
> +        MAXX98090:
> +          * Headphones
> +          * SPeakers
> +          * Mic Jack
> +          * Int Mic
> +        RT5640:
> +          * Headphones
> +          * Speakers
> +          * Mic Jack
> +        RT5677:
> +          * Headphone
> +          * Speaker
> +          * Headset Mic
> +          * Internal Mic 1
> +          * Internal Mic 2
> +        SGTL5000:
> +          * Headphone Jack
> +          * Line In Jack
> +          * Mic Jack
> +        WM8753:
> +          * Headphone Jack
> +          * Mic Jack
> +        WM8903:
> +          * Headphone Jack
> +          * Int Spk
> +          * Mic Jack
> +          * Int Mic
> +        WM9712:
> +          * Headphone
> +          * LineIn
> +          * Mic

All these strings should be part of the schema.

> +
> +  nvidia,ac97-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the AC97 controller
> +
> +  nvidia,i2s-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the Tegra I2S controller
> +
> +  nvidia,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of audio codec
> +
> +  nvidia,spkr-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the speakers
> +
> +  nvidia,hp-mute-gpios:
> +    maxItems: 1
> +    description: The GPIO that mutes the headphones
> +
> +  nvidia,hp-det-gpios:
> +    maxItems: 1
> +    description: The GPIO that detect headphones are plugged in
> +
> +  nvidia,mic-det-gpios:
> +    maxItems: 1
> +    description: The GPIO that detect microphone is plugged in
> +
> +  nvidia,int-mic-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the internal microphone
> +
> +  nvidia,ext-mic-en-gpios:
> +    maxItems: 1
> +    description: The GPIO that enables the external microphone
> +
> +  nvidia,headset:
> +    type: boolean
> +    description: The Mic Jack represents state of the headset microphone pin
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +oneOf:
> +  - required:
> +      - nvidia,audio-codec
> +      - nvidia,i2s-controller
> +  - required:
> +      - nvidia,ac97-controller
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +
> +    sound {
> +      compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
> +                   "nvidia,tegra-audio-sgtl5000";
> +      nvidia,model = "Toradex Apalis T30 SGTL5000";
> +      nvidia,audio-routing =
> +              "Headphone Jack", "HP_OUT",
> +              "LINE_IN", "Line In Jack",
> +              "MIC_IN", "Mic Jack";
> +      nvidia,i2s-controller = <&tegra_i2s2>;
> +      nvidia,audio-codec = <&codec>;
> +      clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
> +               <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
> +               <&tegra_car TEGRA30_CLK_EXTERN1>;
> +      clock-names = "pll_a", "pll_a_out0", "mclk";
> +    };
> -- 
> 2.33.0
> 
> 
