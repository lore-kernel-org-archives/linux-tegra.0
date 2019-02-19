From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 2/2] i2c: tegra: remove multi-master support
Date: Tue, 19 Feb 2019 18:12:55 +0100
Message-ID: <20190219171255.GD14351@ulmo>
References: <1550551825-1245-1-git-send-email-skomatineni@nvidia.com>
 <1550551825-1245-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550551825-1245-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, talho@nvidia.com, wsa@the-dreams.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 08:50:25PM -0800, Sowjanya Komatineni wrote:
> multi-master support is defeatured on Tegra210 and Tegra186 due to
> known bugs.

Nit: "Multi-master" because it's the beginning of a sentence.

>=20
> This patch removes multi-master support for Tegra210 and Tegra186
> i2c hw feature.

Nit: i2c -> I2C, hw -> HW

Acked-by: Thierry Reding <treding@nvidia.com>

>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index e6851904acc1..26f686bc3491 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1409,7 +1409,7 @@ static const struct tegra_i2c_hw_feature tegra210_i=
2c_hw =3D {
>  	.clk_divisor_fast_mode =3D 0x19,
>  	.clk_divisor_fast_plus_mode =3D 0x10,
>  	.has_config_load_reg =3D true,
> -	.has_multi_master_mode =3D true,
> +	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
> @@ -1434,7 +1434,7 @@ static const struct tegra_i2c_hw_feature tegra186_i=
2c_hw =3D {
>  	.clk_divisor_fast_mode =3D 0x19,
>  	.clk_divisor_fast_plus_mode =3D 0x10,
>  	.has_config_load_reg =3D true,
> -	.has_multi_master_mode =3D true,
> +	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D false,
>  	.quirks =3D &tegra_i2c_quirks,
> --=20
> 2.7.4
>=20

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxsORcACgkQ3SOs138+
s6HCUw/9FoLedx9d+wNnvZGbn/SxVMxrq5MaFIKY1jbBlaa35hM42BkQg7bdVmBE
mAzDLFTX5/V1afIPovDVrN4ZV7sGMsVRsbua51/9lY/tw2AAuDj5qDIdRRBfht2M
iOVqk5uZtbN74t+GAgZbF86QHupzr0z3byd62TvWWsheErhx6y6njyJ2l2VnYVok
VtDxOVH0T2TaFIXoYSXTZ8Tq4/NeJ8b7Q6+Pac/OonkixZ38ltqXnZuq4yiXUF2k
K6RQriy49xl3FNV+PTEKw4p+6RQy4Mn42r2jbKE9dfqONljcBs3Xc+nulkiUwNs0
avUEeD/gdEP1Iv1bYXxnA0TPeg5Ww56xh1x2epy0+OMvzAY5dPfICuSdLmkfupmA
oI7lzPQN5pdu5ihDS0DRfe8BzfjaHCtx6xtyW3Q0AoffClzywE41aPYc2blGu4g7
NW8cmE3rHQGS7qUUqwU1ZlcesIkKFco5gS9gaejSIxdZg0Kvh2mUmfaGKA1S9JnH
qZfx9Cb3fs7jVNzdYme1rBJiq69Lu1e9ofeOCPoovqIcWBSY3X7pS/Ou/eMUjRlu
a7PqJ5FJm7eWzbSqU40hkTM0JjGf/I71rMWKmf03UuDPVb/JWucy5RFIXiz3Mxe3
BiSrYuqx4/2nnJpWHtukVPBetXDNaJe3NrGd/hdWDBGTgEmDop0=
=LvUh
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
