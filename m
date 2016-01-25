From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: move Tegra pinctrl drivers to
 sub-directory
Date: Mon, 25 Jan 2016 13:26:32 +0100
Message-ID: <20160125122632.GC20452@ulmo.nvidia.com>
References: <1453563008-30106-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453563008-30106-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2016 at 12:30:08AM +0900, Masahiro Yamada wrote:
> Tegra has several pinctrl drivers.  Now it is reasonable enough to
> move them into drivers/pinctrl/tegra/.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  drivers/pinctrl/Kconfig                          | 32 +-----------------=
------
>  drivers/pinctrl/Makefile                         |  8 +-----
>  drivers/pinctrl/tegra/Kconfig                    | 30 ++++++++++++++++++=
++++
>  drivers/pinctrl/tegra/Makefile                   |  7 ++++++
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra-xusb.c |  4 +--
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra.c      |  4 +--
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra.h      |  0
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra114.c   |  0
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra124.c   |  0
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra20.c    |  0
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra210.c   |  0
>  drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra30.c    |  0
>  12 files changed, 43 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/pinctrl/tegra/Kconfig
>  create mode 100644 drivers/pinctrl/tegra/Makefile
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra-xusb.c (99%)
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra.c (99%)
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra.h (100%)
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra114.c (100%)
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra124.c (100%)
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra20.c (100%)
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra210.c (100%)
>  rename drivers/pinctrl/{ =3D> tegra}/pinctrl-tegra30.c (100%)

I'll leave it up to Linus to decide if this is worthwhile, I don't feel
strongly either way. If you want to go with this:

Acked-by: Thierry Reding <treding@nvidia.com>

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphR4AAoJEN0jrNd/PrOhq+QP+weFXus6rmF+kYJ5zBRV5j3x
OjQb/9g7lv/KJhMUnvlNvrJUVh0MBNmep6Yvnfk7QgI57GBjpBgSF+0FmXTBKDsx
t1ONqkjovNFPXPh/51jCzFUnpEcD558Zlh21XKsWC9k9fheJgKZwas4uitVUssNH
vcY9mLw5QRns/moJxb8jOpKxQMxjo9sF7PS4Jnc/aa3oXOqx7WPAz1Zm3IwtakZo
KibBBsfvZzq3iyCGMw4rQ/y/JRMcZzCPA1X8lYG6u6BA0hO9KJxdJ0+9+vMt41My
StTtXTi/fHAM0HU8FRfWg1GNJZF/T/7IOjox0Dsu4IyngOhJUtSnEtscBybYRyE1
7VfKox/O0lgmL74YtiL0vAf8/jktlkQTba1km3h7t1uK1QGIvGEiQvdNs0Jq6tAb
yf86MvZrJYO2S7lpuwLAbMsGVET4X9n0wYMmDP6TsOpXVaE+xmsR88PK/yOmFdAO
728rQDUOKd008YMbHUxlAlKNSK6DByYFOee5xD+AJiajcIjYbR849BpeV7vAqKEq
B1s5XI3IhrZBnizk6cT6Xwn9Anl1gj+VKn1rwbDxoAh/BUsrwj/a9E7KkkrCqtXf
rkbnz4Gxk0TIc3OVjD/REOy5wHlLWuGX1sPfxP1nM2At1uBJFjx9oki1ymHJrEVw
fx62NZLHD7eQ7pSuEH/e
=CgFx
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
