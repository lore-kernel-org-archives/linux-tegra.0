Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505A1C169C2
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11FB8230FE
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730678AbhASS1A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:27:00 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:45291 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392507AbhASSLi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 13:11:38 -0500
Received: by mail-ot1-f48.google.com with SMTP id n42so20653427ota.12;
        Tue, 19 Jan 2021 10:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ECmOo+b/Ycy8oSdsflKY56kBQ2KKW+k6NlOgYJAU6mg=;
        b=pEdzMbDk0b+osb7hnN8l1TSaU2OEIiDdG8VkkF2CjjAfGTHeY8ofy/CcCAP4WRxQRP
         GNHl/2GrlPo0ifZNAi2s5vNqW6XadwVKzTk1MvlN+nno2emSgtLSk9DXG6Q+WI4LRjps
         QXIsn01uqgbGoCG9/HeHPD2/LQ6iqGKTZ2ulKaBRzaVkIqhIAj+cBAu5T5GzbL59AhOj
         xYSVojc+1A3x6BA6n8+eFXqTn+QvscARL4JLPIxVaW5TFUpCBP1BrtjiMu8Nbl4WAohG
         vong1WG0Q4SizfHzogSAWQZirXQo1F3y4rUwgEUk1FYAEoKLb5U4PCu1aB7rfZ8gaaZR
         FE4w==
X-Gm-Message-State: AOAM530slDjoDtogiHsGd8QFJLqI49DyOcWFqClSb4hnpCSf9ZMPqPhR
        4k4JXWSfU1rZgZUo6Rr2D0Z2t4L0okXR63ZHRHE=
X-Google-Smtp-Source: ABdhPJyROuH3pURiKJ6vM2XKihWlMn+WAXH/KDLEv+d8UpaWsrLEDusb3fix67/t7LnhX6sLXEwS45m4zrrGlHVYG9E=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr4353589otc.145.1611079854461;
 Tue, 19 Jan 2021 10:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20210115210159.3090203-1-saravanak@google.com>
 <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com>
 <CAGETcx9t3R-k0ttiaBUqcveqnXMX75xuTcKPSo9J6WJOfgSP8w@mail.gmail.com>
 <CAMuHMdUN7+O28Xz5rkPwR2RuSA+o_E2VcWsz_9+kzy4=0Jnb1g@mail.gmail.com>
 <CACRpkdZqSm-xfo8a8aFUe-Mbaw9tM+OmCAF3KWjOVDfC=oWj+Q@mail.gmail.com> <CAGETcx-Vp0BpYbpPjwsmOv0q5ba1mJvfsPEZ9Oi2Rmx67udu7A@mail.gmail.com>
In-Reply-To: <CAGETcx-Vp0BpYbpPjwsmOv0q5ba1mJvfsPEZ9Oi2Rmx67udu7A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Jan 2021 19:10:43 +0100
Message-ID: <CAMuHMdUc+RCK=t02QhtWRekoYCx2pHnMyaTYiC0=SxKQVrqDHQ@mail.gmail.com>
Subject: Re: [PATCH v1] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Saravana,

On Tue, Jan 19, 2021 at 6:54 PM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Jan 19, 2021 at 2:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Jan 19, 2021 at 9:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > Can we pull this into driver-core-next please? It fixes issues on some
> > > > boards with fw_devlink=on.
> > >
> > > On r8a77951-salvator-xs.dts, it introduces one more failure:
> > >
> > >     OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
> > > #gpio-cells for /cpus/cpu@102
>
> Geert,
>
> One good thing is that it's noticing this being weird and ignoring it
> in your particular board. I *think* it interprets the "7" as a phandle
> and that's cpu@102 and realizes it's not a gpio-controller. For at
> least in your case, it's a safe failure.

While 7 is the GPIO index, relative to the current GPIO controller,
represented by the parent device node.

> > > Seems like it doesn't parse gpios properties in GPIO hogs correctly.
> >
> > Could it be that the code assumes no self-referencing phandles?
> > (Just guessing...)
>
> Ok I tried to understand what gpio-hogs means. It's not fully clear to
> me. But it looks like if a gpio-controller has a gpio-hog, then it
> doesn't have/need gpio-cells? Is that right?

A GPIO hog is a way to fix (strap) a GPIO line to a specific value.
Usually this is done to enable a piece of hardware on a board, or
control a mux.

The controller still needs gpio-cells.

> So if a gpio-controller has a gpio-hog, can it ever be referred to by
> another consumer in DT using blah-gpios = ...? If so, I don't see any
> obvious code that's handling the missing gpio-cells in this case.

Yes it can.

> Long story short, please help me understand gpio-hog in the context of
> finding dependencies in DT.

The hog references a GPIO on the current controller.  As this is always
the parent device node, the hog's gpios properties lack the phandle.

E.g. a normal reference to the first GPIO of gpio5 looks like:

    gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;

A hog on the first GPIO of gpio5 would be a subnode of gpio5,
and would just use:

    gpios = <0 GPIO_ACTIVE_LOW>;

instead.

Hope this helps.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
