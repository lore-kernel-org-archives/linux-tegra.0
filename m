From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/3] thermal: tegra: parse sensor id before sensor
 register
Date: Wed, 28 Nov 2018 11:25:20 +0100
Message-ID: <20181128102520.GC20723@ulmo>
References: <1543383877-20555-1-git-send-email-wni@nvidia.com>
 <1543383877-20555-4-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543383877-20555-4-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 01:44:37PM +0800, Wei Ni wrote:
> Since different platforms may not support all 4
> sensors, so the sensor registration may be failed.
> Add codes to parse dt to find sensor id which
> need to be registered. So that the registration
> can be successful on all platform.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 46 ++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
> index 375cadbc24cd..79e4628224d7 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -1224,6 +1224,44 @@ static void soctherm_init(struct platform_device *=
pdev)
>  	tegra_soctherm_throttle(&pdev->dev);
>  }
> =20
> +static bool tegra_soctherm_find_sensor_id(int sensor_id)
> +{
> +	int id;

You might want to make this and the sensor_id parameter unsigned int to
match the signedness of the ID in the specifier arguments and the sensor
groups.

Thierry

> +	bool ret =3D false;
> +	struct of_phandle_args sensor_specs;
> +	struct device_node *np, *sensor_np;
> +
> +	np =3D of_find_node_by_name(NULL, "thermal-zones");
> +	if (!np)
> +		return ret;
> +
> +	sensor_np =3D of_get_next_child(np, NULL);
> +	for_each_available_child_of_node(np, sensor_np) {

Aren't we leaking np here? I think we need of_node_put() after
of_get_next_child() to make sure the reference to the "thermal-zones"
node is properly released.

> +		if (of_parse_phandle_with_args(sensor_np, "thermal-sensors",
> +						 "#thermal-sensor-cells",
> +						 0, &sensor_specs))
> +			continue;
> +
> +		if (sensor_specs.args_count !=3D 1) {
> +			WARN(sensor_specs.args_count > 1,
> +			     "%s: wrong cells in sensor specifier %d\n",
> +			     sensor_specs.np->name, sensor_specs.args_count);
> +			continue;

This is odd. You check for args_count !=3D 1 but then WARN on args_count >
1. Shouldn't both of these conditions be the same?

> +		} else {

Also, since the above has "continue;", we don't really need the else
block.

> +			id =3D sensor_specs.args[0];
> +			if (sensor_id =3D=3D id) {

It might not be worth to store the ID in a separate variable, we could
just do:

	if (sensor_specs.args[0] =3D=3D sensor_id)

Thierry
> +				ret =3D true;
> +				break;
> +			}
> +		}
> +	}
> +
> +	of_node_put(np);
> +	of_node_put(sensor_np);
> +
> +	return ret;
> +}
> +
>  static const struct of_device_id tegra_soctherm_of_match[] =3D {
>  #ifdef CONFIG_ARCH_TEGRA_124_SOC
>  	{
> @@ -1365,13 +1403,15 @@ static int tegra_soctherm_probe(struct platform_d=
evice *pdev)
>  		zone->sg =3D soc->ttgs[i];
>  		zone->ts =3D tegra;
> =20
> +		if (!tegra_soctherm_find_sensor_id(soc->ttgs[i]->id))
> +			continue;
>  		z =3D devm_thermal_zone_of_sensor_register(&pdev->dev,

I'd would prefer a blank line after the if block for readability.

>  							 soc->ttgs[i]->id, zone,
>  							 &tegra_of_thermal_ops);
>  		if (IS_ERR(z)) {
>  			err =3D PTR_ERR(z);
> -			dev_err(&pdev->dev, "failed to register sensor: %d\n",
> -				err);
> +			dev_err(&pdev->dev, "failed to register sensor %s: %d\n",
> +				soc->ttgs[i]->name, err);
>  			goto disable_clocks;
>  		}
> =20
> @@ -1434,6 +1474,8 @@ static int __maybe_unused soctherm_resume(struct de=
vice *dev)
>  		struct thermal_zone_device *tz;
> =20
>  		tz =3D tegra->thermctl_tzs[soc->ttgs[i]->id];
> +		if (!tz)
> +			continue;
>  		err =3D tegra_soctherm_set_hwtrips(dev, soc->ttgs[i], tz);

Same here:

		if (!tz)
			continue;

		err =3D ...

Thierry

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+bQ0ACgkQ3SOs138+
s6F/cQ//Vf8Nl9UGrETe7X0iojhxbFD3lElHpm9N8PLev8elRoyKjTDs5ixDFsry
Qv4+/5MpR/rsOGyAQ2t1ACR9Sy7n3juoqIisAZTXYTbxA8n9/j/Zq5zesL5Z2I4p
2HeRLtaFl186YNU9yQtcJsg6TwW+o3SwDRm+49XkQ0xopbcB+3p0dm8J55dOhnMz
F4bYrs3qoG+49i1EhL8oYhk5APdPxIg8TtWePXdEkZgVZ+v/VTuBoXHn/9HnCcOk
RAozYT8AB5wr3elLoXaQN/ijKZOEBPRmQoZ/BmbUVAwJd2G4tmEEy3WlSibU4C1d
VQgUW0JUr6/+v6Q1ohs/H2m9bnq/x9VbjoAI40IlJoPhvv2TZMGIWc2uj1vdJD6k
NuD87kmI+WgiiFOOE9ZpMy4RT7MTepBLpJICruz2ekY+RAbry/yK7/jfclTXWTtK
Ck+CaTm/cja/CEW3OfJ3dJvbgGFN52N6wOy/DUntlOsIWqtmFamvRbK0SgmyVV0q
3axq+c2dCZ3uHqWE8UKsobmDCXGue73j9vqCb+3o4hVfqKNQcw60J7EnzXN6FUhS
Lcc5MuvHidcBbOlbgQMxx3QEYhTKY/HnzO4p+omifourqHOxbEjf1QV5EoyW40DU
H+ozEkLZcB7igniaCR2QqBcgMdWjnDg2KAKxPP0b6IiSsUO/nwQ=
=w2OA
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
