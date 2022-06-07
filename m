Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909B3C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Jun 2022 14:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiFGOc4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Jun 2022 10:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243669AbiFGOcz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jun 2022 10:32:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E1FFE7
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 07:32:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D51561543
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 14:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FF1C385A5
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654612372;
        bh=jZ9gka66m8qzjTOEQfXEhbkv4bMzGxKP/C/fG2lRCBo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VHYjVYcvklVGMAB1SuQCAsXCT4D7bEKWlWC0lckHRqQA6z2j71UqOFolMnpM3b/Yu
         LQPH3+1cwkspBxYUl4sd7XTl5HP6F95cde8U/MdnwItbrtQQnEZGOVG7d3xjJaztRy
         GQILatnBvkO0/RjLFwTwgwCIWXjgV/h1Lc6z0styyyQy916Fx+NUlmMLEEEZITwUOR
         C9P9/anoO446P684K7h5v/FstD3ORMla9UPhnc87F8mLtf9uzfeICGgUpFAZmtdHLP
         1Xie/M+tPD37g3OJs7Z3w+XMBmK9izsiWat0QcF5uCTzA2NF4sIWIQoXnjcZyh95QQ
         A2alA5lzFFbAQ==
Received: by mail-oi1-f182.google.com with SMTP id k11so24052784oia.12
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jun 2022 07:32:52 -0700 (PDT)
X-Gm-Message-State: AOAM533+4gSL8jRV01Ac8aBriLIw5FzEYicj9hE9GkcIBa/T116tV8JL
        AoMprOxfubg0P+WLHKpzpoJUNm4d8vtTXGLiDf0=
X-Google-Smtp-Source: ABdhPJw/qqug4WFcmkwJlCuWrIOwY4mzJjoA4mnMx1Jjwrnsr8Dgls9/r3Xj1DXmMHiAmfCpJipufSE7ypJu7uTaRPU=
X-Received: by 2002:a05:6808:f88:b0:32b:d10f:cc6b with SMTP id
 o8-20020a0568080f8800b0032bd10fcc6bmr32338700oiw.228.1654612371799; Tue, 07
 Jun 2022 07:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328134714.205342-1-ardb@kernel.org> <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com> <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
 <061d892d-7a16-774a-4b50-b09055040ae2@nvidia.com>
In-Reply-To: <061d892d-7a16-774a-4b50-b09055040ae2@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 7 Jun 2022 16:32:36 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGMZR4+eyuG=-7bOLxzvs7Mhv4J4B-7kerdXKZxzON2ag@mail.gmail.com>
Message-ID: <CAMj1kXGMZR4+eyuG=-7bOLxzvs7Mhv4J4B-7kerdXKZxzON2ag@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        linus.walleij@linaro.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 7 Jun 2022 at 16:30, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 24/05/2022 18:03, Russell King (Oracle) wrote:
> > On Tue, May 24, 2022 at 03:50:17PM +0100, Jon Hunter wrote:
> >> Hi Ard,
> >>
> >> On 28/03/2022 14:47, Ard Biesheuvel wrote:
> >>> The Spectre-BHB mitigations were inadvertently left disabled for
> >>> Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
> >>> that case. So fix that.
> >>>
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>> ---
> >>>    arch/arm/mm/proc-v7-bugs.c | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
> >>> index 06dbfb968182..fb9f3eb6bf48 100644
> >>> --- a/arch/arm/mm/proc-v7-bugs.c
> >>> +++ b/arch/arm/mm/proc-v7-bugs.c
> >>> @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
> >>>    {
> >>>     if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
> >>>             cpu_v7_spectre_v2_init();
> >>> +   cpu_v7_spectre_bhb_init();
> >>>    }
> >>>    void cpu_v7_bugs_init(void)
> >>
> >>
> >> Since this patch has been merged, I am seeing a ton of messages when booting
> >> Linux on tegra124-jetson-tk1 ...
> >>
> >> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
> >> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
> >> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
> >
> > Now that you mention this, I vaguely remember some email on the list a
> > while ago about this being caused by something like cpuidle - but I'm
> > unable to find it now.
> >
> >> [0] https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/
> >
> > That was probably it.
> >
> > We can't really do this for the other print, because the system status
> > can change as a result of CPUs being brought online. :(
> >
>
> Does it make sense to only print the message if/when the method changes
> as opposed to every time the CPUs are brought online? That way, there
> would still be at least one print showing the current method. I believe
> that is what Ard had proposed.
>

A fix for this issue is already in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bafa10435c4f34f4b9bda8fc7ee6e4330ebca3ea
