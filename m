From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: apalis-tk1: Drop leading 0 from unit-address
Date: Tue, 8 Nov 2016 12:11:24 +0100
Message-ID: <20161108111124.GA2085@ulmo.ba.sec>
References: <20161107134923.5615-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161107134923.5615-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 02:49:23PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> According to the latest best practices, unit-addresses should be
> represented without any leading zeroes.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-apalis.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIbLcAAoJEN0jrNd/PrOhk1wP/369OSX6WIjOmmEsBYwa0VrI
7QCSHwBurn0hBTpODOnAvzAAIcChjkjQ3iunIhRE7lKdKeuAeZiUPPeHDsafDvqJ
+b5FRsdmLA53WkZipqXh3BGAAP3n7qFhoK7OQ8GmL9sbqSWeX5sVGBvaY96z6Kc7
8RD8RqqSCETpRzlMrKKdtCPibef2xVn5WaEaw4UsoQkm8XHNlx2PhkCcCcHK+ayi
TegECHYbkxX961pJwsxlqnIEi5CcfY+NfGQTk5MAfI6FJpIhlPWp7WzlbkXVeOLU
z9PUumLKZYAbEps6wrQYT2lb3ZDvZkgbV8u2VJlPszKYUsfMMugquiwPqGO/1Qg0
+pLzWiLNpzqdKUORwtPTCylnMLntlWdNRPoy/vr7Ol8hf4RRg5W5hFa1LfR2duMG
o9pq3mMVi40IvWsy/iv+ZW+9L8tfTrdsETG9mZkSvwzSUnad7VDLrPAhEJG/A/zL
8kFr/DWW9KOAel3NB0aGTVirugwiPvjnc9MQbryTqf0+aUOac3sgg5PNa49gFNLc
bgw6/nXr04CGBq4QJAfuijUQiSj4BvKWJLPnMpmH5ZTgAEumzv4qAYKexHfV6Kpa
zcjDE5T+Gm9krVkfuzg8bVceoSgvDj6GeKPTOcJlgca5zH7L3kyvhPV4A0RC30C9
wXqBV40LQ/TOz6OO/OM2
=weRG
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
