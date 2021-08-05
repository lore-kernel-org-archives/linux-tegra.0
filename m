Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78319C4338F
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Aug 2021 19:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F54F60F35
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Aug 2021 19:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhHETbY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Aug 2021 15:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235611AbhHETbX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Aug 2021 15:31:23 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA28C061798
        for <linux-tegra@vger.kernel.org>; Thu,  5 Aug 2021 12:31:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id a201so10821383ybg.12
        for <linux-tegra@vger.kernel.org>; Thu, 05 Aug 2021 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fL8fo3oMGGdyhjep5qev4L9S+lO3A55pCdtFOtBwaxs=;
        b=susPQoo7vDrRfrwzXtBy22f4mKDn99gxcKYS3WdgIv0Ttkg+CxyTBlKqI73LsdPEx4
         DR0rXmw+2M9BrAFs+9Cyc5jmMnJlNuJwJwd/e9fsd3mQP/AroV8yein4SlqXHcgcFtod
         qnviLaCCI41xrhhJrrSSknBzTEd333w3q5ltYQJ3BpPfKI2XnTn3a0SfPAOk4feNEWmi
         b7Z9sNYTlbZX6rp+EmlakSpUCymwol4dLhPbUwiRnKsVI9X8fBtcFt/b6P/P25LFEYj+
         FtKPbw9seF6TpGIB1zr1EyQLxjIF2xewalSu+FUe6bizmrcG+kN9OtKY3sCGdWke66ps
         GODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fL8fo3oMGGdyhjep5qev4L9S+lO3A55pCdtFOtBwaxs=;
        b=Gnp05tggsXv4nj0efqcP9SlgjPjABHpu3nY+Xj1IUjS6n1Vb1FFd5kSNZa1XfsQ4hA
         EBaIWP5ecatePc4qDFStagMVkcBvSMDwwljYqHY8vyYCEOr92MfpDjSSHqiZ6g/BkuCc
         eY3pY1ILK7bfYTN6tT2gXFFg9sQVg4DhaTKZwj3ckJsELe85tTxskZExFoyw4mxpmKbA
         BB6X1AVZ8ZKzftsdURy+bnIo4D+guvTHUqJy2NtRwti8V10THc0WuCraz5byZWJBqwG4
         /4ihE9GnNPi3FpuZD0YUxIr7xmg/34apM+j3foAhImzvWYZQegvSPCKI9S6JYs4oVHXU
         g9Pg==
X-Gm-Message-State: AOAM5325wStqIRD3g8wfyIhF2razO2tc01MP67kciecIvrdOQDcWi6Iu
        f/1iedkWJU13X4/jr4f1miEerCJ492Pp/6f0SeM2Iw==
X-Google-Smtp-Source: ABdhPJwCu69IUV8/73ADKF8rJAeJL2gGGYFSxKuIudS+v8IePJBtkREFBqch3JyZnL622pPLRF9YZCwdVFS53Bk5er8=
X-Received: by 2002:a25:bc2:: with SMTP id 185mr7963251ybl.23.1628191868491;
 Thu, 05 Aug 2021 12:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJWZm_N3yPKa2+32PNOyCUuSbjqWiDBSO3WHjKekZj8Fzg@mail.gmail.com>
 <1626670001-22832-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1626670001-22832-1-git-send-email-akhilrajeev@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Aug 2021 21:30:57 +0200
Message-ID: <CAMpxmJWDX8GifOWcAgnn0BMPhyRpLSkWEcAsr=F4rZ-1OhUqUw@mail.gmail.com>
Subject: Re: [PATCH v6] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, kyarlagadda@nvidia.com,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, mperttunen@nvidia.com,
        smangipudi@nvidia.com, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 19, 2021 at 6:47 AM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> v6 changes:
>         * Rebased on top of v5.14-rc1
>
>  drivers/gpio/gpio-tegra186.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>

Applied, thanks!

Bartosz
