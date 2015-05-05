From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/9] ARM: tegra: colibri t30: activate stmpe811 touch
 controller
Date: Tue, 5 May 2015 14:29:13 +0200
Message-ID: <20150505122911.GG30501@ulmo.nvidia.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
 <d87e59343cc07b99f85fc6dcb6cc8fe941770f30.1428700856.git.marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d87e59343cc07b99f85fc6dcb6cc8fe941770f30.1428700856.git.marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt@kerne>
List-Id: linux-tegra@vger.kernel.org


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 11:36:03PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>=20
> Activate STMPE811 touch controller as found on Colibri T30 modules.
> While at it change order of HDMI sub nodes as well to be more in line
> with Apalis T30.
> While at it also update comment about supported module hardware
> versions.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>=20
> coli
> ---
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |  4 +--
>  arch/arm/boot/dts/tegra30-colibri.dtsi        | 44 +++++++++++++++++++++=
++++--
>  2 files changed, 44 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boo=
t/dts/tegra30-colibri-eval-v3.dts
> index 4d3ddc5..d42c400 100644
> --- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> @@ -55,7 +55,7 @@
> =20
>  		/* M41T0M6 real time clock on carrier board */
>  		rtc@68 {
> -			compatible =3D "stm,m41t00";
> +			compatible =3D "st,m41t00";
>  			reg =3D <0x68>;
>  		};
>  	};

This change isn't documented in the commit message.

> @@ -84,7 +84,7 @@
>  		};
>  	};
> =20
> -	sdhci@78000200 {
> +	sdmmc: sdhci@78000200 {
>  		status =3D "okay";
>  		bus-width =3D <4>;
>  		cd-gpios =3D <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>;

Do you actually need this label? I suspect not, and I would suspect that
you don't need it on Apalis either, so I think a better patch would just
remove it from Apalis as well.

> diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/t=
egra30-colibri.dtsi
> index c4ed1be..5f7f4a0 100644
> --- a/arch/arm/boot/dts/tegra30-colibri.dtsi
> +++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
> @@ -3,7 +3,7 @@
> =20
>  /*
>   * Toradex Colibri T30 Device Tree
> - * Compatible for Revisions 1.1B/1.1C/1.1D
> + * Compatible for Revisions V1.1B, V1.1C, V1.1D, V1.1E; IT: V1.1A
>   */
>  / {
>  	model =3D "Toradex Colibri T30";
> @@ -18,9 +18,9 @@
>  			vdd-supply =3D <&sys_3v3_reg>;
>  			pll-supply =3D <&vio_reg>;
> =20
> +			nvidia,ddc-i2c-bus =3D <&hdmiddc>;
>  			nvidia,hpd-gpio =3D
>  				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
> -			nvidia,ddc-i2c-bus =3D <&hdmiddc>;
>  		};
>  	};

There's too many changes crammed into this commit for my taste. Can you
please separate these out into smaller commits and resend?

Thierry

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSLeVAAoJEN0jrNd/PrOh04YP/3gfuLbzufoPjxRHSKwZI0XL
1j59QFkWJ09Nku9Ifigl/gbfcNfsG6ay99Jh5Bbi9eyV+Y5XElMes5KIrivovlBE
LzafaOAtcn2CtBMh0CQbd9efzwpIEBVsoSKZlDHhPUHpm9KawaY/oWrx+c1Eb3lQ
lJy1lhgkgY/Fk18NK6UwiTDTwNwu4PF/97bVWVpcdVOQh5winXNlf99cdeihgzeM
hK8F/40a43440Adih5vvpd/KMeRi5XbB6QDTGkAsjnSYhb6vUV5gOuNJQCe5Mibr
fiL2+htoluP2VMN61JIxbcTodNSaWwZPQLK6qmbPFkLmLblAatUeRXCon9f4oHER
MeACBr6U0cXq4j9xJBohBUrk2t/SdCsKJH74jLteSogc1XTPfemP4ji5ctoNkO+f
vykQU1j4WX38x4TLL1UsvLPAc7b8TAyIxjca5TlJ9IrL9f+Xad6UTbzhEeOjPi/m
QdrhZGjJ6sftazUp3heDStOSKPfz7J1j8CjnhWXBnR73ru78cyvJOcRybjSuoyFl
hucbD5AXCyxLRbd//iVkz5u69UxfmWuakm+OFBbtXM5yrok4eK10Ug0Mdc3hH/5g
OBUsbiyPnjxwMT5HWVM2vIy09swnwiSjk0L1aFscez3dxWo4sALCMiRtW7DD25Ma
I9n3x9x6HbJigM9t2nGN
=GdcU
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
