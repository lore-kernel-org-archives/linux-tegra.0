From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] clk: tegra: Return the exact clock rate from
 clk_round_rate
Date: Wed, 28 Nov 2018 10:16:42 +0100
Message-ID: <20181128091642.GC17419@ulmo>
References: <20180925214940.15188-1-decatf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180925214940.15188-1-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Yang <decatf@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 05:49:40PM -0400, Robert Yang wrote:
> The current behavior is that clk_round_rate would return the same clock
> rate passed to it for valid PLL configurations. This change will return
> the exact rate the PLL will provide in accordance with clk API.
>=20
> Signed-off-by: Robert Yang <decatf@gmail.com>
> ---
> Changes in V2:
>  - Move input divider (m =3D=3D 0) check into the cfg constraints check
>    condition. Forgo adding WARN_ON and avoid using 0 input divider
>    all together.
>=20
>  drivers/clk/tegra/clk-pll.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+XPoACgkQ3SOs138+
s6HcChAAsJUmStXiyFMnv33/TdFkGug/68b2CmxssoFUhVF9wVVzofb9WwJJJ+Gk
J34qPXy+v+GgCofh0KYrKkb0Jpz6c8fog+sjmvwyCpplml7rAqw2wM4EAfMACAyT
Hnb3bxRKgmK62ccu9IpMNl/bvHhEyYuh0zsm41PPx9Tbp+VOK4FVBPt2BFnPFpDY
rTf5riPCOzW7dhb63zSiNkx4SzRygBKDOiQOPQc28DJyKj4JLNVEoCB86mr7gqMU
BOt/1N8+aGUoO5uhs9BaijEZqexnvIn2H80lVjNRbdfz6PnXK7LWQbFgErvYApHn
2GLWiXPGK/HVC8YelBWvh+qL/CB/N0b6TCEq0WSd24zFJeY3EOXuGiqne0nNs/w3
rBLg9XjNIe3xs/sJ2h1Hj+LpIlnS7og0J60mE6psQRuYYr5JX86QhMcUnNx+N8DD
JywJpvLOaFLJONPwblmKwBqFRMc/EgBrOvQSjLqimyuH85JdgGNtgbYvLzq+pXMC
QWHhk7iizPslaS8ElgUsgB2jok5OlSGY5CAmieuOK7/AJQjGB0EDYFTPQi0wqrBu
qhdDUHwWPlVMbOx/0GreRS1RzNwp4mkfc6ZgZ5a2yEkFEtOI7vbOKLh1DIfq9LV9
RGiuLRnS0ChtoWI+6OugOTBH1h2wzBBvfkljGsyN07JqkZ9fbI4=
=vg/F
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
