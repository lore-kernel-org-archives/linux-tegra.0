From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 1/5] i2c: tegra: Sort all the include headers
 alphabetically
Date: Thu, 31 Jan 2019 13:45:16 +0100
Message-ID: <20190131124516.GI23438@ulmo>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K1SnTjlYS/YgcDEx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--K1SnTjlYS/YgcDEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2019 at 10:16:23PM -0800, Sowjanya Komatineni wrote:
> This patch sorts all the include headers alphabetically for the
> I2C tegra driver
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V3/V4/V5/V7/V8] : Removed unsued headers in tegra I2C
>  [V2] : Added this in V2 to sort the headers in tegra I2C
>=20
>  drivers/i2c/busses/i2c-tegra.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)

See my comments on v7, with those fixed:

Acked-by: Thierry Reding <treding@nvidia.com>

--K1SnTjlYS/YgcDEx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS7dwACgkQ3SOs138+
s6EcJw/9FbCydnBpjEw7YyZZAdsHzuhaWPusrNOovbr90qroGXYYgwVETl7ibbpj
03EjkzfcXv/uj3IsC9LX0xm7ydrEurN5H5QWqkzABO4WX84lWWJd7yjFDNtbJCQ1
5nRnUXUkberz+reWBMNlp6BB0Nk/b+RUFoR82GaczKIeopqqO1CaWS8AVn42aifm
dHyssstPwb8WOgDLL3cBpJtvcCg+VvcaK7ThmPF8XTmexvzT16vzfJSVe3XXFM8l
gM+hxmSnyJw95WADVA68MAvK9HDyIj2X+PKqIkrzVhXsuvBc0CdXR2D/lWoO1A7z
NSNsvC1i8YZoExoQ8I2DpTXdKWhTze8Kk7KRqwA4FiDSoKk1IjurhXBHMcPeykyZ
z8Gm2CCqucCgnoa16Sm3vYZBKs3+ZzYeBJHQ3OHO266v7jSLh2XSF7ek34BWcuH+
fgDHFTRC977f+E4Uu+R0ZbCKxXSbaDWFRA1E/cnp8mLKXhz2mRDHzQnXSNdGBusz
TqFQJTzQQXSPNN5UtOkfOBVQ1fhn/oONGJdQr+Noas5V25oVolU56M0yiQT/nbb3
micX1EowVca+YT36p3niIG+21pRGWCGNHX/iXdzBL6Hnsmx3R9bVP14eOslqq1VR
lgT59glRXRGELcl1UOfptGM+d0bRBRDXtnHYY0oXFXBH6KRj+5I=
=Ma3T
-----END PGP SIGNATURE-----

--K1SnTjlYS/YgcDEx--
