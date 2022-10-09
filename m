Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB04C433FE
	for <linux-tegra@archiver.kernel.org>; Sun,  9 Oct 2022 06:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiJIGu5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 9 Oct 2022 02:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiJIGu4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 9 Oct 2022 02:50:56 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2206018B28;
        Sat,  8 Oct 2022 23:50:55 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id b2so19117792eja.6;
        Sat, 08 Oct 2022 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh4NpXCRtCPTFCCfEYg95xQBrtPC7IO1mZ2P42HJVfA=;
        b=GZ6/3TP/0YTkbqfbZ5rcwb7ow+Bfvj8xAPmwCA0qiK+SbH5/QvqG7IGtedNtwzyIp7
         YWS96XLptPaF/Cnf16DJHvnbnOpstzuyrfJchrdTGfyyzlqjTtAxkyRnZUhS+c83aVtT
         QRkS5gOHeftM1qpbp9raNFiY2nCfzu8rcFhLoMwvLQ9End/9fc/5h38Quer23uIFZVfk
         Bm+nOrCzsK5uMHTGiPOwbRuCi6/9L0GOUR6MS8JukMvtG/TTr/pCw97BXoOi1mPdSIbX
         oqnv2nPRJHpOOSPBv6jwEr1V6lg4ljG7Yyi+w6SL0mQggPAd47j9q3M8kRfiGHzzwzLJ
         HvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bh4NpXCRtCPTFCCfEYg95xQBrtPC7IO1mZ2P42HJVfA=;
        b=GFQ7dPgOiuN0zZxTpSLxhqyITYnoYkkSGoA6kMp2t5IXdmOugk7LPoyOhH7Jj1omBI
         aWQj4/fkpXsHIC8niNCmqTCP1UJWbYlOY90ul6yctLe+GVwV6w5X0EBhkeJABlpl/eLm
         QjZ6KwzDIodAMPWfH5QQbM1J2UIOyPyP2mEIL1JbEgNzdSNrQXgyaG36PYUkVTLwxD+t
         rdLsMlI0YVHMxsyhBPDzs6xlsV5ZPo4WtHq5+sgyaLz7SkyR7jhTIAcxI2BbGGY3hL05
         Q1IMldCDrBqsija5ivamkTA/A15PtMDog2H1C6UnKIl4oEEjmwcdVFHrV08y3lZpJnKx
         2g+w==
X-Gm-Message-State: ACrzQf0nl7OPTomfRhqYD7eeUapkDtVmaHuWi7HjgXDfdnGCp+McUdWH
        xLQwAHUs6mV+hEzFa5+izvf0hgfIIWpgv5NYLZ8=
X-Google-Smtp-Source: AMsMyM6Ra8JdRHgIpw/VcybC7lfZZVTD0cayKcHNWs+sta2G6ZPOnxkApw2rqVadP8ZV+QG+SvtE5Bb15JyMTtBpNXw=
X-Received: by 2002:a17:906:ef8c:b0:78d:96b9:a0ad with SMTP id
 ze12-20020a170906ef8c00b0078d96b9a0admr4638412ejb.529.1665298253581; Sat, 08
 Oct 2022 23:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221007084524.10712-1-jonathanh@nvidia.com> <Yz/9wrmdRQTAhIgS@orome>
In-Reply-To: <Yz/9wrmdRQTAhIgS@orome>
From:   Thomas Graichen <thomas.graichen@googlemail.com>
Date:   Sun, 9 Oct 2022 08:50:41 +0200
Message-ID: <CAOUEw12uicu=PDb9N7vCumKbePguHkLO=MBkcPmGnxHNtMN0tA@mail.gmail.com>
Subject: Re: [PATCH V2] clk: tegra: Fix Tegra PWM parent clock
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 7, 2022 at 12:21 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Oct 07, 2022 at 09:45:24AM +0100, Jon Hunter wrote:
> > Commit 8c193f4714df ("pwm: tegra: Optimize period calculation") updated
> > the period calculation in the Tegra PWM driver and now returns an error
> > if the period requested is less than minimum period supported. This is
> > breaking PWM support on various Tegra platforms. For example, on the
> > Tegra210 Jetson Nano platform this is breaking the PWM fan support and
> > probing the PWM fan driver now fails ...
> >
> >  pwm-fan pwm-fan: Failed to configure PWM: -22
> >  pwm-fan: probe of pwm-fan failed with error -22
> >
> > The problem is that the default parent clock for the PWM on Tegra210 is
> > a 32kHz clock and is unable to support the requested PWM period.
> >
> > Fix PWM support on Tegra20, Tegra30, Tegra124 and Tegra210 by updating
> > the parent clock for the PWM to be the PLL_P.
> >
> > Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> >
> > I have tested this on Tegra210 and boot tested on the Tegra20/30/124
> > platforms but please confirm if this fixes all the issues seen on these
> > platforms.
> >
> >  drivers/clk/tegra/clk-tegra124.c | 1 +
> >  drivers/clk/tegra/clk-tegra20.c  | 1 +
> >  drivers/clk/tegra/clk-tegra210.c | 1 +
> >  drivers/clk/tegra/clk-tegra30.c  | 1 +
> >  4 files changed, 4 insertions(+)
>
> Thomas, can you check this on Nyan where you were observing display to
> be completely broken? In case you don't have this in your mailbox, see
> here:
>
>         http://patchwork.ozlabs.org/project/linux-tegra/patch/20221007084524.10712-1-jonathanh@nvidia.com/
>
> Thierry

hi thierry,

i can confirm that this also fixes the problem on the tegra124 nyan chromebook.
backlight is working fine and can also be adjusted properly with this
patch applied
(and my revert of the breaking pwm optimization commit removed beforehand)

thanks a lot ... thus

Tested-by: Thomas Graichen <thomas.graichen@gmail.com>

best wishes - thomas

> > diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> > index a9d4efcef2d4..6c46592d794e 100644
> > --- a/drivers/clk/tegra/clk-tegra124.c
> > +++ b/drivers/clk/tegra/clk-tegra124.c
> > @@ -1330,6 +1330,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
> >       { TEGRA124_CLK_I2S3_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
> >       { TEGRA124_CLK_I2S4_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
> >       { TEGRA124_CLK_VIMCLK_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
> > +     { TEGRA124_CLK_PWM, TEGRA124_CLK_PLL_P, 408000000, 0 },
> >       /* must be the last entry */
> >       { TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
> >  };
> > diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> > index 8a4514f6d503..422d78247553 100644
> > --- a/drivers/clk/tegra/clk-tegra20.c
> > +++ b/drivers/clk/tegra/clk-tegra20.c
> > @@ -1044,6 +1044,7 @@ static struct tegra_clk_init_table init_table[] = {
> >       { TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> >       { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> >       { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > +     { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> >       /* must be the last entry */
> >       { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> >  };
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> > index 499f999e91e1..a3488aaac3f7 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -3597,6 +3597,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
> >       { TEGRA210_CLK_VIMCLK_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> >       { TEGRA210_CLK_HDA, TEGRA210_CLK_PLL_P, 51000000, 0 },
> >       { TEGRA210_CLK_HDA2CODEC_2X, TEGRA210_CLK_PLL_P, 48000000, 0 },
> > +     { TEGRA210_CLK_PWM, TEGRA210_CLK_PLL_P, 48000000, 0 },
> >       /* This MUST be the last entry. */
> >       { TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
> >  };
> > diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> > index 168c07d5a5f2..60f1534711f1 100644
> > --- a/drivers/clk/tegra/clk-tegra30.c
> > +++ b/drivers/clk/tegra/clk-tegra30.c
> > @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] = {
> >       { TEGRA30_CLK_VIMCLK_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
> >       { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> >       { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > +     { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> >       /* must be the last entry */
> >       { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> >  };
> > --
> > 2.25.1
> >
