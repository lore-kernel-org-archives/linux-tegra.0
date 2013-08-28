From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH] Bump to version 1.2
Date: Wed, 28 Aug 2013 08:37:16 +0200
Message-ID: <20130828063715.GB5141@ulmo>
References: <1377628366-25039-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377628366-25039-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 12:32:46PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Create a release that includes Tegra124 support.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  configure.ac | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/configure.ac b/configure.ac
> index 9b83a21..2d166c5 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -2,7 +2,7 @@
>  # Process this file with autoconf to produce a configure script.
> =20
>  AC_PREREQ([2.67])
> -AC_INIT([cbootimage], [1.1], [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
> +AC_INIT([cbootimage], [1.2], [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org])
>  AM_INIT_AUTOMAKE
>  AC_CONFIG_SRCDIR([src/cbootimage.c])
>  AC_CONFIG_HEADERS([config.h])

I wonder, do we have any place where we can upload tarballs so that
distributions can grab them for packaging?

I don't think you really need it for this, but just in case:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHZqbAAoJEN0jrNd/PrOhJ9EQAL9Ao65PWjb92yE4JcVDLs4/
XxVHlwUPMTfVDO5vj7pgFeWl05zsRimDq90ijvsv0lT1uJMtEifUTpwmOhEdBcgy
YoyXCD12jKQFCpuu5D7Ytgn9XTIGJVHCthpBNw9lCxTmjGhiyWmWOX+wBhCO6JmI
Tut7G/FHtTopm63yLTYXL1GCrOI6UDO3LoL0S+ylry5Hx5ke/yMSJwTrrrWqc7tq
Yn0fqWbH/+d/tbfsBJBTwb91duEjDOpJXyj+hGDdcWop7wZun4zI3tJkRns3rfXc
xRW6PGzRKAhwvNs+0Cm0lLHt/35icfWB+HjOnZHyjy6uEJNdt/1o1NhwzQmN+fhR
8HgFgEH85GUbQax0/JzGCD6a0Z02vu8J9ucg6kkC4/v68UULPajClwiVjEYMclJh
OETaCYB9eBQEmK4UXXIS/0+00S07GM9thdzEx5d4P+l6RTxE3H18XwjnFsSZffpo
F6jUgzICcWBsKW5qH7W0uXhp711M216Qo+IS/FVw8sBq9whzwAyt+aH/eGMXWMrE
G6l11XIgkNFTq7w115tA3Zph7EgFV7CmOnxNuD4RNiG0WiyV/BFDgqboGcZgRAmW
q0npMfevF342Ut19mOX10otaEd8OlWyLdq/Y3AIjq7HYEc+CMUDXPv4Jo/nxdwO8
19ol4GSjYJYye68BbZBf
=9FK/
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
