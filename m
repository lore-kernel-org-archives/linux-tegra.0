From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 02/10] thermal: tegra: combine sensor group-related
 data
Date: Wed, 13 Jan 2016 15:31:23 +0100
Message-ID: <20160113143123.GB2588@ulmo>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com>
 <1452671929-32740-3-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452671929-32740-3-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 03:58:41PM +0800, Wei Ni wrote:
> Combine sensor group-related data structures into struct
> tegra_tsensor_group. This provides a single location for
> sensor group data storage.
> More sensor group data will be added in subsequent patches.
>=20
> Get rid of T124-specific PDIV/HOTSPOT hack.
> tegra-soctherm.c contained a hack to set the SENSOR_PDIV and
> SENSOR_HOTSPOT_OFFSET registers - it just did two writes of
> T124-specific opaque values.  Convert these into a form that can be
> substituted on a per-chip basis, and into structure fields that have
> at least some independent meaning.

This reads as two completely separate commit messages. Should the patch
be split up to separate out the two logical changes?

> diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/thermal/teg=
ra/tegra_soctherm.c
[...]
> +static struct tegra_tsensor_group tegra124_tsensor_group_cpu =3D {
[...]
> +};
> +
> +static struct tegra_tsensor_group tegra124_tsensor_group_gpu =3D {
[...]
> +};
> +
> +static struct tegra_tsensor_group tegra124_tsensor_group_pll =3D {
[...]
> +};
> +
> +static struct tegra_tsensor_group tegra124_tsensor_group_mem =3D {
[...]
> +};
> +
> +static struct tegra_tsensor_group *
> +tegra124_tsensor_groups[TEGRA124_SOCTHERM_SENSOR_NUM] =3D {
[...]
>  };

These look like they should all be static const.

> @@ -168,7 +268,7 @@ struct tegra_soctherm {
>  	struct clk *clock_soctherm;
>  	void __iomem *regs;
> =20
> -	struct thermal_zone_device *thermctl_tzs[4];
> +	struct thermal_zone_device *thermctl_tzs[TEGRA124_SOCTHERM_SENSOR_NUM];
>  };

Does it make sense to use macros here for the number of zones? I suspect
that since you do parameterize the Tegra210 support that will be added
later on will have a different maximum number, in which case macros will
not work very well.

But perhaps I'll see how you solved that problem in a later patch.

Thierry

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWll+7AAoJEN0jrNd/PrOhXZUP/i4/LP8XjqZlGn7KOVricwqf
Ff/YB1hNH4k7vwhaT489IB/22vZKx0ONgtZm/7WzZrjpg4P5dkp78z2DNhsKc7iq
R7DuCcg9euUiuaZB0azRIOCwtwvZ+QGnLbSP/DbHBpOE/NTIu2eco/J8fDmILZ8L
Hnkyd/hjhtC+AtQPRWpjTl77bz2e/mfS77N15xTYzo/i5v+zgsePoMzYnbMTaVba
+CLyy6S7h1lmWNy7IYOgcwjEfVZt0AvsmkLOjPoFEGO4l+q+fN5Lkh1EBUmDFPT2
JzgjNPqDh9rgmOdYH/FyPyoWXhOjg+JRt4H9Zejk7Hj29iQ7FpxSAvKcS/J1ttsy
DYx6FKwP20ncTUTysh0vhC2A2eaT3kKBbG2sqo3HWUgplaseoTVcNM1uxmMUBxaE
gC7GAGwNPmK9gyLpbE6C3SoegknOmJR1ZefmxYOiNBx1TBCIX6gGOS02A9oRL2Q0
rgpXtU/BLkwenl6ROernCsS3idJ30TGBr1sD5aIsYyY2z+a+q4TTBEugg44EgNym
EYdS2Yf10ZE/4ZLiG/q3t5t7b93txYRDjLAc0aqqgQu02Bhel6c059Udwd9ybzF8
a9WKdbPo9jcWjvI3dCabujKvDHVYUl0U2rC13A60RacK6aCXbuGZITdqfIFSVZhC
x0deha26qLAAq87tZxWM
=uZZf
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
