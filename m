Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CDCC433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 23:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAA0D64FCA
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 23:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhBEXUU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 18:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhBEKHA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 05:07:00 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F49C06178B
        for <linux-tegra@vger.kernel.org>; Fri,  5 Feb 2021 02:06:18 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id r2so6155485ybk.11
        for <linux-tegra@vger.kernel.org>; Fri, 05 Feb 2021 02:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qlca0su+U02LsbC3LLD1AYGrfUlPzDaezLX5AMYp+eo=;
        b=GlB8KK/AC8pgbczI0FcWoM7bJ5I+52mIFSdzFSd2Vp/n9A4AAg0PL8npODANtmmWeO
         Wp8+EGrJW8RX9/K66tcc74TJJBZYWiZBVxalvlbwTOyHjCnoYrkXQSyszVBfN3wfuvg0
         0iXcbwp475fdB6w/4sLRAqMVajtGPgAVQ968qn1mQtbjC2ZdKyRdYS60f1uldjebwwbD
         RVDVqX8hmVeB8ecWq9QyN43MCPAbkWRW+G21hQU6zR2d6mAh3s2vUST9QTs+YZRjC3CE
         Qq2xGMxZXJaEphn6UgVzAasrYoEcTxO9EoGv0cNqh1xr53kIdq88H0KQaSI23X0CpM41
         sJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qlca0su+U02LsbC3LLD1AYGrfUlPzDaezLX5AMYp+eo=;
        b=KB3oAjVsGwhMKwhfAQzuq3H1mX0h32o1bWBQMkN338xy7swcwoMzgyiGjKw88h1hcH
         KsriuSKq9jBtv+PjKd4swg54sRedbyjHByA/TjLtqoXoe6DbNO+u13yVX1tk6pDu5Ywj
         4zgWvmFDv8aP5mKsOGwtvZjPa2/Ke6UFA9bnrMJIOmwSmQIhf4BZAxGQ5niFE7TsXyzw
         ngtu/7RqDnhBXvGOt/Wdor4u9GoRHGpIP4tUkCT39OrAavKYwcYS28Cggr/kPxZFtPXC
         P2bFOriRPE+T1vJRv/neWkXA7VKECfqRt3/DQGXqsnInXlBUiQh/xht0Wa2UQi1+srxK
         8K0Q==
X-Gm-Message-State: AOAM530AV326g6ifIyktxLdPcaayoa6WoGwHEvEKHFWR/lQSYMkSYyNn
        3REc69QsWwIdD4pea7+3Ow8G2jsB4WwFyByII1MiGQ==
X-Google-Smtp-Source: ABdhPJyW8GfWJvznKAIv9fkh9s+dgE5JsOR2n/TnXb5uyNuJ1xs1XK3M+JJN8pdzVpQtHnvoezuJsF3m6mBiZ2M8aJI=
X-Received: by 2002:a25:f8a:: with SMTP id 132mr4973807ybp.228.1612519577059;
 Fri, 05 Feb 2021 02:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <CGME20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c@eucas1p2.samsung.com>
 <20210121225712.1118239-3-saravanak@google.com> <9692dfc9-4c63-71c9-b52b-d0feba466695@samsung.com>
 <CAGETcx_KDA55Ti=5CHw48BP1L2Xo64=AFFe+17g27n=P-KUrow@mail.gmail.com>
 <6b606a5d-0435-1e9d-ac61-a8dacf051067@samsung.com> <CAMuHMdWqZonpeyk59b=o_3EKOQx4TxUZE4Jeo-Kxy_o_3CQvnQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWqZonpeyk59b=o_3EKOQx4TxUZE4Jeo-Kxy_o_3CQvnQ@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 5 Feb 2021 02:05:41 -0800
Message-ID: <CAGETcx9Rqa7PygjSiQvadm7C2bpxS2rCf5oB_pFhjh+ESV-WQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Feb 5, 2021 at 12:06 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Marek,
>
> On Fri, Feb 5, 2021 at 8:38 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > On 04.02.2021 22:31, Saravana Kannan wrote:
> > > On Thu, Feb 4, 2021 at 3:52 AM Marek Szyprowski
> > > <m.szyprowski@samsung.com> wrote:
> > >> On 21.01.2021 23:57, Saravana Kannan wrote:
> > >>> This allows fw_devlink to create device links between consumers of an
> > >>> interrupt and the supplier of the interrupt.
> > >>>
> > >>> Cc: Marc Zyngier <maz@kernel.org>
> > >>> Cc: Kevin Hilman <khilman@baylibre.com>
> > >>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >>> Reviewed-by: Rob Herring <robh@kernel.org>
> > >>> Reviewed-by: Thierry Reding <treding@nvidia.com>
> > >>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > >> This patch landed some time ago in linux-next as commit 4104ca776ba3
> > >> ("of: property: Add fw_devlink support for interrupts"). It breaks MMC
> > >> host controller operation on ARM Juno R1 board (the mmci@50000 device
> > >> defined in arch/arm64/boot/dts/arm/juno-motherboard.dtsi). I didn't
> > > I grepped around and it looks like the final board file is this or
> > > whatever includes it?
> > > arch/arm64/boot/dts/arm/juno-base.dtsi
> > The final board file is arch/arm64/boot/dts/arm/juno-r1.dts
> > > This patch just finds the interrupt-parent and then tries to use that
> > > as a supplier if "interrupts" property is listed. But the only
> > > interrupt parent I can see is:
> > >          gic: interrupt-controller@2c010000 {
> > >                  compatible = "arm,gic-400", "arm,cortex-a15-gic";
> > >
> > > And the driver uses IRQCHIP_DECLARE() and hence should be pretty much
> > > a NOP since those suppliers are never devices and are ignored.
> > > $ git grep "arm,gic-400" -- drivers/
> > > drivers/irqchip/irq-gic.c:IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
> > >
> > > This doesn't make any sense. Am I looking at the right files? Am I
> > > missing something?
> >
> > Okay, I've added displaying a list of deferred devices when mounting
> > rootfs fails and got following items:
> >
> > Deferred devices:
> > 18000000.ethernet        platform: probe deferral - supplier
> > bus@8000000:motherboard-bus not ready
> > 1c050000.mmci    amba: probe deferral - supplier
> > bus@8000000:motherboard-bus not ready
> > 1c1d0000.gpio    amba: probe deferral - supplier
> > bus@8000000:motherboard-bus not ready
> > 2b600000.iommu   platform: probe deferral - wait for supplier
> > scpi-power-domains
> > 7ff50000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> > 7ff60000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> > 1c060000.kmi     amba: probe deferral - supplier
> > bus@8000000:motherboard-bus not ready
> > 1c070000.kmi     amba: probe deferral - supplier
> > bus@8000000:motherboard-bus not ready
> > 1c170000.rtc     amba: probe deferral - supplier
> > bus@8000000:motherboard-bus not ready
> > 1c0f0000.wdt     amba: probe deferral - supplier
> > bus@8000000:motherboard-bus not ready
> > gpio-keys
> > Kernel panic - not syncing: VFS: Unable to mount root fs on
> > unknown-block(0,0)
> >
> > I don't see the 'bus@8000000:motherboard-bus' on the deferred devices
> > list, so it looks that device core added a link to something that is not
> > a platform device...

Probe deferred devices (even platform devices) not showing up in that
list is not unusual. That's because devices end up on that list only
after a driver for them is matched and then it fails.

>
> Lemme guess: bus@8000000 is a simple bus, but it has an
> interrupt-map, and the devlink code doesn't follow the mapping?
>

No, what's happening is that (and this is something I just learned)
that if a parent has an "#interrupt-cells" property, it becomes your
interrupt parent. In this case, the motherboard-bus (still a platform
device) is the parent, but it never probes (because it's simple-bus
and "arm,vexpress,v2p-p1"). But it becomes the interrupt parent. And
this mmci device is marked as a consumer of this bus (while still a
grand-child). Yeah, I'm working on patches (multiple rewrites) to take
care of cases like this.

-Saravana
