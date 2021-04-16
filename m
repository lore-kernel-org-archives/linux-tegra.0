Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C42C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 15:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD6D2611C2
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 15:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235698AbhDPP4E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Apr 2021 11:56:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235329AbhDPP4E (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Apr 2021 11:56:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 246AE6113D;
        Fri, 16 Apr 2021 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618588539;
        bh=JEJzzQ+tdLRQxK9H7PGh2vMSOhSroN+byz9JFysxcq8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uxWk475Q0YILN9uDHYFrNZQ8ukASmPIutEUmTOAFlTe984ffKwEEMIVVCub3ibQu0
         KBv33XMEEdYyEE8BBnNRgIgnsAQ/7bhuLIRKoY7DC8nsino2sFLfD0tlkVZS6k/Bbp
         cag8aUF27tY/+zPe4R1crDKp3W5QV/BvhkyhaM/FLShmEi5Xv/gHEGYFTWZBdUDfrI
         fut3nOygjzko26A7GbnNfADKExCr3HeXcxH27I+4eiQggI5GmedKEj1JC6LLxc8pDJ
         k2KwJMm4khokBX7Pi7YlxxCaQazItCB7f6gpYDbv+VhfJ7TMRqmHHc/he8sQvssyLm
         757hrI1pJqOYQ==
Date:   Fri, 16 Apr 2021 16:55:15 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: Propagate errors on too
 many links
Message-ID: <20210416155515.GG5560@sirena.org.uk>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
 <1303b932-5226-0ee6-8f41-fd896908b045@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RDS4xtyBfx+7DiaI"
Content-Disposition: inline
In-Reply-To: <1303b932-5226-0ee6-8f41-fd896908b045@nvidia.com>
X-Cookie: Snow Day -- stay home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--RDS4xtyBfx+7DiaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 03:49:34PM +0100, Jon Hunter wrote:
>=20
> On 16/04/2021 08:11, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The DAI counting code doesn't propagate errors when the number of
> > maximum links is exceeded, which causes subsequent initialization code
> > to continue to run and that eventually leads to memory corruption with
> > the code trying to access memory that is out of bounds.
> >=20
> > Fix this by propgating errors when the maximum number of links is
>=20
> s/propgating/propagating
>=20
> > reached, which ensures that the driver fails to load and prevents the
> > memory corruption.
> >=20
> > Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Code=
c/Platform")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--RDS4xtyBfx+7DiaI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB5s2IACgkQJNaLcl1U
h9AY5Qf/fknqCPfwrUTMIAXJVdVHFkSouCqz2DiWvpg5eePtbojW0X1Ot5RQ0Pwn
OaDVL5DdzXQ/gVk2EOp2Piv2NNlAnKGNuEApKMhpI64XGRIgXAp32ZoTJwqHCfnV
GEL7zMXWr0/ddIpDxnB75RRfM85U1so+KFC1zYX0MQJkr6WxQeMn5/vNxUfg8XiP
EU63NDsfcsaklSP6CoZeFNFfqcyHbueD5ZLUAdx6tQ3g8lklzIPbVQvDMpkUz4OU
CpC5HQbj0IZlATSPQsk5fkhv8yud+MJXH+k1YmQeRdEU5u8p00odp8FKd6uyS/+D
bNmX4wcz08PitzQEH8IWBG0nJ6t18w==
=tM5Y
-----END PGP SIGNATURE-----

--RDS4xtyBfx+7DiaI--
