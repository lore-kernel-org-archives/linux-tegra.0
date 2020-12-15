Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB47C4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 14:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CA9B2251E
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 14:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgLOO3R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 09:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729509AbgLOO3H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 09:29:07 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69770C06179C
        for <linux-tegra@vger.kernel.org>; Tue, 15 Dec 2020 06:28:27 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id o19so14203289lfo.1
        for <linux-tegra@vger.kernel.org>; Tue, 15 Dec 2020 06:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HdkxURvE+//a6vEq3auCmQiU3zCSIzJRBoLgXA2faA8=;
        b=FWWM+el3iG4jml/a/S8+cAleWrZFjQaUo9/89/8OOHAILBQChQhhLwO0CB4f//95L2
         J3sLnuHmmIy1Q0FjAPxlGaYjU7I/W5TktEpWaXkv9Tg8dvT6pUSajPhrAHwhvpwLISJN
         iPeBFgNSEBr1wZdVxEY6UdGkE5otR9R46ktQYGWGzCtNERafVoatwM7kQdTMHvB/ITVW
         AMKqr0OZNWjr4fgAzSxFdGYKzBD0xSeDkhTJNf/Reirluu9IOcljmt7I/edEoqcCd1r7
         XbnyutRlov1Q43UeUF0KUoR1FiCXpxWjJGUkGqCbViKkPAXQjaP/2mRFmAq2mcYiKXH4
         3VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdkxURvE+//a6vEq3auCmQiU3zCSIzJRBoLgXA2faA8=;
        b=WVhkBrXbgUm4sOwvyRQiY7jmZOKwvRif3FleBYEC22d5EUc9/MdlfToeB/U1XATzif
         qfe7/KlOY7sVXG391cWxbVuQXC158xXx+pbEN6qGPF3UjCZsyxn9IvowpB8qlr2riLqf
         GmJQnqEdk4NHMde3372F1dYQsMwjrHj8BlgZQQ8J9z6vGmaJu0168ksGZczec/F4AQED
         qHhQyUg7C612fAeO9V9lYqwH5FFPNYdMIOB4GhwjHIXtHxE8J80C431v9Q1uNw0n9iZt
         HlMtAnboPIfvvX/0nUwhElg8qr2dmk2EZwYSs/t5k12IJIcNRDlbKpNQP2eX2ZNMTT6L
         RPzA==
X-Gm-Message-State: AOAM533Temk8RTP68u/ostunuGZn5YUJoiMVWVtqVca6C6pVUmQTosXS
        b0UlqXPLGQ/FARbDKpsZusLApwCtCG/69vC9Nnyd8g==
X-Google-Smtp-Source: ABdhPJyQeMgSaqYkewzCqMDu+KKRFvrpl5evPi12xUyQ3QG5+JJM4xJ/Zlq77mWSMw52kggUexMfs6//mDGt2F4cBgI=
X-Received: by 2002:a19:495d:: with SMTP id l29mr6969679lfj.465.1608042505945;
 Tue, 15 Dec 2020 06:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20201215135222.6899-1-digetx@gmail.com>
In-Reply-To: <20201215135222.6899-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Dec 2020 15:28:15 +0100
Message-ID: <CACRpkdaUW5E-vqiy6Qghmjx_u7Sde4G18b=AsWBLmn+ARZiD2Q@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: tegra: Fix misplaced tegra_uart_config in decompressor
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Dec 15, 2020 at 2:53 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> The tegra_uart_config of the DEBUG_LL code is now placed right at the
> start of the .text section after commit which enabled debug output in the
> decompressor. Tegra devices are not booting anymore if DEBUG_LL is enabled
> since tegra_uart_config data is executes as a code. Fix the misplaced
> tegra_uart_config storage by embedding it into the code.
>
> Cc: stable@vger.kernel.org
> Fixes: 2596a72d3384 ("ARM: 9009/1: uncompress: Enable debug in head.S")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Aha I see the problem.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into Russell's patch tracker as a fix!

Yours,
Linus Walleij
