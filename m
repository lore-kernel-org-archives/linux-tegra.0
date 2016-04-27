From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160427 build: 1 failures 15 warnings (next-20160427)
Date: Wed, 27 Apr 2016 13:24:38 +0100
Message-ID: <20160427122438.GK3217@sirena.org.uk>
References: <E1avM7P-0002LM-3R@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0ZgrbDZlPgfR0nDk"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1avM7P-0002LM-3R@optimist>
Sender: linux-next-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0ZgrbDZlPgfR0nDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2016 at 10:50:51AM +0100, Build bot for Mark Brown wrote:

Today's next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../drivers/phy/tegra/xusb-tegra210.c:1721:3: error: label 'out' used but not defined

caused by 44f5d38eaa21d (phy: tegra: Add Tegra210 support).

--0ZgrbDZlPgfR0nDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIK+EAAoJECTWi3JdVIfQvyUH/jwLinmAn6TXhQx+GLL8Q/98
HLvtWqboXwtKCMSq7yhMTWFp+gEuaB+SQe/I7xIC6hAjfs07dj4xf+EbMkOR4VjP
UzJi9dNLiXiKyKcdlRIUSfSY+NyGJI/TvUckxlkrVWcsmYlmOgfetlIJYhs8mUBr
/XE8IOvcUjoDGYrDX3aLgn6aLBiXOdAZa7jNaHbpVfLAwAFUpEUTxqDDSithuYC2
RZ0Kw8epZP5Cu/kqhWGKmiIALu2zbm7IJBcTUZ5p0ERbNYSmqOOoiQCobRkXPjRH
LoDlWnTPjDMNFy2W1u6vrOFp2XfkmwGITjRIaixTu0R8gD2Xzz7R52GK8tIjwac=
=mZbC
-----END PGP SIGNATURE-----

--0ZgrbDZlPgfR0nDk--
