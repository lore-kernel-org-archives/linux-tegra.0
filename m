Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED81C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 15:52:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2D47650F4
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 15:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236732AbhCPPvn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:51:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51841 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237534AbhCPPvW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 11:51:22 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMByb-0007iN-9h
        for linux-tegra@vger.kernel.org; Tue, 16 Mar 2021 15:51:21 +0000
Received: by mail-ej1-f70.google.com with SMTP id e13so13751921ejd.21
        for <linux-tegra@vger.kernel.org>; Tue, 16 Mar 2021 08:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RZxwh0t8F0/MB+nIBsx55CaTklvvT0q8IQWe2LFV49A=;
        b=inYzYp++n5Q/j1zUbB5lbIplSO8n1/N0y7siWe/SkA4Bp9VTuBt+OT3d6evTGiLmWv
         bU81QAfCtdUAEWJWoztgGbXUsdmlJS4Cn7bt9tMXPQI0tnaY+L34PpPjpxB4Wt0aGXmR
         2+cjymMP8u5eVrqXQh91icKThrvRTwP/2Q6dJm6csbxqtSeYDGeGBZhEdMEiJkwK+OLn
         iw2Y8SfFqqQjUbB3i/Cw9EUx1hHRNOQJThOF0d8B+ahzr8O0aiFLqz2SSKHtf4t3cesi
         z3kUhmGEK931nYThknvszFPQjtwUHj06XPZQx/hXGbpz+m6YHwtgrjjh96afE+KrnBsr
         jYlQ==
X-Gm-Message-State: AOAM53269sd8ndngtCBFsVfNIxWdmQ1CuiK8CBaQAZBRINgUSiqfUDhS
        TeoaHpukrOJnL4VvnVrvkqt+1rBeoEmJDENU8bitq0/4SBWNvk7UUiPBP6KIJDWRBg4pUsBogxr
        SjGgKu13xXP227byReot1uh4rCJ2qjYKoCU/ElQyEdUxvYk0NgTgB7jVv
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr36357675edd.359.1615909881056;
        Tue, 16 Mar 2021 08:51:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCWwhJRSrCvCm0ahr7KMKeVzMwuwrMmx4YP7y2/DFeymMxrfWCexvNraEJX/4U746unkcfzQQxOpR9gSYKhtM=
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr36357652edd.359.1615909880849;
 Tue, 16 Mar 2021 08:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
 <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com> <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
In-Reply-To: <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Tue, 16 Mar 2021 16:51:10 +0100
Message-ID: <CA+Eumj4WirHRgr3si=nkQpNdUBcCwqLXvs-ihSi2nuJokxg=Xw@mail.gmail.com>
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

On Tue, 16 Mar 2021 at 16:47, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Tue, 16 Mar 2021 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
> >
> > 16.03.2021 10:55, Krzysztof Kozlowski пишет:
> > > From: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
> > > built on platforms without it (e.g. compile test on MIPS with RALINK and
> > > SOC_RT305X):
> > >
> > >     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
> > >     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. Depend on COMMON_CLK always, not only for compile test.
> > > ---
> > >  drivers/usb/phy/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
> > > index 52eebcb88c1f..7500e77a7d01 100644
> > > --- a/drivers/usb/phy/Kconfig
> > > +++ b/drivers/usb/phy/Kconfig
> > > @@ -163,6 +163,7 @@ config USB_MXS_PHY
> > >  config USB_TEGRA_PHY
> > >       tristate "NVIDIA Tegra USB PHY Driver"
> > >       depends on ARCH_TEGRA || COMPILE_TEST
> > > +     depends on COMMON_CLK
> > >       select USB_COMMON
> > >       select USB_PHY
> > >       select USB_ULPI
> > >
> >
> > But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
> > for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?
>
> Hi,
>
> It depends on the platform. Not all of them implement every clk API,
> so you can have failures:
> https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/

Ah, you mentioned the stub, so let me clarify more. The common clk
stubs are not used for cases like !COMMON_CLK && HAVE_LEGACY_CLK (or
HAVE_CLK, I don't remember). This is why you can have a MIPS platform
defining some of the clock operations thus not using COMMON_CLK at all
(and neither the stubs).

Best regards,
Krzysztof
