Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D096C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 13:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E6C82065E
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 13:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404676AbhARNkP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 08:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404669AbhARNkK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 08:40:10 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B61C061573
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 05:39:24 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id w26so18249542ljo.4
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 05:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7rCmnKzXpVa20gXpSfmHUH8NWDq8PYAlPBp+23NCeYc=;
        b=T9EUMNeImUwwkD4WyDhF7Kk0NSaYLw80mFsxFto0JPp2Vj3wumv1RBBWA2bDRx0ctb
         gQ9m59tSyu6g0fUCewx6qmixqPDCNmy5Xvn1rmigxBUIJQSoMBim/f7GZY2YN8Sqq/8n
         ijo6r8uXig2cqictwngUdeqLU0rmWPK81JZi3UQ7F8mVvmPBAqQB93ETUbF4UAZunmMz
         r/l+LGZnCjtUpjTKvPiLBxMnllEjn7dxehkBDi0bWv8s2EB0qsgjMFUWAmjq70VKhb/5
         bhcSA2oSOp0aiuu/cdOuMoxHhnKMCqMse84Ju78hLrx+1Y5cNf/gkos8xole5CpCRWI0
         71Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rCmnKzXpVa20gXpSfmHUH8NWDq8PYAlPBp+23NCeYc=;
        b=PEBRZk5UelYVDSC5/2XU4WqTZC52FHOTPRUGSroYjw0jw9b2fCNIWGUPfWbVVoh7in
         L/BkV5NItON4EN6XbgDZnKnvbw7WoMwmcD+HN9yVgJumRq8y6A/AkAIM+9PGbrC6R8s8
         LwvhSWlkXVCZivNJs+D49/9PIrQy9/c3LfIQJlzBS3OCwIbhCm9gOYPestkOzYD1raZ5
         Z0ENUhZ6JP1zvAo5DmH94zTrV0QJOZTvQd+DYf21xexoPp5MYYxu+PIC/NTJ5iej+jFE
         qYp6dVxrjqdChQQAcTy0S+3KJmM8WxFW/nF+jtkLC4DleGigiMMqTyAbXJBGp6oI6FUs
         BH/Q==
X-Gm-Message-State: AOAM533dH72s29W+7b4h6t56hCY/4FEUUBvQRNV025V+3jhJIaMsgutb
        qscDNy3L2l+iDEm8AQ06Ri774qVdBWL8hPp3r2nvCQ==
X-Google-Smtp-Source: ABdhPJw3FCTQyPsrFGXu0G+vqPN+sHa2TBDw+/GAEnvxRNO83nf1Xwv8q0+VTXNLnEkl0npJzDid86l9ZTjLU5Fifhw=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr10100589ljl.467.1610977162805;
 Mon, 18 Jan 2021 05:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20210112133010.21397-1-digetx@gmail.com>
In-Reply-To: <20210112133010.21397-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 14:39:11 +0100
Message-ID: <CACRpkdZtOiWz=FuBTX=uO4LU22d-OE8D1-B6nN-OHYNenMVYGQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: tegra: Fix wake interrupt
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

> The GPIO bank wake interrupt setting was erroneously removed after
> conversion to gpio_irq_chip, thus the wake interrupt programming is
> broken now. Secondly, the wake_enb of the GPIO driver should be changed
> only after the successful toggling of the IRQ wake-state. Restore the wake
> interrupt setting and the programming order.
>
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
