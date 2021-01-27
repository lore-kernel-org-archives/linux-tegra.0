Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314F9C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 14:47:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 073A0207C5
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 14:47:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbhA0Oq6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 09:46:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbhA0Oqy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 09:46:54 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA63C061756
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 06:46:13 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id hs11so3042806ejc.1
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 06:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LB+KnXDk08QSztygvS1XRrmtygQ3Z6NLwB4B/K64vk4=;
        b=MCq9nT9sjOH/xAmhsgEVlDS04AvCloSKoqpwLu4kkOM9mXA5U807sI6Bq+S0kWd1q+
         hVdknbWzaif7Mpl0GXvRD6W48szElaiBkZpwzK4g3z3ezTApPwstKC9stF9yQTey2aTT
         23RmLCQzkzXAuXHb8Zo8RbYDcGG53pTUXkhA4yLSlUYeWXHVKkEYOm4ZA2kwxN0mnNMF
         qTU3Z07/1z2VIrHlJYvIMj59fGwPnRGVlPPPk7FJQ0uMCeJFfb3CUfQOPZNLAbkaCeNZ
         1GH8J0+NeysPMLvfMKWBrktDcpsTiNIDZ3BNjdyXUJ3jxNotrmD9eEgRBxGkRo8G5h/m
         pb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LB+KnXDk08QSztygvS1XRrmtygQ3Z6NLwB4B/K64vk4=;
        b=mhRfL1NqIwj5AFAhwhvZvb9a3idu/8A9W0aA5NfreqrIgAADLDrEJ1ZmFUEN8iJ+dH
         oJu6xZ4X78lvCPVmuCWtW4inlE84IHcg9x5BLEwRwWnA12mWp/Q8/Lfs1jhV4dALlPeG
         EDPUFb8tgfh5bvpn+PEdrs2rWAJunShWfngp36JyV3qn/ZG6Y45HhDhr3bzEMM50xRjD
         7K4rDNqwid9xT6er9hxC5ZTYpZ+OPurYn7TVx0OLCrqxPf2rVk6TP4sPFjmm8p4V9wfq
         g4ZQ5mTlpvn5W9PDuG+wbUNgpzMgA+bhJyAGDoc1635Z2wjqOgzvC1ZkYks0IPYhn5Qw
         bRVg==
X-Gm-Message-State: AOAM5304Hone2I8pjP15AgsiS6OI3PvAPZZN7TK6CKe+BWwkY5HiPwwd
        /xbXyQ0m6JkMRUeIwW5WDNAu0ru8fVp/WPkfSchT8g==
X-Google-Smtp-Source: ABdhPJyY9Gpe6UV949iqRFcQXeo6eAH+lz7i0n80n61UAFSWAuJJqxJzMnOoy8jNyXqG8JdO34YZgV6MmRfPXZapNVI=
X-Received: by 2002:a17:907:2632:: with SMTP id aq18mr117344ejc.445.1611758772511;
 Wed, 27 Jan 2021 06:46:12 -0800 (PST)
MIME-Version: 1.0
References: <20210120004548.31692-1-digetx@gmail.com> <CACRpkdZynT6T8wnN3xY6hUmZy5emWUe5ep9N3BEV8iQEZLnEew@mail.gmail.com>
In-Reply-To: <CACRpkdZynT6T8wnN3xY6hUmZy5emWUe5ep9N3BEV8iQEZLnEew@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Jan 2021 15:46:01 +0100
Message-ID: <CAMpxmJX2BwN1Lj1GpGqoq9Yd_jGsJoRDO4ur-6nZY18DE++vVw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tegra: Fix irq_set_affinity
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 22, 2021 at 1:56 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jan 20, 2021 at 1:46 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> > The irq_set_affinity callback should not be set if parent IRQ domain
> > doesn't present because gpio-tegra driver callback fails in this case,
> > causing a noisy error messages on system suspend:
> >
> >  Disabling non-boot CPUs ...
> >  IRQ 26: no longer affine to CPU1
> >  IRQ128: set affinity failed(-22).
> >  IRQ130: set affinity failed(-22).
> >  IRQ131: set affinity failed(-22).
> >  IRQ 27: no longer affine to CPU2
> >  IRQ128: set affinity failed(-22).
> >  IRQ130: set affinity failed(-22).
> >  IRQ131: set affinity failed(-22).
> >  IRQ 28: no longer affine to CPU3
> >  IRQ128: set affinity failed(-22).
> >  IRQ130: set affinity failed(-22).
> >  IRQ131: set affinity failed(-22).
> >  Entering suspend state LP1
> >
> > Hence just don't specify the irq_set_affinity callback if parent PMC
> > IRQ domain is missing. Tegra isn't capable of setting affinity per GPIO,
> > affinity could be set only per GPIO bank, thus there is nothing to do
> > for gpio-tegra in regards to CPU affinity without the parent IRQ domain.
> >
> > Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> > Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> > Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
> > Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> > Reported-by: Matt Merhar <mattmerhar@protonmail.com>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>
> Ick, sorry for the noise!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Patch applied, thanks!

Bartosz
