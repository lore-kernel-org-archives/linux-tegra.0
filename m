Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C882C43219
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Nov 2022 13:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiKJNF5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Nov 2022 08:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiKJNFz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Nov 2022 08:05:55 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1288873758
        for <linux-tegra@vger.kernel.org>; Thu, 10 Nov 2022 05:05:54 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id y4so1365159plb.2
        for <linux-tegra@vger.kernel.org>; Thu, 10 Nov 2022 05:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
        b=GVZ09h+ngHWOecbTC/uzghXW93HVi79Hc3aHUMBuHut0K+MRP4qjrmbxOsy9wAvyhh
         CzAf4wAUsz2LX8ScnTSnBYBlU0zD4SfZXHjTGLx4odMNe2HTZmWoc8/O0MjERSTJDuKQ
         9UeL9YNFV2iAuj4M769TxWHJzx0wEKM1UD/fL8Quarzgi8/jAHx03TmKPyEcNniVs1JP
         E1bQ9YyT5yBnS4K6hTH0QDyjNMb9vjtJqKa6/m2IeBhMmf0jPp66hTlfQCyxBUHnorSo
         4QxzB8BVVnzEGtFh63S81NhnvCx7MGrBaQEPEUdQo8KV1MCY/puvxsLONjSQ8GgFephe
         xQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
        b=8FOlIaKrDrVy0lTwX5UzZWrSwrqvqqBuX1f7Vd+j0yAF5AOwv2gTpNEBeXRDhUBZSt
         K1pnFjmJLtl1xdcGx11RZGT6idGUKibz94aOrtdnRXPhnc71XawuH47lUKutrILCtxNV
         myvkoFvcOm3bJaFRG94Uso621wV8jif4TPhd48c2Tf7JhoSyZuSLRerJcwDsQSUDPYGo
         rar8B63H+HEg20bORTB1idM5LquYFvPcsARSBI9CVM9qipJuVYxKkPuRLa54oqFI0iDH
         jykR+5qCiqBL327Tr0c1AnVpqe/AL58s0qfr51nkK71aaptKBBWaOeX0toEX6YfAR5Zl
         qV3Q==
X-Gm-Message-State: ACrzQf0PXg9NH4qr8liwdSMNPMZNDxLkc+c+0L78u7vdt7BqKGhLDLS0
        eX5nX5DXn2K7r5ge+uqwBdb61wFXzQTjxLuH1iCgRA==
X-Google-Smtp-Source: AMsMyM4ntafpxKu1kZoVYdCyuwK4y2qgGm0PDcBHChl8r8c0pj7m0JmQ6SHmodBY/Un25AY0R73awNrQX1GtCyrtwGQ=
X-Received: by 2002:a17:903:100c:b0:186:63a1:3b5d with SMTP id
 a12-20020a170903100c00b0018663a13b5dmr65965693plb.148.1668085553525; Thu, 10
 Nov 2022 05:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com> <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
In-Reply-To: <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 10 Nov 2022 14:05:16 +0100
Message-ID: <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To:     Linus Walleij <linus.walleij@linaro.org>
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
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > hook, but doesn't provide a determine_rate implementation.
> > >
> > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > change the parent of a clock. However, the most likely candidate to
> > > trigger that parent change is a call to clk_set_rate(), with
> > > determine_rate() figuring out which parent is the best suited for a
> > > given rate.
> > >
> > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > used, and it doesn't look like there's any obvious user for that clock.
> >
> > If I recall correctly, that is the use case we did target for these
> > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
>
> Hm I am trying to get that driver to work ... from time to time.
> It's just that ALSA SoC DT has changed to much that it turns out
> into a complete rewrite :/
>
> So in sound/soc/ux500/mop500_ab8500.c
> I see this:
>
>         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
>         if (status)
> (...)
>
> and there is elaborate code to switch between "SYSCLK" and
> "ULPCLK" (ulta-low power clock). Just like you say... however
> a clock named SYSCLK or ULPCLK does not appear in the
> code in drivers/clk/ux500 or any DT bindings so... it seems to
> be non-working for the time being.

It's definitely not working, but the corresponding clocks ("ulpclk",
"intclk", "audioclk", etc) are being registered in ab8500_reg_clks().

What seems to be missing is a DT conversion for these clocks, so they
can be consumed properly. Right?

Kind regards
Uffe
