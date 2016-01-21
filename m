From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 05/11] thermal: tegra: add T210-specific SOC_THERM
 driver
Date: Thu, 21 Jan 2016 15:25:46 +0100
Message-ID: <20160121142546.GA32301@ulmo>
References: <1453111426-12356-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453111426-12356-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 06:03:46PM +0800, Wei Ni wrote:
> Add Tegra210 specific SOC_THERM driver.
>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/thermal/tegra/Makefile            |   1 +
>  drivers/thermal/tegra/soctherm-fuse.c     |  11 ++
>  drivers/thermal/tegra/soctherm.c          |   6 +
>  drivers/thermal/tegra/soctherm.h          |   4 +
>  drivers/thermal/tegra/tegra210-soctherm.c | 181 ++++++++++++++++++++++++=
++++++
>  5 files changed, 203 insertions(+)
>  create mode 100644 drivers/thermal/tegra/tegra210-soctherm.c

This looks pretty good, just a few minor nits...

> diff --git a/drivers/thermal/tegra/soctherm.h b/drivers/thermal/tegra/soc=
therm.h
[...]
> index 1ac66cafb392..bd0f03bc9d80 100644
> --- a/drivers/thermal/tegra/soctherm.h
> +++ b/drivers/thermal/tegra/soctherm.h
> @@ -108,5 +108,9 @@ int tegra_soctherm_calculate_tsensor_calibration(
>  extern struct tegra_soctherm_soc tegra124_soctherm;
>  #endif
> =20
> +#ifdef CONFIG_ARCH_TEGRA_210_SOC
> +extern struct tegra_soctherm_soc tegra210_soctherm;

I would've expected this to be "const".

> diff --git a/drivers/thermal/tegra/tegra210-soctherm.c b/drivers/thermal/=
tegra/tegra210-soctherm.c
[...]
> +static const struct tegra_tsensor_group tegra210_tsensor_group_cpu =3D {
> +	.id				=3D TEGRA124_SOCTHERM_SENSOR_CPU,
> +	.name				=3D "cpu",
> +	.sensor_temp_offset		=3D SENSOR_TEMP1,
> +	.sensor_temp_mask		=3D SENSOR_TEMP1_CPU_TEMP_MASK,
> +	.pdiv				=3D 8,
> +	.pdiv_ate			=3D 8,
> +	.pdiv_mask			=3D SENSOR_PDIV_CPU_MASK,
> +	.pllx_hotspot_diff		=3D 10,
> +	.pllx_hotspot_mask		=3D SENSOR_HOTSPOT_CPU_MASK,
> +};

I prefer single spaces for padding because I find it easier to read that
way. Also using tabs to make this look like a table has the drawback
that you run the risk of having to adjust padding for all fields when a
new field is added whose name is longer than any existing ones. Or you
have to rely on excessive padding (such as in this case) to make that
unlikely. So I don't see any advantage in this, but I don't have very
strong objections either.

> +static const struct tegra_tsensor_group *
> +tegra210_tsensor_groups[] =3D {

Why wrap these two lines? They seem to fit on one line and within 78
columns.

> +static struct tegra_tsensor tegra210_tsensors[] =3D {

"static const"?

> +	{
> +		.name =3D "cpu0",
> +		.base =3D 0xc0,
> +		.config =3D &tegra210_tsensor_config,
> +		.calib_fuse_offset =3D 0x098,
> +		.fuse_corr_alpha =3D 1085000,
> +		.fuse_corr_beta =3D 3244200,
> +		.group =3D &tegra210_tsensor_group_cpu,
> +	},
> +	{

"}," and "{" can go on the same line.

> +struct tegra_soctherm_soc tegra210_soctherm =3D {

"const"?

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWoOpnAAoJEN0jrNd/PrOhoaQQAI0FzT17HDZ+Rf6WKz6ZAhaU
ZqH9ULpZHADpGJAD+1q32Z9y/LZJZeJbs4V+wVw7aJfmssKl98K23dFLZHZ+F5DJ
WlhykfjvqzNplSoFtHJnzWMh6fVEonAVMZOIITbwVqfLY+iWLCEFzi2YYedXDagd
eBBHwmLAxM+BGNxg/2JMWNJLwzDn30FgdBLonFfGQtdYBZYcHnOdhgAbMj83cmvE
kW1AKt+8UX0aS1iVmqH0UwHtvcKydytnZtOp2p/eEFaLqn0dNlc8s2v2XUQ+CloW
tLqSr1EWw3S7TuysK+C6mRJDXnGMmi0oYEs74wQh2J4edCV7oOHEcu/ijuIJskrK
EykFFStlh6yyxHk9ZpYZ7bZBjuMzvNRxz3iumMsss/PXdrmH9LVUtOFzcbEeiAbn
2skZZuTAe08PYjsdyNkMRjNDYe+DyzBUddIfa01NcftkUrW7wDU4TyN6m+gTFhM4
VQCzf7dydKI/wOpZhVfFlbhb6jqoYu3kWWz9iKyXYCVWp+WzaQRvG6Mgtl6Kiqsi
0uOdWewFZc5Bnjy1GvSvXDrPPOqHipwzVt8b0MKdkwziU8NEjDLTY1feqIbEMX7y
lOMCcTVPWQGJqR/xspFMeh54KImlF1xbO/z8Q6kEzAE5kHqtHLxs1ctmIpUR9ZDL
nZNuYG80pztIbkVMJQYJ
=Hi/0
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
