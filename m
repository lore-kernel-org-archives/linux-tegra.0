From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 5/6] soc/tegra: regulators: Add regulators coupler
 for Tegra20
Date: Sun, 12 May 2019 18:06:27 +0900
Message-ID: <20190512090627.GO21483@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-6-digetx@gmail.com>
 <20190508075706.GW14916@sirena.org.uk>
 <9756d8ca-0778-5185-5b6b-3168d63819ec@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DRfr/2Y1Zz/5r+Kb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9756d8ca-0778-5185-5b6b-3168d63819ec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DRfr/2Y1Zz/5r+Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 04:10:58PM +0300, Dmitry Osipenko wrote:

> 1) CORE and RTC have max-spread voltage of 170mV.
> 2) CORE and RTC voltages must be higher than the CPU voltage by at least
> 120mV.

This seems like it should be easy enough to describe - we just need
minimum and maximum spreads between pairs of rails.

--DRfr/2Y1Zz/5r+Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzX4hIACgkQJNaLcl1U
h9A5TQf/blHJSlXwfDTeB7y4cB421y3ptVKoJD6BlCl1CMMkfYxarqomyCybWbOs
0Y15BUjBQCWrggGmMc05Z1gXwp4NqIzfrKWq7FXpUccH5lukp50IBMauQn9eDxsT
pXP7ZwWNHvo7UXDODHoNahiAhBbLdOi6YnLKp9EarO4YD/TJ83NbqdtceQ1m8Upr
z65FekjYssye1HXZWAqrOKl1eW/0UnvqAUuzJNuKmpeIHuppCNRuH/2SMM07f3WH
b5B2oZZMSsFiVcpvTtO2iD4Zv01beijvLa5q05cozYGTGp4bjcA1keiMGMNwI8Po
1jmOEzyyxn0nBbcQUuEU34pMIl+jbA==
=cTGZ
-----END PGP SIGNATURE-----

--DRfr/2Y1Zz/5r+Kb--
