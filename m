From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] soc: tegra: make fuse-tegra explicitly non-modular
Date: Tue, 4 Apr 2017 15:25:43 +0200
Message-ID: <20170404132543.GC843@ulmo.ba.sec>
References: <20161113190302.18099-1-paul.gortmaker@windriver.com>
 <20161113190302.18099-3-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161113190302.18099-3-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2016 at 02:03:01PM -0500, Paul Gortmaker wrote:
> The Makefiles currently controlling compilation of this code is:
>=20
> drivers/soc/tegra/Makefile:obj-y +=3D fuse/
> drivers/soc/tegra/fuse/Makefile:obj-y +=3D fuse-tegra.o
>=20
> ...meaning that it currently is not being built as a module by anyone.
>=20
> Lets remove the couple traces of modularity so that when reading the
> driver there is no doubt it is builtin-only.
>=20
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>=20
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-4.12/soc, thanks.

Thierry

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjntcACgkQ3SOs138+
s6EDNxAAjuRQSb2i9wSQ1oSQat0zQaQHm7q1dEhc310r3FE5xCY9TaCgY9gL3FGr
uxsj5DgaIwSX5WoAda3wiQ4PGcnAi5eftLykrpGOFUSIXTAjho5iQdZc4q3WnuoM
40eRL5JtcFm00MbjGli6dDiy1cZ6ldKlxvIZ7uVIh53Ts6bIMIXI75IZsZb/0yk2
qlw+EeNIcCF3xs+jdmbixzhn2OHKJR2oetQB/754B1sx1EaGVdMp1yoN2WzVsmji
kpGGxZhK52nMbXsGCsfXoFRKeS0MX6e0QIAzMcAia1EpYjG9kRoMxEdtkPsJewjL
NgUvLcGZqtlLYsGf/EaKl9D0mvnFArT5tzjwoOukGB4g8txanCEUJSqBXvfKlDK3
VUpVfBaJo4Itl9P4sjJYasiUEgqQHTbBjePZ6raxde85chmmvIt4cmc9JZ4Bv3Sc
SXqhdWluRk6/qLVxJ9+MjzWYOasL2ApL2/OIunWXXLGpB0kx+zNXVCUl13LlTKo5
6ww8jcWFNrXS0kJJiyi01yre+TTpZcw8SKzuj90HHTbXJQBMYFCOMKGvXJgKF4if
yb0k0qKPSTAsphqaIjPYWXWN85bHMZiPU20RndIIoSuL77eSKQiUh0jQnLwVxRmX
A7RTEBHMbJ1jRm6Csda5Tgm8Jd8n/vGZCmGxdxyeoO0JLji0xdo=
=Zkfp
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
