Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981DAC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 12:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C6F5230FC
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 12:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbhAVM4w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 07:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbhAVM4s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 07:56:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168F7C06174A
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jan 2021 04:56:06 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id a8so7379179lfi.8
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jan 2021 04:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hbysKLgwDzAo+nX90SpxzAyrCCK68/bvQhdhyAtkNpo=;
        b=QDULxrStPPn057tG9barLLBFRTBLJ8ylUfC0+F54+qfA4SNlZv40pBLuzSI0N/59g+
         SapNPHtGBn0koEhPx0looQTZhW4s0UFM5EVkuMCzoapTRXpEDyc69fqvsU908jFwJhl1
         j/yvSpIt2HaWfzv+03V9uyp8XZPdrS6Fth+Ku9EuwOJYLiz4LOmW9KBVV+H7uB9ILTHo
         76d+qxuVb/0yZGYHVhgwPn0OxgWrekrE33QMuejE4dqntZ4GJoOtPN0Jyx7bDRdcr5qZ
         m6CggsFCwzDH7b5b9jySKPwtmQ3X/dswem/zBMF8fVnBErlwmXTgKtFmBiztB4LRoPvI
         ipow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hbysKLgwDzAo+nX90SpxzAyrCCK68/bvQhdhyAtkNpo=;
        b=LsVGY75BKVxCGG/0oQM1l4LaC8ZPITGSJ25FgjHbeqTbDljnHqJEIKXs5nwBkcxata
         HbVSGkMp5ZnTbiirvqRuvYCsVfhNgX/5E8RnPk8nohBGPnPWNG84yIhFY+aZWDwZAuvQ
         M95AsQ1/95dmeSXC3NGtN8DS47EVwstXPPn5BuwoM9JYNVgAsFDytXrE/lC93vfrpEH1
         Y35oSfVpoR+GZaIdPxU2XRfVnxzIZbg6x0qXL07LAizwJxiKAOTnxkkfnjjzQojUKA5C
         zHrkCP+jX/36DI42C2N2hVu8cKEoYh3LH/tgyOOtW3m4B1YX9VQ1FLoab9KAMy7gmChS
         WAaA==
X-Gm-Message-State: AOAM530crCK8pEcejIsgec/sGSj0aLqFYqjl1CC1OXbkKX7f36Rt3sVW
        H2nrgyAn6LcSXyLwJSVazhE8bLAv7DGjbX5gWIKCxQ==
X-Google-Smtp-Source: ABdhPJyzQ8QWrLb9ryGYf8zFaFDgdefT9zZMp875FZQAg32906v115z1A2LAgTQWXJX5DB0zn6ghDHXKGH30CeVhH7A=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr129571lfd.291.1611320164547;
 Fri, 22 Jan 2021 04:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20210120004548.31692-1-digetx@gmail.com>
In-Reply-To: <20210120004548.31692-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 13:55:53 +0100
Message-ID: <CACRpkdZynT6T8wnN3xY6hUmZy5emWUe5ep9N3BEV8iQEZLnEew@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tegra: Fix irq_set_affinity
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 20, 2021 at 1:46 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> The irq_set_affinity callback should not be set if parent IRQ domain
> doesn't present because gpio-tegra driver callback fails in this case,
> causing a noisy error messages on system suspend:
>
>  Disabling non-boot CPUs ...
>  IRQ 26: no longer affine to CPU1
>  IRQ128: set affinity failed(-22).
>  IRQ130: set affinity failed(-22).
>  IRQ131: set affinity failed(-22).
>  IRQ 27: no longer affine to CPU2
>  IRQ128: set affinity failed(-22).
>  IRQ130: set affinity failed(-22).
>  IRQ131: set affinity failed(-22).
>  IRQ 28: no longer affine to CPU3
>  IRQ128: set affinity failed(-22).
>  IRQ130: set affinity failed(-22).
>  IRQ131: set affinity failed(-22).
>  Entering suspend state LP1
>
> Hence just don't specify the irq_set_affinity callback if parent PMC
> IRQ domain is missing. Tegra isn't capable of setting affinity per GPIO,
> affinity could be set only per GPIO bank, thus there is nothing to do
> for gpio-tegra in regards to CPU affinity without the parent IRQ domain.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Reported-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Ick, sorry for the noise!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
