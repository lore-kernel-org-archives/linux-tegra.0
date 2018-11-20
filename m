From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] thermal: tegra: add get_trend ops
Date: Tue, 20 Nov 2018 16:38:33 +0100
Message-ID: <20181120153833.GB28796@ulmo>
References: <1542705077-29697-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542705077-29697-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 20, 2018 at 05:11:17PM +0800, Wei Ni wrote:
> Add support for get_trend ops that allows soctherm
> sensors to be used with the step-wise governor.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
> index ed28110a3535..d2951fbe2b7c 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -488,9 +488,43 @@ static int tegra_thermctl_set_trip_temp(void *data, =
int trip, int temp)
>  	return 0;
>  }
> =20
> +static int tegra_thermctl_get_trend(void *data, int trip,
> +				    enum thermal_trend *trend)
> +{
> +	struct tegra_thermctl_zone *zone =3D data;
> +	struct thermal_zone_device *tz =3D zone->tz;
> +	int trip_temp, temp, last_temp, ret;
> +
> +	if (!tz)
> +		return -EINVAL;
> +
> +	ret =3D tz->ops->get_trip_temp(zone->tz, trip, &trip_temp);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&tz->lock);
> +	temp =3D tz->temperature;
> +	last_temp =3D tz->last_temperature;
> +	mutex_unlock(&tz->lock);
> +
> +	if (temp > trip_temp) {
> +		if (temp >=3D last_temp)
> +			*trend =3D THERMAL_TREND_RAISING;
> +		else
> +			*trend =3D THERMAL_TREND_STABLE;
> +	} else if (temp < trip_temp) {
> +		*trend =3D THERMAL_TREND_DROPPING;
> +	} else {
> +		*trend =3D THERMAL_TREND_STABLE;
> +	}
> +
> +	return 0;
> +}

This looks like a reimplementation of the get_tz_trend() helper. Is
seems like that helper already has everything we need. Perhaps this
isn't working because of-thermal installs of_thermal_get_trend(), a
function that returns -EINVAL if the driver doesn't implement the
->get_trend() callback.

Perhaps a better way would be to do something like this in
thermal_zone_of_add_sensor():

	if (ops->get_trend)
		tzd->ops->get_trend =3D of_thermal_get_trend;

That's similar to how ->set_trips() and ->set_emul_temp() are set up
and should make sure that get_tz_trend() will do the right thing for
all drivers that don't implement a special ->get_trend().

Thierry

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv0KnkACgkQ3SOs138+
s6FoDw//UG4y7JbUCh7i9E6+FBy3aReerfGVH6JVQUw3M7bi0oIlfXumecDdq8Mn
BcP781sws3DgLFXl4wJ1pFhPLWpxuV8ArNS0cRL+Cw53oTQ5WeUXipVTKaC6+wRb
j7aGgABz3FfWdCJpFlSrNHbfd3S+FS2Gq+Uo96cUKDGiLCtOx/Bzt5HC8MuQBl4p
T+Q4wdzNy+Zfha4kdGFtGvuuVU8sZsJgEFoRhA1AyD/cOSNnfq0KghTGZZ+SWiol
rZPuNcWivE7UsrW+f9RNGOJG1yWKb/XS3OArUDo1nIRv94HUxODA/2isIO2HOT7A
pRUpynXJ++Wjo46pwdCJYMkF1nrzyHlfY02VDIWopVf5dsfBuhYz979RF5S3bmQT
+nXP8EIZU8l3chdGwHPTQCfE8yRHhcNSEvrTqqLKEdJ7xCkpXQZCaLnanlfO5K3D
xq/o9Uh1PNTGKEcXypeK93o9HRE3BrcxXXV7Bp4vjnz1MNa4R0NDU12+/IPC6uCC
WnykaKgFI+OqCdTqhV70mUKg3YN3BvGtX9oi0oKKdc9OV8dtOfSKMh1uJJuJi0SS
Py6k3ZUI8BsMxCvdr9sY946byCLej6oNkMD0WbzpqHY+clDCZp3uBL4Z9K9jffRI
+URAjV9fVZAVrdLWr8O+hbSCmO9hPryuJRRI85s8kQ05BHwqjWQ=
=JRWz
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
