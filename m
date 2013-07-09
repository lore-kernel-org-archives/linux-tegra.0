From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: enable gpio-keys on dalmore
Date: Tue, 9 Jul 2013 08:04:49 +0200
Message-ID: <20130709060447.GA17499@mithrandir>
References: <1373102069-5641-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1373102069-5641-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2013 at 02:44:29PM +0530, Laxman Dewangan wrote:
> Dalmore have the keys mounted on board which are connected
> to different pins of Tegra.
>=20
> Add the keys entry in DTS file to enable key functionality.
> This will enable KEY_POWER, KEY_HOME, KEY_VOLUMEUP and
> KEY_VOLUMEDOWN.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Reorder the nodes.
>=20
>  arch/arm/boot/dts/tegra114-dalmore.dts |   30 ++++++++++++++++++++++++++=
++++
>  1 files changed, 30 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/t=
egra114-dalmore.dts
> index cb640eb..259b517 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -883,6 +883,35 @@
>  		};
>  	};
> =20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		home {
> +			label =3D "Home";
> +			gpios =3D <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
> +			linux,code =3D <102>; /* KEY_HOME */

I wonder if these should maybe go into a header file as well so that
symbolic names can be used. That'll make the value self-descriptive and
allow the comment to be dropped.

> +		volume_down {
> +			label =3D "VolumeDown";
> +			gpios =3D <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_LOW>;
> +			linux,code =3D <114>; /* KEY_VOLUMEDOWN */
> +		};
> +
> +		volume_up {
> +			label =3D "VolumeUp";
> +			gpios =3D <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_LOW>;
> +			linux,code =3D <115>; /* KEY_VOLUMEUP */
> +		};
> +	};

Nit: Perhaps the labels should be "Volume Down" and "Volume Up" here?

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR26f/AAoJEN0jrNd/PrOh2/wP+gLTfq2anKTC6WRi8p29BWtv
a0PpZdpIn+4HN0eDRzw2huEk+ik1Te+SlLvb4YuVJxihEfWlx27lktx8gctTNhDr
5f7k+Y0EHOIPKqW73wPLeRGdrCZ0chUFmde7wNftlKbCMVw+ozJk4K7p/hKbfhr+
GdeELuNfe7Tc0ItOb2Q0uSxouQYUcWBQJYpcEu2gGXLOMX0RaCVvY/8KFBFwTmFL
pI0Ef7WFaek+HO9Nq6A6KZfAVb/a6YdOcWrUJyrIXNpSt5k8roOPF4p1wdGd0O0G
dwmsN/k1GaOD3w9BBYwXqvx7m0/Y+soLflGKZNP18OF1CXr6r0cDRB0mUkq1sAFL
dqYeI/51+2IovxYnSnC6oxXwC/sJgbpInp+fFtc2UMsrWxsr0j5DvOMT2ju1xvhc
ror8sw5gSt4YQHH6vt1B9W+dclyV9L9plxPDJl0v7p5QHKMSqCkh3FFQiYEvy7mM
nQNdi7SYkCCrmSxl3/TVtdDE1J2kwuHFQx3mQEXiirn3V4sGGsqAIsS+WNDEH+nb
Cbr5idbNjXSGnEp0Q/1zpa/v4MhrMOPh93OEUwnd8h7BaUjnfg+G5kkcBf5KxK0P
m4FjMm8stFemp5+0X5h/2azAe2FeyW6dQqi6WJDDrZdKdJETvG4CutEW/njFf/dC
ebCbQn//H0+2q4HVGRq+
=NrhK
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
