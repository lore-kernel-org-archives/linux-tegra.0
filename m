Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5011CC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 08:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B02822DD3
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 08:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbhASIu7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 03:50:59 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:42014 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbhASIu5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 03:50:57 -0500
Received: by mail-oi1-f171.google.com with SMTP id x71so4614008oia.9;
        Tue, 19 Jan 2021 00:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4Gm4+uugmYqCJn3t8JQVk7SNB9YL44Y0rg/bn30M9E=;
        b=b35Tm+TLbqE0fHEYHJObhCfaYSx5yTivZHlWPUfFdNxhuYaspfvDdwsPb9kMJ3EYq2
         cJX27i5KDl+3I2jywffkhjsfAv0qZAct//TxQXgHDabaCXWgJbRV53EQyDc7yZw7v0AJ
         4JO6xNdavOs3wejzhtEHkVvBNng4wrDuKkHajjqRVJEhvcbgdVXA+MCxUsHdWRNy4bw9
         wyVhpcF4e0gfzi2YGzc1fKADID6j/yPkbMXDaLj3GB9+i3Gl/IH6YRpPh+7UQtykHXmp
         LkwixkzrsyG8FLUYWjJM/t3QForvNl++j1IWx376WelS0FYK98KL+SRfw+aycyz5z4q5
         o53A==
X-Gm-Message-State: AOAM531kqFyZVm1klKiQI9GkH4VprReVfGdzJPhaRsNwqUIL8FKvpvYA
        O6VomazVHTBLzmWRSrlK2lWoe7pMy2rN/GASvJc=
X-Google-Smtp-Source: ABdhPJwWzZGPBVAc5hLlifjQL3MRYUtQjM+85DWctCesaugATVvMcpLOIc4KpUfO4Rihn6oY785SWzNEmEdERYFaNZQ=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr1873125oia.148.1611046216784;
 Tue, 19 Jan 2021 00:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20210115210159.3090203-1-saravanak@google.com>
 <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com> <CAGETcx9t3R-k0ttiaBUqcveqnXMX75xuTcKPSo9J6WJOfgSP8w@mail.gmail.com>
In-Reply-To: <CAGETcx9t3R-k0ttiaBUqcveqnXMX75xuTcKPSo9J6WJOfgSP8w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Jan 2021 09:50:05 +0100
Message-ID: <CAMuHMdUN7+O28Xz5rkPwR2RuSA+o_E2VcWsz_9+kzy4=0Jnb1g@mail.gmail.com>
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

On Mon, Jan 18, 2021 at 11:14 PM Saravana Kannan <saravanak@google.com> wrote:
> On Mon, Jan 18, 2021 at 7:32 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Fri, Jan 15, 2021 at 10:02 PM Saravana Kannan <saravanak@google.com> wrote:
> > > To provide backward compatibility for boards that use deprecated DT
> > > bindings, we need to add fw_devlink support for "gpio" and "gpios".
> > >
> > > Cc: linux-tegra <linux-tegra@vger.kernel.org>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> > > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>

Thanks for your patch!

> > "gpios" is a valid non legacy property I think.
>
> I checked :) Quoting the documentation [1]:
> "While a non-existent <name> is considered valid for compatibility
> reasons (resolving to the "gpios" property), it is not allowed for new
> bindings."
>
> [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gpio/gpio.txt#n8
>
> > Anyways:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks!
>
> Greg/Rob,
>
> Can we pull this into driver-core-next please? It fixes issues on some
> boards with fw_devlink=on.

On r8a77951-salvator-xs.dts, it introduces one more failure:

    OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
#gpio-cells for /cpus/cpu@102

Seems like it doesn't parse gpios properties in GPIO hogs correctly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
