Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F30C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C758222E00
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbhASSor (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387890AbhASR5H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:57:07 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62FEC06138B
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 09:54:30 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id e67so8211446ybc.12
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 09:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+/J27uvGJNWRkcEdHdikRhtGLPGXBf2Z7B8raJzfG8=;
        b=VNmhhkIievbkfSc+cjRvVw2L92usrVFQArZAzXCy99qCox/NjfpvR07w/+4P8slWk5
         NHZAWIhrgGzzekDe1fQMBL0cUF2CjUMATWBMUl31unA/FvaxTrFd+77Oup7faIC9sJVM
         9QG87sR/eWzrliUtIupEbtEiNWQyG5oPB7F+/+CpmGxlk2KYqDH3PnavfGc3sy9n7tP/
         cCSPhtGwfXS2d2gSzNiZrKaqlfal36TyN15sGM/Dns6WwQFG0fZRlvY/116YfkG8Ku5T
         qUqMC+HWaUq+SDkKx1HB9w2+TB9q8VzQq1SEh+nw8myO82T6druRVu5BAszrPdMLCQAC
         YqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+/J27uvGJNWRkcEdHdikRhtGLPGXBf2Z7B8raJzfG8=;
        b=P/VGrBYWi+Y6E+yhwD0NnNa8QgiuEo7vqzLDVD3zWWroMl4kdE8m+UvnxZkOcsgCDq
         Kwg+f4dlJ1PuQQYWSwuxs5PhWhQA0BuU7LuMGnKl0wXouBmZjDFiVgELELmNEotDkh7K
         3TiuNZIX16dqcJQaZPDFm3rgHTI9GPD6i9i0QqtCYl+V2UNaNUyi082CYa/24TOtfuaD
         iX5SgH1CE3/bLQWgQ+Hc6gA/YzdHNfVgkGDWkFu83a+kORjviKmR7gWw8bgQ+HQw1rjk
         5r8qEHQuBdEccPmfBAK1Ybq7LMCK0J/NKeArcbvVmH+brmsNNMVoqDcteLfySd7wYMVO
         xfMA==
X-Gm-Message-State: AOAM532Y7HhjXCqHyclxYq8JXM/MoGnag7Z8oBrWt4AN1AnXhcoqyl0d
        tty1zhnhHTNfe57SHs6Se3FcGkL7SGrmkZ1UOObEtg==
X-Google-Smtp-Source: ABdhPJxrYl/1TM45kNIJhyUluY43XDSvSI/9t/hcpCygXflUpxCfBA/MJNLA/Q+aYIn08kWgLlNWb6Xo+b5k0jCg4sg=
X-Received: by 2002:a25:7491:: with SMTP id p139mr7075085ybc.346.1611078869664;
 Tue, 19 Jan 2021 09:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20210115210159.3090203-1-saravanak@google.com>
 <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com>
 <CAGETcx9t3R-k0ttiaBUqcveqnXMX75xuTcKPSo9J6WJOfgSP8w@mail.gmail.com>
 <CAMuHMdUN7+O28Xz5rkPwR2RuSA+o_E2VcWsz_9+kzy4=0Jnb1g@mail.gmail.com> <CACRpkdZqSm-xfo8a8aFUe-Mbaw9tM+OmCAF3KWjOVDfC=oWj+Q@mail.gmail.com>
In-Reply-To: <CACRpkdZqSm-xfo8a8aFUe-Mbaw9tM+OmCAF3KWjOVDfC=oWj+Q@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 19 Jan 2021 09:53:53 -0800
Message-ID: <CAGETcx-Vp0BpYbpPjwsmOv0q5ba1mJvfsPEZ9Oi2Rmx67udu7A@mail.gmail.com>
Subject: Re: [PATCH v1] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Tue, Jan 19, 2021 at 2:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jan 19, 2021 at 9:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > > Can we pull this into driver-core-next please? It fixes issues on some
> > > boards with fw_devlink=on.
> >
> > On r8a77951-salvator-xs.dts, it introduces one more failure:
> >
> >     OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
> > #gpio-cells for /cpus/cpu@102

Geert,

One good thing is that it's noticing this being weird and ignoring it
in your particular board. I *think* it interprets the "7" as a phandle
and that's cpu@102 and realizes it's not a gpio-controller. For at
least in your case, it's a safe failure.

> >
> > Seems like it doesn't parse gpios properties in GPIO hogs correctly.
>
> Could it be that the code assumes no self-referencing phandles?
> (Just guessing...)
>

Linus,

Ok I tried to understand what gpio-hogs means. It's not fully clear to
me. But it looks like if a gpio-controller has a gpio-hog, then it
doesn't have/need gpio-cells? Is that right?

So if a gpio-controller has a gpio-hog, can it ever be referred to by
another consumer in DT using blah-gpios = ...? If so, I don't see any
obvious code that's handling the missing gpio-cells in this case.

Long story short, please help me understand gpio-hog in the context of
finding dependencies in DT.

Thanks,
Saravana
