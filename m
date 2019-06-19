From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/8] clocksource/drivers/tegra: Drop unneeded
 typecasting in one place
Date: Wed, 19 Jun 2019 10:18:34 +0200
Message-ID: <20190619081834.GE3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3O1VwFp74L81IIeR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--3O1VwFp74L81IIeR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:54PM +0300, Dmitry Osipenko wrote:
> There is no need to cast void because kernel allows to do that without
> a warning message from a compiler.
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--3O1VwFp74L81IIeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J79oACgkQ3SOs138+
s6GsNA//XZ5xYkaF3xgvvfM6XBRUNXdQj6smE51BlUt55h4LccLgovbawGnHOly2
uKrBXYhyTwM1zeJSNK5jRJa60M6gHUhUOvYd604sIRPNkuLlTSDmmbCp9phROWGz
Z5TMuXTUVtG0EswN1Li3CUbAa1bDpPR0XHTLLlJMkIkzdA4DUGww01OFMN+CmBDJ
WQ4JHr7s6asbpkPr51jyVDMYLrv+eAlaTVPN96kp2zA/oD0XcknoMPjfh/XOUsM8
xciWMj6Et9Z4ztt6acI1hXG5pblA+vyR3DIcO85nEH5eA3DF7sRitnUZCoUZxfr+
lVJi/isfxMDxyUaiUdgzKJMGds4qUsIBPx6qnVFcfC4kDBKrSAVDYrFJ5UgvrHQ8
JT0+mrI1OQYK3kEut48/eO0H6tTB1QYzdMPlYbA1G9r1hGvUFLio6EwQchJjoOmG
R2Ee6FoEJUNL2gkwMaitHtEkr2nZGSSPEU6asi61dvHB0Iw9ETg+CJ7U0mwWGlHQ
g29XcPbp7hxA8LYhvQpsTPO78HagayPv4qNgOJVK+FgXYDuDeKxmjSveBJGJaQD0
mE79WYfawkGf++ZI6zvdjlNxwf8HzbHFonNTWXyIiCn43S2kvVj9p3L8EsP4+it/
Oo9c4yD15Wyd/HfxeoztGzd2mDRyTcY6K82BggklOmB+qR6i+uI=
=rquA
-----END PGP SIGNATURE-----

--3O1VwFp74L81IIeR--
