Return-Path: <SRS0=26Yb=EM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39D3C4741F
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 14:31:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21A402087E
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 14:31:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lRfYqwlH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbgKFObf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Nov 2020 09:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgKFObe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Nov 2020 09:31:34 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0592C0613CF
        for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2020 06:31:31 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id k3so2200531ejj.10
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2020 06:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jO1JvdLqeiH3264lCYhj7Gy4bF9zHfZntEVAZAvsks=;
        b=lRfYqwlHmkiO4L+mrhKBCy1RCydVF0Kae5XfTywnCxqgNk+I/3qMeYsauHG0w5FBmR
         PdLJSqAmuwKnGakZbKzazDkGs1VlbE+/vqA6HTYIU2k+t1L+FGQI2xpCGRFG22V9K7ty
         2EAtn08MMb4m5QALnbsoSzjHB+I749tCBb0g5c9myKCEaD1RhOh/s4D1Cyr0ji9susAU
         ngJMq1+Coj95GQkB/QOJ9SazWWSEEM6UwZhyO0M2NR+8BQvul9jGWGp2G4CEn8JEjWrx
         V8Vn9S0Vsw1B4aw61v8UbFRxXxxB+KxJYZVmEhNjIRWfULykQgGb40pa9SYL2ojantMJ
         UCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jO1JvdLqeiH3264lCYhj7Gy4bF9zHfZntEVAZAvsks=;
        b=p7X+DU8gZiWDPnquNjr1ku06Gw75cfQ87zyGjRoCWQVB96rVZzV8JCp8v6fwv3HogC
         4P4+njA7lJWf1KMAq71KChucEWJuaP92MQAVXo5hGDxhPwAxadMYSAUONMlYMqsjm6Qy
         Cq0yLb7lQdUYWGSFMlQICWd1dONr1lvAo/ojhliFdXhYm/K/Qh45bLGbRM3ajtxUhDZ2
         nK41MB1J+UZgAXcyMNFcjI8PA92kNa9hDCItWw39Hlivz4+WT7EPDSSmJPbpU80bdHB2
         PZGoXWJh+5dlcOCEi0P9r6ffvFwaIeQKPMCEaPmX19UEOuYsqX0JwkawwTKQH7mouw7W
         HdIA==
X-Gm-Message-State: AOAM5302RB749cLIytCgpah2crbcWkk/F8e1HAczFklUhqzMyL2J8UZG
        J8eym5cGWTu0IrfQ659vDyCF40j6Mq3yPIl1VdX/+g==
X-Google-Smtp-Source: ABdhPJxteyN0q/t8Zh7XAfYNQLAzU6gV+MgbSN1UI1ZQ0Y8oOfjDV9opyYXqFQewhFn2CA8VYBwpcKz7ZTds54vTPiY=
X-Received: by 2002:a17:906:1c83:: with SMTP id g3mr2246116ejh.168.1604673090686;
 Fri, 06 Nov 2020 06:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20201104132624.17168-1-digetx@gmail.com>
In-Reply-To: <20201104132624.17168-1-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 6 Nov 2020 15:31:20 +0100
Message-ID: <CAMpxmJWwC-gqVERsUzdNH7jA5jC40fzekkFXJvagDmau1-F9QQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: tegra: Add lockdep class
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 4, 2020 at 2:26 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add lockdep class in order to fix debug warnings that are coming from a
> legit nested use of irq_set_irq_wake() by the Tegra GPIO driver.
>
>  WARNING: possible recursive locking detected
>  ...
>   (irq_set_irq_wake) from (tegra_gpio_irq_set_wake)
>   (tegra_gpio_irq_set_wake) from (irq_set_irq_wake)
>   (irq_set_irq_wake) from (brcmf_sdiod_intr_register [brcmfmac])
>  ...
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Reported-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 86568154cdb3..98fc78739ebf 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -560,6 +560,9 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
>  };
>
> +static struct lock_class_key gpio_lock_class;
> +static struct lock_class_key gpio_request_class;
> +
>  static int tegra_gpio_probe(struct platform_device *pdev)
>  {
>         struct tegra_gpio_info *tgi;
> @@ -661,6 +664,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>                 bank = &tgi->bank_info[GPIO_BANK(gpio)];
>
>                 irq_set_chip_data(irq, bank);
> +               irq_set_lockdep_class(irq, &gpio_lock_class, &gpio_request_class);
>                 irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
>         }
>
> --
> 2.27.0
>

Patch applied, thanks!

Bartosz
