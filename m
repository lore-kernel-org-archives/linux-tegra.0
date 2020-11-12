Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3009DC5519F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 14:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D20E52224D
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 14:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgKLOi7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Nov 2020 09:38:59 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45258 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLOi6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Nov 2020 09:38:58 -0500
Received: by mail-oi1-f195.google.com with SMTP id j7so6562760oie.12;
        Thu, 12 Nov 2020 06:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g2feB/PWURbtrnJtItFz1VQ5PPwL6e/I9KTZ0Uw/R1A=;
        b=Cfpqck5LVC3fFJpbZTQfiDNgnHhu3R0CpSDeQlme4w83ufrbxFuQ/b967YA3P+R1P6
         /6M5GSN0+iA+ZfMbLe/SmqwwEwZrITFeuXsSeImgaDwqf3ZbZB7vfieUmCn6qiwA0/ce
         LL6B6bhbhAiiUkEvEN70TzamREz+VOCf7c5rmLN+ukksFZUTEhhYuT/QGxzk4yMIcSmc
         xfsH1YFp0UAym/hKI4IMRQ6ryOPSUr0U56Jv9lSLoHpmwAVFgj/RQgA4SO6wyOHzZuPI
         qE49b0HLh9/rZOjXdctk8Y3eXD+WWN3itEXVd7B+dlSHPfzli/Za7p5zAi1UR1scXPKY
         8EUA==
X-Gm-Message-State: AOAM533nr6wb4bKlCNwre1JwrRxWIXorXutpdSWE8J5fxzCbeg8rTU1p
        rpBqvw4vChqCMOGNUeqTrQ==
X-Google-Smtp-Source: ABdhPJzb4C6749pnyPFAAzZjnZI0T9oOb7W++bv3cxZb4oci7pI8qdSdXH9njzY5O/62MMrjZaaLCA==
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr5908800oih.56.1605191937418;
        Thu, 12 Nov 2020 06:38:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p128sm1292890ooa.14.2020.11.12.06.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 06:38:56 -0800 (PST)
Received: (nullmailer pid 3562944 invoked by uid 1000);
        Thu, 12 Nov 2020 14:38:55 -0000
Date:   Thu, 12 Nov 2020 08:38:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [PATCH v5 1/6] ASoC: dt-bindings: tegra: Add graph bindings
Message-ID: <20201112143855.GA3553055@bogus>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
 <1605119676-32273-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605119676-32273-2-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 12, 2020 at 12:04:31AM +0530, Sameer Pujar wrote:
> Add device tree binding properties of generic graph to ASoC component
> devices. This allows to define audio ports out of these components or
> DAIs and audio graph based sound card can be realised with this.

This is all dependent on graph.yaml being applied which hasn't happened 
yet. I guess I'll need to provide a branch as there's multiple 
subsystems needing it.

> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml     |  6 ++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml   |  6 ++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 13 +++++++++++--
>  .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml     |  6 ++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml      |  6 ++++++
>  5 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> index ed2fb32..3c9364d 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -55,6 +55,12 @@ properties:
>        The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>        available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

If you have 'ports', then that means you have multiple ports and you 
have to enumerate what each port is.

> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port

If you only have 1 port then, you can use 'port'.


So listing both is an error.

> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> index c028b25..162823d 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> @@ -37,6 +37,12 @@ properties:
>  
>    dma-names: true
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
>  if:
>    properties:
>      compatible:
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> index d772197..59cd1f1 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> @@ -56,6 +56,16 @@ properties:
>  
>    ranges: true
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    type: object
> +
>  required:
>    - compatible
>    - reg
> @@ -67,8 +77,7 @@ required:
>    - "#size-cells"
>    - ranges
>  
> -additionalProperties:
> -  type: object
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
> index 2a3207b..b16bf5e 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
> @@ -56,6 +56,12 @@ properties:
>        The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
>        on the maximum available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> index dfc1bf7..598f763 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> @@ -74,6 +74,12 @@ properties:
>        The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
>        on the maximum available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +  port:
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.7.4
> 
