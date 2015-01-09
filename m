From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] clk: tegra: add support for the Tegra132 CAR IP block
Date: Fri, 9 Jan 2015 12:22:47 +0100
Message-ID: <20150109112246.GC16465@ulmo>
References: <20141216203813.22980.2301.stgit@chromeos-P9X79>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141216203813.22980.2301.stgit@chromeos-P9X79>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2014 at 12:38:24PM -0800, Paul Walmsley wrote:
> This series follows up on Peter De Schrijver's posting of a Tegra132
> CAR series in July of this year.  It adds common clock framework
> support for the Tegra132 CAR IP block.
>=20
> The patches are based on next-20141209 and have been compiled and
> boot-tested on a Tegra30 Beaver board, a Tegra114 Dalmore board, and a
> Tegra124 Jetson TK1.  They've also been tested on a Tegra132 Norrin
> FFD board, with some other patches applied since support for that
> board isn't completely upstream (but is coming shortly).
>=20
> Intended for v3.20.
>=20
> - Paul
>=20
> ---
>=20
> Paul Walmsley (2):
>       clk: tegra:  split Tegra124 clock header file
>       clk: tegra: Add support for the Tegra132 CAR IP block
>=20
> Peter De Schrijver (2):
>       clk: tegra: make tegra_clocks_apply_init_table() arch_initcall
>       clk: tegra: Update binding doc for Tegra132

Peter, you've collected clock patches in a separate branch in the past
and sent off pull requests to Mike. Are you going to pick up these
patches, too?

With the comments on patch 4/4 addressed, the series:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUr7oGAAoJEN0jrNd/PrOhzkAP/AlHQ0tPxBTnpxlgTE6bYxny
U5veMR5eICLQXpASj+zbf0SkMcVntjhc3efMM7JJ4o2qk+y9nVqSkGzn63SKY4w1
KFKq0dZsm6sWgjzFc9jFTtXWEuOHmOnMNtrvv5+7Jg6zJjSbc/ebN097hytO7MGs
U5uuYXVOFPRU4D/m/Tdmxo0vrRyFIQHCFXM4v/NhqAni3s1no5bRzh1DK6eRyb6b
z6wtkpPyBaZgUA2EQVay9UqL1yBlwBQVFn0oHt+x2u4BIatlcKl7Jk1HTaVrBTo3
1iM4ccbwDfrRO3YVTiiAMUaP9XHUQ1TY33huUvIRdtVeBNgibq45RA2UQW79pLzq
F6qb8N7/acnO0SryS/d0VCkzHyKxZ0aLWquNClh98ka+hEpQ8ojmO8xDbduoQ1Wn
GOJoG3w7EcERGn9qyyTgV9hACObKzMaYBpIjX99GJn9ruX7O1nhGVd1KT5QP5EqT
J/wRY11HSGEuMmNR52bhYyCFgI0vViKJTJfYDTWgpTkwVKlVxmt9f3xg8ObZVi4I
hcYthRMBh19wuwkWXGZRwQ+Mu+8qZDv7roq6+wsEm7/hdUi3tgA8Yo+7Ezut+FmH
sWWTcc/DWDTprc0Ok1Xf0nzCOd4SAB4sOo9khLt8tE2sNUIRw0YuMgwDdnKEVjs1
mLAJyWuW59GuLKOex+4k
=zTVr
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
