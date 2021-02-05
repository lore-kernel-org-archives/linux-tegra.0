Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F238CC4332B
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 22:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C678164FF1
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 22:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbhBEW3L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 17:29:11 -0500
Received: from mail-yb1-f180.google.com ([209.85.219.180]:38301 "EHLO
        mail-yb1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbhBEOVA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 09:21:00 -0500
Received: by mail-yb1-f180.google.com with SMTP id i6so7196589ybq.5;
        Fri, 05 Feb 2021 07:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pcsL3L96/P432KRfr8meKABbNCvH15jFgDBOX8Jm7VI=;
        b=pNxx6U/PAFZtffyb7PVuXTanPCOP6J4yX/5lphFJlfI+1snMKfwHtuCeDKrW11wPCF
         jEpf3ks19hE7nqV0AntAVERJ8UyXELzcp3BqZpyPU0BQMG1aHxPK0yblti6o+OJpxmll
         /kR8SNF9hQz5MxR6k/99XCWe0TbvZulqWmbW+aLc3SXOE+rIJ7ONGmb3XQHRXoETrm1t
         LEjeJrxwyuA472TZ4pRCdTy+JF08CT/Eg2LWMpdqru6pX1w2Vl0Z+41qfUZlNdrCsv/n
         T772S9M8wDSF1AaQbxb+w6c5RNsLvHYBcsDFN4FABxpig7mVFwZjHJjiCr6i3JKRj4fJ
         IwrA==
X-Gm-Message-State: AOAM5309eCngFg+/h5/Ge2wjGk2tShKDMxuW0PyQ3ILGyrVpL6gu72t+
        8mcBQUJX7USLxivreHqZs1qpT5uJ7w==
X-Google-Smtp-Source: ABdhPJxLyz2+vEYLPJbIMPPyf8v4GvRxCn/U3G5BbJvdBxOFydbP+SUTyuGP9TUEoUo40pZqggc4Gw==
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr1344536oth.115.1612538975799;
        Fri, 05 Feb 2021 07:29:35 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 62sm227063oii.23.2021.02.05.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 07:29:34 -0800 (PST)
Received: (nullmailer pid 3090591 invoked by uid 1000);
        Fri, 05 Feb 2021 15:29:33 -0000
Date:   Fri, 5 Feb 2021 09:29:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     thierry.reding@gmail.com, broonie@kernel.org, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, sharadg@nvidia.com,
        Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>
Subject: Re: [PATCH v2 1/9] ASoC: dt-bindings: rt5659: Update binding doc
Message-ID: <20210205152933.GA3089668@robh.at.kernel.org>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611944866-29373-2-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 29, 2021 at 11:57:38PM +0530, Sameer Pujar wrote:
> Update following in rt5659.txt binding doc
>   - Add JD source for Intel HDA header: Commit 041e74b71491
>     ("ASoC: rt5659: Add the support of Intel HDA Header")
>     added driver support. Add missing info here.
> 
>   - sound-name-prefix: Used to prefix component widgets/kcontrols
>     with given prefix.
> 
>   - ports: Helps to use the Codec with audio graph card
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> Cc: Bard Liao <bardliao@realtek.com>
> ---
>  Documentation/devicetree/bindings/sound/rt5659.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rt5659.txt b/Documentation/devicetree/bindings/sound/rt5659.txt
> index 56788f5..c473df5 100644
> --- a/Documentation/devicetree/bindings/sound/rt5659.txt
> +++ b/Documentation/devicetree/bindings/sound/rt5659.txt
> @@ -37,10 +37,21 @@ Optional properties:
>  - realtek,jd-src
>    0: No JD is used
>    1: using JD3 as JD source
> +  2: JD source for Intel HDA header
>  
>  - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
>  - realtek,reset-gpios : The GPIO that controls the CODEC's RESET pin.
>  
> +- sound-name-prefix: Please refer to name-prefix.txt
> +
> +- ports: A Codec may have a single or multiple I2S interfaces. These
> +  interfaces on Codec side can be described under 'ports' or 'port'.
> +  When the SoC or host device is connected to multiple interfaces of
> +  the Codec, the connectivity can be described using 'ports' property.
> +  If a single interface is used, then 'port' can be used. The usage
> +  depends on the platform or board design.
> +  Please refer to Documentation/devicetree/bindings/graph.txt

Please read what that file says now.

> +
>  Pins on the device (for linking into audio routes) for RT5659/RT5658:
>  
>    * DMIC L1
> -- 
> 2.7.4
> 
