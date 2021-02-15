Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ACDC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 22:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BE5A64DFF
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 22:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhBOW0Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Feb 2021 17:26:16 -0500
Received: from mail-yb1-f174.google.com ([209.85.219.174]:41310 "EHLO
        mail-yb1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhBOW0O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Feb 2021 17:26:14 -0500
Received: by mail-yb1-f174.google.com with SMTP id m9so6532436ybk.8
        for <linux-tegra@vger.kernel.org>; Mon, 15 Feb 2021 14:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WCYjBj19j1mBgoUgFAPx3GRqxMEDCFPUmgnbsB//gL4=;
        b=oiEC2/2OMUPQ8FofQhJj5TF/v8RcIGyWdLp1COtoqmIUZpcsb99BTkmkTNjpXe/+PH
         fCiBLptsPUMudu8VwUaiAy0MkQTJesz/DpSmZKJfoQjJvTkDNPWQKpnrJOZdehsLTOQF
         CWK8lzVhk8AHmdLWFVYkzi9VxSEkwUmZffCzjJUv0PbFFPuEa3s5oTvFF4d/Nd3BrRMT
         yCYdC5SsDF82ZYxyYWLDu6FoWsqDLNn7M3FexUKFLdBgW6pJfPCd5Y4wTL5HvqvNWWfr
         n05M+aDh4i7y5RqdqnbxaF4fdVl5iZHeUFX5zdHoD3XG2mXWzWNjucMPlGOX/whAamFY
         Kx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WCYjBj19j1mBgoUgFAPx3GRqxMEDCFPUmgnbsB//gL4=;
        b=WXAW+4cf/zou4RuGWkDyjHQ5wuLGXZaDXaHws58C2yWnLQZaRn5J7yGglrSXWw5ucH
         xIAs+OVFER4ucLNh5eLvD2STy9UKkq2+UtVo8dWF14GVbFqZSmkYHZDRguiDHQPAmuIM
         ZADFwkt3FkbPtEUhMWoYT8cTdkD4UPaTjR3fWqNDUKvI+u7ieHr7UP5+oN75p9IPRKF5
         1x5BEy//0RqE1TzwKYRTgKFN2knj24PYRmvsHNf+EOFce4kt8wMiU0KW8H+KGwtqouUL
         nPHA/CIL2ongKhE6JP9+QbgRwFnMgB/jLD/zhdlssgeu3hfHSUvmvj3a4gVPepAGGoI/
         LWJQ==
X-Gm-Message-State: AOAM531irGNpkWQ7QqXt3CGuAfCYAMK10bP+cWL9UynWk8uBLurgr/fT
        l8c0QyveipSk7Uz5M2HVICRP6+kazXu5GBKjqYOj1w==
X-Google-Smtp-Source: ABdhPJzI25brqTRNPiKDbaw8zxs/3dnPSzw2CkyA2hA+yWam9mqbXj74HyGpnIFgah+oTmvic3SS4tAP2Nj47L0hJvw=
X-Received: by 2002:a25:dc94:: with SMTP id y142mr15188087ybe.346.1613427873211;
 Mon, 15 Feb 2021 14:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <20210121225712.1118239-3-saravanak@google.com> <20210213185422.GA195733@roeck-us.net>
 <CAGETcx_RpG45Fwhty1Uj34Mv01qkH5vFv0J6jVtJgTBFQinOBA@mail.gmail.com>
 <a76a73e4-f7ba-4893-14b8-01d21943241a@roeck-us.net> <CAGETcx9mzYbujVW8ALrNvs1FabvuUpZpChxBb0Tp8q7w+TY4=A@mail.gmail.com>
 <87v9atpujb.wl-maz@kernel.org>
In-Reply-To: <87v9atpujb.wl-maz@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 15 Feb 2021 14:23:57 -0800
Message-ID: <CAGETcx8msCsFnPk2SV-r2QfVDPBY2RvJQumd9RzbrFCvVUxCXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Feb 15, 2021 at 1:09 AM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Saravana,
>
> On Mon, 15 Feb 2021 08:29:53 +0000,
> Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Sun, Feb 14, 2021 at 7:58 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 2/14/21 1:12 PM, Saravana Kannan wrote:
> > > [ ... ]
> > > >
> > > > Can you please give me the following details:
> > > > * The DTS file for the board (not the SoC).
> > >
> > > The devicetree file extracted from the running system is attached.
> > > Hope it helps.
> >
> > Hi Guenter,
> >
> > Thanks for the DTS file and logs. That helps a lot.
> >
> > Looking at the attachment and this line from the earlier email:
> > [   14.084606][   T11] pci 0005:01:00.0: probe deferral - wait for
> > supplier interrupt-controller@0
> >
> > It's clear the PCI node is waiting on:
> >         interrupt-controller@0 {
> >                 #address-cells = <0x00>;
> >                 device_type = "PowerPC-Interrupt-Source-Controller";
> >                 compatible = "ibm,opal-xive-vc\0IBM,opal-xics";
> >                 #interrupt-cells = <0x02>;
> >                 reg = <0x00 0x00 0x00 0x00>;
> >                 phandle = <0x804b>;
> >                 interrupt-controller;
> >         };
> >
> > If I grep for "ibm,opal-xive-vc", I see only one instance of it in the
> > code. And that eventually ends up getting called like this:
> > irq_find_matching_fwspec() -> xive_irq_domain_match() -> xive_native_match()
> >
> > static bool xive_native_match(struct device_node *node)
> > {
> >         return of_device_is_compatible(node, "ibm,opal-xive-vc");
> > }
> >
> > However, when the IRQ domain are first registered, in xive_init_host()
> > the "np" passed in is NOT the same node that xive_native_match() would
> > match.
> > static void __init xive_init_host(struct device_node *np)
> > {
> >         xive_irq_domain = irq_domain_add_nomap(np, XIVE_MAX_IRQ,
> >                                                &xive_irq_domain_ops, NULL);
> >         if (WARN_ON(xive_irq_domain == NULL))
> >                 return;
> >         irq_set_default_host(xive_irq_domain);
> > }
> >
> > Instead, the "np" here is:
> >         interrupt-controller@6030203180000 {
> >                 ibm,xive-provision-page-size = <0x10000>;
> >                 ibm,xive-eq-sizes = <0x0c 0x10 0x15 0x18>;
> >                 single-escalation-support;
> >                 ibm,xive-provision-chips = <0x00>;
> >                 ibm,xive-#priorities = <0x08>;
> >                 compatible = "ibm,opal-xive-pe\0ibm,opal-intc";
> >                 reg = <0x60302 0x3180000 0x00 0x10000 0x60302
> > 0x3190000 0x00 0x10000 0x60302 0x31a0000 0x00 0x10000 0x60302
> > 0x31b0000 0x00 0x10000>;
> >                 phandle = <0x8051>;
> >         };
> >
> > There are many ways to fix this, but I first want to make sure this is
> > a valid way to register irqdomains before trying to fix it. I just
> > find it weird that the node that's registered is unrelated (not a
> > parent/child) of the node that matches.
> >
> > Marc,
> >
> > Is this a valid way to register irqdomains? Just registering
> > interrupt-controller@6030203180000 DT node where there are multiple
> > interrupt controllers?
>
> Absolutely.
>
> The node is only one of the many possible ways to retrieve a
> domain. In general, what you pass as the of_node/fwnode_handle can be
> anything you want. It doesn't have to represent anything in the system
> (we even create then ex-nihilo in some cases), and the match/select
> callbacks are authoritative when they exist.
>
> There is also the use of a default domain, which is used as a fallback
> when no domain is found via the normal matching procedure.
>
> PPC has established a way of dealing with domains long before ARM did,
> closer to the board files of old than what we would do today (code
> driven rather than data structure driven).
>
> Strictly mapping domains onto HW blocks is a desirable property, but
> that is all it is. That doesn't affect the very purpose of the IRQ
> domains, which is to translate numbers from one context into another.
>
> I'd be all for rationalising this, but it is pretty hard to introduce
> semantic where there is none.

Ok, I'm going to disable parsing "interrupts" for PPC. It doesn't look
like any of the irq drivers are even remotely ready to be converted to
a proper device driver anyway.

And if this continues for other properties, I'll just disable
fw_devlink for PPC entirely.

-Saravana
