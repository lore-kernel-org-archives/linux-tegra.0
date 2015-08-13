From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: remove redundant $(CONFIG_ARCH_TEGRA) in
 Makefile
Date: Thu, 13 Aug 2015 16:18:41 +0200
Message-ID: <20150813141840.GB26559@ulmo>
References: <1438322301-24584-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438322301-24584-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2015 at 02:58:21PM +0900, Masahiro Yamada wrote:
> Kbuild descends into drivers/soc/tegra/ only when CONFIG_ARCH_TEGRA
> is enabled. (see drivers/soc/Makefile)
>=20
> $(CONFIG_ARCH_TEGRA) in drivers/soc/tegra/Makefile always evaluates
> to 'y'.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>=20
>  drivers/soc/tegra/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVzKdAAAoJEN0jrNd/PrOhtmUP+wVjErLX+Hk69aFCr4qsb0KQ
kwGp/WRD30gpmb8CyTmZABJ5PXv0zgGE5zMG+L7uNL9vtwfMsgyX7e3G8/c4/5FP
OvvUBR0fv/w/rzueBK6xv09ze4X8F9888XV1WXaKqAekCSu/tQRgdh9goI6qMcod
7Gn/DWbzr/jNRPw7JhziECscGNt6+ST3Y4kUn7IMTNkE8vbV2D+WHMQG58f/urfd
HqqBhy/BK4/v5mxN4pmkjGSLpt4K0d8loyIIbb7HfKayu1KkLgHIm77umsogeGQl
lZHleAe6tokMnAB/gR3M0F3uUzdyq5XAZ09Rq2FjT50X7pvh/fMDbaaVUCqtNRcl
9LYg0+qvBinaSHnbMUwUzBjZsfC578Vi2UMboi7JnTF86LxDYn4b52Uf+GgPC9sm
KkDrQ1Y95qL70ITj7qnwcVpfr7s9Gupd4KFEcZ9RGd9b3xu6FbH5E9zzRwW1W9JR
8wwOMT1BX6KLTtpQWcb1vrnq+LfpfyIBLHWF8MwjTqLMcwtejsQ0IgSksoFppWI5
fetMCuqjEakgG0Xt/mzNLvwKUwjBDwpgGRHGNTR0SoJoUOw2MgL67mCTyjJE1jOx
ILe7iVkXWDoGFG9WVUOSPccdYwg7dJiFG2xqAianEeJ7d9dIqZOAoxn4qdZMwITe
r/VbRs51ro1gsMzRtC81
=DPTO
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
