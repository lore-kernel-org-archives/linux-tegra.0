From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 01/20] drm/tegra: Fix lockup on a use of staging API
Date: Thu, 15 Jun 2017 14:11:40 +0200
Message-ID: <20170615121140.GB30056@ulmo>
References: <cover.1497480751.git.digetx@gmail.com>
 <7b70a506a9d2355ea6ff19a8c4f4d726b67719b3.1497480754.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7b70a506a9d2355ea6ff19a8c4f4d726b67719b3.1497480754.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 02:18:24AM +0300, Dmitry Osipenko wrote:
> Commit bdd2f9cd ("Don't leak kernel pointer to userspace") added a mutex
> around staging IOCTL's, some of those mutexes are taken twice.
>=20
> Fixes: bdd2f9cd10eb ("drm/tegra: Don't leak kernel pointer to userspace")
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)

Applied to drm-misc-fixes, thanks.

Thierry

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllCeXwACgkQ3SOs138+
s6Gfrw/+MbPKvPSRt22fxDbVChGRMjCMZDDP5PE5aT+8AbZ6NlX7LF2O8cdsc73u
ujSAK+EHRd5HKFlS6329uVKrYG1x+waVOwlNAlpH3+fe/tD5nTIINvu38wI2e7Fo
zzqH+2QDK6CQ1W2/66bTnUwjF0um7743jVvKJmRqt1TD/OSVC9BxDLtLjZBFoJxL
+mr1JskyhMeSnjENlsovWKIZC5PXmQKj6Un4uA3f0A9mwcYe+zYYdyusmo7DhIHx
i7eYnTYJYx7I2RP1jvFfe1522uIWjRHXLnDy06IYMr7oKREJitDEV7uFb5f4kN89
nQGJBbm6kYn04l5712VbhAXlUh/AO9FMXU4YZ8gJct3zgvAEmQcuKxQrLRQxWO8t
/rzdIauqG6eAZ1Fd16R4LZNgvr89qLZJpy0AfFSzDLn7dyn+zPTiTApKJDdgyppI
E5Z3tbCuwyLUutKuXngm6WMtswid4RmFxLdb1VjFmeTHB7dfxD4yyFc9suk0C4Jg
JhlIChYUxD5lNH+TtCj6NStJtMQkdu0cNID/tejSNs0kPVyWU7ZrsEuSa3tBYTlR
jZOErZ2cFpzJ3ifoVFbDZW1+hbeevTjcHH19Y+Xz1nMDjcHyHLuK78Or6h3nmr6r
D5JthhVVDshrCYtGnjSJrRSTm0KX7V6pEztdyO8DTLaVdW5iIeM=
=lC9I
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
