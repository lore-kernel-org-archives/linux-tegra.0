Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20785C433E6
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0056264F8F
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbhCCX7y convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Mar 2021 18:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236616AbhCCMVT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Mar 2021 07:21:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D939C061788
        for <linux-tegra@vger.kernel.org>; Wed,  3 Mar 2021 04:10:09 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lHQK5-0002tf-66; Wed, 03 Mar 2021 13:09:49 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lHQK2-000228-HX; Wed, 03 Mar 2021 13:09:46 +0100
Message-ID: <f581865a299091371a8450349e23ffdc8abb7b37.camel@pengutronix.de>
Subject: Re: [PATCH v1 5/5] ASoC: tegra30: i2s: Add reset control
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 03 Mar 2021 13:09:46 +0100
In-Reply-To: <cbb1f0d4-ddc5-733d-896d-dd76ce01ca69@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
         <20210302112123.24161-6-digetx@gmail.com>
         <cbb1f0d4-ddc5-733d-896d-dd76ce01ca69@gmail.com>
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

Hi Dmitry,

On Wed, 2021-03-03 at 11:28 +0300, Dmitry Osipenko wrote:
> 02.03.2021 14:21, Dmitry Osipenko пишет:
> > The I2S reset may be asserted at a boot time. Tegra30 I2S driver doesn't
> > manage the reset control and currently it happens to work because reset
> > is implicitly deasserted by the Tegra AHUB driver, but the reset of I2C
> > controller should be synchronous and I2S clock is disabled when AHUB is
> > reset. Add reset control to the Tegra30 I2S driver.
> > 
> > Note that I2S reset was always specified in Tegra30+ device-trees, hence
> > DTB ABI changes aren't required. Also note that AHUB touches I2S resets,
> > hence AHUB resets are now requested in a released state, allowing both
> > drivers to control the I2S resets together.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
> >  sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
> >  sound/soc/tegra/tegra30_i2s.h  |  1 +
> >  3 files changed, 47 insertions(+), 4 deletions(-)
> 
> ...
> > @@ -579,7 +587,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
> > +	ahub->reset = devm_reset_control_array_get_exclusive_released(&pdev->dev);
> 
> Thinking a bit more about this, it looks like we actually want something
> like:
> 
> 	devm_reset_control_array_get_exclusive_released_named()
> 
> that will request resets by given names and in a given order, similarly
> to devm_clk_bulk_get(). This will be very handy for both Tegra audio and
> GPU drivers. I'll prepare a v2 if there are no objections.

I do have an untested reset control bulk API patch that I've just never
finished, because I had no user. I'll send you an RFC, let me know if
you can build on that.

regards
Philipp
