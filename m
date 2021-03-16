Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178C9C433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 15:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBE21650FD
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 15:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237246AbhCPPr7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:47:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51716 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237314AbhCPPrn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 11:47:43 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMBv3-0006Lb-3r
        for linux-tegra@vger.kernel.org; Tue, 16 Mar 2021 15:47:41 +0000
Received: by mail-ed1-f71.google.com with SMTP id bm8so4720227edb.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Mar 2021 08:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=inY6i8A4Tqqf26IRTTPmHrEemCAIy4a8P6L1PcnGZLw=;
        b=D2t+EF6rwpJZNZEQUEnZ3ZsXCFH83I/0vmYTCSDewGddTCUZ2hFhauPD4p3qbB745d
         q0oVaFGtSakCOMppobEBKI6muJajmA+H7HSpZ+BZv1cQDFgomtmRcLFdtcyYaxMXaGfq
         imJ5Me6Haxy3WSvuq9VAnDXLON+5bgmLvCvxPaeOOT6XePA/FULxyv54QThtRQQ0gKhS
         y+Bz7yVfo6jxiXXP2ky59rRhaBz5kVWnEWpMreskwk1Wg3PgbF5WY9qRxWQgDOJs/GtN
         ez6BXxSzf5P9/kBZoTKae7EQzisETEOZG/XhlYgQpnlr/+0YdJCZdK+j+rBysDOnCy3c
         bnMg==
X-Gm-Message-State: AOAM53379KeXYieM9PHURoiAk54gnA2suxKvFewAbbkxFjeLzInAtHPU
        gVjb6Ju56EHZKKhDOdj/539pmgYDogEwomBA79FzNeYr2Pi/c8Egvd0VMoqCibddie16d/UPw+s
        ls35yr/oHWBSSxInGEfXqbP+siUju2tpUUen//NLkLqvPXQ6snlzu4la/
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr36699089edy.49.1615909660872;
        Tue, 16 Mar 2021 08:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuw/dJQo9rH0tFlvYp4nm03MBWw0FLDNdvROj1KnIALerZB4yUNuZjOR6eHwi+Wa1HgbEZ0IePzPZ4lEB2wsg=
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr36699067edy.49.1615909660757;
 Tue, 16 Mar 2021 08:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com> <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
In-Reply-To: <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Tue, 16 Mar 2021 16:47:29 +0100
Message-ID: <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
Subject: Re: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 16 Mar 2021 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 16.03.2021 10:55, Krzysztof Kozlowski пишет:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
> > built on platforms without it (e.g. compile test on MIPS with RALINK and
> > SOC_RT305X):
> >
> >     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
> >     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. Depend on COMMON_CLK always, not only for compile test.
> > ---
> >  drivers/usb/phy/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> > index 52eebcb88c1f..7500e77a7d01 100644
> > --- a/drivers/usb/phy/Kconfig
> > +++ b/drivers/usb/phy/Kconfig
> > @@ -163,6 +163,7 @@ config USB_MXS_PHY
> >  config USB_TEGRA_PHY
> >       tristate "NVIDIA Tegra USB PHY Driver"
> >       depends on ARCH_TEGRA || COMPILE_TEST
> > +     depends on COMMON_CLK
> >       select USB_COMMON
> >       select USB_PHY
> >       select USB_ULPI
> >
>
> But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
> for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?

Hi,

It depends on the platform. Not all of them implement every clk API,
so you can have failures:
https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/

Best regards,
Krzysztof
