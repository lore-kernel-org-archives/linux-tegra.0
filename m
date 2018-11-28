From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] clk: tegra: get rid of duplicate defines
Date: Wed, 28 Nov 2018 10:17:55 +0100
Message-ID: <20181128091755.GD17419@ulmo>
References: <20181101015230.27310-1-marcel@ziswiler.com>
 <20181101015230.27310-2-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181101015230.27310-2-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stephen Boyd <sboyd@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 02:52:28AM +0100, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> Get rid of 3 duplicate defines.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> ---
>=20
>  drivers/clk/tegra/clk-tegra-periph.c | 3 ---
>  1 file changed, 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+XUMACgkQ3SOs138+
s6HLtBAAwLL2s5Q37THgafBMibsJL0fTIZxHyL4TAMQ6AinFQxL4sNVpf2I+S7oL
G79WnmDGcrYXDsE0AdYXY5IJD9SoS4VE73KrCbnsxzsnmk2MouzWaELrSlFbKDvi
cN1Fs7Gl98T7hhkLTyZAmwAlM2aI5T0xrGXTxJXGQG5uOYmC1y0fyNik+o7mMiei
bEhQACtsOzuV01LfR44aXJ2ScQGrD8NM26TzeB+lCkiEr4PtHpbe7vM1Hya1t73p
+rCCtWi4fJze9d9oW8ZnWFFEoRosbLEi6om1PojMtWx5kL329sYwHcYUOBQB14jW
GjTEX9hvUvFXi9/LsdNFHrP5EJECwkGrLZLXCfbYXG3uoD+TR0Gok7o4ct22dBUE
1hFUW73o3tk4jH+Qc3hCXeDKzvKPWQW07ClFP58yELz8uH1TWIcdRgJwB9fIc7qw
JlXJFHQfVuPlb2AnIXsasTzhZ0FCIBE/2plr9MOBWJU+KVo2fcYr9Sw8UAvM7tq9
Y4k16hbIkTu5/WsFpYPyj5hMEXOz60EMFVzeQvTcsmYnkMlm5anUKLlFmnT+GyEw
jrnlOEc/tJePcZOO5LgbBptVlisZcpB9l81nW59QdsZEiR+k8VUCHsYr1cXMVJFj
VLX0cuRsxEcSFma1joGD8e0mfriSB9rWXJ82MvBAkavysSvm3yM=
=plpM
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
