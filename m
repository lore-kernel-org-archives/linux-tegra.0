From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tegra: Support disabled CONFIG_PM
Date: Mon, 11 Dec 2017 11:13:43 +0100
Message-ID: <20171211101343.GG10671@ulmo>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
 <02bccd8c39c0e7e9d3c6733e238e291e8297c830.1512947732.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eVzOFob/8UvintSX"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <02bccd8c39c0e7e9d3c6733e238e291e8297c830.1512947732.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--eVzOFob/8UvintSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 02:19:44AM +0300, Dmitry Osipenko wrote:
> Add manual HW power management to drivers probe/remove in order to
> not fail in a case of runtime power management being disabled in kernel
> config.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 164 +++++++++++++++++++++++++++----------=
------
>  drivers/gpu/drm/tegra/dsi.c  | 138 +++++++++++++++++++++---------------
>  drivers/gpu/drm/tegra/hdmi.c |  90 ++++++++++++++++--------
>  drivers/gpu/drm/tegra/sor.c  | 103 +++++++++++++++++----------
>  4 files changed, 310 insertions(+), 185 deletions(-)

I think that's the wrong way around. We unconditionally select PM on
64-bit ARM already, and I think we should do the same on 32-bit ARM.
There's really no excuse not to enable runtime PM these days.

Thierry

--eVzOFob/8UvintSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlouWlcACgkQ3SOs138+
s6GIjg/+OBdHVhaEoKLs879mKox4tSK8mwF57vQJ2K2m3avht4KDRnhEDjh6nJRe
q36S/oapfNEKSMsxxlUfCQoZTXkPW3pslqb4drXTqAUEZsTV+wcLKkgzNgURn5hV
INDI9VLtvT+xvJkQz5N+ji3ZQFx8xGWTXlyFz3p+RYF6+HNJmVeLh3Ci7QWu4y30
RhkfSCucpvV46Li5YltMF5esZgXUv9Djc9iMr1BUzem5KWiJxRAlmz07tFBi6aXB
E2g9oPGezfUUqe3kOV12NTGqoxq5rsLQAsU3f2WMiZfRPeLCsq8xWRE4/7336UmI
nOTmeKg9X7pZ5OG97MKlcGoniV+mA6CkptpxSgIswiLOr1uOohoMbD+AwSnUeljn
+uWixOjsLXA+3vpDLadIzAHmv64lVyRCEkpH9/9dtPe9aDHX/UDk9OxKcILfR5s+
wqEEasPpzH6S68EX9T7EGT9Dd7Pg4iDnR0pkhPeda4CkOv9bU1cqvYF3brA7jpQ4
TYmTEs/ogOoaE5z2adVRd2YhCsyka2qrLlrfE1/Ol+H99iq9EW9NsP85s7GT0Cq5
NilXnxLkodjSFe5AtpXLmaLh/0083lQqj2yQuVnRElJT6Of9gHnE7o4vAHQ325l/
FWrf1y7tRsWf71XSFoG0vegsHBtH+6zUT8tsIZONbolrIl2nSdU=
=Jc66
-----END PGP SIGNATURE-----

--eVzOFob/8UvintSX--
