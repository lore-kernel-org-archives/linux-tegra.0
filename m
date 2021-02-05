Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24531C433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 10:23:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C720D64E56
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 10:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhBEKX1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 05:23:27 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:42929 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhBEKVT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 05:21:19 -0500
Received: by mail-ot1-f53.google.com with SMTP id f6so6371557ots.9;
        Fri, 05 Feb 2021 02:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3RF2C/PA6a6ba6a9kvICkFlC1q6hnsnECE3kSeEdlo=;
        b=HJFofwczRVQAvLnj9wcxvk5wu3JM879AeQV1XQ9cArUXMFMukGQYp1hALPhmM/XgeD
         heaw8uCO88gni6htNwpAxIrrW7oXGIEO1ts6lWx8MrHmpgIK1IHXYb8FKNjwtwoTUHyT
         b7u5dG3Dyy9DFSJu7lyHyRXGuN6U+PTNcFcTYeENGglMLWZWClryWV1e/Y8vtWNDVg6F
         t8S7MG0Sdf87srY44mb1YyX/p/+TS1/0ZDFhNQlKxRuo+GLhufRTwArRTTN66UpwPWUc
         z/MuOl2iB0Y0UJdGJoap+CPYf74g9OPJVAmf1FvRHuNwseMkNsKBGqkAhag1eyE2hinM
         PujA==
X-Gm-Message-State: AOAM531Xi8g9KGTnREZahRG1aOKNm1SMlAlkDvlk9n0ECkpDfkNEh+3V
        1/Lkip2NE1Xgnb3985VZ6HbYhK0ht7Jhm9WKGrw=
X-Google-Smtp-Source: ABdhPJxaAzP865Vmnvr1fq9k8jVK1cEEm2Qir3RiFDzwCxIrZEbUN97VUFhB9QV4+y8tU2656HDzFkvuQjfME2sklqE=
X-Received: by 2002:a9d:3604:: with SMTP id w4mr2857988otb.107.1612520437777;
 Fri, 05 Feb 2021 02:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <CGME20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c@eucas1p2.samsung.com>
 <20210121225712.1118239-3-saravanak@google.com> <9692dfc9-4c63-71c9-b52b-d0feba466695@samsung.com>
 <CAGETcx_KDA55Ti=5CHw48BP1L2Xo64=AFFe+17g27n=P-KUrow@mail.gmail.com>
 <6b606a5d-0435-1e9d-ac61-a8dacf051067@samsung.com> <CAMuHMdWqZonpeyk59b=o_3EKOQx4TxUZE4Jeo-Kxy_o_3CQvnQ@mail.gmail.com>
 <CAGETcx9Rqa7PygjSiQvadm7C2bpxS2rCf5oB_pFhjh+ESV-WQA@mail.gmail.com>
In-Reply-To: <CAGETcx9Rqa7PygjSiQvadm7C2bpxS2rCf5oB_pFhjh+ESV-WQA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Feb 2021 11:20:26 +0100
Message-ID: <CAMuHMdUt4tSEO_Hcf4AgVY_jqZ6Bsyk2+f2P3gQRQk0UfgSSjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Saravana Kannan <saravanak@google.com>
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

Hi Saravana,

On Fri, Feb 5, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
> On Fri, Feb 5, 2021 at 12:06 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Feb 5, 2021 at 8:38 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> > > On 04.02.2021 22:31, Saravana Kannan wrote:
> > > > On Thu, Feb 4, 2021 at 3:52 AM Marek Szyprowski
> > > > <m.szyprowski@samsung.com> wrote:
> > > >> On 21.01.2021 23:57, Saravana Kannan wrote:
> > > >>> This allows fw_devlink to create device links between consumers of an
> > > >>> interrupt and the supplier of the interrupt.
> > > >>>
> > > >>> Cc: Marc Zyngier <maz@kernel.org>
> > > >>> Cc: Kevin Hilman <khilman@baylibre.com>
> > > >>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > >>> Reviewed-by: Rob Herring <robh@kernel.org>
> > > >>> Reviewed-by: Thierry Reding <treding@nvidia.com>
> > > >>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > >>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > >> This patch landed some time ago in linux-next as commit 4104ca776ba3
> > > >> ("of: property: Add fw_devlink support for interrupts"). It breaks MMC
> > > >> host controller operation on ARM Juno R1 board (the mmci@50000 device
> > > >> defined in arch/arm64/boot/dts/arm/juno-motherboard.dtsi). I didn't
> > > > I grepped around and it looks like the final board file is this or
> > > > whatever includes it?
> > > > arch/arm64/boot/dts/arm/juno-base.dtsi
> > > The final board file is arch/arm64/boot/dts/arm/juno-r1.dts
> > > > This patch just finds the interrupt-parent and then tries to use that
> > > > as a supplier if "interrupts" property is listed. But the only
> > > > interrupt parent I can see is:
> > > >          gic: interrupt-controller@2c010000 {
> > > >                  compatible = "arm,gic-400", "arm,cortex-a15-gic";
> > > >
> > > > And the driver uses IRQCHIP_DECLARE() and hence should be pretty much
> > > > a NOP since those suppliers are never devices and are ignored.
> > > > $ git grep "arm,gic-400" -- drivers/
> > > > drivers/irqchip/irq-gic.c:IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
> > > >
> > > > This doesn't make any sense. Am I looking at the right files? Am I
> > > > missing something?
> > >
> > > Okay, I've added displaying a list of deferred devices when mounting
> > > rootfs fails and got following items:
> > >
> > > Deferred devices:
> > > 18000000.ethernet        platform: probe deferral - supplier
> > > bus@8000000:motherboard-bus not ready
> > > 1c050000.mmci    amba: probe deferral - supplier
> > > bus@8000000:motherboard-bus not ready
> > > 1c1d0000.gpio    amba: probe deferral - supplier
> > > bus@8000000:motherboard-bus not ready
> > > 2b600000.iommu   platform: probe deferral - wait for supplier
> > > scpi-power-domains
> > > 7ff50000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> > > 7ff60000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> > > 1c060000.kmi     amba: probe deferral - supplier
> > > bus@8000000:motherboard-bus not ready
> > > 1c070000.kmi     amba: probe deferral - supplier
> > > bus@8000000:motherboard-bus not ready
> > > 1c170000.rtc     amba: probe deferral - supplier
> > > bus@8000000:motherboard-bus not ready
> > > 1c0f0000.wdt     amba: probe deferral - supplier
> > > bus@8000000:motherboard-bus not ready
> > > gpio-keys
> > > Kernel panic - not syncing: VFS: Unable to mount root fs on
> > > unknown-block(0,0)
> > >
> > > I don't see the 'bus@8000000:motherboard-bus' on the deferred devices
> > > list, so it looks that device core added a link to something that is not
> > > a platform device...
>
> Probe deferred devices (even platform devices) not showing up in that
> list is not unusual. That's because devices end up on that list only
> after a driver for them is matched and then it fails.
>
> > Lemme guess: bus@8000000 is a simple bus, but it has an
> > interrupt-map, and the devlink code doesn't follow the mapping?
> >
>
> No, what's happening is that (and this is something I just learned)
> that if a parent has an "#interrupt-cells" property, it becomes your
> interrupt parent. In this case, the motherboard-bus (still a platform
> device) is the parent, but it never probes (because it's simple-bus
> and "arm,vexpress,v2p-p1"). But it becomes the interrupt parent. And
> this mmci device is marked as a consumer of this bus (while still a
> grand-child). Yeah, I'm working on patches (multiple rewrites) to take
> care of cases like this.

One more reason to scrap the different handling of "simple-bus" and
"simple-pm-bus", and use drivers/bus/simple-pm-bus.c, which is a
platform device driver, for both? (like I originally intended ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
