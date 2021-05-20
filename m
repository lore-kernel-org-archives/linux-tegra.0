Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F9BC433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 19:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DCAB60E0C
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 19:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235501AbhETTJj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 May 2021 15:09:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:43712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234572AbhETTJg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 May 2021 15:09:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F98660FE8;
        Thu, 20 May 2021 19:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621537695;
        bh=z8L4oCBXjvffXYsBtw3x+DRK4fRDIPDgFEx1CMHmpPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bWydcwtw1iMbV1+JypJDPdk9CVyD6sIQC76c2/iKwBONip9AfpxVyv2a2jfbvHVEh
         QGwFuBEvuEZVWOPCZbpIwWACddUQReDqAN4mrJpoWH4hAdkx5FQLASj8Ew5VOdVgpg
         LpVRu880OHLGkmkpluS8nMpSv0/JZKso3SnO15BcJp3uIur7WoSkl2njWdKHCO0W3h
         XOG5QUUzsYaV6PdJO1KXuQwHai6Xuaknw+hsmZFKDdck2vt7nJFgLbUjMbIRFuWMcf
         F4nhPu+0e4FGaUJuoU1iCyJKcHkWU7Hbjts8pFA2XwBaSatl4LyqPwJO/Mi/9ah8q3
         jTSCn0iOlNZww==
Date:   Thu, 20 May 2021 20:08:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210520190812.GF3962@sirena.org.uk>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
X-Cookie: Offer void where prohibited by law.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 20, 2021 at 09:02:49PM +0200, Jaroslav Kysela wrote:
> Dne 20. 05. 21 v 19:50 Dmitry Osipenko napsal(a):
> > Squash all machine drivers into a single-universal one. This reduces
> > code duplication, eases addition of a new drivers and upgrades older
> > code to a modern Linux kernel APIs.

> > +static struct snd_soc_card snd_soc_tegra_wm9712 = {
> > +	.dai_link = &tegra_wm9712_dai,
> > +	.num_links = 1,
> > +	.fully_routed = true,
> > +};

> Please, could you also initialize snd_soc_card->components? It may be useful
> to pass the codec identification to the user space like:

> .components = "codec:wm9712"

Hrm, if this is important to userspace shouldn't the core be doing
something by default given that it already knows all the components
going into the card?

> The passed information should be consistent. You may look into the Intel ASoC
> drivers for the examples (card->components initialization). There are also
> hints about the number of connected microphones ("cfg-mic:2" - configuration
> with 2 microphones) or the codec purpose ("hs:rt711" - headset codec is RT711)
> etc.

This sort of stuff is more something that the card should layer on top.

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCms5sACgkQJNaLcl1U
h9ASfgf9HkitwSIVjMI1yhKeZnUTrueUtiYwFvJjlEJJnCnrsS2QMufsf1/0q6Bn
yfQQaL660jHo+gkzvnHz0+c+Ykd7HdPx7YRiwPQG33Sh2kva1MsGXa9Wvh+p+unZ
4rtVpcmIB3azj+sat9pKqOcjfLA0KVDA+COLeS+Yg6OVMq0RIAw+jQRQ+f4oYrlG
vqF2+bJe3GmE+N/SrrTpx1yYwnRMNEQKCA7o6e5FjaFJzASTo2XColBvEX29ttnc
7+Z7PTYRGnVlYWpH1JWY+LBd6UHc7YGGArlPeaxbHLUg/kICqq+jkQKBareaQysU
0VAdJa/rHULm49mE8NfMa45wGan8lA==
=P/CB
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
