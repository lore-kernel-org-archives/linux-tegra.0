Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D30CC4321E
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 09:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiKKJUu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 04:20:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbiKKJUt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 04:20:49 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAF465E7A
        for <linux-tegra@vger.kernel.org>; Fri, 11 Nov 2022 01:20:48 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id a13so6874527edj.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Nov 2022 01:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KQqlnqh61yDEivsgLuzXFgBFvWeIkle9538NvChEgG4=;
        b=eRHEStFUgdZI+TOEkzLgPNAUqr8je9PakORGJBpBvetm722q6+52mzO4PuK6UP2C9B
         y5QKHELjwoL/I5ZveEAoHNQYPUFH2gG9BiO6rNE0Zoi1U/NPdjDb6jXihqpiYnUK7uS7
         SaEgVVAc1rCLsO+PywRf34jY4cKkxjJ5rpb0iLv7Lx6icnPxIKkBSReqSNOAi5AyQqJr
         wfParI72b+nyrA1C6NNwYpO2mYi/F3sK4RXxqU2kGu5IcDipfl9TyQkhA6GnH0/P0zga
         4Pzu7HawlgloyguZmgsGbfP6pqVHW5N9NgfDTgsFvjn4zWaBEAPihtz4CQ3ui15zn27r
         jJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQqlnqh61yDEivsgLuzXFgBFvWeIkle9538NvChEgG4=;
        b=zYbcU5WH5L/wO5SIYdhgajAkIgSkJs4mF6F10Dw05dLlEfJQ71SjFSIXJFP8ofNK8T
         CZewnh1heJv0XRU+i6mDLcSqEEPribgZ6RqfwO8x50xf+9YGI6jpXvQ3/CaCXDOqNaF+
         EGOzKvwLw1ybtYDUMEGs6arnGO+DmgyDccUexKegguXAzCdTbMBUjY9gmSFZaPPsLMFE
         5m7Tc+2aHNpp/H81YuZ/8WwOnyfk8L1jbU48sTFKyjrkjSOilouUun90wTIIlQuicqzO
         C46Xr5PEof4pHP6X4byLE+dornSk81rn1gu0hz6BMCIPRbgdwj/B7WSgUuUDEsRXd79l
         ffng==
X-Gm-Message-State: ANoB5pkt06RtFYuLvFU+qO2NJRpWzfP1wCnz5nnYF1G2GPHBAsZIlFDo
        5Ms/YotiXuaY28iQgRWYosuBzlmpAMln1tTBmI1DYg==
X-Google-Smtp-Source: AA0mqf53QBR47pUgYWT2xVhbs/Lj4/kZl7NAGXQCY837HnfVAtbLsG6fA3g+X2q4OOQ/b93b11NyQoioTLD4pHwNxXU=
X-Received: by 2002:a50:ee13:0:b0:463:a83c:e0af with SMTP id
 g19-20020a50ee13000000b00463a83ce0afmr679526eds.158.1668158446767; Fri, 11
 Nov 2022 01:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
 <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com> <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
In-Reply-To: <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Nov 2022 10:20:34 +0100
Message-ID: <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Takashi Iwai <tiwai@suse.com>,
        David Airlie <airlied@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Lechner <david@lechnology.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-stm32@st-md-mailman.stormreply.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 10, 2022 at 2:05 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > > hook, but doesn't provide a determine_rate implementation.
> > > >
> > > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > > change the parent of a clock. However, the most likely candidate to
> > > > trigger that parent change is a call to clk_set_rate(), with
> > > > determine_rate() figuring out which parent is the best suited for a
> > > > given rate.
> > > >
> > > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > > used, and it doesn't look like there's any obvious user for that clock.
> > >
> > > If I recall correctly, that is the use case we did target for these
> > > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
> >
> > Hm I am trying to get that driver to work ... from time to time.
> > It's just that ALSA SoC DT has changed to much that it turns out
> > into a complete rewrite :/
> >
> > So in sound/soc/ux500/mop500_ab8500.c
> > I see this:
> >
> >         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
> >         if (status)
> > (...)
> >
> > and there is elaborate code to switch between "SYSCLK" and
> > "ULPCLK" (ulta-low power clock). Just like you say... however
> > a clock named SYSCLK or ULPCLK does not appear in the
> > code in drivers/clk/ux500 or any DT bindings so... it seems to
> > be non-working for the time being.
>
> It's definitely not working, but the corresponding clocks ("ulpclk",
> "intclk", "audioclk", etc) are being registered in ab8500_reg_clks().
>
> What seems to be missing is a DT conversion for these clocks, so they
> can be consumed properly. Right?

Yeps that and a few more things, I have a scratch rewrite here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git/log/?h=ux500-audio-rewrite

I remember Lee said he had audio working with the mainline kernel
on Snowball at one point, unfortunately I think that was before we
started with the DT conversions and then we probably broke it.

Yours,
Linus Walleij
