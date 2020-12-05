Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7D8C433FE
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Dec 2020 21:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11C292310B
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Dec 2020 21:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgLEVeY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Dec 2020 16:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgLEVeX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Dec 2020 16:34:23 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C57EC0613D1
        for <linux-tegra@vger.kernel.org>; Sat,  5 Dec 2020 13:33:37 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id s9so10677901ljo.11
        for <linux-tegra@vger.kernel.org>; Sat, 05 Dec 2020 13:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=44cM81jwDy3oSJ5c3tpV4IlBGDrsE7jmCYgRJXxm894=;
        b=olsBNT8OXaV/QWtQpC33sHoZgjrGOoBbg/3DZZGkM7R1HtfgTJsytlsl9xTl1LdLKj
         +X+1S8OTcdUDtaqr88DMBHhoj0jUjOoiQ0Db6/za+mN+dXxtSF12wyr1n43ePih4Ibhd
         7jizVyoP/RxPRFKwIjLd2mXYfLU7cD6QHIVj0ZpSQ/+CkjAyxmJTm7qTaHVQuCMJOWey
         mfY0R8x/hj9PS9X/JhqOHdEcbLdqzCz76tTfLW6PdEva/mb7KPKseWXh1945ToF/8T4i
         Q26YUNjB9Tg6PGIAOozjZP1hv2H6PKTllOzPUskkQc0Y9T/44hBz3zjRP5DvQO08ce8R
         X8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=44cM81jwDy3oSJ5c3tpV4IlBGDrsE7jmCYgRJXxm894=;
        b=aagImeoeR5pCNx/TPUA5phaYrZ9kcm6dWawiA1jaX+ftjtgBU+CgqcN/aaE0jKRSUN
         MReB4I+BGX8oK1iXjC7kROMu7tyaWJ8i/QwPiv+sqsL75zzutIul6ChrreZBP7nEAzoC
         Rp5fFNc8T09qY68tDfvRRBzTTgUS1Ax5SHDV/zjFRPd8DO1GvpJMg15ihwoKr2Q+D7o3
         4c9v/kImtDdTUtArdsGr6Og7NqFB+5oXzu6x2V+1zqGp5f5yELePZxCIs5QfxPDKPIUq
         nnj9t4UlWlZUVe45I8LG78lKPZYzeRI3joGQw/HAr1vbJJPfnvXedOo3Ra8ApWZMqGgO
         QigQ==
X-Gm-Message-State: AOAM533eTLVowvbXPdoQMOtsy6Z5XU72mkBwS0mT7TKt9NYErbM3reKl
        29FyMtPGKzr/AgAwtuDoEV72oOtAWlvMyj2Oeu1Amg==
X-Google-Smtp-Source: ABdhPJyS/nBnudQvrGNGdH8DXPxEfZtPNZH7bAoPMUKmttA9jwmhgIJBCwKO6CfEItZdbV5BfC4BEsqVV22asvr4nt0=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr5995158lja.283.1607204015946;
 Sat, 05 Dec 2020 13:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20201127140852.123192-1-thierry.reding@gmail.com> <20201127140852.123192-3-thierry.reding@gmail.com>
In-Reply-To: <20201127140852.123192-3-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 22:33:24 +0100
Message-ID: <CACRpkdZ3Krgsjyc3-NU0pmYkzFPue_-1VWqkdNvxoG2c6OF7aQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra: Convert to gpio_irq_chip
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 27, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Convert the Tegra GPIO driver to use the gpio_irq_chip infrastructure.
> This allows a bit of boiler plate to be removed and while at it enables
> support for hierarchical domains, which is useful to support PMC wake
> events on Tegra210 and earlier.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

The patch didn't apply to my "devel" branch for some reason
so have a look at that, seems gpio-tegra.c has some changes not
in my tree.

>  struct tegra_gpio_soc_config {
> @@ -93,12 +91,12 @@ struct tegra_gpio_soc_config {
>  struct tegra_gpio_info {
>         struct device                           *dev;
>         void __iomem                            *regs;
> -       struct irq_domain                       *irq_domain;
>         struct tegra_gpio_bank                  *bank_info;
>         const struct tegra_gpio_soc_config      *soc;
>         struct gpio_chip                        gc;
>         struct irq_chip                         ic;
>         u32                                     bank_count;
> +       unsigned int                            *irqs;

So this is hierarchical with several IRQs.

>  static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>         unsigned int gpio = d->hwirq, port = GPIO_PORT(gpio), lvl_type;
> -       struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
> -       struct tegra_gpio_info *tgi = bank->tgi;
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +       struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
> +       struct tegra_gpio_bank *bank;
>         unsigned long flags;
> -       u32 val;
>         int ret;
> +       u32 val;
> +
> +       bank = &tgi->bank_info[GPIO_BANK(d->hwirq)];

So the general idea is to look up the bank from the IRQ offset.

But...

> -       return 0;
> +       if (d->parent_data)
> +               ret = irq_chip_set_type_parent(d, type);
> +
> +       return ret;

I don't quite get this. This makes sense if there is one parent IRQ
per interrupt, but if one of the users of a GPIO in a bank sets the
IRQ type to edge and then another one comes in and set another
of the lines to level and then the function comes here, what type
gets set on the parent? Whichever comes last?

Normally with banked GPIOs collecting several lines in a cascaded
fashion, the GPIO out of the bank toward the GIC is level triggered.

I don't understand how this GPIO controller can be hierarchical,
it looks cascaded by the definition of the document
Documentation/driver-api/gpio/driver.rst

Yours,
Linus Walleij
