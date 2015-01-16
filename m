From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] drm/tegra: gem: oops in error handling
Date: Fri, 16 Jan 2015 12:12:24 +0100
Message-ID: <20150116111222.GB4885@ulmo.nvidia.com>
References: <20150116104342.GA4860@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150116104342.GA4860@mwanda>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2015 at 01:43:42PM +0300, Dan Carpenter wrote:
> kfree(ERR_PTR(-ENOMEM)) will not work very well.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Thierry

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUuPIWAAoJEN0jrNd/PrOhY+EP/RodiJ4aN2oiUR51X2RBwbk5
epU+SxyG9PQ/qh3g47X7o3b1kUIoHtvxD7vKFupUrLqthCahtLY5lDqWJ6xGlMNs
fohToLy7/Hs/eQWNorw/ccZYXpxy3VkhKFY+5wOfx/Ix+jbn5saZQbvNXtiF2mpR
RK9xyoI/vHGGklD/QVp8XxwpOkHosbQ3NeQWlYdbLqeACKOKbaydC0L/EmHNWBKJ
u7ywBlBpeIA/toXn+zz0Hips38aOv/NnTMTNYrIYQ1qckUYPPrQ1glBaUR6MafvI
MrslwYqSG6aFxbQ5kRCb0x+/pV+kzKJOLv7AlyQkOyGvWYUar16ECCYR6xaUMjaT
0dhR6OGQflY50rhWBZlN4G6J7aceseHvCLeb6Nx9NuxEG5TodL9p9p+a+DaJXWG9
DTuCvlNywucldesDNTQeiVZItLGV5AC8Rz40LD0FyHEJvw0yOisX0UQG865qTUX3
iLNZR0nBcvmuICjyMNz5f2dCC9Madbkin1zInJag4PuhYhGmjarKK1l/HaYHDQF7
8eKhr9CVuMSGqyS13NrlIDLrF3mkBP4/seHk64CAIPQ/2dA446i+3Cw4JdQhHrl8
s+CbXeVbuaAFsBcK5wXZs1U8wrV8V3sUkcKLbv33SVWkoAOtuDBjZCrNZQoGzZW4
Bsn9erIc8nHWDfl1Q7lm
=JSzl
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
