Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E59C4332D
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 13:18:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC27E64F49
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 13:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhBBNS3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 08:18:29 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14216 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbhBBNRx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Feb 2021 08:17:53 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601950d00000>; Tue, 02 Feb 2021 05:17:04 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb
 2021 13:17:00 +0000
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: tegra: Add binding for RT5631
To:     Ion Agorria <AG0RRIA@yahoo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephen Warren <swarren@nvidia.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-2-AG0RRIA@yahoo.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ef45da2b-22b0-80f5-c3e8-f25f9209e1e8@nvidia.com>
Date:   Tue, 2 Feb 2021 13:16:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210131184101.651486-2-AG0RRIA@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612271824; bh=kHwwCFZOBcZt8HEeiinoBimAE/Mk7BxGie3JGOVk6Vg=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=SXcxHqIz/otPP7pSDUkaNNJyzDSKSpq05Z7/lRwcuR529gT9L8F/dhOAPNpyDgn77
         h4fgNq8ecgTor2hP0/5ASb/OS9lmgWsaBSOAFcrx31D3/4JTaJykC4jjF/+IOraLpB
         Oog4HjOm1c+p3kf6HSAh1VseNOjtxgERT40zDk+Mp4//N5rWMLbGyPy4VtGvrjLTLL
         ToDqtmc4vShE+B61DxAqMtfBOP13mmAWAQhsupQcRl0GzfcABkOU5skdkTrKaY4nth
         x+5nXkRA/fBz/awz33SIppEzLLsO8toMWYOEeDf8Arbpqkjq9hh2Fegl3kAYscbamR
         fcE0z5/kiP2gA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 31/01/2021 18:41, Ion Agorria wrote:
> From: Svyatoslav Ryhel <clamor95@gmail.com>
> 
> Add device-tree binding that describes hardware integration of RT5631
> audio codec chip with NVIDIA Tegra SoCs.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> ---
>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> new file mode 100644
> index 000000000000..6ee62c599518
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra RT5631 ASoC
> +
> +description: |
> +  This binding describes integration of the Realtek ALC5631/RT5631 sound
> +  codec with the sound system of NVIDIA Tegra SoCs.
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Stephen Warren <swarren@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>


Thierry and I should be sufficient and so no need to include Stephen in
the list.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra-audio-rt5631
> +
> +  clocks:
> +    minItems: 3
> +    items:
> +      - description: PLL A clock
> +      - description: PLL A OUT0 clock
> +      - description: The Tegra cdev1/extern1 clock, which feeds the card's mclk
> +
> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: pll_a
> +      - const: pll_a_out0
> +      - const: mclk
> +
> +  assigned-clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  assigned-clock-parents:
> +    minItems: 1
> +    maxItems: 3
> +
> +  assigned-clock-rates:
> +    minItems: 1
> +    maxItems: 3
> +
> +  nvidia,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User-visible name of this sound complex.
> +
> +  nvidia,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source. Valid names for sources and
> +      sinks are the RT5631's pins (as documented in its binding), and the jacks
> +      on the board:
> +
> +      * Int Spk
> +      * Headphone Jack
> +      * Mic Jack
> +      * Int Mic
> +
> +  nvidia,i2s-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of the Tegra I2S controller.
> +
> +  nvidia,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of the RT5631 audio codec.
> +
> +  nvidia,hp-mute-gpios:
> +    description: GPIO that mutes the headphones (button event).
> +    maxItems: 1
> +
> +  nvidia,hp-det-gpios:
> +    description: GPIO that detects headphones plug-in.
> +    maxItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +  - nvidia,model
> +  - nvidia,audio-routing
> +  - nvidia,i2s-controller
> +  - nvidia,audio-codec
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +    #include <dt-bindings/soc/tegra-pmc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    sound {
> +        compatible = "nvidia,tegra-audio-rt5631";
> +        nvidia,model = "NVIDIA Tegra RT5631";
> +
> +        nvidia,audio-routing =
> +            "Headphone Jack", "HPOL",
> +            "Headphone Jack", "HPOR",
> +            "Int Spk", "SPOL",
> +            "Int Spk", "SPOR",
> +            "MIC1", "MIC Bias1",
> +            "MIC Bias1", "Mic Jack",
> +            "DMIC", "Int Mic";
> +
> +        nvidia,i2s-controller = <&tegra_i2s1>;
> +        nvidia,audio-codec = <&rt5631>;
> +
> +        nvidia,hp-det-gpios = <&gpio 178 GPIO_ACTIVE_LOW>;
> +        nvidia,hp-mute-gpios = <&gpio 186 GPIO_ACTIVE_LOW>;
> +
> +        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
> +                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
> +                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
> +        clock-names = "pll_a", "pll_a_out0", "mclk";
> +
> +        assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
> +                          <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
> +
> +        assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
> +                                 <&tegra_car TEGRA30_CLK_EXTERN1>;
> +    };
> +
> +...
> 

Otherwise looks good to me ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
