Return-Path: <SRS0=MPHS=D2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422F6C433DF
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 22:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6BD622400
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Oct 2020 22:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603145469;
	bh=4xdTj5Y4VJ/3BEN7HRpzd+X3zOWHsYAtusdSthtK/fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QJUs7vSm/70+1oguRI03+uH4GORBC3vcFJgORDNM4Su20uFFhowcznORJhLlaYbsC
	 0NfPNtzA36royM2ghSio582fEx8XeUOGysxzdb8n9b03q53fT24FzEWBFAKuNJsy5W
	 Ni3QRfbNusOkjvfogvTvqggu5FJTOi6KFYMzllB0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387839AbgJSWLJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Oct 2020 18:11:09 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:46781 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387779AbgJSWLJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 18:11:09 -0400
Received: by mail-oo1-f68.google.com with SMTP id c25so339054ooe.13;
        Mon, 19 Oct 2020 15:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YAcxqz4gzIZRTswKLMgM+/6nLU+BPO60IaB6aMIKPFs=;
        b=XbQIvIXdHc7Yv9SpPbbDUZatNrjXBbWr367bUvf0MyA4Ep57lki2LCQ8+8YxlatmyT
         VaULmseVRE8/KmBmjYHvdv4dqIDfkimBmgCdPwkClxTFEP1bedsK+jHaItlADoOVaJJj
         rRz0TxqtTa1Z/Y8oN8OeI5zLWR+IyOAwdolC717/fLCFynTwnmoZ0OVe8cEu8F4BrTaI
         a4DNcE03+N1A6jvHclYCk+Z5lsduOpxt+zwi6zBHm2GYj55DzqS6UIzZa1+3W9GnesdD
         MdpjSfATdbamq1cSCxiknTaNEv7dCAO8cOYRDuLrUEKU1xuGn+dMwUh2wXTYegP2XAUo
         FwMA==
X-Gm-Message-State: AOAM532jXLMo8P80fMLOcEDaGFh9syXEwJvgQahAuiKQBaOSPeXc/jYC
        BhsM353DKBIuKScb3ZU7lg==
X-Google-Smtp-Source: ABdhPJwRFkQroby+u4ICY2NJLUAU/9hZmS0o+Tf0mlbmQ+dO75MkbVoF+8Wwz8jdOtiUcjy2KT6FqA==
X-Received: by 2002:a4a:c68d:: with SMTP id m13mr1485011ooq.64.1603145467832;
        Mon, 19 Oct 2020 15:11:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm269664ota.42.2020.10.19.15.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:11:06 -0700 (PDT)
Received: (nullmailer pid 3688686 invoked by uid 1000);
        Mon, 19 Oct 2020 22:11:05 -0000
Date:   Mon, 19 Oct 2020 17:11:05 -0500
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
Subject: Re: [PATCH v4 10/15] ASoC: dt-bindings: tegra: Add graph bindings
Message-ID: <20201019221105.GA3679866@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-11-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602859382-19505-11-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2020 at 08:12:57PM +0530, Sameer Pujar wrote:
> Add device tree binding properties of generic graph to ASoC component
> devices. This allows to define audio ports out of these components or
> DAIs and audio graph based sound card can be realised with this.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml  | 7 +++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml          | 7 +++++++
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml  | 7 +++++++
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml  | 7 +++++++
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml   | 7 +++++++
>  5 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> index ed2fb32..23875b1 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -55,6 +55,13 @@ properties:
>        The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>        available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
> +
> +patternProperties:
> +  "^port(@[0-9a-f]+)?$":
> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port

You should have either 'ports' or a single 'port' (yes, the graph 
binding allowed multiple port nodes without 'ports', but that should be 
deprecated IMO)
