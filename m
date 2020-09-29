Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CBFC4727C
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 13:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 703592145D
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 13:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gj+U2Dfi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgI2NtD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgI2NtC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 09:49:02 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65540C061755
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2020 06:49:01 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so4095604ljk.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2020 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D+vLUCZZ5UKIWpTSD1+fX6O9kh/TXupdSQG8eQc/bmA=;
        b=gj+U2DfiooxiDzQOUl5qle+R3xr9NIOf6ZcMaxButhbYfcHF3xYrzbQcSYHTV89DeQ
         4p7fxRX8wEN3dFYIFVnGdvuLdm6bVEMRKOQ4o10c1iE9P+3RDiXGfzq7dcXPHPXxS8jk
         rexKAs9j3V4IPCFs5cMl+cveTRwSsDYd78Jus7dKGIn2dnDKYE0i+YdbGuRIInE43Be4
         Jl0yzQe1kSDIFFrpikrL7A6+mTzMLrdzc2O/tA/z9UHM4uGkOW7eCVdDLJREFXQKs5Dj
         kkXttFPU7Uwhsq+OuJpmxf9/HQx0Uw0jv/+vaMZ8DXn63TAgUkGAMdLu2AmgEL8+8hg7
         w47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D+vLUCZZ5UKIWpTSD1+fX6O9kh/TXupdSQG8eQc/bmA=;
        b=ASrRQdW8EOGwVPr/SZ94dHqm9nByqitl3jViCtD03Fu54IbpkgZ8XwMJl098Ye24XM
         geoEQqtTirWQu93Lp+iOj2wE6uldAWBSqZ8EH06xJgT1OZSMEh7GEbZpMA8UHYwtZhPl
         pnecV3M+dcjmIHl6C8pAErSfnMRrERjsjfyvEbj1wh1I3YzX2DvYQt9U6n/05Kc/+e1G
         PDZ2D5cNaiBvSvEDpz6UdT1vCJWWxbvlOYjAMkf46cERW7uz/GEA6j1moPOuYl9HD7bP
         SAd6QG/1A0Ode10fNpe3LT8xKrMQY+iDV2Y9MhUpyZdHVvT4+DniH6/XgPZAHmrFpesP
         DfZg==
X-Gm-Message-State: AOAM533vUh+b4IqjvGdlt9mGn5/+10NRi7QhfvHz4wG3NuEJruFSPIq0
        DLQj2aSoVAkQYS3NrCr8eDmzi1OP/ZSf6vJGaVCI9Q==
X-Google-Smtp-Source: ABdhPJyiIWB6K9oEXax8jJuXMr9FdHo6YqLOve2YqGoXeu0Tzpl7gBLMtEN+zFIv714Ne/aWJD90Rz1GrU1xVpUBXDQ=
X-Received: by 2002:a05:651c:107b:: with SMTP id y27mr1112311ljm.338.1601387339756;
 Tue, 29 Sep 2020 06:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200901124736.155281-1-linus.walleij@linaro.org> <7e34261d-c7b9-99f9-121e-05da76a8781a@gmail.com>
In-Reply-To: <7e34261d-c7b9-99f9-121e-05da76a8781a@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:48:48 +0200
Message-ID: <CACRpkdZnZ0fxU=7_RLMEivvFProa5r9VPpPiHHR_45zzk3_kCA@mail.gmail.com>
Subject: Re: [PATCH] ARM: uncompress: Enable debug in head.S
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 23, 2020 at 12:13 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> I have CONFIG_DEBUG_UNCOMPRESS=y and was trying today's linux-next which
> unfortunately doesn't work well on NVIDIA Tegra30 because it's
> frequently failing to boot, hanging early during boot, about 1 of 5
> boots are failing. Then I also noticed that Tegra20 has a similar
> problem, but worse, only 1 of 10 boots succeed.

Hm let's try to fix that.

So you got the "Uncompressing Linux..." message before and all
worked fine? So we know the physical UART base is correct.

> I loaded Tegra2 QEMU and got it also hanging on boot. I retried multiple
> times and most of the times it's was a silent CPU hang, but one time I
> got an endlessly reoccurring debug message from QEMU telling that CPU
> tries to write to a wrong/non-existent IO address. Then I attached to
> QEMU's GDB session and found that CPU hangs at the busyuart.

Could you try to implement
waituarttxrdy in arch/arm/include/debug/tegra.S?
A copy of the contents in busyuart should work.

I suspect this could be FIFO overflow making the hardware
hang.

If this is trouble to you I can try to make a patch
that you can test, just tell me.

> Reverting
> this patch resolves the trouble for both QEMU and real HW.
>
> I also tried to revert only the "ARM: 9006/1: uncompress: Wait for ready
> and busy in debug prints" patch and got this in QEMU:
>
> Starting kernel ...
>
> DTB:0x016F6A20 (0x00005DA6)
> C:0x010000C0-0x016FC820->0x0125AF00-0x01957660
> Uncompressing Linux...
(...)
> LZMA data is corrupt
>
>  -- System halted

Hmmmm is the physical and virtual address to the UART
really correct?

Else it might write in some random memory.

Yours,
Linus Walleij
