From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] I2c: busses - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 08:12:17 +0100
Message-ID: <20170130071217.GG3585@ulmo.ba.sec>
References: <CGME20170130050324epcas3p28c9adcffd7bc40e1733cdeef1e5240d5@epcas3p2.samsung.com>
 <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NY6JkbSqL3W9mApi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485752587-30107-1-git-send-email-shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.shailesh-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ashish.kalra-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shailendra Verma <shailendra.capricorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NY6JkbSqL3W9mApi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 10:33:07AM +0530, Shailendra Verma wrote:
> of_device_get_match_data could return NULL, and so can cause
> a NULL pointer dereference later.
>=20
> Signed-off-by: Shailendra Verma <shailendra.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c |    4 ++++
>  1 file changed, 4 insertions(+)

This will never happen. Any match in the OF table that would cause the
->probe() to occur has a valid .data pointer associated with it.

Thierry

--NY6JkbSqL3W9mApi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliO51AACgkQ3SOs138+
s6HXJA/9GZWy97x9tbbgGVm2BFAFpiajVD4/KMewzA7FLgI7ikxgU3lUo39wDjvW
/J/RqIKYmDVIHepP/C0WDTEVAVZ8PQ0ksuk5M1O3uz1txPcScwncWHyNkgi0MM7t
OYTToDv8PttocasxtOjTt/sFtCAeXay2qL6PTeZKuKV8NiU3fb/vFYGCUkZyn7GS
lrLYpfGz+ZQDDf7dLXC6CujEb+MLCaO9lLwEhQ7Ha5ayH6v4HQZlkYjqpWsj0wHL
Sb+SskEBxji9xxp4kSnzxjqxQdskKiJ8NlZiyiglwyckv9bMPFlQEWQ8tnPti7zc
wzMeaqoDs0XYvKSJaCwsyFUXN80WhZyMDugwtS52fiCINfTTI3qOZTgmnHNOPKA6
VzP7MBr+ChE/E2u7qlzmqroWNunj8xWhPd3UJ0KTXXBnNkX5E+MWvErHVnJu1w6U
kB8a4WiHxi+VwkEOSuJIpF8RA51au3gV+UMF+ILlZliDk2eTHtbZ6f/q4A4OdnSA
NDBmYlN+GUV5lnjGvb3WJrS+qL2z/p4sv2i5XSm4KD8yb+OIMzfpcGw/H6PLEVCx
IXKtPMG4J6XHkok8/X2mnBFapE8TiJZFpmK0ZpFWMRvnj62fBOdapZJzLkbVOm1T
M8AOuqA/tyvHdXPfSKozhEIl1D0lNXLDJbX2oajVx6kBLKvJlFA=
=eG7T
-----END PGP SIGNATURE-----

--NY6JkbSqL3W9mApi--
