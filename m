From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] amba: tegra-ahb: mark PM functions as __maybe_unused
Date: Fri, 26 Apr 2019 17:20:33 +0200
Message-ID: <20190426152033.GB19559@ulmo>
References: <20190426145617.2342824-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426145617.2342824-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 04:56:03PM +0200, Arnd Bergmann wrote:
> clang warns about an unused variable when CONFIG_PM is disabled,
> since it is only referenced from an #ifdef:
>=20
> drivers/amba/tegra-ahb.c:97:18: error: variable 'tegra_ahb_gizmo' is not =
needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>=20
> Rather than trying to get the #ifdef right, remove it and
> use __maybe_unused here, which is less error prone.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/amba/tegra-ahb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Shouldn't tegra_ahb_gizmo have the same annotation, then? I do see that
it's "used" in tegra_ahb_probe() as part of an ARRAY_SIZE() expression,
but that technically doesn't mean that it would need to be emitted, but
it might be enough to shut up clang?

Or does the __maybe_unused not get propagated?

Looking at the code, I guess we could save a bit of memory if we didn't
allocate memory for the zero-length "ctx" array for !PM since that's no
longer needed. But then again, we've recently changed 32-bit Tegra to
forcefully enable PM, just like we did for 64-bit Tegra, so that's moot
anyway.

Do you want me to pick this up, or would you rather stash it into ARM
SoC directly? If the latter:

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
> index b0b688c481e8..3751d811be39 100644
> --- a/drivers/amba/tegra-ahb.c
> +++ b/drivers/amba/tegra-ahb.c
> @@ -170,8 +170,7 @@ int tegra_ahb_enable_smmu(struct device_node *dn)
>  EXPORT_SYMBOL(tegra_ahb_enable_smmu);
>  #endif
> =20
> -#ifdef CONFIG_PM
> -static int tegra_ahb_suspend(struct device *dev)
> +static int __maybe_unused tegra_ahb_suspend(struct device *dev)
>  {
>  	int i;
>  	struct tegra_ahb *ahb =3D dev_get_drvdata(dev);
> @@ -181,7 +180,7 @@ static int tegra_ahb_suspend(struct device *dev)
>  	return 0;
>  }
> =20
> -static int tegra_ahb_resume(struct device *dev)
> +static int __maybe_unused tegra_ahb_resume(struct device *dev)
>  {
>  	int i;
>  	struct tegra_ahb *ahb =3D dev_get_drvdata(dev);
> @@ -190,7 +189,6 @@ static int tegra_ahb_resume(struct device *dev)
>  		gizmo_writel(ahb, ahb->ctx[i], tegra_ahb_gizmo[i]);
>  	return 0;
>  }
> -#endif
> =20
>  static UNIVERSAL_DEV_PM_OPS(tegra_ahb_pm,
>  			    tegra_ahb_suspend,
> --=20
> 2.20.0
>=20

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzDIcEACgkQ3SOs138+
s6Ft6A//b0cxvRY6nJ9Yet6Wg/uddl2eSzPlON4FpiwM+h+j1a0NKr3DkrMhzAe7
wUMCnuIej+9XHDhTnZKere+C8MBWOkAJVVtaUKG57PXLIz8kn6bdpExhyon2M868
xl2iWRVObyFf8mdJiqx0LQ0gLNgWTEoLojXi6p+9wF3MwmGwoJhSsNjgOkPmfDCb
fccwgyBcMGKOei9gkiZKBQcgb4NTQNEJeR38FXFskoU2Rv6LvyE4e1riSh9BQ3hR
wjMhJLqVYwGBnGLJAc6rhoxhJa9eiUbn8cwgsVNwc5B+agUuM/RGPx5+dHPjjbso
Cl/BTerUwpW0uG4Fp01kyBIr7DvJHqZxND93c8lNktuaq3u/ADhaeKjUz5qi88jG
TJhnJ5gYPd92wpqGOUsqE1IiZGcq/rLx+mxGAxhVYsE0cCGJYj+WLGadi+GiVpca
/z7I5+NwTDcRszm/KuyOsCRMo1l7jp+tdueJHl12UtmyAt87CR9QaXyzqor38Sdc
dcvXnA0M/5fzDwaN4O1HzMLl9rlP8bXnvCtBnZll/x8VjRB01GxQPdoBPuC4ogxb
fljEbTg9FjW7Ib1530KlCAqQ+U+Oas87hk0R7m3MjcYCWi7tAAj+oWWzGoSPI78o
3bdELnmBOj8J3f8x77llHPAb/GNZoQK4Rwt702PmGIr1Tstf8/U=
=xwIS
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
