From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] soc/tegra: pmc: Initialise power partitions early
Date: Thu, 30 Jun 2016 12:17:32 +0200
Message-ID: <20160630101732.GG1776@ulmo.ba.sec>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
 <1467112844-26927-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z9ECzHErBrwFF8sy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467112844-26927-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--z9ECzHErBrwFF8sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 12:20:42PM +0100, Jon Hunter wrote:
> If CONFIG_PM_GENERIC_DOMAINS is not enabled, then power partitions
> associated with a device will not be enabled automatically by the PM
> core when the device is in use. To avoid situations where a device in
> a power partition is to be used but the partition is not enabled,
> initialise the power partitions for Tegra early in the boot process and
> if CONFIG_PM_GENERIC_DOMAINS is not enabled, then power on all
> partitions defined in the device-tree blob.
>=20
> Note that if CONFIG_PM_GENERIC_DOMAINS is not enabled, after the
> partitions are turned on, the clocks and resets used as part of the
> sequence for turning on the partition are released again as they are no
> longer needed by the PMC driver. Another benefit of this is that this
> avoids any issues of sharing resets between the PMC driver and other
> device drivers that may wish to independently control a particular
> reset.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 1f702538f8ec..64678ff2173e 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -788,7 +788,7 @@ error:
>  static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_nod=
e *np)
>  {
>  	struct tegra_powergate *pg;
> -	bool off;
> +	bool off, err =3D true;
>  	int id;
> =20
>  	pg =3D kzalloc(sizeof(*pg), GFP_KERNEL);
> @@ -819,6 +819,9 @@ static void tegra_powergate_add(struct tegra_pmc *pmc=
, struct device_node *np)
>  	if (tegra_powergate_of_get_resets(pg, np, off))
>  		goto remove_clks;
> =20
> +	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS))
> +		goto power_on_cleanup;
> +
>  	pm_genpd_init(&pg->genpd, NULL, off);
> =20
>  	if (of_genpd_add_provider_simple(np, &pg->genpd))
> @@ -828,6 +831,11 @@ static void tegra_powergate_add(struct tegra_pmc *pm=
c, struct device_node *np)
> =20
>  	return;
> =20
> +power_on_cleanup:
> +	if (off)
> +		WARN_ON(tegra_powergate_power_up(pg, true));
> +	err =3D false;
> +
>  remove_resets:
>  	while (pg->num_resets--)
>  		reset_control_put(pg->resets[pg->num_resets]);
> @@ -845,14 +853,23 @@ free_mem:
>  	kfree(pg);
> =20
>  error:
> -	dev_err(pmc->dev, "failed to create power domain for %s\n", np->name);
> +	if (err)
> +		dev_err(pmc->dev, "failed to configure partition %s\n",
> +			np->name);

This is beginning to look very spaghetti-like. Do we really need the
error message here? Could we instead add more explicit error messages
before the gotos above?

Thierry

--z9ECzHErBrwFF8sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdPG5AAoJEN0jrNd/PrOhxo0P/RBDvtwxbo99MoasW5EgUozF
zJRNLGJ/LZckXyzoVbYcBvG5dmjDedFo1txdUU88sdl1SSWChihbetO2N0U4L5OG
dX8sRJd6FfZnDPfGvk8Xj2sJ3mATK/YOGbTJjpAZq3HGbX/rdpjolvBaix98mbqK
vuTvfvFNUG8AZlHu8euIvG8Q3nt3uspMfvL2t3gykU5Fosch3MJvVWe2UnLbUMOc
yx5Q8wsa2DtNupXjQSdmKxF9B2mfTJ0pDqOA2W7SPJo3MGLnvLuepb7/TZdW9zpn
YuPZWcqQcsmaBt8pwJbWYVym9tCWGXFywrcaLiWln+JNArjIghXrEufizfd4e7Nn
7uqSgJv8NgBRE47YWYUbZwfL2MP15EDqKx0zEIGMLn0c0GAm4UPOL+18nRerYJIX
e+Y5eBqnktJvYehLKHwCmGjaQFsNrP5i6u6R+3M2rKF0QWs+ccK774/TUNRdChF3
0/8xLp6y4L61Xt7ZiXUSEbN/jXTevqJ19eiUuVKqD/9mhU+X+PFvsrnIDfnvXlSz
9a21Y1hwVGrO6FH8gt0+pRpWS6WgXYZ4vTfmr5669tRjV4xAR+eaL5nkvNAu6BVc
D8NimEkkCC7bLbOQRwRxiLFnYF/ApIS4bw2T+lG795qJsNGyAp/l10WCZJ2G93cJ
nTh/vkwJojhdfnEIH4gN
=4B7U
-----END PGP SIGNATURE-----

--z9ECzHErBrwFF8sy--
