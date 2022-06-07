Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0913AC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Jun 2022 14:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245713AbiFGOjh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Jun 2022 10:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245703AbiFGOje (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jun 2022 10:39:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08121F45E3
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 07:39:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76935B8206A
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 14:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B464C341C0
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654612770;
        bh=InV9CMrKaQwKl2bK4mb7WbWu4ZjAtIdkFsHCshJZGoA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VYdw6Kg6SP0Pc9r/P3LtWqd2v0dvXeGMX0v2TpqEdlZI9buUIMMwovnTyzk/kJw4D
         M0sCajR1EZeewAh8WgTChT6K1E6aZdRx6VpT/dhDLAzDj3VpwlVIz80UdvoCLd7cTh
         Vp+WZ9PqBxpuWSeyIyG0TpUjncOFie41jX0C/dSEq2tiN1vPpD1+WGLwkiLbwfvvcI
         c+pEligkZtIqq1WiMAf+dee6slcXcAaa8J4p+iKs77M4rw/D+DSLux+FTVvXnI7jnx
         UP49uatz2/oMX7enKXDHTgVjby7SnNVCxluOFJk+8SVsjhun9FcATwDnTYe7ksAKD2
         O+Y/oUz1k68/Q==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-f33f0f5b1dso23374368fac.8
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jun 2022 07:39:30 -0700 (PDT)
X-Gm-Message-State: AOAM533kNjaaaPhpBOAwia+jgUVooQWMsaYbinqx0/bXAwc0tO4mKnYs
        VkXPj8Nv8lQNG1Q6Sve6gWN57yxyClzxXExyWuM=
X-Google-Smtp-Source: ABdhPJxzGNqbRoe8K7UyuygvOXKVPzJ82TObrwyRcAERJC0u8jvk2QH3n9xyRvg1DxVxIjhXX8qa24EFWHA89iPX/Oc=
X-Received: by 2002:a05:6871:5c8:b0:f3:3c1c:126f with SMTP id
 v8-20020a05687105c800b000f33c1c126fmr16702035oan.126.1654612769275; Tue, 07
 Jun 2022 07:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220328134714.205342-1-ardb@kernel.org> <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com> <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
 <061d892d-7a16-774a-4b50-b09055040ae2@nvidia.com> <CAMj1kXGMZR4+eyuG=-7bOLxzvs7Mhv4J4B-7kerdXKZxzON2ag@mail.gmail.com>
 <fe5ed99e-955e-d22a-0f78-d83c82cab66d@nvidia.com>
In-Reply-To: <fe5ed99e-955e-d22a-0f78-d83c82cab66d@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 7 Jun 2022 16:39:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE_MzrnnWLgCVy0Su=_TgMyGV_WnbSgd-eBijboBPQp-Q@mail.gmail.com>
Message-ID: <CAMj1kXE_MzrnnWLgCVy0Su=_TgMyGV_WnbSgd-eBijboBPQp-Q@mail.gmail.com>
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

On Tue, 7 Jun 2022 at 16:35, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 07/06/2022 15:32, Ard Biesheuvel wrote:
> > On Tue, 7 Jun 2022 at 16:30, Jon Hunter <jonathanh@nvidia.com> wrote:
> >>
> >>
> >> On 24/05/2022 18:03, Russell King (Oracle) wrote:
> >>> On Tue, May 24, 2022 at 03:50:17PM +0100, Jon Hunter wrote:
> >>>> Hi Ard,
> >>>>
> >>>> On 28/03/2022 14:47, Ard Biesheuvel wrote:
> >>>>> The Spectre-BHB mitigations were inadvertently left disabled for
> >>>>> Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
> >>>>> that case. So fix that.
> >>>>>
> >>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>> ---
> >>>>>     arch/arm/mm/proc-v7-bugs.c | 1 +
> >>>>>     1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
> >>>>> index 06dbfb968182..fb9f3eb6bf48 100644
> >>>>> --- a/arch/arm/mm/proc-v7-bugs.c
> >>>>> +++ b/arch/arm/mm/proc-v7-bugs.c
> >>>>> @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
> >>>>>     {
> >>>>>      if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
> >>>>>              cpu_v7_spectre_v2_init();
> >>>>> +   cpu_v7_spectre_bhb_init();
> >>>>>     }
> >>>>>     void cpu_v7_bugs_init(void)
> >>>>
> >>>>
> >>>> Since this patch has been merged, I am seeing a ton of messages when booting
> >>>> Linux on tegra124-jetson-tk1 ...
> >>>>
> >>>> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
> >>>> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
> >>>> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
> >>>
> >>> Now that you mention this, I vaguely remember some email on the list a
> >>> while ago about this being caused by something like cpuidle - but I'm
> >>> unable to find it now.
> >>>
> >>>> [0] https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/
> >>>
> >>> That was probably it.
> >>>
> >>> We can't really do this for the other print, because the system status
> >>> can change as a result of CPUs being brought online. :(
> >>>
> >>
> >> Does it make sense to only print the message if/when the method changes
> >> as opposed to every time the CPUs are brought online? That way, there
> >> would still be at least one print showing the current method. I believe
> >> that is what Ard had proposed.
> >>
> >
> > A fix for this issue is already in linux-next:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bafa10435c4f34f4b9bda8fc7ee6e4330ebca3ea
>
>
> Ah wonderful! Sorry I had missed that. Once merged can we pull into
> stable as well?
>

Yes. It has a fixes: tag so it will most likely get picked up
automatically, but feel free to remind the -stable maintainers once
this patch is merged by Linus.
