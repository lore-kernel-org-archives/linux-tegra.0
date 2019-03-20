From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next] clk: tegra: Make tegra_clk_super_mux_ops static
Date: Wed, 20 Mar 2019 09:44:02 +0100
Message-ID: <20190320084402.GC6043@ulmo>
References: <20190319153504.23072-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190319153504.23072-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 11:35:04PM +0800, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
>=20
> Fix sparse warning:
>=20
> drivers/clk/tegra/clk-super.c:124:22:
>  warning: symbol 'tegra_clk_super_mux_ops' was not declared. Should it be=
 static?
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/clk/tegra/clk-super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyR/VIACgkQ3SOs138+
s6EQjxAAoaL/KeouycZmBXVUKnEMaYJ6vzftGYyTCO2OJ5T/A3BMGxpJE9o1X+Sm
0nvDonljrcoyVwP96Rrn6sMQaoOZd2tsM92U1T9nb0yBWD001TfDgjL02U9nVvf1
DLNodMHtX3SDeDJJLWi7tAd05XekdXwjiZpg3JgEkYjUVXX0HHRdpZsJTlJT7JmS
U+OnsXZugvo6OsviDkAxQd1JkYahukNVn7JgYunNf47zkodkhjD7oZflnJqkozgB
1Vz9zHgKdlQlYd9YigLMwQ+VX1/VcBnOVyxT0ACk4pGqw6+l0Y6q8tu5AB6AXQWK
xGRZSuedIQsQdondYAjXr1KhOEl2ZyHjD/fOWFrbXOhwTPrJI2KyZlF6UgDC0Lvm
rBVBYfx2x8mgemFb7Ne09wx3rGBodJD6UqoV/QfrytFxfCzy/aoC6L7tQbDuN+Vq
OUKSCBESPtzx1jJRVUVRMfov3/6nb0+qBbuE0ZtFW1ZcYBalJjCjzrW1AensY2fg
NRdqF2zZhcL7A0G4ABXAyr5xgmYgm2HoSTrqPir46UTP1SXZAxKaGL8/RBog+C2E
TsZ+nkeMn/D2aDBT5fR2QfKm2J6CulMCuiybP8nG+8JLnA4WjmkfLFhDas8GEn6q
1Wa5Z8AGdUukXTrRbAOgCGJg504URghNTlaTZrPpsWg4xq6XmNQ=
=EN85
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
