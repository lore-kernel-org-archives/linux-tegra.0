From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 14/16] PM / devfreq: tegra: Enable COMPILE_TEST for
 the driver
Date: Tue, 4 Jun 2019 13:20:26 +0200
Message-ID: <20190604112026.GN16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="U6leaJ20qZQc29iB"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-15-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--U6leaJ20qZQc29iB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:13AM +0300, Dmitry Osipenko wrote:
> The driver's compilation doesn't have any specific dependencies, hence
> the COMPILE_TEST option can be supported in Kconfig.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 56db9dc05edb..a6bba6e1e7d9 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -93,7 +93,7 @@ config ARM_EXYNOS_BUS_DEVFREQ
> =20
>  config ARM_TEGRA_DEVFREQ
>  	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
> -	depends on ARCH_TEGRA
> +	depends on ARCH_TEGRA || COMPILE_TEST
>  	select PM_OPP
>  	help
>  	  This adds the DEVFREQ driver for the Tegra family of SoCs.

You need to be careful with these. You're using I/O register accessors,
which are not supported on the UM architecture, for example.

This may end up getting flagged during build testing.

Thierry

--U6leaJ20qZQc29iB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2U/oACgkQ3SOs138+
s6FAvw//dyUsGtKs5mTTMtrTOsyA/yTph5TFbQxj6Ldz0Qe+yvt8q9UhJQrZ8Otr
fGKRedThgT/kV3BsBtgyy1KaPNRncN4unwk5X3maqZAL11pHfTTt8gKqWvEa3qvt
WdaZNZRzL6ltGvazChtYHgnJy/+U0CNEVpb2JdXKsns0WapnLfABvjS2nYzcNmYm
F6AqZjwSXF4uFyXUfzDiRLC6he8Ttgmrwrsz2OLdVNTRiGc1AMxd7NclevjxyHPA
NkjEjSIEI95DjCTqTzXynnFAPUPQmXoUo38Fa0eM/hBe02YzESE1W+MFXGYxWx7o
SGgRqvNPa3bH/bVs1o7izQtvAfNbIDqMEJGU/DXu058xy3ChZ/v9ANI/E3Yf0O8y
Kg0ux0lbTfx9B/Lju2nXYAQF1edjpdfSYKDvwRARZsWlsOsfjjc678S1jHRZ8P1u
8giEjfWwFRFgpZfq5cWBeO0i70Z/zBnl7osKKkMGRkaaWSepdR1gX+49vFXmCwjs
UAvcKMGYIr5OK3zi+WS5eZ3YtYQKmOzzSvgCMQn5W5nCi3T5k5pQ/hspX4ibu9w4
75BYN5E0NV0dVadCdNxI+C/v/5z3rsKUzf5oMxz4VTW/esqR8UZ/wS8T47LpAFIG
GFOoUzbeumE50C6Vch4QI90MqJiKr3CYhcmQe6r4Mbqhg787rtw=
=Fb77
-----END PGP SIGNATURE-----

--U6leaJ20qZQc29iB--
