From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-core: Fix probe deferral following prelink
 failure
Date: Wed, 3 Apr 2019 10:47:32 +0700
Message-ID: <20190403034732.GA5748@sirena.org.uk>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
 <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
 <20190402043509.GQ2059@sirena.org.uk>
 <2d8a0569-b821-c0c0-af39-d3863d17f47f@nvidia.com>
 <20190402091955.GE2059@sirena.org.uk>
 <10d454a4-e1e1-3a4b-8400-acd680d75a3d@nvidia.com>
 <20190402093159.GF2059@sirena.org.uk>
 <3053ef10-ba36-ee88-4ca0-d1e39c0ea25c@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3053ef10-ba36-ee88-4ca0-d1e39c0ea25c@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 02, 2019 at 10:44:34AM +0100, Jon Hunter wrote:

> Right I see it in -next. Sorry but what I am asking is if you are
> planning to send as a fix for v5.1? Maybe you have not sent out the
> fixes yet for v5.1 and so wanted to check.

It is in my for-5.1 branch so I am intending to send it for v5.1.  Like
many maintainers I have separate branches in my tree and in -next for
things that are intended for the next merge window and things that are
intended to be sent sooner, in my case I have both for-linus and
for-next branches, plus both topic and numberd for-x.y branches which
feed into those.

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlykLNMACgkQJNaLcl1U
h9BmVAf/ZcwA45Zda/LkY1pBNBCgd87JEXIVkqXKtQGiEnPfpPgVjzZGI2dUGdHy
k2vP6x3i2/4tVQnihVezBNfuGh1wWSPiQD2WDBZURzn0TVpn0ACqD5m0c293f123
nUTXSjC6W2En40vRwC9TJZw5TlDFm6Dz1p+Wrrcj9BU6g/8T0vCo9rjTFT2EBq0D
i1VG7PojtINPWgLE/r2B/rewpPDtaxCMHRoA9/dKbpIcadXhX8aIbHlr95d6KqpN
m2XStNxFVjNjQyF4V+K7oeS/dBeVjVccoP3cj5E8brUicgXfV6IEVgIVciQ/R6lT
0qwd/+GKsvLlgwuy9Im4iSriS8pTvQ==
=zXM5
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
