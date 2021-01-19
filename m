Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD477C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A63DE23135
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbhASO6b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 09:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390652AbhASMi0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 07:38:26 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93632C061575
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 04:37:45 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id dj23so18735058edb.13
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 04:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uX05RLrFNDFR+8S7xOfs8UI8fZ3dszKDQDSS1Mm1oRI=;
        b=tJ+U52IBIWNDfTK5zo8brqLp/GYfXWl5QdtKyMVwTp7+1APyQLJAlq3mPN+6zTdkzu
         PSMp/aXe4e/Wn9Qq8/oLh8NJKIlSDQDz/jHafpQvz7CkXy2yAhOONt00w16tirntt0mu
         SqTROIu7CfCRcnqGRdKiH+aFO4a5FVZEja5fV/LTMT4+sqmwy4Swh7DBWhwzR+H4JrG2
         yfiL92ZtY7QHSA3JZU6gcz8U4ItrUdqFnjHYfsAyXAxGIrkv5vBWS6lbMEVLIYNWNrWo
         fST5y6jADs22N+P1o+WQYTvLdC5Q0Nk6yQRqsKvkzCA42s1MFdt77iAoQXzmJgT8PXGG
         pUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uX05RLrFNDFR+8S7xOfs8UI8fZ3dszKDQDSS1Mm1oRI=;
        b=WUWeyNDO14+vBuUaeEuSINh+FUbgz8z4454BuIvDGSKcPpAFoEQeQMtLm4QIERrmCQ
         la3Y7IeClp+lbnvI8kt/WyruyBF/wsriTqky59iXM2JMWBW+KS5Qy4sKgqCtey6/Rp0y
         nFQgvif1JB2wY3hCMrGow5tqAk1REBgotm8E183ytFNKrZElxr710zz5VgwpydLsxdER
         ClX6gUiPy2Uap3mh9MtR8p6muUWT2mYIWAM9S7VcXPgHWUiiHuvKTJGK/0KXXGQSeYli
         N3r1ohjfOmrd/zKxqinOz54HNv/bsPro0L/hT99STQogW6ZmoZIN7ZmMpTHYyd1KddDO
         JULg==
X-Gm-Message-State: AOAM532yPCOg8BRlp+M3fNo+GqmgmMckKBpHCFuEOMNMeVrCuu3/xxlL
        t51iR8lg4/U0/rTV6HZcWNcGmouqsbrriwXJQSrGMA==
X-Google-Smtp-Source: ABdhPJzwyxjvwMiQLzkqllYCKMU6mEWJaYJ/J+ypPwfmQL+Gmfrg8A6ZcRXembuqo8a+XYju0LZ2W7wS0upW6uhFrVg=
X-Received: by 2002:aa7:d401:: with SMTP id z1mr3199321edq.213.1611059864353;
 Tue, 19 Jan 2021 04:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20210118194925.819610-1-thierry.reding@gmail.com>
In-Reply-To: <20210118194925.819610-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 13:37:33 +0100
Message-ID: <CAMpxmJW4uAJggA+yuO8Ntgi_px1fmZ3e3WCtszvc+prpYY=DGA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Add missing dependencies
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 18, 2021 at 8:49 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Commit efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip") moved the
> Tegra GPIO driver to the generic GPIO IRQ chip infrastructure and made
> the IRQ domain hierarchical, so the driver needs to pull in the support
> infrastructure via the GPIOLIB_IRQCHIP and IRQ_DOMAIN_HIERARCHY Kconfig
> options.
>
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 75f6c37620ea..013a1055939d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -597,6 +597,8 @@ config GPIO_TEGRA
>         default ARCH_TEGRA
>         depends on ARCH_TEGRA || COMPILE_TEST
>         depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP
> +       select IRQ_DOMAIN_HIERARCHY
>         help
>           Say yes here to support GPIO pins on NVIDIA Tegra SoCs.
>
> --
> 2.30.0
>

Applied, thanks!

Bartosz
