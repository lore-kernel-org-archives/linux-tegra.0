From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch] drm/tegra: sor - missing unlock on error
Date: Mon, 14 Jul 2014 08:53:48 +0200
Message-ID: <20140714065346.GF2081@ulmo>
References: <20140611070608.GD16443@mwanda>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1543486475=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140611070608.GD16443@mwanda>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--===============1543486475==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2014 at 10:06:09AM +0300, Dan Carpenter wrote:
> We should unlock before returning the error code.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 27c979b..64f57fa 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -516,7 +516,7 @@ static int tegra_output_sor_enable(struct tegra_outpu=
t *output)
>  		if (err < 0) {
>  			dev_err(sor->dev, "failed to probe eDP link: %d\n",
>  				err);
> -			return err;
> +			goto unlock;
>  		}
>  	}
> =20

Applied, thanks.

Thierry

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw356AAoJEN0jrNd/PrOh3g4P/0+STeMG3I1Zs65+h5idfkRH
jmRcj22nV2yVJUOAm3YiBLpQJAUim5yl6S4n+4eTEsBaWSFDYCalO3jJN1JtxEbJ
K3d+yEarK2bZiE3uDWYIJUH6fNOWvv7ahVj7T7aQuBtgbQv20M8LX1riFNt6WzjS
gzrwCs6DvmjIuo+MF9sBD9w7sRDprHfzWnnDTLd21LvJXdsZzbfTc/nLOEwrTZZi
NWA4UZmXmEmD25Yx92mWCVRvwgki7DHnomK9vI6ySzbcmsF5PE8fcB74XEfAKSSL
dmJiI+7BIATr5/m01r3SZ4UIfFxh6HENwhh1t8fE564FpQzXSsYqt6n4aIL5/owo
4m5crN8czZkyFLM7BuFZVvkPd6or4oIBveNFXsqUm1DCDhGrHgwP0ck2Tqa5WG26
LBcfkesVeRM98eC9/E6D+gkuApV0dAFOdIysNcrWBO1ErU2PH6EnYnTz3t1U94VK
Epr3DLzQpmOuvOisI7VV2GOzL2v7TYpRUp48aJBkcPmy5yUvbj+Os4IQLj8FdN7V
uIYSVCDYlxc2NY7JnfumibeNEZIt2DEzz8qgDP5wA3YwdgavsdD3mBVIZ4NZJ0KF
Ae3FLSUWckoSAWk1/vx3pW9nTwwMe6XkhJfO662rm9lmjdTeaK7snger9ZzwCssA
eU2wbr2uLo7I73Hw8gpJ
=rzRF
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--

--===============1543486475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1543486475==--
