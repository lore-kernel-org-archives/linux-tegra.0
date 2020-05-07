From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] memory: tegra: EMC scaling is not a clock provider
Date: Thu, 7 May 2020 22:07:18 +0200
Message-ID: <20200507200718.GD2981633@ulmo>
References: <20200506123236.7463-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200506123236.7463-1-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 02:32:34PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
>=20
> The Tegra EMC scaling support code is not a clock provider, but merely a
> clock consumer, and thus does not need to include
> <linux/clk-provider.h>.
>=20
> However, drivers/memory/tegra/tegra210-emc-table.c relies on
> tegra210-emc.h to include <linux/of.h> through <linux/clk-provider.h>.
> Hence the first patch makes <linux/of_reserved_mem.h> self-contained
> first.
>=20
> Thanks for your comments!
>=20
> Geert Uytterhoeven (2):
>   of: Make <linux/of_reserved_mem.h> self-contained
>   memory: tegra: Drop <linux/clk-provider.h>
>=20
>  drivers/memory/tegra/tegra210-emc-core.c | 1 -
>  drivers/memory/tegra/tegra210-emc.h      | 1 -
>  include/linux/of_reserved_mem.h          | 1 +
>  3 files changed, 1 insertion(+), 2 deletions(-)

Ah... I should've read the cover letter first. Looks like I need to take
that first patch through the Tegra tree as well to avoid introducing the
build error in the second patch.

Rob, do you mind if I pick up patch 1 of this into the same OF branch
that I already carry the memory-region-names patches on?

Thierry

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60anYACgkQ3SOs138+
s6EaEw/9EGmZ4wRdJQnZKEPfSrkI8ezYGzEWDNRp9OC17IzFf2+rDPyHkuM6zynx
sqWhXQeersjdUCJLMyRStJ47/ismsDY9Dsi/Y52S1Bhc9PibFbKO6GsEOUyiRaSa
FQJX/LstrlkGtTsymCp7rXw1SnneQg4StyPI7pXmoNBZafCEdRVHAUt5atl3dKO1
vPQolPeuzA9oaizomcnPKM2eY7JXxWw0J/ZnphMRcpPLkNXdGLcKb4IZocBS9DcX
Qd/4Ipk5jMR4lILYOHweJFHV3FagRj8GSO/cotDSDPlPdxYPQF1XDNTRau2FAuv0
fdft30qVrMr4XwZW5opTxafv90UZJXXtchexfUMx+SBgtQ8DGy1PLiNbKxyQjbcD
SqKNNKIoz3LdcKv3PTBSmIsdROOPoKtO0lSTR3lqsc1gMWt/RVdnIoffOupFFxU/
FLoXWUfbQojhjUg7NME0ViUVaJDrORqbbH6Wq7F7zNBTBJJPq+pC1G4jkvvuFmvG
0s//QGxgO8hoZOE8++1pw+F1fybzkGOiDATBCxFBllutuHq897y9sgIk6FquRud4
cf8wdwJ+fOAH1eHMTr/U3TXNMKm3YccLNYY6Iry8xDGU3/vAk8MsUrFkFKLSMIm5
Lxd5rMApw+T2sZX2BDThuWZN38gotqCZhJbgBl0b/P1PnclP1IU=
=qNDk
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
