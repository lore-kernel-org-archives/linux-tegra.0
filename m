From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage] Add automake option subdir-objects to
 prevent warnings
Date: Tue, 23 Jul 2013 08:49:19 -0700
Message-ID: <20130723154918.GB2864@dhcp-172-17-186-34.nvidia.com>
References: <ba99c86b9074ac9053f665350e6b4985@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ba99c86b9074ac9053f665350e6b4985-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2013 at 11:25:28PM +0200, Stefan Agner wrote:
> The SoC specific code is in subdirectories which leads to warnings in
> newer
> automake versions. The option subdir-objects prevents those warnings.
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  src/Makefile.am | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 6fcc0d8..6fecfc7 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -1,3 +1,5 @@
> +AUTOMAKE_OPTIONS =3D subdir-objects
> +
>  AM_CFLAGS =3D -Wall -std=3Dc99
> =20
>  bin_PROGRAMS =3D cbootimage bct_dump

Hi Stefan,

Thanks for the patch. Generally this looks good to me, though automake
now complains:

	src/Makefile.am:36: compiling `t114/parse_t114.c' in subdir requires `AM_P=
ROG_CC_C_O' in `configure.ac'

Which can quite easily be solved by adding that line in configure.ac.
Immediately following the AC_PROG_CC looks like a good place for it.

Thanks,
Thierry

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJR7qX+AAoJEN0jrNd/PrOhAkQQAJDbicm26mw9TvL3zsZIz0OB
AOBEogaTbUAMHFCSfnJQ8iGUhQe8P6rRv8ENJ71jw6UXqf+DS+1ahbb1V2QtjVBJ
8kR4j7fc4QzWSyqY/0pSV5Px6vlfHT+dRK9b2K+I3L/kOQC6ZDu+I1mMC3Xm6CQG
BLvc/AA/D43s8fC0rC//wqb3t7zeDIOEMHlbR0fn4eEOBcEFyzA1shYjjIKyo0Cv
m1EhxliByVQDZugEQZg9jbdgjYwLUs9Agr8sac3CuWU616JPVhSM7HllGfhDCdyQ
Rdi9zyMtKA9BKQKIZXM8R2yRtrai3/dBuhUMF1ih+tEhCJ+HEuNS0DCXirDv2HSm
V5TXczMraa6RXkfsd5eqzQJLHhl32y1FVbkNEQFvtp8WhVSHq1DIdytF8nNO9pKJ
I8M/IO5pEw3cLaJYzHSWNMyudJgOgTkYOJmscHogw7e5WKkUsX/3Arn5WPvWeFJi
iAZ71BlBlPt0pb975h9iN6cPeW3CIonsmpGL6XEReXGc/0Lb2T6/TlRAqGCRiTRQ
Z6ZPem+CymKgz3erkxlcMb7TmnBABrOhrWcH4UFC7DR1k/AZGDSIftMLza+08u4Y
mgeRj5obmgoFdAhbSViX6bTp2iXpD1NHLY/STqelBWIA5BkdOol6KZs9hxkFpBeK
cH8pMD01y/pg1kWl6/SK
=7+WJ
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
