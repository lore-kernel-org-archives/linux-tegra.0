From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: apalis-tk1: fix high speed uart compatible
Date: Thu, 3 May 2018 11:45:23 +0200
Message-ID: <20180503094523.GB3251@ulmo>
References: <20180503074646.24300-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180503074646.24300-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 09:46:46AM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> Turns out the compatible "nvidia,tegra124-hsuart" does not (yet) exit
> and everybody else also uses it only in conjunction with
> "nvidia,tegra30-hsuart".
>=20
> Reported-by: Martin =C5=A0afa=C5=99=C3=ADk <msafarik@retia.cz>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> ---
>=20
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 6 +++---
>  arch/arm/boot/dts/tegra124-apalis.dtsi      | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrq2jMACgkQ3SOs138+
s6HC4w/+LXFnOp8re0nyWyA5EYdCjhaX8tWdNlDpnJiBUW+mPUM/VkWGR+XOJSdP
XjJpyXE2L22UaIN0qJli5jqRmL9m3zFS9ZKOw+CNX42aipJjVDjtaZkmf433SsEC
ykUj5hCpfKSGDD/zzfW8oCHzsUBshgLOgbo6YU8fffLiE734pZBANzI3JKxyhqXp
qOnkAT5gblKotWFt+Qdqc8O27H2AwOsxZu19rMWb6kU79AjUf2ZRUePoPlhLhFWn
N2ys4J4wdr1CGHUc+88aPGU8dHIPFfA24/kUlGHJyNzi/4jFecJ2wQd1uBVryr8z
Zv5sJQ/zUC1ujIBQz0zstjuk/v20IlyezN8O5XobtO9Nfocxr9m7XyNUMTrRowVt
mAAC5ZQV3zMhu0RbSA7rs4G++z/8vkZ7Oswi1be/QN/o1htD58rx3nMEerEJrviy
t2tOGkzYq6u8lrvSS53irGUdApzK7oMRxbio0xD69TZ2numHLYi6Wsi5BCVwIYOL
FCUkWV+A2ocDdm+ozgVS2kwky9ztqsX/NQmNP0CIFrF8tJagPKON0ctGgwQUTCs3
KIFoRVvCcZyP87tYIzV/cpJFrq1jFwqbxWAc719ApgjPkVEYMETH9i2ObDI7ej9L
9+oOzAVY6BDMftB/wCueJsf+XfzrLySnjMUdPNDiPU4L5KIjaxw=
=gipg
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
