Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FFDC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 24 May 2022 15:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbiEXPWN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 May 2022 11:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238794AbiEXPWJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 May 2022 11:22:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D904C789
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 08:22:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7FCC61710
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 15:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC4EC36AE3
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653405723;
        bh=aclhNmBDEjkZFboreUg2TxO5BoMHzjL+JcrisqxFyBY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nlldaB9PO54KvKtHs1oDiBALIIY5o+OmqJGjQb1zr8VRVidje5iIuzyXByzYvRfHg
         uRvblv1xdeB3P1LvFGi6lZmHbwhPrJZcWp29xS0A9kx2IT4vTvFde0DYBfUj/1e9UF
         Zl5DCX6H6LgF4OOkhjWblD4clBei5paABXDEOfb9BIoTQ+GyO/QAgyFfe/crp9towI
         lPIi27WZQriCeJpJtaMWCWDFHOw1zqjQbCeKvDjlr66HwILdH980szGNaxlzM+JIPV
         At853PYM+2UcLnjHrRepm5b4HK+/P9OG80D5xquS9ooYo9rwtz08dt/kz7gj2oDlNK
         IN5pw4+neeiwA==
Received: by mail-ot1-f54.google.com with SMTP id n2-20020a9d6f02000000b0060b22af84d4so1289597otq.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 08:22:03 -0700 (PDT)
X-Gm-Message-State: AOAM531MwzqfkMSUfBiiAVHRjNLL6K0IPbvIimNIbF5zcORdh/wIQdES
        YTAxctD8MYu8q27yTKTCQr26PTA/2Zc4y70bZT0=
X-Google-Smtp-Source: ABdhPJzvGHcQvOz0QlA8T6e5+i28C8MelX4W1g0WXm5pq51O73yEyJh6LK11Bk2i5wxDjpN5nspZWQ96P8sCWFdRNvQ=
X-Received: by 2002:a05:6830:9c2:b0:606:1e0a:cc8d with SMTP id
 y2-20020a05683009c200b006061e0acc8dmr10593501ott.265.1653405722322; Tue, 24
 May 2022 08:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220328134714.205342-1-ardb@kernel.org> <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
In-Reply-To: <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 24 May 2022 17:21:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEmZdUePX8+9SPQhhc9CPTkg0fGWY7ftroYm8vH8xnz9w@mail.gmail.com>
Message-ID: <CAMj1kXEmZdUePX8+9SPQhhc9CPTkg0fGWY7ftroYm8vH8xnz9w@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
To:     Jon Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 May 2022 at 16:50, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Ard,
>
> On 28/03/2022 14:47, Ard Biesheuvel wrote:
> > The Spectre-BHB mitigations were inadvertently left disabled for
> > Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
> > that case. So fix that.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >   arch/arm/mm/proc-v7-bugs.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
> > index 06dbfb968182..fb9f3eb6bf48 100644
> > --- a/arch/arm/mm/proc-v7-bugs.c
> > +++ b/arch/arm/mm/proc-v7-bugs.c
> > @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
> >   {
> >       if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
> >               cpu_v7_spectre_v2_init();
> > +     cpu_v7_spectre_bhb_init();
> >   }
> >
> >   void cpu_v7_bugs_init(void)
>
>
> Since this patch has been merged, I am seeing a ton of messages when
> booting Linux on tegra124-jetson-tk1 ...
>

Thanks for the report. The good news is that the Spectre BHB
protection is finally taking effect on your system.

> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
> [ 1233.328700] CPU1: Spectre BHB: using loop workaround
> [ 1233.355477] CPU2: Spectre BHB: using loop workaround
> ** 7 printk messages dropped **
> [ 1233.366271] CPU0: Spectre BHB: using loop workaround
> [ 1233.366580] CPU0: Spectre BHB: using loop workaround
> [ 1233.366815] CPU1: Spectre BHB: using loop workaround
> [ 1233.405475] CPU1: Spectre BHB: using loop workaround
> [ 1233.405874] CPU0: Spectre BHB: using loop workaround
> [ 1233.406041] CPU1: Spectre BHB: using loop workaround
> ** 1 printk messages dropped **
>
> This is significantly increasing the boot time and causing failures if
> the boot takes too long.
>
> I see that Dmitry has posted a fix for one of these cases [0], but the
> above also needs to be fixed.
>

Agreed.

Do we have any idea why this init hook is being called so often? Is
this expected on systems that do agressive suspend/resume for power
management, or is there another existing issue here that is just
coming to light due to the newly added printk() ?
