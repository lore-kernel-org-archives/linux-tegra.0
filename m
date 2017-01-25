From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] memory: tegra: Add a missing 'of_node_put()' call
Date: Wed, 25 Jan 2017 07:57:39 +0100
Message-ID: <20170125065739.GB13025@ulmo.ba.sec>
References: <20170104071324.32721-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170104071324.32721-1-christophe.jaillet@wanadoo.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: swarren@wwwdotorg.org, gnurou@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2017 at 08:13:24AM +0100, Christophe JAILLET wrote:
> If 'of_find_device_by_node()' fails, an 'of_node_put()' call is missing in
> the error handling path.
> Fix it by reordering the code.
>=20
> While at it, remove some empty lines in a more or less similar constructi=
on
> a few lines below.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied, thanks.

Thierry

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliITGMACgkQ3SOs138+
s6HJ7g//Z03O7iVkxi6hETHYW26D2lMTwe7jtMMQueKCzm1POxlU7d6BctXNiXCG
Y36zA2AyWdrhtNsApyAW/8/ggfnae7CTMUHHg6lRyN7tXiljFSX9C9CrRMUADhnV
+yokZ4G+taSlkXUhIhLlKlq9Za2M6jyEDvCn2nR22OzeF51/9kvCMS2bxxZjAxAW
UrewFE3vhDxvRxBW1Asq8on2gM++ChvtLjlODuxXnygLtl9bHtvB2Ui7h77sJFTo
x3VPIyMQ3u+N7ASB3lR+vvg/4g40IapKqN/qbRkEp2X21DCpls5Gr/ShrTOSHWsl
6/YgWLr9Q0z9bfonx8v41LULYjPYeZXuVbvYuV5SDD/m0QujeXnKt5RCH9I5LWiO
UKuYRnpM9kaizhnM9G3d5J5DuaJYooZS4ZOEaW3668qBafoFDtKuCnzEJJCpt5yH
aCX4WUVz7zMgRP3ShCBGXn9OCT51VKH+ix3d2kbhoC+Gelq7C5teW1Zs8BnULcdx
el+nipr3ZJOk8DAwLek8W1A+ufIkSorPqfX7+D5gQOhKQkO0tVLrUUYa54sRzGZ8
duPSw/Gu073DDORwWs8qzb9oST1dW+LT1f2JLR5FReradQkX1xPbap0zU7CHyEVA
k0O1CWWkWecYYXyW1cBlEMYgSeeqSwN0NfvntFof4GTGtaSSDsM=
=4zo7
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
