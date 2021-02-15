Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F5DC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 08:31:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3370664E51
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 08:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhBOIbQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Feb 2021 03:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhBOIbM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Feb 2021 03:31:12 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BBEC0613D6
        for <linux-tegra@vger.kernel.org>; Mon, 15 Feb 2021 00:30:32 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id m188so6312149yba.13
        for <linux-tegra@vger.kernel.org>; Mon, 15 Feb 2021 00:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IosKC9haWoEFEaZa0BZbxfuLVeZ+4qcWUxhFQ2haJCg=;
        b=tr6tzTp61UKCAo6zjUbgQjCWLVR9C3MkYtoPLEDgxQK21qGZhplxp/zzCQThUxX8p+
         Gx0bMuurqxbRZyRrvSGp1cP+MIEk8JVudbLZuv+BYXQXH88j27X+AZkgw8StQY3Z6Qlk
         mIMGAXMl9Bb2we03isnTNkWiO0W6DlvGr+kSYruqZ7TrJcPqpE0VckUYgQOOTk9brmt/
         9FQKLGTpYzAacgPq/VvjIWRS+i4qM5+EOh8vZHPLja69cmNxvaF5eflA5FjGL7kGhrXb
         ONNho7ShMEYHxu4yCY6My94qvl2lUHZ2l4ztBdxO/XqnnNbH39MPy1lqFQnbJJx3fvEo
         C+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IosKC9haWoEFEaZa0BZbxfuLVeZ+4qcWUxhFQ2haJCg=;
        b=Xf/+RVngbZIzB391MtMmfYcoTfRkMbM5JD3BzBcxg/ipM0LFEwcQARAn35m0V+eymd
         h3GO7Ccwr+z2llM7nmTqc9yDAaYzn+7pkpMGKILCG7DDWH+XUblCqCIbcgrg3dKEzdlH
         yech4S/0DvqCD8milsbnvt6VhdvFXv9yNSy+sIZwroS0Tike3Vtq93qicZ/8cpmrK8fQ
         KXYS54M9zjZuX0+nMLjDaw/UMlUxV+gnMUVdeG/D4y0u/jrtVKNMpwSjtimpR2syBHp9
         v7SnurI2NQG93WENCQRUYpygOISOyv6eNKrguQzlhoQyrPRmP054RAaXu3i+Kodj8Pbb
         Ocxg==
X-Gm-Message-State: AOAM531fPNsWH4+5s7Zn5LD1xopkYO7FvG2lDcUE/Ure3kDBP2+gyrjf
        8XT0k4+cncorPXMXcTmR/d5PwLBOR/JkosbIcYaJgg==
X-Google-Smtp-Source: ABdhPJzKa3jhEnQQhhwY5N+nH8GasiMlAFPRDmalbwkm6hAFH+qDOWb86TO1KQ5bewNrePhGX/XW1FbFRlLYKdO4LsI=
X-Received: by 2002:a25:3345:: with SMTP id z66mr21333926ybz.466.1613377829136;
 Mon, 15 Feb 2021 00:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <20210121225712.1118239-3-saravanak@google.com> <20210213185422.GA195733@roeck-us.net>
 <CAGETcx_RpG45Fwhty1Uj34Mv01qkH5vFv0J6jVtJgTBFQinOBA@mail.gmail.com> <a76a73e4-f7ba-4893-14b8-01d21943241a@roeck-us.net>
In-Reply-To: <a76a73e4-f7ba-4893-14b8-01d21943241a@roeck-us.net>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 15 Feb 2021 00:29:53 -0800
Message-ID: <CAGETcx9mzYbujVW8ALrNvs1FabvuUpZpChxBb0Tp8q7w+TY4=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
To:     Guenter Roeck <linux@roeck-us.net>
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

On Sun, Feb 14, 2021 at 7:58 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/14/21 1:12 PM, Saravana Kannan wrote:
> [ ... ]
> >
> > Can you please give me the following details:
> > * The DTS file for the board (not the SoC).
>
> The devicetree file extracted from the running system is attached.
> Hope it helps.

Hi Guenter,

Thanks for the DTS file and logs. That helps a lot.

Looking at the attachment and this line from the earlier email:
[   14.084606][   T11] pci 0005:01:00.0: probe deferral - wait for
supplier interrupt-controller@0

It's clear the PCI node is waiting on:
        interrupt-controller@0 {
                #address-cells = <0x00>;
                device_type = "PowerPC-Interrupt-Source-Controller";
                compatible = "ibm,opal-xive-vc\0IBM,opal-xics";
                #interrupt-cells = <0x02>;
                reg = <0x00 0x00 0x00 0x00>;
                phandle = <0x804b>;
                interrupt-controller;
        };

If I grep for "ibm,opal-xive-vc", I see only one instance of it in the
code. And that eventually ends up getting called like this:
irq_find_matching_fwspec() -> xive_irq_domain_match() -> xive_native_match()

static bool xive_native_match(struct device_node *node)
{
        return of_device_is_compatible(node, "ibm,opal-xive-vc");
}

However, when the IRQ domain are first registered, in xive_init_host()
the "np" passed in is NOT the same node that xive_native_match() would
match.
static void __init xive_init_host(struct device_node *np)
{
        xive_irq_domain = irq_domain_add_nomap(np, XIVE_MAX_IRQ,
                                               &xive_irq_domain_ops, NULL);
        if (WARN_ON(xive_irq_domain == NULL))
                return;
        irq_set_default_host(xive_irq_domain);
}

Instead, the "np" here is:
        interrupt-controller@6030203180000 {
                ibm,xive-provision-page-size = <0x10000>;
                ibm,xive-eq-sizes = <0x0c 0x10 0x15 0x18>;
                single-escalation-support;
                ibm,xive-provision-chips = <0x00>;
                ibm,xive-#priorities = <0x08>;
                compatible = "ibm,opal-xive-pe\0ibm,opal-intc";
                reg = <0x60302 0x3180000 0x00 0x10000 0x60302
0x3190000 0x00 0x10000 0x60302 0x31a0000 0x00 0x10000 0x60302
0x31b0000 0x00 0x10000>;
                phandle = <0x8051>;
        };

There are many ways to fix this, but I first want to make sure this is
a valid way to register irqdomains before trying to fix it. I just
find it weird that the node that's registered is unrelated (not a
parent/child) of the node that matches.

Marc,

Is this a valid way to register irqdomains? Just registering
interrupt-controller@6030203180000 DT node where there are multiple
interrupt controllers?

Thanks,
Saravana
