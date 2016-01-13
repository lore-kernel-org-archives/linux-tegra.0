From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 01/10] thermal: tegra: move tegra thermal files into
 tegra directory
Date: Wed, 13 Jan 2016 15:24:18 +0100
Message-ID: <20160113142418.GA2588@ulmo>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com>
 <1452671929-32740-2-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452671929-32740-2-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 03:58:40PM +0800, Wei Ni wrote:
> Move tegra soctherm driver to tegra directory, it's easy to maintain
> and add more new function support for tegra platforms.

Please use the proper spelling "Tegra", except where you refer to
directory or file names.

> This will also help to split soctherm driver into common parts and
> chip specific data related parts.
>=20
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/thermal/Kconfig                      | 15 +++++----------
>  drivers/thermal/Makefile                     |  2 +-
>  drivers/thermal/tegra/Kconfig                |  9 +++++++++
>  drivers/thermal/tegra/Makefile               |  6 ++++++
>  drivers/thermal/{ =3D> tegra}/tegra_soctherm.c |  0
>  5 files changed, 21 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/thermal/tegra/Kconfig
>  create mode 100644 drivers/thermal/tegra/Makefile
>  rename drivers/thermal/{ =3D> tegra}/tegra_soctherm.c (100%)
>=20
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index c463c89b90ef..7984cba6b340 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -254,16 +254,6 @@ config ARMADA_THERMAL
>  	  Enable this option if you want to have support for thermal management
>  	  controller present in Armada 370 and Armada XP SoC.
> =20
> -config TEGRA_SOCTHERM
> -	tristate "Tegra SOCTHERM thermal management"
> -	depends on ARCH_TEGRA
> -	help
> -	  Enable this option for integrated thermal management support on NVIDIA
> -	  Tegra124 systems-on-chip. The driver supports four thermal zones
> -	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the thermal
> -	  zones to manage temperatures. This option is also required for the
> -	  emergency thermal reset (thermtrip) feature to function.
> -
>  config DB8500_CPUFREQ_COOLING
>  	tristate "DB8500 cpufreq cooling"
>  	depends on ARCH_U8500
> @@ -380,6 +370,11 @@ depends on ARCH_STI && OF
>  source "drivers/thermal/st/Kconfig"
>  endmenu
> =20
> +menu "Tegra thermal drivers"
> +depends on ARCH_TEGRA
> +source "drivers/thermal/tegra/Kconfig"
> +endmenu
> +

I think it'd be more idiomatic to only source the file here and move the
menu declaration and the dependencies into that file. Perhaps also make
the menu description "NVIDIA Tegra thermal drivers", I think we've been
using that consistently elsewhere.

> diff --git a/drivers/thermal/tegra/Kconfig b/drivers/thermal/tegra/Kconfig
> new file mode 100644
> index 000000000000..a6e6cd4528dc
> --- /dev/null
> +++ b/drivers/thermal/tegra/Kconfig
> @@ -0,0 +1,9 @@
> +config TEGRA_SOCTHERM
> +	tristate "Tegra SOCTHERM thermal management"
> +	depends on ARCH_TEGRA
> +	help
> +	  Enable this option for integrated thermal management support on NVIDIA
> +	  Tegra124 systems-on-chip. The driver supports four thermal zones
> +	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the thermal
> +	  zones to manage temperatures. This option is also required for the
> +	  emergency thermal reset (thermtrip) feature to function.
> diff --git a/drivers/thermal/tegra/Makefile b/drivers/thermal/tegra/Makef=
ile
> new file mode 100644
> index 000000000000..8c51076e4b1e
> --- /dev/null
> +++ b/drivers/thermal/tegra/Makefile
> @@ -0,0 +1,6 @@
> +#
> +# Tegra thermal specific Makefile
> +#
> +
> +# Tegra soc thermal drivers
> +obj-$(CONFIG_TEGRA_SOCTHERM)	+=3D tegra_soctherm.o

I personally don't think these comments are helpful. They're really
redundant given that they're in a Makefile within a subdirectory of
drivers/thermal.

Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWll4PAAoJEN0jrNd/PrOh4jcP/3Zyb1vgO042mZtFKB/KfiQl
0FQlM6d7oUdN4VD1lQeSWzoT0+8OBKm+QAMXrgWlvFY1j1s1Xozwh2jxh/hxr5Ay
OM9pKhJozpqwUJJ2CuNttEiIy57YI5LGtY3z70Z7yWw8qZgsQHdo7MTaDEBltU6y
c66vFgrxgCm3HLXj0FNAO9xDy4MI6Y+6t9cAVr1aiFMYTNO2nZ1XwL2hGEK+VUA3
cdYbZL2bWMst8BiFXMHvNPRSe+QPJjQRkMfuVp8ReTRmRtMpztwns1s0X5fj/RSu
Psrwi7BGQ85Kyb1kYfS3l/5MOXcQGWRu51mVwK0y3qadUQi245bW6A+52GVN5WGH
8ZvC3femc/zobezbN7JZQ/AUet32caoiAxPX5N94CS6zAmUfFrTaDmaKxN52QRPH
joY6bYTRgWBKXuM7DnIUt1gXaj+xJhRMY9xvrqCi7vydoGrC7Y9nfA/DCU/H5ysZ
dbuJKoynMPoZAbquZK5EQC4mbwRbLgewQtW/Q2UgpHp6dfZcOGa6CskUBByZaafl
+nw4btLuNZM989E9Oy3addIVrplpwvmNxQVSuIlCb0wip9pUoMA8AR1Htatdr5S/
PyoxpYLmamOi9LpIzYPKeXwyGAUaU35tardHSdyatsc2NeIZbd8mUp06wTTMxuQd
zCSKLuy/07gNscYs1AG3
=gCWN
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
