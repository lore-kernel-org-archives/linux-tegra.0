Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882D8C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 14:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50AB72312E
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 14:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbhASO6f (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 09:58:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392982AbhASNAG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 08:00:06 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE1EC0613ED
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 04:52:08 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id f1so7239647edr.12
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ejq4HtAQKiBD88tnqaXHBsdxX4bqHNk2H5bixMlEZ8E=;
        b=OeUsyJeQWOtd2isUYxRj908deHZQ708lk0IJ971sXNuOtMh4beAsyrqPQ1Rbx+yA7L
         8P3ID2tH/j2ZzQicj3R4kVgUvBmRmleYRrhlHvceOWZ+tqAQsH+KA5fJBkSK05n1SE98
         31VevdUV/TSuENiY4+uK4nORTYTelgpk1PcU0hMrvk8a83+U9I512yiJ6m+xCDEIeylh
         58oUvufVYJ4Op6is0R5fRdy2rImKkg2I/1akzGa8ErVTa+OyATlW6vmm9ST71C5yxfLQ
         nZRfrWvtChY9I0dJVeuHnhZxaEp/Fo/nx6A1OHnCFRmoa8s9ioIbP1KabWJIpQSCjeYh
         YFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ejq4HtAQKiBD88tnqaXHBsdxX4bqHNk2H5bixMlEZ8E=;
        b=AG6ru65H5k3iKubWtUfynsM0PAN74xFwOOSps0rDhCAvlqPvA7l3k2B2aBGnHuNp4O
         a7fZG59YM+4Bp9yL+Z+n/tZy+sV3f+ZQl6IU9QtSdwjvEemfie3JUOr5LS3pIX+5x7jv
         LS8rSVi+V6L+qWFTiehCXUybUvQ7oGTtIiuIUymAg1y+ReGiVZ628EVgWytFfE6EgWZf
         QFmKmtpO7fS5fxGloYO8H07DNTw2w93GiLUuESEc1giuYZ0WJB+yDTPb9Qglr/vIsBb2
         ZFIDIZUp7wYbN5P9VPmiDBQx/hV4tYPJQ5vuORojAjLyr0A2u/+6Wek3KBMa1SltThl/
         DTxg==
X-Gm-Message-State: AOAM533BuIJ6dDlgj0xm2EM3PclBWjXWd7IpaWfPRMHlu1jgL4dxNVNj
        7ViKCElZI3AO8acRz98OCP33ON+xhW1l0tGxPhLhq4g5+oE=
X-Google-Smtp-Source: ABdhPJy7sFiialecB4af5tB+I59xlHlvbT8npjfBGIVtPGe2D+Fe19r/eIj2VOCc8wCkoxcyEopjRSVGWIo2hZ+dmgo=
X-Received: by 2002:aa7:d401:: with SMTP id z1mr3244360edq.213.1611060727543;
 Tue, 19 Jan 2021 04:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20210112133010.21397-1-digetx@gmail.com>
In-Reply-To: <20210112133010.21397-1-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 13:51:56 +0100
Message-ID: <CAMpxmJWMYN2M-kGXiFbBVMiOtTwbMegvCJDyVLge0Y=ZHChJEg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: tegra: Fix wake interrupt
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 12, 2021 at 2:30 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The GPIO bank wake interrupt setting was erroneously removed after
> conversion to gpio_irq_chip, thus the wake interrupt programming is
> broken now. Secondly, the wake_enb of the GPIO driver should be changed
> only after the successful toggling of the IRQ wake-state. Restore the wake
> interrupt setting and the programming order.
>
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-tegra.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index b8a4fd07c559..6c79e9d2f932 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -541,6 +541,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>         struct tegra_gpio_bank *bank;
>         unsigned int gpio = d->hwirq;
>         u32 port, bit, mask;
> +       int err;
>
>         bank = &tgi->bank_info[GPIO_BANK(d->hwirq)];
>
> @@ -548,14 +549,23 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>         bit = GPIO_BIT(gpio);
>         mask = BIT(bit);
>
> +       err = irq_set_irq_wake(tgi->irqs[bank->bank], enable);
> +       if (err)
> +               return err;
> +
> +       if (d->parent_data) {
> +               err = irq_chip_set_wake_parent(d, enable);
> +               if (err) {
> +                       irq_set_irq_wake(tgi->irqs[bank->bank], !enable);
> +                       return err;
> +               }
> +       }
> +
>         if (enable)
>                 bank->wake_enb[port] |= mask;
>         else
>                 bank->wake_enb[port] &= ~mask;
>
> -       if (d->parent_data)
> -               return irq_chip_set_wake_parent(d, enable);
> -
>         return 0;
>  }
>  #endif
> --
> 2.29.2
>

Applied, thanks!

Bartosz
