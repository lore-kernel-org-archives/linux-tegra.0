Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15EBC433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 21:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 676FF64FAD
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Feb 2021 21:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhBDVce (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Feb 2021 16:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhBDVca (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Feb 2021 16:32:30 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AE5C061786
        for <linux-tegra@vger.kernel.org>; Thu,  4 Feb 2021 13:31:50 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id k4so4670198ybp.6
        for <linux-tegra@vger.kernel.org>; Thu, 04 Feb 2021 13:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=29BoGNlBSuRptp75qdFu7EtcEjyZvsuV2W9BZnedNiw=;
        b=m7JhjKA5LR57ijKi9WJBvdVcUt8vGEfUDLk1uoFrZoPnHCr4eWh1SKKac2ygEQBFVC
         2qvmKOu3CcpqsHl7+roCbgqgdQWOrewROlxxDAtknEB8iggJidNsgfxaivb90APnN9wv
         0h0+zbwPFSal3i2jtZP0PilXVsEgBOx7DmwwAmJIci6gnYls7ICevMnfnpvKxYhTrZoH
         TjUOKIqeZ+XTHGWwT7Lcytkhpi8tkMNJoS360hisK3n0o8tuIyTaFkrctKNBJAxA1VJk
         0bDISpotUj6pO/5XTpO3UOC5rprKrCVZkGBj0T4HtHYQaxOa9A8XKXbZhyd9r1ybG9nm
         AP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=29BoGNlBSuRptp75qdFu7EtcEjyZvsuV2W9BZnedNiw=;
        b=e9gm1LG3nY840zcPLKevW1wqibYwNgHNAGI7fEddMRS8h75ehR0tSp63C6kSUo35Hg
         WSNOvXfajnv644vr8gcNMQMkvZfi0qq7DkymkKMqJ3IUOWvjb1lL7MeX7N3ppc6c4itv
         zp8LvEnxWtE+LZMBgd471tgiu5tBeduw9w9Ic2uehtNZS2P1k+FI7d+EW582li0+/bH2
         vktmJ3J69vq4BUS+lQXjeLmrDychljU0F5GGfaI0oPJx/MJP5Lb2ug/4zp7Y7A69a+Rp
         RsfOzhzG9dymXxnLCtWZwoE8BhhedkjX/D3M6jWUY8gvhnPrUsZ3iGGmznG3JSaLAlqb
         KwhQ==
X-Gm-Message-State: AOAM533TYgTyQAdt8/77q5TuzfdwJ0tUli0xE8DG5ObOss63ndFeLFNC
        8O8xxD7c7f7I2nCmxdWNLoAmunUSPddiotTg0qJqqw==
X-Google-Smtp-Source: ABdhPJzXo+2QfAAZsWBIWdDQJqEUS/VFWFs+8oVZFxPhskYIqgK0ZJ38GKKtHrSVeSIg0cb1D3Jg1FOxNRw1AGpG7/w=
X-Received: by 2002:a25:b74c:: with SMTP id e12mr2004516ybm.20.1612474309232;
 Thu, 04 Feb 2021 13:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <CGME20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c@eucas1p2.samsung.com>
 <20210121225712.1118239-3-saravanak@google.com> <9692dfc9-4c63-71c9-b52b-d0feba466695@samsung.com>
In-Reply-To: <9692dfc9-4c63-71c9-b52b-d0feba466695@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 4 Feb 2021 13:31:13 -0800
Message-ID: <CAGETcx_KDA55Ti=5CHw48BP1L2Xo64=AFFe+17g27n=P-KUrow@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Thu, Feb 4, 2021 at 3:52 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Saravana,
>
> On 21.01.2021 23:57, Saravana Kannan wrote:
> > This allows fw_devlink to create device links between consumers of an
> > interrupt and the supplier of the interrupt.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> This patch landed some time ago in linux-next as commit 4104ca776ba3
> ("of: property: Add fw_devlink support for interrupts"). It breaks MMC
> host controller operation on ARM Juno R1 board (the mmci@50000 device
> defined in arch/arm64/boot/dts/arm/juno-motherboard.dtsi). I didn't

I grepped around and it looks like the final board file is this or
whatever includes it?
arch/arm64/boot/dts/arm/juno-base.dtsi

This patch just finds the interrupt-parent and then tries to use that
as a supplier if "interrupts" property is listed. But the only
interrupt parent I can see is:
        gic: interrupt-controller@2c010000 {
                compatible = "arm,gic-400", "arm,cortex-a15-gic";

And the driver uses IRQCHIP_DECLARE() and hence should be pretty much
a NOP since those suppliers are never devices and are ignored.
$ git grep "arm,gic-400" -- drivers/
drivers/irqchip/irq-gic.c:IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);

This doesn't make any sense. Am I looking at the right files? Am I
missing something?

-Saravana
