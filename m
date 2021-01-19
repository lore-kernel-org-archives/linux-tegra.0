Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEC5C10F04
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA7C522AAA
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389382AbhASRfR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 12:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387620AbhASRfP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:35:15 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974A6C061573;
        Tue, 19 Jan 2021 09:34:34 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id 143so22577739qke.10;
        Tue, 19 Jan 2021 09:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p8tNnzd4y2KJS/reGqJBwxz1GlmlM3VOZcIG7Ld49os=;
        b=UURw0+UWpe4aBZNtUILUdnwTTMO1z8WUJzSWZTGPjiftc+oGCvSwte9YNL490jXhJF
         ZMnFHWbUZvKenzQacEy16CV4FbJg46GhIqUCnIO0yYn9wMYUJGFlVcXLubVyORs4HKsP
         mLqAhRyj5m8cezm5qBLezA//8tM/X71+wPf+pPCQpUBxJMijzB/j9uhLLPT79r0c1QTS
         Gt3nRfyb3gZvePzLJUZYU1ZIDIsP1+lCmEYFlB69v48s30WDoXChwvgMl2R1vd22NIIy
         v7UVbFSGJenO3HurJUww+WAwho2Q23TYuIC2HUknAjJdreqZSa91bxJgEBzKIZcMgk6R
         2eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p8tNnzd4y2KJS/reGqJBwxz1GlmlM3VOZcIG7Ld49os=;
        b=JnTFkuA2sJU1HQSPW/RwOMn2M9J1t9TX/J8ys0aG4JFwR8kPmcMhP7Dfnf0eIUwNix
         EhKh+s8q5K4CR1mGw0NEE3eCKNJURM0we7u+kSJjni5x77S/yAmL0bSZV4twgZse2Npg
         dzANyNic6dlXffwP9QRaKzOCyd138xaKD2Gb8qxvzRvy9AyiwkIagi8yMB036WO0Siex
         6Iy3IDmgxiU5GtZDx6+rRjXO0yDwBGrcP21/Ngm4K2nIbWJltDiNp3GYRQRScskIaQO1
         UYBx6l2SfRNYngE46N4wx4+60YqMxUbkj8BVqVjSwCY8tmvpu+OZ9iyWsMMEstuygHWW
         5CZw==
X-Gm-Message-State: AOAM533fjzysptvgTjGqt5x6wxDFG65QRVIb6et0AgOybX6Hp3B/6o4h
        wI6FwT9xX8SnTCINO9rRZQI6iqLHw5U=
X-Google-Smtp-Source: ABdhPJxnBhaCimzZgQX62uN2ZXLlnTeBj4V52zrzuS8102pthkDV0hPys/7gF47J3dljrPwAm+Gz6Q==
X-Received: by 2002:a37:a110:: with SMTP id k16mr5462338qke.320.1611077673854;
        Tue, 19 Jan 2021 09:34:33 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k141sm13376514qke.38.2021.01.19.09.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:34:32 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:34:30 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
Message-ID: <YAcYJpb/Zf7IKZp5@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-6-digetx@gmail.com>
 <YAG4aFADwo7dh/oR@ulmo>
 <c2f3d149-0781-3d0a-1d68-f6820386e84d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gssaDyI1tNRHdKsC"
Content-Disposition: inline
In-Reply-To: <c2f3d149-0781-3d0a-1d68-f6820386e84d@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gssaDyI1tNRHdKsC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 03:02:38AM +0300, Dmitry Osipenko wrote:
> 15.01.2021 18:44, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jan 12, 2021 at 03:58:34PM +0300, Dmitry Osipenko wrote:
> >> Assert hardware reset before clocks are enabled and then de-assert it
> >> after clocks are enabled. This brings hardware into a predictable state
> >> and removes relying on implicit de-assertion of resets which is done by
> >> the clk driver.
> >>
> >> Tested-by: Peter Geis <pgwipeout@gmail.com>
> >> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
> >>  sound/soc/tegra/tegra30_ahub.h |  1 +
> >>  2 files changed, 17 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_=
ahub.c
> >> index 4dbb58f7ea36..246cf6a373a1 100644
> >> --- a/sound/soc/tegra/tegra30_ahub.c
> >> +++ b/sound/soc/tegra/tegra30_ahub.c
> >> @@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct devi=
ce *dev)
> >>  {
> >>  	int ret;
> >> =20
> >> +	ret =3D reset_control_assert(ahub->reset);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	ret =3D clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
> >>  	if (ret)
> >>  		return ret;
> >> =20
> >> +	ret =3D reset_control_reset(ahub->reset);
> >> +	if (ret) {
> >> +		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
> >> +		return ret;
> >> +	}
> >> +
> >>  	regcache_cache_only(ahub->regmap_apbif, false);
> >>  	regcache_cache_only(ahub->regmap_ahub, false);
> >> =20
> >> @@ -462,7 +472,6 @@ static int tegra30_ahub_probe(struct platform_devi=
ce *pdev)
> >>  {
> >>  	const struct of_device_id *match;
> >>  	const struct tegra30_ahub_soc_data *soc_data;
> >> -	struct reset_control *rst;
> >>  	struct resource *res0;
> >>  	void __iomem *regs_apbif, *regs_ahub;
> >>  	int ret =3D 0;
> >> @@ -475,22 +484,6 @@ static int tegra30_ahub_probe(struct platform_dev=
ice *pdev)
> >>  		return -EINVAL;
> >>  	soc_data =3D match->data;
> >> =20
> >> -	/*
> >> -	 * The AHUB hosts a register bus: the "configlink". For this to
> >> -	 * operate correctly, all devices on this bus must be out of reset.
> >> -	 * Ensure that here.
> >> -	 */
> >> -	rst =3D of_reset_control_array_get_exclusive(pdev->dev.of_node);
> >> -	if (IS_ERR(rst)) {
> >> -		dev_err(&pdev->dev, "Can't get reset: %p\n", rst);
> >> -		return PTR_ERR(rst);
> >> -	}
> >> -
> >> -	ret =3D reset_control_deassert(rst);
> >> -	reset_control_put(rst);
> >> -	if (ret)
> >> -		return ret;
> >> -
> >>  	ahub =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
> >>  			    GFP_KERNEL);
> >>  	if (!ahub)
> >> @@ -507,6 +500,12 @@ static int tegra30_ahub_probe(struct platform_dev=
ice *pdev)
> >>  	if (ret)
> >>  		return ret;
> >> =20
> >> +	ahub->reset =3D devm_reset_control_array_get_exclusive(&pdev->dev);
> >> +	if (IS_ERR(ahub->reset)) {
> >> +		dev_err(&pdev->dev, "Can't get reset: %p\n", ahub->reset);
> >=20
> > I didn't notice that the prior patch already introduced this, but I'd
> > prefer for this to either be %pe so that the symbolic error name is
> > printed, or %ld with PTR_ERR(ahub->reset) to format this in a more
> > standard way that can be more easily grepped for and parsed.
>=20
> This is already fixed in v2. Good catch anyways, thanks.
>=20
> > It also seems like the prior patch that converts this to use
> > of_reset_control_array_get_exclusive() is a bit pointless now. Why not
> > just move to this directly instead?
>=20
> These are two independent changes. The previous patch fixed the missing
> resets, this patch changes the hardware initialization logic.

But moving to devm_reset_control_array_get_exclusive() isn't really part
of the hardware initialization logic change, right? So it's not strictly
related to the rest of this patch.

Anyway, I don't feel strongly about it being part of this patch, so feel
free to keep it here.

Thierry

--gssaDyI1tNRHdKsC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHGCYACgkQ3SOs138+
s6E2pw//fpPwc7rRFuwtI+fpGYhR9bkSJGAsW8c13WeGUXpmIBG24DNPTMa5Dwjr
dunxgN+tl4MRPvegW2vqWIDy/Gasxcp1eCryiYSal2W3UsDSb3B8DO/6zo4l0jUF
XjLRslsDLVlXPvtiKLTeIAV6xbWmvjXvYLv0kZ6KrPj61PmSdejglDq+WqhG+mZu
qYodRgqRCByrfjVhR1pvTtARbSZl+iQLsb9RhomzsB/bJUITiIu6+/ZVi+r/i6aR
xj7mUu9YKkTmpVVi4Wv480Tuq2+u5sZc569FA6utPWAEelPdiFpDJrEjz6eq9Ouj
ImjgMqZwFsERkJaAb35BU1eXn+VlylLjn8L+pzfGj2zW3TLrQ++Be7UY3iftlhrD
qYssfr1rQmElNd1UuCWDDF5fyp1T423mxupboWmrai4iIAe+aUmgXlZZfHQaaI60
5I4niaNihm9R4ZzBlkGvS7p93/dmSHY5MMAyTDMLrGXzt076MGcWezBk6P/jAW+m
/hwWBXaRnf1E1v0BYX89P8pHUIr07LhmeYTu8IJGTna0IiLexmDrzh1U7gnw/MUk
SbRFMYKCm4x5P3DSk9AnKo7R4yWavYohy9GMFVCQA48HLKAukKWLiDc1ayalNPf/
Cb7exez/22oxAeTG+OWRH26o41R727BtXkl+SCP0tLj6X9urpQw=
=ejHG
-----END PGP SIGNATURE-----

--gssaDyI1tNRHdKsC--
