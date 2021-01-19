Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56114C43217
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FFF320754
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392211AbhASMDF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390420AbhASKVS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 05:21:18 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A93EC061573
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 02:20:37 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b10so21273361ljp.6
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 02:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YQBcNBC489WaN9UL5/YpWA5NrXZnL3lkrVKWyyBDD8=;
        b=Oij/nf57252NbWgQ6kxq3HlQvHsxTgCrtEu4ieKonr/XWhrR0+nBWWDAotFFTGtxjQ
         PargBwuTuhLGCG/yiKNdqVHxFQldBmWQH/LQ86clXlRWzWrA02XWtWzJMu4u+7d6JZsv
         qi4eQxMpbhH6tRxa0hi28WEi3Mt6cvqWntB8evriedqCtUndhRNIgoG8sOPqJYKEdTZD
         Yv9LL+w+02Da0OAgpsIR0q6hkMXz/3EY3PLj5txy2rJdwdNEL46v0RpYxb2WQWWZMx5W
         Ksh1lHnsDqaQlQ7nGOIWU4krN4ohVHo1UxKlw8N+7YrmcQuc4N0xkYEaFiHfErNwvLXa
         5JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YQBcNBC489WaN9UL5/YpWA5NrXZnL3lkrVKWyyBDD8=;
        b=XaPL+gS/PEK3Pebj4ckzfeAV/0l9yhjq/Vh3hl4RvJQedp9vMQXwdPk8lKWnBal3xA
         r8Dx6+hRGTyL8ExXBXv/5QHUDqUO4kz48w9XQBPbZx7v7jT0RUck9y8jJR/RJ8NR6UDd
         yXG5XAtz8fwSkLAYoQzLQ8IKD13EDWNtFTlbugqxneCL/2DEIEvBM6aywG4TltJtZj5S
         mw5vPnUnlDcVyhD2x6tzBtqfewr4jsSW53q2ZKfMlEd/SW4rXzQMbOPKW1BeXNA2c+qn
         yzJztmRTamuv4qi3aNFpEpSq4JiIhDMBpaxROBZmDykWdzK+e6IcFj4bvXIaFqsgSPnB
         VcYg==
X-Gm-Message-State: AOAM530mdwHAP1PDhzV2vteOBbNQw0lnQ9KefK5R1xhTI/nXjhfjvlRR
        aLtOIyGojunGnjGDHCvxVPnv+a33/FCloOVnQgOL0w==
X-Google-Smtp-Source: ABdhPJz+4QRX7HKw9VEHd12Gtrjk667fN0JyF+01zaf0EbwqwdJ7Fe2bT7F5OqK9k2gnHfNTKGTAUF79v7Zl3/MIby4=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr1594135ljo.368.1611051635989;
 Tue, 19 Jan 2021 02:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20210115210159.3090203-1-saravanak@google.com>
 <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com>
 <CAGETcx9t3R-k0ttiaBUqcveqnXMX75xuTcKPSo9J6WJOfgSP8w@mail.gmail.com> <CAMuHMdUN7+O28Xz5rkPwR2RuSA+o_E2VcWsz_9+kzy4=0Jnb1g@mail.gmail.com>
In-Reply-To: <CAMuHMdUN7+O28Xz5rkPwR2RuSA+o_E2VcWsz_9+kzy4=0Jnb1g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Jan 2021 11:20:24 +0100
Message-ID: <CACRpkdZqSm-xfo8a8aFUe-Mbaw9tM+OmCAF3KWjOVDfC=oWj+Q@mail.gmail.com>
Subject: Re: [PATCH v1] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Saravana Kannan <saravanak@google.com>,
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

On Tue, Jan 19, 2021 at 9:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > Can we pull this into driver-core-next please? It fixes issues on some
> > boards with fw_devlink=on.
>
> On r8a77951-salvator-xs.dts, it introduces one more failure:
>
>     OF: /soc/i2c@e66d8000/gpio@20/pcie-sata-switch-hog: could not get
> #gpio-cells for /cpus/cpu@102
>
> Seems like it doesn't parse gpios properties in GPIO hogs correctly.

Could it be that the code assumes no self-referencing phandles?
(Just guessing...)

Yours,
Linus Walleij
