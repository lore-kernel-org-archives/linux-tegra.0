Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FF6C432BE
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 902E46056B
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhIAQ7x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:59:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:48194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345518AbhIAQ7w (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 1 Sep 2021 12:59:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B55186056B;
        Wed,  1 Sep 2021 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630515535;
        bh=hvxpfj8K8oct4hHwvU35wB0MGQTZZG6Lx6u8g6TYyo8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jQ8o2gg9DltU6/b8m+uOCVqeNkepc5gSMO2oDCxvuQ7TiAcvPI9t2viZ3+v9PDBZf
         DVPYzT/NiO+Mo+Y/3abRZq0P0zO35/Jcn4AhRJFHeeXhuINWzK78foEkoljMwPMSyz
         tAFCZ1kLtbbY6S0QK0W7R7vMENkDHD9zzgty81/80hRXM0YsZp9y15prHMUgPCn0MD
         pQTcbxe8886mpU/nUz24YixQVBz5AQKT9bQDAvZKyEC5sKoFi7GyRBXhbpKCQD6iLy
         ogIsf3htlkxk2d+fIsd3jFDDuPBWrYSGSemmtiC6ZATnyBYzwDkw8oeiGO5vi3TTdm
         T3+/dHBrdReTg==
Received: by mail-ed1-f45.google.com with SMTP id j13so4724887edv.13;
        Wed, 01 Sep 2021 09:58:55 -0700 (PDT)
X-Gm-Message-State: AOAM530GRKiR1JIsVhtqsHs1OxePoU26FD/aJsvc6THDpIhWrKhpyVrs
        OYmhIjYSs8PNQix8vKzBkW4ofGQFuLVYNfzA7A==
X-Google-Smtp-Source: ABdhPJw+f2KQ5R6JUA/hgi2itUMiAS3Pn+3IPU4x3548Cx5FAXWQRC4/KD7oKtjgu2MJ56cCQ3kADyiGbui9s2wZbEQ=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr601401edt.194.1630515532404;
 Wed, 01 Sep 2021 09:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <1630513111-18776-1-git-send-email-spujar@nvidia.com> <1630513111-18776-3-git-send-email-spujar@nvidia.com>
In-Reply-To: <1630513111-18776-3-git-send-email-spujar@nvidia.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 1 Sep 2021 11:58:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJgqyGGF=SwEox6LkR_P8AR+c30AWNejA6UiCCh+U55Pg@mail.gmail.com>
Message-ID: <CAL_JsqJgqyGGF=SwEox6LkR_P8AR+c30AWNejA6UiCCh+U55Pg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: Use schema reference for sound-name-prefix
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        aleandre.belloni@bootlin.com,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Bard Liao <bardliao@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 1, 2021 at 11:19 AM Sameer Pujar <spujar@nvidia.com> wrote:
>
> Use schema reference for 'sound-name-prefix' property wherever
> necessary.
>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: bardliao@realtek.com
> Cc: Alexandre Belloni <aleandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml | 7 +------
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml | 7 +------
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml  | 7 +------
>  Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml          | 5 +----
>  Documentation/devicetree/bindings/sound/rt5659.txt                | 2 +-
>  Documentation/devicetree/bindings/sound/simple-audio-mux.yaml     | 5 +----
>  6 files changed, 6 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> index 5f6b37c..ae04a11 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -48,12 +48,7 @@ properties:
>
>    sound-name-prefix:
>      pattern: "^DSPK[1-9]$"
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description:
> -      Used as prefix for sink/source names of the component. Must be a
> -      unique string among multiple instances of the same component.
> -      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
> -      available instances on a Tegra SoC.
> +    $ref: "name-prefix.yaml#/properties/sound-name-prefix"

This is generally not how we reference common properties.

Either you add a $ref to the whole schema document at the top level of
this one or add a 'select: true' in name-prefix.yaml.

Rob
