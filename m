From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] soc/tegra: Various PMC fixes
Date: Thu, 30 Jun 2016 12:04:19 +0200
Message-ID: <20160630100419.GF1776@ulmo.ba.sec>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467110308-22126-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 11:38:22AM +0100, Jon Hunter wrote:
> A few fixes for the Tegra PMC driver.
>=20
> Jon Hunter (6):
>   soc/tegra: pmc: Ensure powergate is available when powering on
>   soc/tegra: pmc: Fix early initialisation of PMC
>   soc/tegra: pmc: Don't populate soc data until register space is mapped
>   soc/tegra: pmc: Ensure mutex is always initialised
>   soc/tegra: pmc: Add missing of_node_put
>   soc/tegra: pmc: Don't probe pmc if early initialisation fails
>=20
>  drivers/soc/tegra/pmc.c | 51 ++++++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 33 insertions(+), 18 deletions(-)

Applied all patches to for-4.8/soc and squashed the follow-up from 5/6
into 5/6. Thanks.

Thierry

--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdO6jAAoJEN0jrNd/PrOhQrQQALA5uY3qbyy5eWMtKXX8bqUJ
JwENNWHh37GzZqU+4aOVC8E7oL/k3UmGXx/+wIPgYgZyHMeDXj21EvtatlxrO7qG
T5v0kVr+4yhez34ZKhLx/uo4Ptr8aIo3ijKSeKNjnEj1t6GhLmCf+VFtyH/Bw9O+
Z0bWl+h+WPZvhjZMK1Ql1CajD9dxJL6MT3VFymUn9vEWR/Q+fx451Qf2aSF/n6sU
3MgT3aZlAWx4uzZrwn0JldjMTzcV7ptU93yk2eWPEfsbmTAdXCzej5KiUeeXtOIA
kWwyPsUPk9QYoNZFKvjIakJEKdSE8cPkzWC2bHJIhbm0wzbKzDIjcr1NicbPYxjf
1VlSUX1nISQAE/l1SEoNeSRcCz+MEmMcuKNY8matt0wDz87ZnM2ShISwvJQ1hl7o
kwaf19EMIaDYkxTG79WXscQQ45tlJYEPYJgP3x9GCfrIw9D77a5sdxyVtDIzKxy8
8wPXR+OHDgU1SzcIPVdyiORxBbnsy0J9K1WSUAAFizxub9A+ZUy5RPLurUx8o6st
uhVjnJ3AgG/liKi5qZOCSzxOavd6RYE8f64qKd56Cvx3eeTgi1iOvUxybqETxULc
cXpGarXbGe2K+jBXrKQbEYCESe5hcoEBpiLKZokS0qoVWgpaNMOwrSRzmbkjOwoD
LfBnORExy+rF3ZEb+ubJ
=2SXC
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--
