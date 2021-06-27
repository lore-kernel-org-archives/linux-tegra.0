Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDA2C48BC2
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 10:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E663F61C3D
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Jun 2021 10:57:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhF0K7b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Jun 2021 06:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhF0K7b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Jun 2021 06:59:31 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C9DC061767
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 03:57:07 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id d25so20269175lji.7
        for <linux-tegra@vger.kernel.org>; Sun, 27 Jun 2021 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTEvR8vNZmSkCCvd7kXnIDqGnNbdwQ1baNJXm2EXJuU=;
        b=yzdFGFOTrJISQhFLfqIYNb92VC4LFeeqggPC/JIl3EBFYPPxiO8a2k6IFEunTUrB2H
         Xr0x8Erd8srzZR1Vu+Di1DnZ/gP3of5e3DXd2zIV4B3pB1AJyVqIuQNWm8b7CiaSSJYk
         fe+WgfM3mNIqKhAfB7gXZUGQc89xHm6hXRm22Bx4u4kx5MciGEG+edOP43evKyoBsfnh
         LqSlxZIoM7mGSNS1ZRB9c+TuCc8ClaTM00SWEZ4vQKRqi7FROihijgbc3NvVFtQRUz/B
         yA8igIPPjX/GxtzQWvxn5aJbs5PvzPJ/K2YuSfiVqmOR5n9+iqXicbjDcKHiYNAaOr93
         BaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTEvR8vNZmSkCCvd7kXnIDqGnNbdwQ1baNJXm2EXJuU=;
        b=bqZ8RldmmiLLH9IOHgGjG8W3p+c2LwpeizGbPOKQ0VPn27MA1WEg4zHAfdMACjTFeA
         14Z3B9Y2GLM1VWFkyhGQ3aqbzdFsSc3azzJi3ETUV/4lrJvvxal/pjafuZByKTRkKmQr
         j/ok89j8myJcpxBRG8X8de8fCUhC7YxdGpPYldKvYl3FNNARzYBdp7QfLAAzxI6j8p9X
         IUBjpTN5E/XX96iOdPYyMOWMauao6ynGaNTI6UR67in3W6JddFHrNDQfIi3XjLjmztYP
         JMsg+XFoSRm49g/Kj+96ecoRm0VU76XDy0tNM3VkCAdYMdOe9H2kVZWsrDjKW1UHYDTP
         3qwQ==
X-Gm-Message-State: AOAM53236zCR7XR20t9ksnEEjGuBrG1Lt+JcJ2DpQqBDQCzYw19qLrw4
        //IFm66hPOdKQrGfwMkpU2wlFwd4ouKeiCYw8Vdz1g==
X-Google-Smtp-Source: ABdhPJwGAHXPLyOn5EGBJgA8Jv9S+SbKC/9qd0ekxItP16IN3TWo7m1K6877Hzmkxr5RaxT1yaMQrVKbviDJ/sVu27c=
X-Received: by 2002:a05:651c:603:: with SMTP id k3mr15449365lje.368.1624791425668;
 Sun, 27 Jun 2021 03:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-5-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-5-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Jun 2021 12:56:54 +0200
Message-ID: <CACRpkdbazcGqapWMLnj8=UShU0j002SkKRTxgpprfDeaP_nAQQ@mail.gmail.com>
Subject: Re: [RFC 04/11] dt-bindings: Add HTE bindings
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dipen,

thanks a lot for this very interesting patch set!

I'm gonna try to review properly, just pointing out some conceptual
things to begin with. Bindings is a good place to start.

On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:

> +description: |
> +  HTE properties should be named "htes". The exact meaning of each htes
> +  property must be documented in the device tree binding for each device.
> +  An optional property "hte-names" may contain a list of strings to label
> +  each of the HTE devices listed in the "htes" property.

I think this is a bit over-abbreviated. IIO has:
io-channels =...
io-channel-names =...

Given DT:s infatuation with using english plural I would opt for:
hardware-timestamps = ..
hardware-timestamp-names = ...

The "engine" part is a bit of an nVidia:ism I think and a too generic
term. Could as well be "processor" or "automata" but nVidia just
happened to name it an engine. (DMA engine would be a precedent
though, so no hard preference from my side.)

When reading this it is pretty intuitively evident what is going on.

Other than that it looks really good!

> +++ b/Documentation/devicetree/bindings/hte/hte.yaml

I would name this hardware-timestamp-common.yamp or so.

> +title: HTE providers

Spell this out: Hardware timestamp providers

> +properties:
> +  $nodename:
> +    pattern: "^hte(@.*|-[0-9a-f])*$"

Likewise:
hardware-timestamp@ ...

I think this is good because it is very unambiguous.

> +examples:
> +  - |
> +    tegra_hte_aon: hte@c1e0000 {
> +              compatible = "nvidia,tegra194-gte-aon";
> +              reg = <0xc1e0000 0x10000>;
> +              interrupts = <0 13 0x4>;
> +              int-threshold = <1>;
> +              slices = <3>;
> +              #hte-cells = <1>;
> +    };

The examples can be kept to the tegra194 bindings I think, this
generic binding doesn't need an example as such.

> +$id: http://devicetree.org/schemas/hte/nvidia,tegra194-hte.yaml#

This one should be named like this, that is great.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra194 on chip generic hardware timestamping engine (HTE)

This is clear and nice.

> +  int-threshold:
> +    description:
> +      HTE device generates its interrupt based on this u32 FIFO threshold
> +      value. The recommended value is 1.
> +    minimum: 1
> +    maximum: 256

Does this mean a single timestamp in the FIFO will generate an IRQ?
Then spell that out so it is clear.

> +  slices:
> +   description:
> +    HTE lines are arranged in 32 bit slice where each bit represents different
> +    line/signal that it can enable/configure for the timestamp. It is u32
> +    property and depends on the HTE instance in the chip.
> +   oneOf:
> +    - items:
> +        - const: 3
> +    - items:
> +        - const: 11

Can't you just use
enum: [3, 11]
?

> +  '#hte-cells':
> +    const: 1

So IMO this would be something like
#hardware-timestamp-cells

Other than this it overall looks very nice to me!

Yours,
Linus Walleij
