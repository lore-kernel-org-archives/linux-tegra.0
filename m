From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 08/10] thermal: tegra: add PM support
Date: Wed, 13 Jan 2016 16:55:40 +0100
Message-ID: <20160113155540.GH2588@ulmo>
References: <1452672043-475-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AzNpbZlgThVzWita"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452672043-475-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AzNpbZlgThVzWita
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 04:00:43PM +0800, Wei Ni wrote:
> Add suspend/resume function in soctherm driver.
> And enable it for Tegra124 and Tegra210.
>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/thermal/tegra/tegra124_soctherm.c |   9 ++
>  drivers/thermal/tegra/tegra210_soctherm.c |   9 ++
>  drivers/thermal/tegra/tegra_soctherm.c    | 154 +++++++++++++++++++++---=
------
>  drivers/thermal/tegra/tegra_soctherm.h    |   5 +
>  4 files changed, 130 insertions(+), 47 deletions(-)

This all looks like it'd be a better candidate for runtime PM. The
implementation would be mostly the same, except that you'd need to
add a few more things to tegra_soctherm_probe() and use the runtime
PM API to enable/disable the device (clocks, resets, ...). System
sleep should then be taken care of automatically.

Another comment irrespective of that...

> diff --git a/drivers/thermal/tegra/tegra124_soctherm.c b/drivers/thermal/=
tegra/tegra124_soctherm.c
> index 13d7f4e3a3d7..04cb419dbabc 100644
> --- a/drivers/thermal/tegra/tegra124_soctherm.c
> +++ b/drivers/thermal/tegra/tegra124_soctherm.c
> @@ -205,6 +205,14 @@ static const struct of_device_id tegra124_soctherm_o=
f_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static SIMPLE_DEV_PM_OPS(tegra124_soctherm_pm,
> +			 soctherm_suspend, soctherm_resume);
> +#define TEGRA124_SOC_THERM_PM      (&tegra124_soctherm_pm)
> +#else
> +#define TEGRA124_SOC_THERM_PM      NULL
> +#endif

I wouldn't bother with the #ifdef, just always define the structure.

Thierry

--AzNpbZlgThVzWita
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlnN7AAoJEN0jrNd/PrOh634QAJRY+8GJswMpNKYu8EA67Grm
qKx5nHUQips7mv4kM+TwGe1k1w2O+T5dwDMY7N5G4/bhSKeEXTdH1SXUffOOwFlI
iW2R+wTRC+zqbrZzBHuKYK7itAWWJDLbY2nLdTBNfLPHy7qGajId9r0wb1ZpMSqL
xYMTpS0HJdKPkZoBUug/8kEzPOUwWZcZ3JukKOqRg1mK2/fLsENuO+178KRhZBhS
tJTkAeETMaQ8oUqDg0UC0upqOi0cDhfxH2J+9l95bXXVsitiR/O2WMpIPWxR5JMg
P/pLyIWply2Zu5Ps+QNShw6NyFz6yEaIS1n5TmW7patRVHcvkrxwXSHrQXIt2SYD
gO520BJ/HWUGslxUmr9XjHI0vsHZMMpGx2BNyjdFDIV5mr7S7n+bRtDCB2tDOjAy
lqQmXYB9ayuG0xUPeyFuWfhFSuPuQtbrnCoaywbnzxcpZh0NrKRNky+S7qgSLUcU
IEBN6A1n+u2DRqJbdz1hyURtPEgDIpP+5GEzqQqpjny38v031mZLZ9sIIovUuh4w
TEbka3IzCDmK+7V8ric/LyJAGLA4Kz6D7CQN0aYukq8pXofuneQlnY3vpNFL6hxF
wXfsauPQKFLO0On9Ky5jLK/s76qFU3X7S5GnsN0idUGAq7nkqHNIP7PlMxCBmNwv
7MWXM7pkkpxBn3exDhN2
=EuT6
-----END PGP SIGNATURE-----

--AzNpbZlgThVzWita--
