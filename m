Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33527C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 13:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D72E121E92
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 13:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404628AbhARNlF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 08:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404709AbhARNk4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 08:40:56 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA16C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 05:40:06 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id p13so18284626ljg.2
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=agRpMrek+Sppj7GIr8oRcD/VoAZuQ4C+XG8ubwmjo4k=;
        b=rocze4a/cGqaTl37flewv1kZPlkcZC9Q9GsT3LiMVLV4JD2GajATAopnT7qRD69wU4
         m0KgxlHf3pEq/+MUD29LiuAm+v7BInGssiPywyFKZkz16/+AWlEv13Nt2YprofI2SVxs
         nqlrR7i1XvjYhJJlOeMW7jiRbGy5/e4u8Ed4srNbFCH7mMoCFXr4aFVuQlfSkGbAN5zY
         HIk5z8BBJ+iis8mmOm/OYKMatP40OzQH6ziMc1219ug3iLjnjZy+6LcLmj39a4qZtSUU
         3gJdT9ikQ97hGpsCqXtr924Fc6VPbm27drkGXsnsSrIpheyWNp9j7yP+v+nPjYDPfE/s
         piwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=agRpMrek+Sppj7GIr8oRcD/VoAZuQ4C+XG8ubwmjo4k=;
        b=j1teKPj/+RedkHvttftAUt0HZbDhfmaRque+PaOsBCMNNqdm1+inj79eFAvN+72NVy
         ANA12O1LHE6Nk+xWmYYx76BgGYuAa/lPsf1S2QjCGEHGveIbLHcL1YcD6Yz5WCDcEI2u
         L5R9Rtop7dPrnvyAIW7StthVghGamkXNg/QZcOiPMj9iTWSLyU5/TDWAvGJa+x1foIpx
         S5TVRRuabgLW6oFk66dNzegKyo4ueGSDbxYumdMLqdzgycjyMm7FXnDAySEbEdEE2cBE
         dQI0V6874IeldvgYNcDrouot5zAB5+i5kFXxQHb7BeR03bu+bTIw0Z62n6YXzqvmdyKN
         IGfw==
X-Gm-Message-State: AOAM531lwvIF4PmcUaAYb+jwkNLgY+KfrlBss82k5dv4xrBqV8gCG+yn
        fQ1pU47GardFWfKdz2r3jytNO0D2/ob6DPplEx/FaA==
X-Google-Smtp-Source: ABdhPJwAvKK/U4EUCHlui/R7DHrDRKoSCCyv/UBKJaKwItG3nr4+TGKZ/eoC10L2NTt8VIP1H8+TMonSXEUM/aAoSCY=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr11263570ljz.74.1610977205079;
 Mon, 18 Jan 2021 05:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20210112133010.21397-1-digetx@gmail.com> <20210112133010.21397-2-digetx@gmail.com>
In-Reply-To: <20210112133010.21397-2-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 14:39:53 +0100
Message-ID: <CACRpkdZunRyQhWcMxKC1qXfO9gni_n_1Hr90C-RA3jSpXcOYzA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: tegra: Add dependency on GPIOLIB_IRQCHIP
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 12, 2021 at 2:30 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> Add dependency on GPIOLIB_IRQCHIP in order to fix driver compilation.
>
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Reported-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
