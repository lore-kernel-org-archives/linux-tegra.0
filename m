From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: tegra20: Remove obsolete vbus-gpio
 properties
Date: Wed, 26 Jun 2013 13:17:58 +0300
Message-ID: <20130626101758.GU12640@arwen.pp.htv.fi>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
 <1372240781-1017-5-git-send-email-mperttunen@nvidia.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eUqGrSc0O7wKBRnC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372240781-1017-5-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--eUqGrSc0O7wKBRnC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 12:59:41PM +0300, Mikko Perttunen wrote:
> USB VBUS regulators are now specified with the vbus-supply property
> instead of vbus-gpio, so remove the obsolete properties.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-seaboard.dts  | 1 -
>  arch/arm/boot/dts/tegra20-trimslice.dts | 1 -
>  arch/arm/boot/dts/tegra20-whistler.dts  | 2 --
>  3 files changed, 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/t=
egra20-seaboard.dts
> index ab177b4..2ab4775 100644
> --- a/arch/arm/boot/dts/tegra20-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra20-seaboard.dts
> @@ -566,7 +566,6 @@
> =20
>  	usb@c5000000 {
>  		status =3D "okay";
> -		nvidia,vbus-gpio =3D <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;

silly question but don't you need to put a phandle to the VBUS regulator
here ?

--=20
balbi

--eUqGrSc0O7wKBRnC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRyr/WAAoJEIaOsuA1yqREvjYP/RmRJiNA/0fGJCsgeV5p1bLQ
3uAB/lcaBWoxps7ztuwNlI4NquUA53YwBFYEuu6zys/wpONDETjSY9MhPLMrPo27
vUdr0iinTk2DC5sO9HLj57qKOvXuvy4alP2RA6ICq+vVPqQug1S5KvT62kG59s/H
DRWDF5dVFrbBpIkpdJnEDHgYNu/O4EfLMIdqS1BEWl++t/e8mgqeYGgAyGG5gIMs
VmmcTbIUZC3LRUSwQ+RRoBiZgtXcbcW2nJ6p0YBApZsui9KyQaBZzsFxifS96SCv
ZDnkBw9bZuaUYrawHQCcBg1u6o/gEQX/DyEx6Ri+HOUmrnxgTHgb0O1uqacQu5nS
0AIwLRpAflIpxQlJC6O5EkwcGpx6ezmZ6xh+wx49xISG7Dqxx+pwYDDL+Vjb6Pmh
z6O8IBi8N8eu7rViMFNvJxsoqOIj1nxxk5WPEat4GyDqPHEhLVX6rqoc3Jm+fBdq
FAiZJv8SFpMuiXdmLOTkz7qrPyxmfQQNC8wJD0EuTs43YZASU2DH86e5hlGLSR5a
eC5E4rULOr5X/PGeptAj+Ytlsx7mQqu5UNE89Oe9Sk9FNIOx6kT5oNkPgZhNt5No
A48aVIrs92xNC2EInrisTanOor3RIJAkTKuRMfUMxOrsSdW9G3LSZBwA8rpQeP5F
qX0VV/Z90tTy9RuD+RU9
=3HQO
-----END PGP SIGNATURE-----

--eUqGrSc0O7wKBRnC--
