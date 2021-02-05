Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083D9C433DB
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 08:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B381264F99
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 08:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhBEIMY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 03:12:24 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:43226 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbhBEIHH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 03:07:07 -0500
Received: by mail-oo1-f49.google.com with SMTP id x19so1411722ooj.10;
        Fri, 05 Feb 2021 00:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1sbeZYAOwBKv6wE1Ckk+wE5naRJCnZ4LL+AW39A3/w=;
        b=MEMDy3CefHLQJtqvpW2KmzN64CMLgGkkPyiiFndtyX7fZPZkXJD3SpwvnjvAubFsez
         j+BlWlGN4OS87n9DJGOmoPA7u3ajKPCJvYSJMsD6xNW3QMuH2XlF8RDEGdJHlaEL9CEJ
         CUiA+YDlTO/Y4l+Czc34vGiEWPZ13vqHCuzbANYKMSEhbmfP3g3Yr5z2aaN9AiVrZM+L
         rtTRw1QZtSDUqJf+rbF3NfhMERYgF6RQTnbnYcE2WCmDesA8F/Vl9fFicXk7yTCSh59v
         MaoZG/LODDdEVd+M+rO9gAeN+K7T8/Vg2RAgrXjJLkuEaISTaLuTGWJPMRA/pbnvO5s5
         sfOA==
X-Gm-Message-State: AOAM533aKSRYcxT8dZukZoK9DmeRDMFP+EpyHU1pTahCkdr9+WXu/aSC
        xkdTfCrHcjQri4s/hOGiYtFU7ke2p5GbGCmgy8M=
X-Google-Smtp-Source: ABdhPJz46bJWsBPHyZM+AgT9VAN4FHCddLasieW1kdal/35EqalLOcrmu9pCZYE0c0KUJ5WVnwvWVR8uTRoL/Ix6xdQ=
X-Received: by 2002:a4a:96b3:: with SMTP id s48mr2624067ooi.11.1612512386119;
 Fri, 05 Feb 2021 00:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <CGME20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c@eucas1p2.samsung.com>
 <20210121225712.1118239-3-saravanak@google.com> <9692dfc9-4c63-71c9-b52b-d0feba466695@samsung.com>
 <CAGETcx_KDA55Ti=5CHw48BP1L2Xo64=AFFe+17g27n=P-KUrow@mail.gmail.com> <6b606a5d-0435-1e9d-ac61-a8dacf051067@samsung.com>
In-Reply-To: <6b606a5d-0435-1e9d-ac61-a8dacf051067@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Feb 2021 09:06:14 +0100
Message-ID: <CAMuHMdWqZonpeyk59b=o_3EKOQx4TxUZE4Jeo-Kxy_o_3CQvnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Saravana Kannan <saravanak@google.com>,
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

Hi Marek,

On Fri, Feb 5, 2021 at 8:38 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 04.02.2021 22:31, Saravana Kannan wrote:
> > On Thu, Feb 4, 2021 at 3:52 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 21.01.2021 23:57, Saravana Kannan wrote:
> >>> This allows fw_devlink to create device links between consumers of an
> >>> interrupt and the supplier of the interrupt.
> >>>
> >>> Cc: Marc Zyngier <maz@kernel.org>
> >>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>> Reviewed-by: Thierry Reding <treding@nvidia.com>
> >>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >> This patch landed some time ago in linux-next as commit 4104ca776ba3
> >> ("of: property: Add fw_devlink support for interrupts"). It breaks MMC
> >> host controller operation on ARM Juno R1 board (the mmci@50000 device
> >> defined in arch/arm64/boot/dts/arm/juno-motherboard.dtsi). I didn't
> > I grepped around and it looks like the final board file is this or
> > whatever includes it?
> > arch/arm64/boot/dts/arm/juno-base.dtsi
> The final board file is arch/arm64/boot/dts/arm/juno-r1.dts
> > This patch just finds the interrupt-parent and then tries to use that
> > as a supplier if "interrupts" property is listed. But the only
> > interrupt parent I can see is:
> >          gic: interrupt-controller@2c010000 {
> >                  compatible = "arm,gic-400", "arm,cortex-a15-gic";
> >
> > And the driver uses IRQCHIP_DECLARE() and hence should be pretty much
> > a NOP since those suppliers are never devices and are ignored.
> > $ git grep "arm,gic-400" -- drivers/
> > drivers/irqchip/irq-gic.c:IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
> >
> > This doesn't make any sense. Am I looking at the right files? Am I
> > missing something?
>
> Okay, I've added displaying a list of deferred devices when mounting
> rootfs fails and got following items:
>
> Deferred devices:
> 18000000.ethernet        platform: probe deferral - supplier
> bus@8000000:motherboard-bus not ready
> 1c050000.mmci    amba: probe deferral - supplier
> bus@8000000:motherboard-bus not ready
> 1c1d0000.gpio    amba: probe deferral - supplier
> bus@8000000:motherboard-bus not ready
> 2b600000.iommu   platform: probe deferral - wait for supplier
> scpi-power-domains
> 7ff50000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> 7ff60000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> 1c060000.kmi     amba: probe deferral - supplier
> bus@8000000:motherboard-bus not ready
> 1c070000.kmi     amba: probe deferral - supplier
> bus@8000000:motherboard-bus not ready
> 1c170000.rtc     amba: probe deferral - supplier
> bus@8000000:motherboard-bus not ready
> 1c0f0000.wdt     amba: probe deferral - supplier
> bus@8000000:motherboard-bus not ready
> gpio-keys
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
>
> I don't see the 'bus@8000000:motherboard-bus' on the deferred devices
> list, so it looks that device core added a link to something that is not
> a platform device...

Lemme guess: bus@8000000 is a simple bus, but it has an
interrupt-map, and the devlink code doesn't follow the mapping?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
