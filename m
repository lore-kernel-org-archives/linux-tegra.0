Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0287C4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jul 2021 12:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78388604D7
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jul 2021 12:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhG3McE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Jul 2021 08:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238693AbhG3McE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Jul 2021 08:32:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8D2C0613C1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jul 2021 05:31:59 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m9RgA-0001JJ-Uj; Fri, 30 Jul 2021 14:31:54 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m9Rg9-0007mm-Hz; Fri, 30 Jul 2021 14:31:53 +0200
Message-ID: <048851b26d012069ecaf52286ec48d2b4e38571d.camel@pengutronix.de>
Subject: Re: [PATCH 3/7] drm/imx/dcss: Enable COMPILE_TEST on all ARM64
 platforms
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
Date:   Fri, 30 Jul 2021 14:31:53 +0200
In-Reply-To: <CAMuHMdWGf2rh2qF3WapeRcTo6nPfs06oLUq7aX+2d_g=6275uA@mail.gmail.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
         <20210728153736.15240-4-laurent.pinchart+renesas@ideasonboard.com>
         <CAMuHMdWGf2rh2qF3WapeRcTo6nPfs06oLUq7aX+2d_g=6275uA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 2021-07-30 at 14:10 +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Wed, Jul 28, 2021 at 5:37 PM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > To extend test coverage, relax the dependency on ARCH_MXC to also enable
> > compilation when COMPILE_TEST is selected.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpu/drm/imx/dcss/Kconfig
> > +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> > @@ -3,7 +3,8 @@ config DRM_IMX_DCSS
> >         select IMX_IRQSTEER
> >         select DRM_KMS_CMA_HELPER
> >         select VIDEOMODE_HELPERS
> > -       depends on DRM && ARCH_MXC && ARM64
> > +       depends on DRM
> > +       depends on ARM64 && (ARCH_MXC || COMPILE_TEST)
> 
> As you now have two depends statements, I think this would be easier
> to read by maintaining a strict separation between "hard" and "soft"
> dependencies:
> 
>     depends on DRM && ARM64
>     depends on ARCH_MXC || COMPILE_TEST

I would let (ARCH_MXC && ARM64) stay together, and as Tomi suggested,
lift the ARM64 limitation if COMPILE_TEST is enabled:

	depends on DRM
	depends on (ARCH_MXC && ARM64) || COMPILE_TEST

regards
Philipp
