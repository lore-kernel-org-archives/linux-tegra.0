Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2871AC433E0
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jan 2021 10:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA0E622CA2
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jan 2021 10:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbhAFK75 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Jan 2021 05:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbhAFK75 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jan 2021 05:59:57 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3996C06134C
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jan 2021 02:59:16 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id lt17so4507764ejb.3
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jan 2021 02:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BWlXC8BKh3+3Bf8ABIpEApZGEjbSGt1OiJ8+9qOElDc=;
        b=zOmew6x2ZlKTmlzIVqwS1pcjwTh4Q/9TFnuqzgM4uKEiBk+w9FFvoWvQmMNGE7yXDK
         O3QapFHHWHlAXMAGqttPSaU75GZta3YnC1+k0w4gAxpKd5kmMAEk4jrSE4wO1LwpPl+o
         vKr8OjtdGLffWrsCCzlyXpuXqY0jaHHsgZXGNsXHPM9mqOD+P7roi0Xpn1ulyqOZDYgi
         AU17Qu+HN9YVc3jNv1CkmdugvOzT4jnMPchUCwjhv/hm2C0rB6flyfPM+RHEQStwf6UG
         2pz77HxsldXqq5DDVHesDMy9Kd3MlESF42RUR6/pvwLWfgs46zdX4VcDu6hH/iKCvpup
         cwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BWlXC8BKh3+3Bf8ABIpEApZGEjbSGt1OiJ8+9qOElDc=;
        b=CXw9E25+QrD9+Qw9gx72UWIm8gK10ovVNjiyWbSBxENAoCENUhjBNexpxOuHQ2lnhg
         9g/WAWbEwXyg+1RoFq41fXcjpYRx0KFIkab4b8soc3tfR3lyiCNOKEVnqIZiT4oIn57m
         AfnvIhguzAI8TA9HPl2HIoJWptghdmjF73/TFo30Yw2202POP1WZ946K8u/DlVeeAkvP
         ES+dm9GqgQTQ1BR0GUdY+YPaidiHfK7t9zhZDTnRA8zDrw6PyziMJmBYbuql64Q6eKnY
         Eh7enc79BeS2OJUck5mc1cKkC2B3DDOOqEv4F4K0cJaKliwhfOLmsATHtr/0l5bvdz35
         0yHQ==
X-Gm-Message-State: AOAM532TStv8ooPE9f7CMh4U7AnTxjyMKrOGIhr8AIkpSKC9p2kd3ePA
        iofv3IKPDm0pyFlKeLP4wHuT/x+VUW+/onOGgF0GBA==
X-Google-Smtp-Source: ABdhPJxVX0BETaULoe3F/yF8NkEDm2PKPRl8Y0HNy9lmSf+rq0gc/lGchEhWtjWAw7gf1ZxEqJhwqkUGoHg2vtD+dYE=
X-Received: by 2002:a17:906:3953:: with SMTP id g19mr2415252eje.429.1609930755657;
 Wed, 06 Jan 2021 02:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20201127140852.123192-1-thierry.reding@gmail.com>
 <20201127140852.123192-3-thierry.reding@gmail.com> <CACRpkdZ3Krgsjyc3-NU0pmYkzFPue_-1VWqkdNvxoG2c6OF7aQ@mail.gmail.com>
 <X9zBeEDO8uTOCyxw@ulmo>
In-Reply-To: <X9zBeEDO8uTOCyxw@ulmo>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Jan 2021 11:59:04 +0100
Message-ID: <CAMpxmJUyX_6FJ_04N-XXoJKJp-N_Ui0j7jg0=bp04F-ns6zk0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra: Convert to gpio_irq_chip
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Dec 18, 2020 at 3:49 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> >
> > I don't quite get this. This makes sense if there is one parent IRQ
> > per interrupt, but if one of the users of a GPIO in a bank sets the
> > IRQ type to edge and then another one comes in and set another
> > of the lines to level and then the function comes here, what type
> > gets set on the parent? Whichever comes last?
> >
> > Normally with banked GPIOs collecting several lines in a cascaded
> > fashion, the GPIO out of the bank toward the GIC is level triggered.
> >
> > I don't understand how this GPIO controller can be hierarchical,
> > it looks cascaded by the definition of the document
> > Documentation/driver-api/gpio/driver.rst
>
> This is basically the same implementation that we've used in the
> gpio-tegra186 driver. The goal here is to support wake events, which are
> a mechanism for the PMC (which, among other things control wakeup of the
> CPU complex from sleep). Wake events are a somewhat non-trivial concept
> and I keep second-guessing this myself everytime I look at it...
>
> So basically with these wake events we have a selected number of GPIOs
> that are routed to the PMC and which can wake the system from sleep. To
> make this work, the PMC IRQ domain becomes the parent of the GPIO IRQ
> domain, so what we're forwarding the ->set_type() and ->set_wake()
> operations to here is the PMC parent, rather than the parent IRQs which
> are, I suppose, somewhat unfortunately named for this particular use-
> case.
>
> I suppose given the definition in the documentation the GPIO controller
> is both hierarchical (it's a child of the PMC IRQ domain) and cascaded
> (sets of GPIOs routed to a number of "parent" interrupts).
>
> What usually helps me in understanding this better is to look at GPIO
> and IRQ functionality as separate things. The GPIO controller is
> cascaded from the point of view of the GPIOs and how the Linux virtual
> interrupts are mapped to physical interrupts. On the other hand the GPIO
> controller is hierarchical from an IRQ domain point of view because some
> of the GPIO interrupts also have a parent interrupt in the PMC.
>
> I hope that clarifies things a little bit. More specifically the
> irq_chip_set_type_parent() isn't actually going to cause the type to be
> set on the cascaded interrupts that go to the GIC, but on the parent
> interrupts within the PMC (i.e. the wake events) which have separate
> registers to program the type and wake enables.
>
> Note that because not all GPIOs may have a corresponding wake event
> (i.e. no parent, hierarchically speaking) that's also why we first
> check for data->parent_data. See this email thread for a bit more
> background information from Marc, who added proper support for this
> recently:
>

It's clear to me that I need to finally educate myself more on
hierarchical IRQs. I don't want to block this patch though until that
happens. I trust that Thierry knows what he's doing here and so I've
applied it for next.

Bart
