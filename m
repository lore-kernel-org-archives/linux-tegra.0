Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A3DC433E7
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 22:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 023C622384
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603145776;
	bh=uX4maItsqDG18cfvewtCdQzqtCHtz4s8dlLHWRZfQgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jiSjDSYBzyQU8HyEJVa9oiXl3+sXeUjbD8SkbA5ilc2JDqSQ7/1G7PPEDn92h1KOb
	 n+Pwo5CTiiwUEKQdgAqIZ0BAzto3BE/h1iJrGEgHVdIzYLtzzkYl5gHaap9bE+uely
	 Wd6iFKO9fTGVVoRhJuVyv74V2FPhi1YGRvjyGkhg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387972AbgJSWQP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Oct 2020 18:16:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41063 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729813AbgJSWQP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 18:16:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id n15so1336190otl.8;
        Mon, 19 Oct 2020 15:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ro/YQVjz81P9SXrPqBg+aSAZ3CY21lcJ/N+W67/ad0=;
        b=K8kW4jCUVRCf5TwF1Nv/sJeqOk3aP8NEa1MUAxnCJ7dCyEy9AhtKyC0B3Lc6PyJWyY
         LBO8xPd09afTtgcTCN59DfLRiQd6TJ3IpwzPMvVHufGobWrZHF9aANGYshfBzRuC9pk4
         9ieY82vgEkeuDW96uK7UlV32Be2PNgSp4fKnzSG4pterRXqd82XBJ6cSQRQ4PsQKRmee
         52gopXqr6JzloNDZfcabnf7OWgYc9EYuV/c19h2o6x1G/N4YBcp5eWpUFEtegfh8HnEn
         2X4aSgKs7lWb02MPmkbYk7+vLjXsWLwXSHJSTvx1nvksK5MDYa1dMKbqAtF8UuxNbKuS
         0N0g==
X-Gm-Message-State: AOAM531u23oLtWwTuFvrl2znyzjUDnWRyrcTweR/hJ8Md4wO2oPLf6k6
        mmr+TE9/OOYUTTPCTSsDDQ==
X-Google-Smtp-Source: ABdhPJwToqJ2946gzDsGsazKbQCSDFHji8pzyB1wMCh7IO4Irb4cjEHJvy/roabKqFJ7wELd+1le8w==
X-Received: by 2002:a9d:42e:: with SMTP id 43mr1489058otc.199.1603145774004;
        Mon, 19 Oct 2020 15:16:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p10sm312216oig.37.2020.10.19.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:16:13 -0700 (PDT)
Received: (nullmailer pid 3695429 invoked by uid 1000);
        Mon, 19 Oct 2020 22:16:12 -0000
Date:   Mon, 19 Oct 2020 17:16:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, p.zabel@pengutronix.de, thierry.reding@gmail.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com,
        mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com,
        dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com,
        swarren@nvidia.com, nicoleotsuka@gmail.com
Subject: Re: [PATCH v4 11/15] ASoC: dt-bindings: tegra: Add json-schema for
 Tegra audio graph card
Message-ID: <20201019221612.GA3690258@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-12-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602859382-19505-12-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2020 at 08:12:58PM +0530, Sameer Pujar wrote:
> Add YAML schema for Tegra audio graph sound card DT bindings. It uses the
> same DT bindings provided by generic audio graph driver. Along with this
> few standard clock DT bindings are added which are specifically required
> for Tegra audio.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../sound/nvidia,tegra-audio-graph-card.yaml       | 158 +++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> new file mode 100644
> index 0000000..284d185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph based Tegra sound card driver
> +
> +description: |
> +  This is based on generic audio graph card driver along with additional
> +  customizations for Tegra platforms. It uses the same bindings with
> +  additional standard clock DT bindings required for Tegra.
> +
> +  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.yaml

You should be able to just $ref this at the top level.

> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,tegra210-audio-graph-card
> +          - nvidia,tegra186-audio-graph-card
> +

> +  dais:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/dais
> +
> +  label:
> +    $ref: /schemas/sound/simple-card.yaml#/properties/label
> +
> +  pa-gpios:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/pa-gpios
> +
> +  widgets:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/widgets
> +
> +  routing:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/routing
> +
> +  mclk-fs:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
> +
> +  prefix:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/prefix

And drop all of these.

> +
> +  clocks:
> +   minItems: 2
> +
> +  clock-names:
> +   minItems: 2

Don't need this.

> +   items:
> +     - const: pll_a
> +     - const: plla_out0
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
> +  ports:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/ports
> +
> +patternProperties:
> +  "^port(@[0-9a-f]+)?$":
> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port

And these can be dropped. Unless what each port is is Tegra specific.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - dais
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +
> +examples:
> +  - |
> +    #include<dt-bindings/clock/tegra210-car.h>
> +
> +    tegra_sound {
> +        compatible = "nvidia,tegra210-audio-graph-card";
> +
> +        clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
> +                 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +        clock-names = "pll_a", "plla_out0";
> +
> +        assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
> +                          <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
> +                          <&tegra_car TEGRA210_CLK_EXTERN1>;
> +        assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +        assigned-clock-rates = <368640000>, <49152000>, <12288000>;
> +
> +        dais = /* FE */
> +               <&admaif1_port>,
> +               /* Router */
> +               <&xbar_i2s1_port>,
> +               /* I/O DAP Ports */
> +               <&i2s1_port>;
> +
> +        label = "jetson-tx1-ape";
> +    };
> +
> +    tegra_ahub: ahub@702d0800 {
> +        // ...
> +
> +        reg = <0x702d0800 0x800>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            xbar_i2s1_port: port@a {
> +                reg = <0xa>;
> +                xbar_i2s1_ep: endpoint {
> +                    remote-endpoint = <&i2s1_cif_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +    tegra_i2s1: i2s@702d1000 {
> +        // ...
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        reg = <0x702d1000 0x100>;
> +
> +        port@0 {
> +            reg = <0>;
> +
> +            i2s1_cif_ep: endpoint {
> +                remote-endpoint = <&xbar_i2s1_ep>;
> +            };
> +        };
> +
> +        i2s1_port: port@1 {
> +            reg = <1>;
> +
> +            i2s1_dap: endpoint {
> +                dai-format = "i2s";
> +
> +                // ...
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
