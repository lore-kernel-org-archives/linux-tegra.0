Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546F2C433E6
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 22:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14CA522D01
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 22:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbhAWWvE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 23 Jan 2021 17:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbhAWWvA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 23 Jan 2021 17:51:00 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF272C061788
        for <linux-tegra@vger.kernel.org>; Sat, 23 Jan 2021 14:50:19 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i187so2358636lfd.4
        for <linux-tegra@vger.kernel.org>; Sat, 23 Jan 2021 14:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5FMoc4rlspXDa8RwRSPjCdNzMvT7gR3rZeQf96XBACU=;
        b=pbHIGHcB7/lNJJmV0AhwRirB26dYTxu3e31nG5k+1V883Fo3serpCHGlkQjvptzw5V
         jgt+5itvcsdHXwk6ot4vFnyGEHAS+ojZseTkdpm+/KgcJyCqR0wcd4X9ZzF9YqCBRWo5
         jHdgu/hAV9UMV1H6VqC/qljA6s23hMAvIDlLgLI9w+m0U/3080Pudx5ozHB/diXy/fHy
         NDPjNz61WrHQE+PBQnguw3uKznYeJeMWwQmKnoVxNNAV72/1GN4Ep8r43BVvGwvLPuP0
         FqVg19A3UAINYsplzs5ty+R5Nlf4DRxAqlrD8zNVOw1innEqLSKe3o3vd5CS2uBqCNDq
         PXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FMoc4rlspXDa8RwRSPjCdNzMvT7gR3rZeQf96XBACU=;
        b=uKw00KsI2xuBbS8i/zg8DUrYsZwXwPiF+HdLTKi9yqb9vg2G+OUipKHw25ms1WRy5l
         /Qa1ZFM0WCj9YTNQ9LAucQtHN3Bv4XiiDlnhw6SjpiYkzC5bOxTjqEKHu0awHQCHubrO
         Y32qM57yWrPDdKSY//4d0qwx42dKQCHZj8oIzv5ziuObWonUBTeRnaJHI/m07FT5u5Zs
         eHsb6YPP0hMzafGrlNj9p2yfic/J8Oh38cKUoBwPrLK7wOcVmOH1iulOd1jy6fjQZ4m5
         Yv5vWN5jqsxtYOcD4AYtd2GY3LqdYi8tf259GP8rkYmJu6s77PEDZixX3uDGodS055QE
         ORgw==
X-Gm-Message-State: AOAM530I8bLVP0dRPuUUwIjl/9R1PvQ+Fc3twDk588aHtHVP0TpQTMsu
        sLUTOWCDPPiUD71Ii6Mpj8t06wXHQzYxgYo4wfkBEg==
X-Google-Smtp-Source: ABdhPJz7Cj86RdMSh12IrhlVXOFnQOdiRQMmkZvBPn+guW/2OITi8G0VXT9ofQRUB8w1pTsH++NbMzf6BCL3BQx5gEM=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr826516lfe.29.1611442218331;
 Sat, 23 Jan 2021 14:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20210122185543.16554-1-digetx@gmail.com>
In-Reply-To: <20210122185543.16554-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Jan 2021 23:50:07 +0100
Message-ID: <CACRpkdZTyBuz240iYuvi91k3dLKKXX=4DNxFEBP7mSNB58XtDw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable module
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> This small series adds modularization support to the gpio-tegra driver,
> i.e. driver now could be built as a loadable kernel module.
>
> Dmitry Osipenko (3):
>   gpio: tegra: Use debugfs_create_devm_seqfile()
>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
>   gpio: tegra: Support building driver as a loadable module

As these three patches clearly make the kernel look better after
than before:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

However when we are doing this I would strongly encourage you
to also make a patch implementing remove() so you can insmod
rmmod the module at runtime.

Yours,
Linus Walleij
