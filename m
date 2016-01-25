From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: clk-emc: Add missing of_node_put
Date: Mon, 25 Jan 2016 13:55:47 +0100
Message-ID: <20160125125547.GO20452@ulmo.nvidia.com>
References: <20160124151519.GA23923@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UFMLoheMaWcIEZAi"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160124151519.GA23923@amitoj-Inspiron-3542>
Sender: linux-clk-owner@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, swarren@wwwdotorg.org, gnurou@gmail.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr
List-Id: linux-tegra@vger.kernel.org


--UFMLoheMaWcIEZAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2016 at 08:45:20PM +0530, Amitoj Kaur Chawla wrote:
> for_each_child_of_node performs an of_node_get on each iteration, so
> to break out of the loop an of_node_put is required.
>=20
> Found using Coccinelle. The semantic patch used for this is as follows:
>=20
> // <smpl>
> @@
> expression e;
> local idexpression child;
> @@
>=20
>  for_each_child_of_node(root, child) {
>    ... when !=3D of_node_put(child)
>        when !=3D e =3D child
> (
>    return child;
> |
> +  of_node_put(child);
> ?  return ...;
> )
>    ...
>  }
> // </smpl>
>=20
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
> ---
>  drivers/clk/tegra/clk-emc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--UFMLoheMaWcIEZAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphtTAAoJEN0jrNd/PrOh4i4QAJDrzpBXqUT6yC5Pg8I8mVBh
vU22kT5OgMa9WtVZLdBg+0+fZUWAXtyVmsy9T/05CKNyg9khp9+nlPnAZC5B1a7b
Lb4ubZdTcb09bgca/VoysZqP0HbSKSWBPng85DCAakIcuSFO+5hpJLiKBYvz7U8W
AeHCsqQ3jUWjFu1c1GG87L7CRBumm9annleRVmIa0xG4nrgUjSqVxuaAzZ30lHrH
yk51RBxaFM770i329pUWpF4+2phFYstRgwOrDDp8o0Hp6iC+PSLbMpjY87jTbGf2
yKIVdc3uU130o5ip8EdjhTkTECUvoMhGecmLBqinYA4+z5NsdFbcuPiNt3cjUZWn
+cbcoHerGn3bitHH9LJSdiBFeH4nSzz9CLbiCc70tlvhhay2FHLfcoElVX/OjUUq
b9dpMR3Zo0vrvZgjYN5i2BtVmvJE3Iv3n6h3IvRLt+GJDpVC+A+SixeuufKTaegn
gZPBbST/3faxZr5hCs95uwUArLyO0VQHKAIYT9rS2lg2+W/LJuQfsNk9G0+NhpSF
DiR767GIgkaPdsxBy6hvvbvZ1QV/OMgOT52omLnEl8zuTeB4nOwfaMUGErKY6TVt
KJvARSi8jUvFOkacIVERMEMCE4IHbtmqU/0wyvNdRQUkkVnS9AkQEzCSM4ueaVFv
QnLIckdZZtfX4AWv487/
=a2ih
-----END PGP SIGNATURE-----

--UFMLoheMaWcIEZAi--
