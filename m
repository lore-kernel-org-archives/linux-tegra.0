Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11EDC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 19:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E9D36191D
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 19:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhCWTPz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 15:15:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233300AbhCWTPX (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 15:15:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1FD9619D5;
        Tue, 23 Mar 2021 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616526923;
        bh=vz1/BwgKsE4QbkxEXRmEGYxQ6lPFuYc202DcZfmWPD8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rQFSHnitQ6+kpGJZuvHSKEGBHFXMX+wwPTFR7qY5UowNPpwAoZNZEy1w0auxbFQV6
         Waok3+0GibjFa/ysyW3jB6MjhXPl33LPeK2B19lgGhljJFV8L75EYoe+cxy68shxb4
         D+LtRkf8M3g7UN18j2Gh8Ae5N0nIpDlNjN6X3bQaNRtzJiuMIHoz6VMLIxzDUwVNsu
         Vx+Dmphj3hlUYjc1I9wtyKZ4JnEcJWm65DDMSFvKbDX/Gfszc6YR30Aglh8ABw2BnY
         Iny/3S32BZFCHZt8nDApWM8V0aMvTFQjp1AQP2rMWwQ0+9joX8xOvYgpye+oCzHfSu
         2U6gRYJZKMWxw==
Received: by mail-ed1-f51.google.com with SMTP id b16so24788293eds.7;
        Tue, 23 Mar 2021 12:15:22 -0700 (PDT)
X-Gm-Message-State: AOAM530AQh6dGQ2eqUZ/5Khzj17Dw9hMufAfyZ45pfDw/h+2Q3pwHHqj
        ZJFnKvV8Bfud63CE9lqmcthqdNJMaCO839VC8w==
X-Google-Smtp-Source: ABdhPJyQUqDZQDlvFKjPPDtTkz4sNMlGLVxwHNqzDZOmCnzfXNGTmq/LBSdLt5mLoL79k61b8WRMes6qPDOkgy4P01Y=
X-Received: by 2002:a05:6402:2d0:: with SMTP id b16mr6214654edx.194.1616526921538;
 Tue, 23 Mar 2021 12:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210323163634.877511-1-robh@kernel.org> <20210323163634.877511-2-robh@kernel.org>
In-Reply-To: <20210323163634.877511-2-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 23 Mar 2021 13:15:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLFj3tUUeEeKoZx=P3AHE4Tu1TzuA-tqK4+qD=4J6c=8Q@mail.gmail.com>
Message-ID: <CAL_JsqLFj3tUUeEeKoZx=P3AHE4Tu1TzuA-tqK4+qD=4J6c=8Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Move port/ports properties out of audio-graph-port.yaml
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 23, 2021 at 10:36 AM Rob Herring <robh@kernel.org> wrote:
>
> Users of the audio-graph-port schema need to define how many ports
> and what each port is, so they need to define 'ports' and/or 'port'
> anyways. Let's drop 'ports' and 'port' from the schema and adjust users
> to reference audio-graph-port.yaml from a port property.
>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Lubomir Rintel <lkundrak@v3.sk>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> index 31f3e51974bb..e568d6c7dddd 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> @@ -17,9 +17,6 @@ maintainers:
>    - Jon Hunter <jonathanh@nvidia.com>
>    - Sameer Pujar <spujar@nvidia.com>
>
> -allOf:
> -  - $ref: audio-graph-port.yaml#
> -
>  properties:
>    $nodename:
>      pattern: "^ahub@[0-9a-f]*$"
> @@ -60,12 +57,18 @@ properties:
>    ranges: true
>
>    ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description: |
>        Contains list of ACIF (Audio CIF) port nodes for AHUB (Audio Hub).
>        These are connected to ACIF interfaces of AHUB clients. Thus the
>        number of port nodes depend on the number of clients that AHUB may
>        have depending on the SoC revision.
>
> +    patternProperties:
> +      '^port@[0-9]':
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -77,7 +80,7 @@ required:
>    - "#size-cells"
>    - ranges
>
> -unevaluatedProperties: false
> +additionalProperties: false

Adding this results in schema errors in the example, so a prerequisite
patch is needed.

Rob
