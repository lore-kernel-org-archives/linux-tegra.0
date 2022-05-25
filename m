Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C966C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 25 May 2022 07:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiEYHJ7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 May 2022 03:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiEYHJ6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 May 2022 03:09:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BCBB08
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 00:09:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DE0CB81CA2
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 07:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509A9C34117
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653462594;
        bh=aKKLMsRFRutlhBZplh9GI8Z0CfmgAYgGcWTCe50XcZA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n3dOIDk1/oI9/6bPc+XVgAm7UTvZOMWKESxxU7SyG/fIdtx9eC9qmYMKIVr6xyGYD
         RQ3kIJUb6QQV/tmLgg5KW6sr/kd1IdTij7LzCWTfUN1gl2LRW5XaFWUHUUJckGvH4s
         4NSJ/1CQ6jq5ehEjULZFO3ib8UkxwsY8G7LQwfnjlOXZZzPakMKz7Qfkp3iZtk04Mu
         fNFM3DRr2eju4nv9Ph+fBudIwrq4BzWcOAS8nxY4jEluL11zbcXMkpcFkDD5mspQrC
         Ay6C4zZiy/Db/LxiTR8cDGtANTQ0zwaCCdvjJBuY0THzJ5NoEyDJR7mTl/DRVTOi/x
         vcOJmpU9K/UMQ==
Received: by mail-oi1-f177.google.com with SMTP id t144so20848902oie.7
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 00:09:54 -0700 (PDT)
X-Gm-Message-State: AOAM531+JdOQqaMdrIq+OHBPzjYW8riZeZZbyNmwjdzVOTnEZiqRBtwc
        qt+w7iYOMJJGSKVEFDjo4f4C7FBUeXunnkkC2wU=
X-Google-Smtp-Source: ABdhPJwF+zbGHLjdWP776ahr3lIKwA3hykP1B1NwTOLc/S+TUn1WMrizJlo8TfFyewfoxsRl5px5froN8vsMUvQeLvo=
X-Received: by 2002:a05:6808:1314:b0:326:e438:d8cd with SMTP id
 y20-20020a056808131400b00326e438d8cdmr4755699oiv.228.1653462593429; Wed, 25
 May 2022 00:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220328134714.205342-1-ardb@kernel.org> <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com> <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
 <b7f9d04b-db90-4dc2-4a52-7e637dc7a2ad@nvidia.com>
In-Reply-To: <b7f9d04b-db90-4dc2-4a52-7e637dc7a2ad@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 25 May 2022 09:09:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFPwRkMu9Lc=vSyPwYMnMXNmv3LdHsSMfZk56m8cAJzMQ@mail.gmail.com>
Message-ID: <CAMj1kXFPwRkMu9Lc=vSyPwYMnMXNmv3LdHsSMfZk56m8cAJzMQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 May 2022 at 19:49, Jon Hunter <jonathanh@nvidia.com> wrote:
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
>
>
> I am seeing ...
>
> [    4.415167] CPU0: Spectre BHB: using loop workaround
> [    4.417621] [<c01109a0>] (unwind_backtrace) from [<c010b7ac>] (show_stack+0x10/0x14)
> [    4.430291] [<c010b7ac>] (show_stack) from [<c09c2b38>] (dump_stack+0xc0/0xd4)
> [    4.437512] [<c09c2b38>] (dump_stack) from [<c011a6c8>] (cpu_v7_spectre_bhb_init+0xd8/0x190)
> [    4.445943] [<c011a6c8>] (cpu_v7_spectre_bhb_init) from [<c010dee8>] (cpu_suspend+0xac/0xc8)
> [    4.454377] [<c010dee8>] (cpu_suspend) from [<c011e7e4>] (tegra114_idle_power_down+0x74/0x78)
> [    4.462898] [<c011e7e4>] (tegra114_idle_power_down) from [<c06d3b44>] (cpuidle_enter_state+0x130/0x524)
> [    4.472286] [<c06d3b44>] (cpuidle_enter_state) from [<c0164a30>] (do_idle+0x1b0/0x200)
> [    4.480199] [<c0164a30>] (do_idle) from [<c0164d28>] (cpu_startup_entry+0x18/0x1c)
> [    4.487762] [<c0164d28>] (cpu_startup_entry) from [<801018cc>] (0x801018cc)
>
>
> So definitely CPU idle.
>
> > We can't really do this for the other print, because the system status
> > can change as a result of CPUs being brought online. :(
>
>
> How about making this a pr_debug as opposed to pr_info?
>

We should pull the pr_info() into the conditional so that it only
executes the first time around:

--- a/arch/arm/mm/proc-v7-bugs.c
+++ b/arch/arm/mm/proc-v7-bugs.c
@@ -209,10 +209,10 @@ static int spectre_bhb_install_workaround(int method)
                        return SPECTRE_VULNERABLE;

                spectre_bhb_method = method;
-       }

-       pr_info("CPU%u: Spectre BHB: using %s workaround\n",
-               smp_processor_id(), spectre_bhb_method_name(method));
+               pr_info("CPU%u: Spectre BHB: using %s workaround\n",
+                       smp_processor_id(), spectre_bhb_method_name(method));
+       }

        return SPECTRE_MITIGATED;
 }

If you can confirm that this fixes the issue, I can send it out as a
proper patch.
