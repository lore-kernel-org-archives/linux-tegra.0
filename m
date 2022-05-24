Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDF7C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 24 May 2022 09:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbiEXJ0q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 May 2022 05:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiEXJ0p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 May 2022 05:26:45 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF78FD1C
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 02:26:44 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id w18so828121ybi.12
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TvF2v3Zdj4AvC6elhsnAGyTKo72kfURW1pII2j4gt/Q=;
        b=XpzHTpvN6AmprZmrulW4mS/lY8Nyve1zMhfriFFCBRVY2hE/9QHmXRJzy8s7Gc8ET2
         OXS1sMp9MZ0vpV0wrG/c8HGO+Rr3nBmG9R5WJK4eOCAhNZ9lioFMUlC5XhP6xOa9hKUW
         MGALMYsCxHaNVg2xNoRgxWhVX4oXfryYfUeZ8lekKH8aLmzAb7xigj5rdoj+RvtKLhoA
         UJ5JvFb+pzrC6SxzjzSUBwn81XdzPlb+ZN1SJhkUiaq7cc5HK0a1ZziMgbyB0hNqAfgV
         LAMnJwsbzNgrW1mt/QDwRzHRfst7jFGePVTaQd7LpHfdwmE7Ls0rIk3ecs7yCIn+AWdR
         OPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TvF2v3Zdj4AvC6elhsnAGyTKo72kfURW1pII2j4gt/Q=;
        b=CBZPDaqsN24k/OCSDRcFABCWcSwfXZ5RMb93SeXpRVJhJ9gxP0GjU57dftKSVtC7OW
         tdoUyeol+rivLW8bQwWbfBldAvzrGHzfnm6bqI/DyI4MclD/1aBfg+FMJ3bIzcgDbPBk
         GVdCth7PEJvDNDbbV68SEkVoMsIvazXBIZW99BBEPd9De9jqWU4+5JYyPvYJK87IZL+X
         lD5+uc6TrImnum+LZqoUYWjnn0pVoaTiGNwmy2c4vIJ6zHvK4V/dwICY1vXdbAmPVkRM
         qAhoHyzpvGpZhKTXAQSp7ISRMqrZCjlJ1EL3A7NNZkDzWxhcH+83RHny5k/FKN+pjqw3
         UI/Q==
X-Gm-Message-State: AOAM530z3kQXbExTJcyQz305zcb6+T+a7FOq09/bKlu/5+eVniKBmDn5
        iDxslxBqePJaSojkfk69ccD+lZDA+WhxBgjaYNLjpw==
X-Google-Smtp-Source: ABdhPJw4F63kJFgsm1T9Z/g9blNQ0UdX3POXlsiloEufBWHlBkpks52cg5U1Nk/npdqwyeShzZavBlLqOj7LUew5nPg=
X-Received: by 2002:a25:6cd6:0:b0:64f:c489:5382 with SMTP id
 h205-20020a256cd6000000b0064fc4895382mr10539555ybc.514.1653384403397; Tue, 24
 May 2022 02:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220523174238.28942-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CACRpkda5x-O+RT-=4AU0MYgeR2j7ToH5maYGCUH5NDyx6T7CFw@mail.gmail.com> <CA+V-a8s8K0VaNunrFnW_BzPCHmi9RK887bb1tBfodbxBmGOvPg@mail.gmail.com>
In-Reply-To: <CA+V-a8s8K0VaNunrFnW_BzPCHmi9RK887bb1tBfodbxBmGOvPg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 24 May 2022 11:26:31 +0200
Message-ID: <CACRpkdbqm_DYagbtnv3m8H+woQZxLK6g9WrV+8X8PDQyrK-Gxg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to
 handle GPIO interrupt
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 24, 2022 at 11:01 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, May 24, 2022 at 9:57 AM Linus Walleij <linus.walleij@linaro.org> wrote:> >
> > On Mon, May 23, 2022 at 7:43 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > > Add IRQ domain to RZ/G2L pinctrl driver to handle GPIO interrupt.
> > >
> > > GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
> > > used as IRQ lines at a given time. Selection of pins as IRQ lines
> > > is handled by IA55 (which is the IRQC block) which sits in between the
> > > GPIO and GIC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > I don't know if I'm too tired or reading it wrong, but it seems you
> > went through the trouble of making it possible to override .free() in
> > the irqdomain in patch 3/5 and yet not using it in this patch 5/5?
> >
> I think you missed it, free callback is overridden with
> rzg2l_gpio_irq_domain_free().
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220523174238.28942-6-prabhakar.mahadev-lad.rj@bp.renesas.com/

Yeah my bad, can't read properly today :/

Why is it necessary to do this stuff in the irqdomain rather than
in the irqchip? Especially this:

+ bitmap_release_region(pctrl->tint_slot, i, get_order(1));

Since the idea with irq_domain is to translate physical (hardware) IRQs
to Linux IRQ numbers, I don't see how this is related to that.

To me it seems you have taken the usecase that is normally
in irqchip and moved it to irqdomain.

To me this seems much more like a job that needs to happen in
the irqchip .irq_enable()/.irq_disable() pair, and which we have
done before in Hans Verkuils patch series:

461c1a7d4733 gpiolib: override irq_enable/disable
4e9439ddacea gpiolib: add flag to indicate if the irq is disabled
ca620f2de153 gliolib: set hooks in gpiochip_set_irq_hooks()

This gets used by drivers such as:
drivers/media/cec/platform/cec-gpio/cec-gpio.c

Where you can see these dynamic calls:

static bool cec_gpio_enable_irq(struct cec_adapter *adap)
{
        struct cec_gpio *cec = cec_get_drvdata(adap);

        enable_irq(cec->cec_irq);
        return true;
}

static void cec_gpio_disable_irq(struct cec_adapter *adap)
{
        struct cec_gpio *cec = cec_get_drvdata(adap);

        disable_irq(cec->cec_irq);
}

Which end up calling .irq_enable()/.irq_disable() on the irq_chip
dynamically enabling/disabling the irq.

If you prefer to have this done in process context up front when
the irq is requested/released then irq_chip also have these
callbacks:

        int             (*irq_request_resources)(struct irq_data *data);
        void            (*irq_release_resources)(struct irq_data *data);

So I would think over the usecase here a bit. Why does this have
to be in the irqdomain?

Yours,
Linus Walleij
