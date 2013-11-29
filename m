From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 30/31] clk: tegra: remove legacy reset APIs
Date: Fri, 29 Nov 2013 15:55:47 +0100
Message-ID: <20131129145546.GJ9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-31-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvznHscUikHnwW2p"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-31-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--GvznHscUikHnwW2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:25PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Now that no code uses the custom Tegra module reset API, we can remove
> its implementation.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/clk/tegra/clk-periph-gate.c | 22 --------------------
>  drivers/clk/tegra/clk-periph.c      | 40 -------------------------------=
------
>  drivers/clk/tegra/clk.h             |  1 -
>  include/linux/clk/tegra.h           |  7 -------
>  4 files changed, 70 deletions(-)

Very nice!

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--GvznHscUikHnwW2p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKryAAoJEN0jrNd/PrOhF0kP/RLunjLTsOdSurktJlZk9bc1
04/69qcWCkDBaydmFnsN3nDySITNyPIQo+wCB1hEuU4F4JiLvvxorvBz9xUVZprC
pjHX/6dFNPspjMuPnX1gkclX4Qw8CoLt/osZtabOXzTZOT66fl1nOITNrv+kHIUb
HSdEYn1y9w7TtlwivJw9zTNFMk9OPQ+r3yN3pYnsAmn9Y4WCZILL/xt7sDY/MuWn
JcwrROgaFMHbz1LfP4gFhSU/qqkmaWmjt6jNdiXpWLTgYsll7xQ1K2zpnOaimz0R
NquP5zWA9+pha/qnWZDGqj4gcciKBJKI/mZJQ4IVnXUm/3HeGkEQTNO4tddYHyKo
Hp2xhyDPHlUwjA/8Al6fPyfZoLdqNFWnWlCd+DDaFQpOSiVS8V7MiUcifcUtb72o
890r0SNjccVu/NEIEWRNEfOSPX2lZtKfW+cnAfy3QPvWJR5BqVh9b3dDUEjwxv9m
UMMQMkBXO9Kqg2uxj7c4oKzqt4Dj1dG8ZEnVefrfRu/KWgWLLyPF0WFap4JtI9+H
0exzZ3lifwq/P4OYoXjJd4AB1VB3lo10TteYYQFuS5KI5u60hxwcpRkFb5lIsGuh
fjR0neFYK8hjhFnqxg5goU69X/00HyQj53733MGVHIatKqzlz5rEiB0ifCVAYKnc
M931I96h+o4D2GCLOmKN
=3i0x
-----END PGP SIGNATURE-----

--GvznHscUikHnwW2p--
