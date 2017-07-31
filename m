From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] gpio: tegra: Remove unnecessary check
Date: Mon, 31 Jul 2017 13:00:33 +0200
Message-ID: <20170731110033.GJ26667@ulmo>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UlxN1C6awaFNesUv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170724145508.7388-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--UlxN1C6awaFNesUv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 04:55:05PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> of_device_get_match_data() can never return NULL, therefore the check
> for NULL values is unnecessary.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Hi Linus,

any comments on this? I've got an updated series for the GPIO IRQ chip
stuff and another set of patches for banked controller support, but I'd
like to flush out all of these minor patches that are byproducts of the
other work.

Thierry

--UlxN1C6awaFNesUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/DdAACgkQ3SOs138+
s6Greg//W8Aphr/zl0UQ09JvSSV3e7WeKS/l+F81A17JixwI06zWHViU9Uejf6JU
JM14XJHxTHkhEWVaVebstN18+5mwX/DM9pyTVpaX7+kZ2UqaPCnWfvfl5n7X6juo
p+mEivyvQJk9RXs5NP/Hv5hThUjbaCon8x6sJ2FBdKG7XS9u/anyZr708b+LiQcg
5ntBqGdsHDWKAt1tsOPPj4gWf7FKTrKDdkXsMIVwlOuGroe/lqvwUztegeKqCu2y
fCNazlNRljZIg9UuJFYS8A+AJ4ZOLitpEgr8uj/Gka3iL3J5R/cepMkMNKIKYzxk
kLZjaN5dRLQ7hWAkMssjgKB38n0B+KlOotpNf/1dhBP4ufbXarx765lDgjmbcEFR
R0PCY4dGWIKwhC99MDxrGTi2ve5SjZjDV6qkT3E21pfkgTm6FemAgSNw+LqStFuw
7AntUvWJLuwSZV5hynsNOBjdYqIY0eyvR6w4tKeykG3d2n2AiOKribRiZfZtmcQY
xJ+ZtPFc5c9OTaCNzkx/E5uIOM3h5PWuxzJoO46Dno+cAnIBKdSkIh5fWOnmPqKm
rC1dKVLYAyIZH8Sg/Edr9nMlCXJSWSIyntbDj6VJ7/042/WfGI8pHQqlBhnjzlp0
CytiM2dFM2LE8YTcUdB+k7wgDyxqodBUxFGMhJpyYH1BwkLM12E=
=bwkp
-----END PGP SIGNATURE-----

--UlxN1C6awaFNesUv--
