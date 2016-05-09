From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Mon, 9 May 2016 07:25:00 +0200
Message-ID: <20160509052500.GB18753@ulmo.ba.sec>
References: <1462566015-12306-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462566015-12306-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2016 at 04:20:15PM -0400, Rhyland Klein wrote:
> From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> Move the UTMIPLL initialization code from the clk-tegra<chip>.c
> files into clk-pll.c and perform the initialization sequence when
> PLLU is enabled.
>=20
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> [rklein: Merged in some later fixes for potential deadlocks]
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
>  - Swapped out __clk_lookup for 2 calls to clk_hw_get_parent
>=20
>  drivers/clk/tegra/clk-pll.c      | 484 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-tegra114.c | 155 +------------
>  drivers/clk/tegra/clk-tegra124.c | 156 +------------
>  drivers/clk/tegra/clk-tegra210.c | 182 +--------------
>  drivers/clk/tegra/clk-tegra30.c  | 113 +--------
>  drivers/clk/tegra/clk.h          |  17 ++
>  6 files changed, 510 insertions(+), 597 deletions(-)

The commit message should mention *why* this change is necessary. It's
fairly obvious what you're doing by looking at the code, but the commit
message is an opportunity to let others know why this is necessary or
worthwhile. Does it fix a bug? Is this clean up? It seems important to
me when you say "perform the initialization sequence when PLLU is
enabled", but as it is I don't understand why.

Thierry

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXMB8rAAoJEN0jrNd/PrOh228QAI1zVCq1KCgkMTY2+uxwLvPL
TCYfnmFbbplz5k/curXpGQHE4MFixqWSAhqlR/tPniUXgqJg7fFbYnc+KCCTU0Fe
Kyp+NkOXt54k5B5WGDp1SfRBCX5F2VkHhJLpjzGBKEC+4+D+ZAB8uWt0kOOfFEaR
XKm8ViwiaRcwCbNuET7HjY5gBr/llxE+0diXizwmmJe9a7jJzb1nVtfi7ecaHv5a
nZl1zoQ6by6Q5MRLedp2DGGw/m14ktjwUEUDoce0RMssTqFmvp1vsZBg1pJIYwoK
NSHaN7dBrPmwKq+ZL51nt9iO0ww3QzuEABHon7reUYrT7USguP1mAwJcTvoOeywZ
8qR1i9rms7EwJDjEk5Yw71X1MnzJwA1/0GtHlxXZ/2kd1CJ+j8BXZ+0rq4rXJnFd
J2mFcridjklPY0m6geMpJdsufFStatIR9WBqE/WA6XYqXrzsfv69KJSHDYehl5UA
RFv1HExRPdP0NFG1qnscJGW2ZjDlcYxudW1MunZCaMTPn+nveGheWduZfVXgKloE
0lcp+RrUGtnJooiQkZNSt9eFN1QeGRkVWg/h25THe0Hhx2allUthQ3Sa3GpbzxA7
SdkOHnWA5Pu0v/PQwumX0qJRh4w4rv1XMTOE7ZdIVBss0+7ybfJyBhQXN/8C9YwM
t1JGd6IAJoJ3ZZCSnwOC
=1AE6
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
