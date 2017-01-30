From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Gpu: drm: tegra - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 08:11:12 +0100
Message-ID: <20170130071112.GF3585@ulmo.ba.sec>
References: <CGME20170130045353epcas2p198210c8758d8a9d35fbfcfd8d24cc072@epcas2p1.samsung.com>
 <1485752025-29465-1-git-send-email-shailendra.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485752025-29465-1-git-send-email-shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.shailesh-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ashish.kalra-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 10:23:45AM +0530, Shailendra Verma wrote:
> of_match_device could return NULL, and so can cause a NULL
> pointer dereference later.
>=20
> Signed-off-by: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/sor.c |    4 ++++
>  1 file changed, 4 insertions(+)

No, this will never happen on Tegra. If you reach the ->probe() function
this pointer is guaranteed to be non-NULL.

Thierry

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliO5w8ACgkQ3SOs138+
s6GDxBAAwsJwNLyLjTPPKHf25ChM8l1rZV6dkxhzoQrN8X1XpKr3dPT1Eevkc+gh
zY/nKu/TXfaosAXu7Jrr8WDB+4rzFoO1UpjiOiZpJ8rGyRbsuT+/+O8xB8j4txF0
ep6btPx6ltS6XyS/sSQKwOLLCYC7OBPDvXv5V4bbKZfHgNI2zGt2+E6pLLLKuOxW
cRqEwSFqanz+A5RpOOXH+y/POq/vPMfs9hq/kVP1hAptnLVmuEz8OuDseYcs/bZR
Eh7gbKpr1lK1Zg/OmhyeMGQftU9B7EYxlacUUSjO2/bAa6rITfACxlkdDOQ6Oseh
6jXOEBCDPHvf5YaWVB3ED5ZjSzaly+9gseqjDqglhwYw/HIYvGKpn5Pp+s7FkWUJ
vYfwBUgCQYcZ8OhyIbkdAlqTM5Ebmxtdo1g6oDxj7Vm+cCj7XK49qo5Mzau/VUHR
vwCdkIcrsti/gOFIbJTjzXcxnekv7mUSMt1V8zUgQUPIc1rEc5Vj7qwHd1dyRhjt
f+ivumeVgO4biMh22TkhBT3F/GoyT7Z7NNoOwymGqPGr8IeEXWILPKs4K1ZCJ52v
aUcUQShOqtGX1NSYP390YgAurG7Fvaj1ZR4fMuU8vZ2ZT7PbbEgIjvma43tckYB7
n32S6GxwUrCFmgh2XJkjAc/aiZEXDIlis1XOTO4XTVR4DWIYzs8=
=9rQr
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
