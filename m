From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 06/15] memory: tegra: Setup interrupts mask before
 requesting IRQ
Date: Fri, 27 Apr 2018 11:36:36 +0200
Message-ID: <20180427093636.GH30388@ulmo>
References: <cover.1523301400.git.digetx@gmail.com>
 <dd3f80ce5a74c04b170303bceb4e0682de145678.1523301400.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CEUtFxTsmBsHRLs3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dd3f80ce5a74c04b170303bceb4e0682de145678.1523301400.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--CEUtFxTsmBsHRLs3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 09, 2018 at 10:28:28PM +0300, Dmitry Osipenko wrote:
> This avoids unwanted interrupt during MC driver probe.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--CEUtFxTsmBsHRLs3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlri7yQACgkQ3SOs138+
s6GgHQ/+Js5Rzmabnakj+umeNK2JoUJ8lz2QVd1cprk7ij8k0+tiwfsU/ZDmxVfF
HnYwD+nb4wA20gPgHq4u8xWrMKqFmaWRR6LDFYYdCxTHZWty6QizyCt/5FoO4YME
7qwXtNbBnomPpco1FUiw9k9MnGlR0P6m3OlruJJOrbugutasSKvmvAwEACXkaT4D
rOGjnhE1sBKgyUbHUEQ56QDVDSNVQXM+gMuZIECyebqhgtELQLX1wBnJPNBbwEg3
cR1/xpItNez6sFfsW6y0CZjdZR3DKZ8MhS1I49F3FStiBgVGGDpVjkHwOeZiN/km
yiiHwQbE3/ivQJZncpK/yuqN74aXhoC1H0z40Mue1Ge7DjbCjwzNLr+P6+dZTzcg
Upvjt+MnXXeiHh3VkTRm3lWf1pEFcC0wqzIx9InH0z8dboO1HOPXgQQ4nwGr9AWU
mJZ+vFm2ViYRCIXwm4n1NU2BrPBKoi3Wr4vyNo2nIjrGGe01+lZnXbl3ObMi00vO
W3QYHzY8XTjg9iJdZ7hSRDaM0dO94ndPRiizcrTziz9xCU053LsE0boRQqnqPkk6
T3XcE9uSBaZCEDF/J0fQaOEBG4vAB5R6yah2d+hb4iZfg1JgZiAEK9/9p9WC2uMC
/G8Og+UnwCd6hgKaTdgII1BBZIg0l6hCtINXrAjZrh25NxkjOEc=
=gW9g
-----END PGP SIGNATURE-----

--CEUtFxTsmBsHRLs3--
