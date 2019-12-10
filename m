From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: Fix double-free in tegra_clk_init()
Date: Tue, 10 Dec 2019 13:22:00 +0100
Message-ID: <20191210122200.GC2703785@ulmo>
References: <20191210020512.6088-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191210020512.6088-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 05:05:12AM +0300, Dmitry Osipenko wrote:
> It's unlikely to happen in practice ever, but makes static checkers happy.
>=20
> Fixes: 535f296d47de ("clk: tegra: Add suspend and resume support on Tegra=
210")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Good catch:

Acked-by: Thierry Reding <treding@nvidia.com>

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3vjegACgkQ3SOs138+
s6GOoRAAidaUWN9p+mEK9ws/uUDXI6Xmy+ARBVvNkFB/tvhUIuI/gLHE+dpeLwsh
pmatWTRMujK3ILr1DJ2hojSZU0nEMdceLztyP2u0aiyoDYYUeI+WSb7Jcqd+9Bq4
ug6ZwkWs++U+S1FGNxETPiXm2xFLSWTPa/+n4fvC5bMTcbHV3yU98j7h20MEiFkr
6V1o86caDHp4mFDeJd4+3G6j8KHV1CPK3UycWed6A6GNJVxbVdF4+y+T/itMduIo
lMDaIsNFm6+LqNVDyQoYJRPmPYS/ClgZk5Hz6/ZJgyTzDEYeJkDaod8bJaVrpt/U
qzdn3u+C9M8xX68hOe8NQxZi5my/tSIx/G8RpK2fNDIc8kN0Mi8Bo8hKZjSXNB6X
6tippzUuQ2Nw1MoGcOgsCPKyCY6SfsOnZG4UGqsuGkPD/OXNvhWTr51v7TsAhCvs
p0ElbZrFy2n6Yw15LCHyJoDf+ovGOZrKNVfz7jZrG0buloGux8Iu+RInQKLPexGm
Hv7k1O8x5/k3ALRUo3fZG6mvt0CPdh06tLkbuX0fZQ2zmgfxTRLbaNAbjk8g9XWR
xV+qUkhDcEKQ8zkkGiO7IcWh+hQUzsPZU4Bn4eknIa6TShCZHG8a/+vR0kxLNlOu
F3ZpPW1PKNiKgFtDjnNhIzFWz4VC07Po4VrayaR9HGpFn5xxVmE=
=5N0X
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
