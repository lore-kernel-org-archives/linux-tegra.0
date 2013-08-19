From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 tegra-cbootimage] Add automake option subdir-objects
 to prevent warnings
Date: Mon, 19 Aug 2013 22:33:17 +0200
Message-ID: <20130819203316.GE5191@mithrandir>
References: <c0f44202ad8a959b1bd4c93f43c1dc42@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c0f44202ad8a959b1bd4c93f43c1dc42-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2013 at 10:10:20PM +0200, Stefan Agner wrote:
> The SoC specific code is in subdirectories which leads to warnings in
> newer
> automake versions. The option subdir-objects prevents those warnings.
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>=20
> Sorry, was in vacation. I could not reproduce the message Thierry sees
> on
> my automake 1.14 installation, however, the option make sense as far as
> I=20
> understand its meaning.

Yes, automake 1.14 doesn't warn about it, presumably because it makes
sure to select AM_PROG_CC_C_O if subdir-objects is enabled. I can
reproduce the warning by downgrading to 1.13.4, though.

>  configure.ac    | 1 +
>  src/Makefile.am | 2 ++
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/configure.ac b/configure.ac
> index ccd0a55..9b83a21 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -10,6 +10,7 @@ AC_CONFIG_HEADERS([config.h])
>  # Checks for programs.
>  AC_PROG_CXX
>  AC_PROG_CC
> +AM_PROG_CC_C_O
>  PKG_PROG_PKG_CONFIG
> =20
>  # Checks for libraries.
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 6fcc0d8..6fecfc7 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -1,3 +1,5 @@
> +AUTOMAKE_OPTIONS =3D subdir-objects
> +

I don't remember if I mentioned it before, but I've seen a lot of
projects that keep these options in the configure.ac file (in the
AM_INIT_AUTOMAKE command). The GNU documentation isn't specific
about which variant is preferred, so either way:

Reviewed-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSEoEMAAoJEN0jrNd/PrOhnnEQAI9QWK0cDFc7LatAdpx1JVbt
dbtudFpOenxhVSETgKgmYkcNhl8q6XIU2ip1X68gqb490Iym7w1HTC2iA76jLnod
PHOgZhW92ji6IPMhzsEKAtMKJeJ266+mbADaLj9EETy0rT9Iuu06EzGM12j1qZDv
oLYfg1IKwp/QlkstBULm9UI3PtIjJeXCZLzmutcnXOfc4UEdJsLcqe2Vhs5A/c6P
HUlPTp7rxc2rlyaYodIWxPlcPpo9x4bcUsgexnNEZOQlvXlhXK7aJEOnDqolhbvT
Xa3yauQSaN8drbPihDArCeYKYbxV53GzHkMeLXLZJRdrwpa7kSPV5dKQr6jHtsKz
glGL4FTB+nqTWHjHgghGjheteSfldTuuKAb6JR/4STwNGSYiA57rXNrcaqZZqbQM
m+BG1Qd1MTOzSbF8ElWhwGDGGLD4gHebrK3VjYw+0gHiBAa+Qfb2edMcdK0z3NO2
WWdCNaB51V2TAmjEnXI8YNom6YgldrrO92D+XSRo6/IPT+HwpPI1Ungn5xfEQYzQ
lC70rOwK4bcYXSXD2AbMKEnkT+N/bpeKmEzl9uwTnUU/8twLgrWJvk/AeyoBn036
W1Rz3sfSzFkZsGKJPNPWVnYIh2ff5LmAT0sqPdjV7N6uNQfFE8Dv11e7PbtndLl9
faaBa3tH5mDeXEzphjvj
=6RwX
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
