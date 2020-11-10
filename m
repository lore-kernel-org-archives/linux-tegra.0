Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2552DC4742C
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 13:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA3EB20797
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 13:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4qfzc6f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgKJN3E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 08:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJN3E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 08:29:04 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D18C0613CF
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 05:29:02 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 74so17506538lfo.5
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 05:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VpvennLXqd9u8XBAkLNq08P3gs06tYHk1YXS66WYMfA=;
        b=e4qfzc6fGLSanNKKKH1lMessAnUc6V7lq/QDpUfyCwsButZQXNjlI2Zy+kbN6ShlH8
         sAwf+KQM/TE+pk+jK+wOShgehU1Ax+FGfNSGRXOji/7RzGqXaubIhXylhZoZbEpBBgnH
         TkCsZaPqDHElv6Ic6ugy6Moa98kgWmucxwOgEvH53UuFtdOF4yPe9JdoVXhA1lG4g6jg
         vYbcQP+WbqWBad02yxOyMYuDzyvhpWSHKGTRSNzkQJ5u37+xhKnaHIIyc+xb8cPpkCSr
         C7e5J5kHc7S3V+ma3OopWpYRxPhcfPm+RqapqZqIVBFYEnwitKfJVtGd0F1U8RvxPcTc
         CrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VpvennLXqd9u8XBAkLNq08P3gs06tYHk1YXS66WYMfA=;
        b=L0+nQNXL4ylZC0p50JwlEdJwDxH1jf9YF4dhKZY0au9BfSDgkWt1ZFXKyCBcVlwD7S
         bhCaS+He9Xr7I5gwdppxIYqgOsJK/YrrZVJNiptLuWjzxP/7xufn57K42B6fC5Qb4D2U
         x1dxZXJxFLc/Uk1635EVunTOpMYmexkgiVS+wmOY0lSxoENW3EfPfTP9yEAfqGXfO6L5
         4sABPOpey+pGgQzlNsaoGArlav5uZeRTO7tD2NxA6P0Fr8/qfJ6xv4uQ5pdXd0gaJWaP
         bm1zxHEP0DjnIjGl0QJZoIMkmg00Qwo+NiwTpftTzrJzSw4/SGV183kxTJrivW1qQsD8
         Kb0w==
X-Gm-Message-State: AOAM531wGYDulEf5RaPYmmPSJpEnQz69lt3UaQTqRq8XdO2rX/O6pf0s
        gx7fR6Q834HXZrJYLqhVgYRF5RBEkGMYlh/yTqjxtjfOApoZrSS1
X-Google-Smtp-Source: ABdhPJzlApEwfwRGbOpyP6hL+tJ9TQYgfwqBZBfNChK8tlWs+CksUDxUlyUhT9aRZqSe/bM7S8045vtpQdlLTLBS4pQ=
X-Received: by 2002:a19:5e0b:: with SMTP id s11mr6916846lfb.502.1605014940935;
 Tue, 10 Nov 2020 05:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20200901124736.155281-1-linus.walleij@linaro.org>
 <7e34261d-c7b9-99f9-121e-05da76a8781a@gmail.com> <CACRpkdZnZ0fxU=7_RLMEivvFProa5r9VPpPiHHR_45zzk3_kCA@mail.gmail.com>
 <6877bfc9-3099-226a-7f9c-9f1c488e0872@gmail.com>
In-Reply-To: <6877bfc9-3099-226a-7f9c-9f1c488e0872@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:28:50 +0100
Message-ID: <CACRpkdanP05wN03Ge4Vu4cAxXuOdnGHZrHGNMcw-H3=9ohjx=w@mail.gmail.com>
Subject: Re: [PATCH] ARM: uncompress: Enable debug in head.S
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 4, 2020 at 9:40 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 29.09.2020 16:48, Linus Walleij =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> >> I also tried to revert only the "ARM: 9006/1: uncompress: Wait for rea=
dy
> >> and busy in debug prints" patch and got this in QEMU:
> >>
> >> Starting kernel ...
> >>
> >> DTB:0x016F6A20 (0x00005DA6)
> >> C:0x010000C0-0x016FC820->0x0125AF00-0x01957660
> >> Uncompressing Linux...
> > (...)
> >> LZMA data is corrupt
> >>
> >>  -- System halted
> >
> > Hmmmm is the physical and virtual address to the UART
> > really correct?
> >
> > Else it might write in some random memory.
>
> Hello Linus,
>
> Just want to let you know that the problem isn't fixed yet and I haven't
> got around to work on yet too. Hopefully next week!

OK it's "just" debug code after all but it is working on at least 5
different platforms I tested with so I strongly suspect something
fishy with the Tegra include/debug/tegra.S.

This debug macro file is bigger than any of the others and I
see some suspicious amount of clock code and what not
in there so I am not sure what can cause this.

I would test to implement waituarttxrdy first and see what
happens if you just do that. I remember that those early
debug prints use the macros slightly different from the
"Uncompressing..." message.

Yours,
Linus Walleij
