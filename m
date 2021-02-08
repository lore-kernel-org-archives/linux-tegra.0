Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E28C433E6
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 23:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA40864E9A
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 23:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhBHX7R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Feb 2021 18:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBHX7P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Feb 2021 18:59:15 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB5DC061797
        for <linux-tegra@vger.kernel.org>; Mon,  8 Feb 2021 15:58:19 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id p193so2666979yba.4
        for <linux-tegra@vger.kernel.org>; Mon, 08 Feb 2021 15:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lzfzZMa99tyYou47Mwj80zUT6xShIhy0DCTdQpmeONY=;
        b=D+W9iv9dxMOLzV38cOBUWqeHFAdyFUAntsifLuYxuifdJrBNL+fvmNmCr+pBy+5OH+
         FLaKWl5s64QQQ38lyrP44rPLnsnHS0SJG4aB8YCAIvjDJB8ehxH/Eug3fXs1whfuED7M
         vzaFSFUkI5Z+yW2Tv2FVBAuhCBiziPsvtvbdAH8ni9iAQILynnECUU0KXKrisaKIyLjK
         YYFAoCkPmw4pVh8g6DSxnJLGgW69VkEEDAoeBaj1UHCHdF2I93DvRTlHgpmNoli+wyuU
         1+oigLqxQgxqoaojN2VgmOAatX785VoBPLzF5qfL15W73L/ZchxyY/43071lIh+FSp4p
         XyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lzfzZMa99tyYou47Mwj80zUT6xShIhy0DCTdQpmeONY=;
        b=G4E+8aO+CQQFXMX79dqvlLy5FakZcKQv2xM7nmN8LYhX538VBauTO4kqa6fdHEyZtc
         QwNSzuZAjdoLR5Nk0kBFx24sHt5Bcak+rThpt8Y+JsFwWt3T7fiMlarLSdZ52uqFIoCw
         vcOMMtFDaafa5tvGenPAOP6HQ12I/BB7wpcHO+FvSZOBDv3H9l4tk9OvsfgKyt3leNrK
         /Cg6OxkGfyI4UsbsBCY4dFVTaU45L8/K5A8vQV+jk14+Tb0vjJpOpRqVqBzjwvKqSKLo
         PPt4cHVIC1iAWseoMgLETwa6oR6SYgeLt9ASzgGdsxe5jcxg2KnpCX2fYEbJRZRjrA3P
         V59Q==
X-Gm-Message-State: AOAM532xdfyFHlQjItxomeg8czQ2feuBrqRJAl8W1oeE2zJdwpyavUAS
        4SBfZAoPjEpiib9r9VAtKVSz4gVmMMTvbdXCDxDIOQ==
X-Google-Smtp-Source: ABdhPJyAXDDajPxUin26EaZ6WYmNbnx+MV0PQk6+6hcdJXnBoS8YGggKUmEoepWIRge4HC3iY3buh8Y6znCQ6rVtX4E=
X-Received: by 2002:a25:af0b:: with SMTP id a11mr22574164ybh.228.1612828698549;
 Mon, 08 Feb 2021 15:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <CGME20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c@eucas1p2.samsung.com>
 <20210121225712.1118239-3-saravanak@google.com> <9692dfc9-4c63-71c9-b52b-d0feba466695@samsung.com>
 <CAGETcx_KDA55Ti=5CHw48BP1L2Xo64=AFFe+17g27n=P-KUrow@mail.gmail.com>
 <6b606a5d-0435-1e9d-ac61-a8dacf051067@samsung.com> <CAMuHMdWqZonpeyk59b=o_3EKOQx4TxUZE4Jeo-Kxy_o_3CQvnQ@mail.gmail.com>
 <CAGETcx9Rqa7PygjSiQvadm7C2bpxS2rCf5oB_pFhjh+ESV-WQA@mail.gmail.com>
 <CAMuHMdUt4tSEO_Hcf4AgVY_jqZ6Bsyk2+f2P3gQRQk0UfgSSjQ@mail.gmail.com>
 <CAGETcx9YN6uC3XJ_J+PLxvHBVFK-h2X3Qh+kuKDceN5XSt3ZuQ@mail.gmail.com>
 <CAMuHMdVyTOp9PU0rO+YkpzE68VtGdy-bMOwmE_PJx2fiwwpMzQ@mail.gmail.com>
 <CAGETcx93cee=aH+cOyf-xmYGSHcn6AfBHC=fOw7By6=8JzT56Q@mail.gmail.com>
 <CAGETcx8+de7RYcUZQzq4WvdK_Qq9ZsJ_SuXw4rX9EZ+sXWtu+A@mail.gmail.com> <ab39d157-a150-3f34-ec3a-047821f7c2a8@samsung.com>
In-Reply-To: <ab39d157-a150-3f34-ec3a-047821f7c2a8@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 8 Feb 2021 15:57:42 -0800
Message-ID: <CAGETcx8bK_PXZ_=O+ZG6ef8324qbaqgPNfcuLas6a9KFB_MzHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Mon, Feb 8, 2021 at 12:14 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Saravana,
>
> On 06.02.2021 05:32, Saravana Kannan wrote:
> > On Fri, Feb 5, 2021 at 9:55 AM Saravana Kannan <saravanak@google.com> wrote:
> >> On Fri, Feb 5, 2021 at 9:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>> On Fri, Feb 5, 2021 at 6:20 PM Saravana Kannan <saravanak@google.com> wrote:
> >>>> On Fri, Feb 5, 2021 at 2:20 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>>>> On Fri, Feb 5, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
> >>>>>> On Fri, Feb 5, 2021 at 12:06 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>>>>>> On Fri, Feb 5, 2021 at 8:38 AM Marek Szyprowski
> >>>>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>>>> On 04.02.2021 22:31, Saravana Kannan wrote:
> >>>>>>>>> On Thu, Feb 4, 2021 at 3:52 AM Marek Szyprowski
> >>>>>>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>>>>>> On 21.01.2021 23:57, Saravana Kannan wrote:
> >>>>>>>>>>> This allows fw_devlink to create device links between consumers of an
> >>>>>>>>>>> interrupt and the supplier of the interrupt.
> >>>>>>>>>>>
> >>>>>>>>>>> Cc: Marc Zyngier <maz@kernel.org>
> >>>>>>>>>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>>>>>>>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>>>>>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>>>>>>>>>> Reviewed-by: Thierry Reding <treding@nvidia.com>
> >>>>>>>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>>>>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>>>>>>>>> This patch landed some time ago in linux-next as commit 4104ca776ba3
> >>>>>>>>>> ("of: property: Add fw_devlink support for interrupts"). It breaks MMC
> >>>>>>>>>> host controller operation on ARM Juno R1 board (the mmci@50000 device
> >>>>>>>>>> defined in arch/arm64/boot/dts/arm/juno-motherboard.dtsi). I didn't
> >>>>>>>>> I grepped around and it looks like the final board file is this or
> >>>>>>>>> whatever includes it?
> >>>>>>>>> arch/arm64/boot/dts/arm/juno-base.dtsi
> >>>>>>>> The final board file is arch/arm64/boot/dts/arm/juno-r1.dts
> >>>>>>>>> This patch just finds the interrupt-parent and then tries to use that
> >>>>>>>>> as a supplier if "interrupts" property is listed. But the only
> >>>>>>>>> interrupt parent I can see is:
> >>>>>>>>>           gic: interrupt-controller@2c010000 {
> >>>>>>>>>                   compatible = "arm,gic-400", "arm,cortex-a15-gic";
> >>>>>>>>>
> >>>>>>>>> And the driver uses IRQCHIP_DECLARE() and hence should be pretty much
> >>>>>>>>> a NOP since those suppliers are never devices and are ignored.
> >>>>>>>>> $ git grep "arm,gic-400" -- drivers/
> >>>>>>>>> drivers/irqchip/irq-gic.c:IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
> >>>>>>>>>
> >>>>>>>>> This doesn't make any sense. Am I looking at the right files? Am I
> >>>>>>>>> missing something?
> >>>>>>>> Okay, I've added displaying a list of deferred devices when mounting
> >>>>>>>> rootfs fails and got following items:
> >>>>>>>>
> >>>>>>>> Deferred devices:
> >>>>>>>> 18000000.ethernet        platform: probe deferral - supplier
> >>>>>>>> bus@8000000:motherboard-bus not ready
> >>>>>>>> 1c050000.mmci    amba: probe deferral - supplier
> >>>>>>>> bus@8000000:motherboard-bus not ready
> >>>>>>>> 1c1d0000.gpio    amba: probe deferral - supplier
> >>>>>>>> bus@8000000:motherboard-bus not ready
> >>>>>>>> 2b600000.iommu   platform: probe deferral - wait for supplier
> >>>>>>>> scpi-power-domains
> >>>>>>>> 7ff50000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> >>>>>>>> 7ff60000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
> >>>>>>>> 1c060000.kmi     amba: probe deferral - supplier
> >>>>>>>> bus@8000000:motherboard-bus not ready
> >>>>>>>> 1c070000.kmi     amba: probe deferral - supplier
> >>>>>>>> bus@8000000:motherboard-bus not ready
> >>>>>>>> 1c170000.rtc     amba: probe deferral - supplier
> >>>>>>>> bus@8000000:motherboard-bus not ready
> >>>>>>>> 1c0f0000.wdt     amba: probe deferral - supplier
> >>>>>>>> bus@8000000:motherboard-bus not ready
> >>>>>>>> gpio-keys
> >>>>>>>> Kernel panic - not syncing: VFS: Unable to mount root fs on
> >>>>>>>> unknown-block(0,0)
> >>>>>>>>
> >>>>>>>> I don't see the 'bus@8000000:motherboard-bus' on the deferred devices
> >>>>>>>> list, so it looks that device core added a link to something that is not
> >>>>>>>> a platform device...
> >>>>>> Probe deferred devices (even platform devices) not showing up in that
> >>>>>> list is not unusual. That's because devices end up on that list only
> >>>>>> after a driver for them is matched and then it fails.
> >>>>>>
> >>>>>>> Lemme guess: bus@8000000 is a simple bus, but it has an
> >>>>>>> interrupt-map, and the devlink code doesn't follow the mapping?
> >>>>>>>
> >>>>>> No, what's happening is that (and this is something I just learned)
> >>>>>> that if a parent has an "#interrupt-cells" property, it becomes your
> >>>>>> interrupt parent. In this case, the motherboard-bus (still a platform
> >>>>>> device) is the parent, but it never probes (because it's simple-bus
> >>>>>> and "arm,vexpress,v2p-p1"). But it becomes the interrupt parent. And
> >>>>>> this mmci device is marked as a consumer of this bus (while still a
> >>>>>> grand-child). Yeah, I'm working on patches (multiple rewrites) to take
> >>>>>> care of cases like this.
> >>>>> One more reason to scrap the different handling of "simple-bus" and
> >>>>> "simple-pm-bus", and use drivers/bus/simple-pm-bus.c, which is a
> >>>>> platform device driver, for both? (like I originally intended ;-)
> >>>> I'm not sure if this will cause more issues since people are used to
> >>>> simple-bus not needing a driver. I'm afraid to open that pandora's
> >>>> box. Maybe last resort if I don't have any other options.
> >>>>
> >>>> But keeping that aside, I'm confused how interrupts are even working
> >>>> if the parent is a DT node with no driver (let alone a device). Any
> >>>> ideas on what's going on or what I'm misunderstanding?
> >>> No driver is needed, as the interrupts are just translated by the map,
> >>> and passed to another interrupt controller, which does have a driver.
> >>>
> >>> Cfr. Section 2.4.3 "Interrupt Nexus Properties" in the DeviceTree
> >>> Specification (https://protect2.fireeye.com/v1/url?k=72fff987-2d64c09f-72fe72c8-0cc47a314e9a-fd7dac11a78508f3&q=1&e=c0dbf5ca-130b-4aac-a011-447e82ca1914&u=https%3A%2F%2Fwww.devicetree.org%2F).
> >>>
> >> Yeah, I need to add interrupt-map support. Sigh. Only so many things I
> >> can fix at a time. Let me know if you want to help.
> >>
> > Marek,
> >
> > After reading the DT spec and poking at the code, I THINK this code is
> > correct. Can you give it a shot? If it works, then I can clean it up,
> > roll in interrupts-extended and send a patch.
>
> Yep, this fixes this issue. Fell free to add:
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>

Thanks! I'll send out the proper patch.

-Saravana
