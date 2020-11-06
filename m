Return-Path: <SRS0=26Yb=EM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3DBC55178
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 14:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0903D2087E
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 14:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MJZxZb9N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgKFOcD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Nov 2020 09:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgKFOcB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Nov 2020 09:32:01 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3596BC0613D2
        for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2020 06:32:00 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id p93so1475391edd.7
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2020 06:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oB1Imkum9eDeaPIc2hKzTYzV0vCEPBOSK4bPPbyIfFo=;
        b=MJZxZb9Np7qkyYy2+/tuO+PJ7RD8i5hCMCSDVGIKwTmGEMUp8jBXPxbi+ypenl2uOX
         qJ+L1g3+lrM0rI9q1py697lLpVRpbpkvaX0ElM8ptuKvrrkiH2JpsDBGnsMgMYG1cxgj
         rf004YD74RsbNxZw9n64cR/SXbBsAMzl7nmG9y4aWGHYSDiJIASZMOZKw1AJaZ4GgIvq
         dlNw/F+0nf0rg9hu3C2ImbB6PPdVRLjidafVVXKzFiq/1l+5YdtMlfZc6GuqsDe5Vz4T
         jjDqLv8LS3Z8+gbHNi8Btm42PrEaRycBGPh5rEGzK7ffR3uGl6alKh5Vqg0qZUM0QFth
         YvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oB1Imkum9eDeaPIc2hKzTYzV0vCEPBOSK4bPPbyIfFo=;
        b=awN1WZhCid7H2mwQWpINd+2SVMHEx4oXd88vzYNgBkehRpIoc6kQQodWtJR/Owls/h
         dDmbIZ0stn1iFq2MfdkZ987Jt4ISvClEX4wYwe475m9ITidoOP441PW4TJav/dQwlzTG
         VMcB24iWFPaV0EoIY/ms0RyIJoeh+fGfymUkAu5PjIvitRcGKHUibfUoDZGQIRRxozvX
         9hjI/kvjqkFaxbydroOYdRRtXFkDGh35WaXyLa9m3Xuefncr2U6s0OXEKJTponlTOf/r
         Dq8rFvpJ8d2+f2CCbr02V3p+cbazXU14wtZsNVgVmdsBJkvlfHuteGURUP+tPVGKap4w
         MErQ==
X-Gm-Message-State: AOAM530bdBl6zGDpx0emgF3QSCizVMgaeaGAef6+UgGKG4nVqEC5XnVO
        IZY/d65UU00nJOD2iVHWdEjlKh2h2kwVDcpExiySKSbIdc0//A==
X-Google-Smtp-Source: ABdhPJwN3sBPbMXm3I2rAZin69LJ3GQIjqXtM+gIxWu/GLSx5jjjouxHaYHt0BHaZZKKHv3ulQCoB71rLRAWQxWPAZw=
X-Received: by 2002:a50:ab15:: with SMTP id s21mr2279062edc.88.1604673118970;
 Fri, 06 Nov 2020 06:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20201104170423.23436-1-digetx@gmail.com> <20201104170423.23436-2-digetx@gmail.com>
In-Reply-To: <20201104170423.23436-2-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 6 Nov 2020 15:31:48 +0100
Message-ID: <CAMpxmJVUkXxDkPDKQr98H0uCWJF9zKKzpe9np3McmT3MmeLJ3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: tegra: Use raw_spinlock
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 4, 2020 at 6:04 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Use raw_spinlock in order to fix spurious messages about invalid context
> when spinlock debugging is enabled. This happens because there is a legit
> nested raw_spinlock->spinlock locking usage within IRQ-related code. IRQ
> core uses raw spinlock and then Tegra GPIO driver uses a nested spinlock.
> The debug code can't recognize and handle this case, hence we need to use
> raw spinlock in the GPIO driver.
>
>  [ BUG: Invalid wait context ]
>  ...
>   (dump_stack) from (__lock_acquire)
>   (__lock_acquire) from (lock_acquire)
>   (lock_acquire) from (_raw_spin_lock_irqsave)
>   (_raw_spin_lock_irqsave) from (tegra_gpio_irq_set_type)
>   (tegra_gpio_irq_set_type) from (__irq_set_trigger)
>   (__irq_set_trigger) from (__setup_irq)
>   (__setup_irq) from (request_threaded_irq)
>   (request_threaded_irq) from (devm_request_threaded_irq)
>   (devm_request_threaded_irq) from (elants_i2c_probe)
>   (elants_i2c_probe) from (i2c_device_probe)
>  ...
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>
> Changelog:
>
> v2: - Only lvl_lock is converted to raw_spinlock. The dbc_lock doesn't
>       relate to IRQ and doesn't need the conversion.
>
>     - Improved commit message by clarifying that IRQ core uses raw
>       spinlock.
>
>     - Added clarifying comment to the code for the lvl_lock.
>
>  drivers/gpio/gpio-tegra.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 98fc78739ebf..e19ebff6018c 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -61,8 +61,16 @@ struct tegra_gpio_info;
>  struct tegra_gpio_bank {
>         unsigned int bank;
>         unsigned int irq;
> -       spinlock_t lvl_lock[4];
> -       spinlock_t dbc_lock[4]; /* Lock for updating debounce count register */
> +
> +       /*
> +        * IRQ-core code uses raw locking, and thus, nested locking also
> +        * should be raw in order not to trip spinlock debug warnings.
> +        */
> +       raw_spinlock_t lvl_lock[4];
> +
> +       /* Lock for updating debounce count register */
> +       spinlock_t dbc_lock[4];
> +
>  #ifdef CONFIG_PM_SLEEP
>         u32 cnf[4];
>         u32 out[4];
> @@ -334,14 +342,14 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                 return -EINVAL;
>         }
>
> -       spin_lock_irqsave(&bank->lvl_lock[port], flags);
> +       raw_spin_lock_irqsave(&bank->lvl_lock[port], flags);
>
>         val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
>         val &= ~(GPIO_INT_LVL_MASK << GPIO_BIT(gpio));
>         val |= lvl_type << GPIO_BIT(gpio);
>         tegra_gpio_writel(tgi, val, GPIO_INT_LVL(tgi, gpio));
>
> -       spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
> +       raw_spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
>
>         tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
>         tegra_gpio_enable(tgi, gpio);
> @@ -675,7 +683,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>                                                  tegra_gpio_irq_handler, bank);
>
>                 for (j = 0; j < 4; j++) {
> -                       spin_lock_init(&bank->lvl_lock[j]);
> +                       raw_spin_lock_init(&bank->lvl_lock[j]);
>                         spin_lock_init(&bank->dbc_lock[j]);
>                 }
>         }
> --
> 2.27.0
>

Patch applied, thanks!

Bartosz
