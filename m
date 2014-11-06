From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add serial aliases to Tegra124 DT
Date: Thu, 6 Nov 2014 15:42:21 +0100
Message-ID: <20141106144219.GD12260@ulmo>
References: <1415053204-30114-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415053204-30114-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2014 at 11:20:04PM +0100, Lucas Stach wrote:
> Provides consistent numbering of consoles across boards.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
> These aliases are already present in the base DTs for all
> other Tegra SoCs.
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Applied to the for-3.19/dt branch, thanks.

Thierry

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUW4jLAAoJEN0jrNd/PrOhLHEQALzty5rXSp6s6XoCAbiarnoG
O8DHJ/SYmAQtZbv1CKg5r+A/fx3i5OU0XedDHblk387PYBT78mZcNm5fAj4jptZF
KlfByZn8fxWSjT8TrUqYf3GAHIt5CplrQ3yrVijZA0En5eNTq146XzKCiGMWig3J
QBXO101/ULqkxQz9PgO1hWc2tE6Bkz5/laJxYnWx/lxEQFfUR23EWGPa/AbtH/Fw
4Cbs3NMGmaNuPlLYv/9rK0PEAe5HwregcpAEknQu8i2gUmKXe2tL3DwUZttVZLIY
6muyzm8U+hVQ33BQd8vLN0cXDRJ8WnmJSJJNGwuhvaJkeekzD1rau3ep2ofAYoy0
JTxnywcydHja0QbUXi+M6fTGenviSYSjnXNoalQfFM8Dx0UH3s7hvxkstmx5lb1J
Djtx93R3MGuiTdKJ0+nXP8dauXh2AQKus84qykFscKZPxERJ66yhsdi1odheqwza
yKvlLZIvz58d5N1902R8BgdopmsxaWQASoqyaEkSxqIs4QBJ5wTJWjKHfmRgxPUT
VR432CHJvhS2PrvHi+B1FXl8qlZkZxl3fv7R/KSXrhHEmJNe7szthANSyS5l1yWg
i9HdqJNLrQyxBGEm+GTH5zRtHPOeLKIATVyohZ22/b9M9WV5GhJAopVheJ7sav1y
l+M1JhwjkjCujdjDWwoW
=LZA1
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
