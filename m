Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC2CC433DB
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Jan 2021 22:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E52222C9F
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Jan 2021 22:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbhAXWro (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 24 Jan 2021 17:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbhAXWrm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Jan 2021 17:47:42 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A510EC061756
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 14:47:01 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id h7so15105734lfc.6
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 14:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y/Ur1icl1bDhiJCpdkX42xbQJISQc10E4JkJfciYOIg=;
        b=Fia13/11rrtVr3VD7jIbc1K2BXfyYbZKOQTkLB5fAphprZoIvpPCfPD9iEjTxrgu6L
         4FV34p6SGvJ+iLunKep0oqWeCiFrP/WtmaaTq9zJLy6Xhh/TgI0S7C/Xo/Idfmv+cAgA
         +0Ucp8n8H19ggvIdUc0BtrkWn7+4itcS3JLyj81g0jXRaJV0I5VOgSI0wfxhbpVGHjEZ
         xuNH/O9sJgiIDcV/+B7ykpvJgvaltM55BcY+DSRsFA/WMFhp0GcU1q3g/NHexoA898y8
         r2XAq8Yo7i46ovoLHCweo+CMO6+tE7lVpj/hiFnpL6l5HGhrhjGbFgoSqwcgGI817arb
         ofCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y/Ur1icl1bDhiJCpdkX42xbQJISQc10E4JkJfciYOIg=;
        b=oSN5wy8tVFXYqyJ5TXbMqxJuthPQ7jACapNoQoWqLT9U6VnIESesF7ENY0pWHeblTK
         RUH9xi4wQwxW8c9rMHf+1nW5GWkGpazx94sTUT72XAa3DhLrhczVxHuBSmygEq8DLVyG
         qDZBAiwluaKxss12WF13kqAVS3JxR0dIpG28rlhRmo8/lIu3FS+jZ+Z79viAUgcOx4Cd
         To8PRGqlR/RKoX7EeqYlSkU9V76npWgMzTJbI4D1FZiZLFndBLyfzvBFtgy64sIg9eVk
         w3XEiGaV8qyacZ/o4ci2Gp29rjc06atqFTMpCAMIp0s/uYUyGEfE5gjfuXlEJZIR/MJm
         fxVQ==
X-Gm-Message-State: AOAM533IkYv7VZhhVs7EKKwOCmuUG5w4/WR3XcwYj3xTDd54fBFXNWAP
        wznEWiQa6L8uaRjnX3cT1INmllx0t09/+vrkS9WgcQ==
X-Google-Smtp-Source: ABdhPJxRmV/i00A0XXkkWgplWNjeR+UwYPMT/qKg224LqsPZ4Tm9OrCC49nvwsY/P09TlEZqpiPKi95861RYTNut0G8=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr278583lfp.586.1611528420080;
 Sun, 24 Jan 2021 14:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20210122185543.16554-1-digetx@gmail.com> <CACRpkdZTyBuz240iYuvi91k3dLKKXX=4DNxFEBP7mSNB58XtDw@mail.gmail.com>
 <24d46928-8c57-acba-f9cf-49afbe4c983c@gmail.com>
In-Reply-To: <24d46928-8c57-acba-f9cf-49afbe4c983c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Jan 2021 23:46:49 +0100
Message-ID: <CACRpkdaR9+mxXXjRADG4+qaGiqgwVRPcCAo-5nZwXXASYfs9+g@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable module
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jan 24, 2021 at 12:56 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 24.01.2021 01:50, Linus Walleij =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >
> >> This small series adds modularization support to the gpio-tegra driver=
,
> >> i.e. driver now could be built as a loadable kernel module.
> >>
> >> Dmitry Osipenko (3):
> >>   gpio: tegra: Use debugfs_create_devm_seqfile()
> >>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
> >>   gpio: tegra: Support building driver as a loadable module
> >
> > As these three patches clearly make the kernel look better after
> > than before:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > However when we are doing this I would strongly encourage you
> > to also make a patch implementing remove() so you can insmod
> > rmmod the module at runtime.
>
> The remove() is optional for drivers, it doesn't prevent the rmmod.

Aha you mean all resources are managed (devm_*) so that
rmmod/insmod works fine with this driver?

OK then! :) the work is finished.

Yours,
Linus Walleij
