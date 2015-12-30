From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 4/5] ARM: tegra: Devicetree changes for v4.5-rc1
Date: Wed, 30 Dec 2015 16:48:28 +0100
Message-ID: <20151230154828.GC7085@ulmo>
References: <1450356639-7758-1-git-send-email-thierry.reding@gmail.com>
 <1450356639-7758-4-git-send-email-thierry.reding@gmail.com>
 <20151222195520.GI30172@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151222195520.GI30172@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 11:55:20AM -0800, Olof Johansson wrote:
> On Thu, Dec 17, 2015 at 01:50:38PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d713=
0bec:
> >=20
> >   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.5-dt
> >=20
> > for you to fetch changes up to 336f79c7b6d7d04f7dad0361b9f4c8995107c062:
> >=20
> >   arm64: tegra: Add NVIDIA Jetson TX1 Developer Kit support (2015-11-24=
 16:52:25 +0100)
> >=20
> > Note that this pulls in the device tree bindings for the Tegra210 clock
> > and reset controller. A separate pull request is sent to the clock tree
> > maintainers including this commit. I've included this patch in the diff
> > stat below.
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > ARM: tegra: Devicetree changes for v4.5-rc1
> >=20
> > This adds support for the Tegra132 Norrin and various Tegra210-based
> > reference designs. There is also an initial device tree for the Jetson
> > TX1 development kit.
>=20
> Unfortunately can't merge this due to the feedback on your soc branch tha=
t is
> part of this.

In the past we've sent devicetree updates via a single branch for both
32-bit and 64-bit ARM. That's not the case for this cycle, but if we had
changes to both 32-bit and 64-bit ARM device trees, would you prefer
separate branches for those as well?

Thierry

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWg/zMAAoJEN0jrNd/PrOheSIQAK8Naagf5EQBquptlJLf76ur
ux+F7y+BgT5Oi51jklVH+3VnMmu/zxhfbajlewiX6gIjAH35OH1kCHZh9KNcNZ/L
DSrpSWfOVNk8NAqS2mH4cHkNDjkfQnXJ9FH1ZtgPWEtWG04sVmb9HnJp9zucIuB7
HQ2PEEhmBFVR27cId7NTbKVKv3OC3zCP1IB9gDShcafip+2UCmrW4u6ICgtBpppc
Fzu7OrmQ/UsZBVs3dmunyHMgB7KCRt+9RcD5rCYYhCzBJjV+1jZwy54hkcggUQLI
BMXp7F5v1pOM9KhzsBaT/OY23NPSUc9QT6cbOK3eDiQ+5gXXqvYuJWMd/72QiPau
cvxXsCxrDA4+YCcYQUq3HSPuXfkR9e2G4gjTA/VyHS3owX9cj7DplUG8soXn7x4q
u68o0yPbV/JtzUSuuzYwLci+gE4vhcIxjFAG2hMIDYI6CziaGhqkbbtLB452EuxH
hgw89usnRlrqGzAnMrsQVnjubSPHFUSb1BCo7jep7wnMH8VQZdkaUyukR63o7m3w
xMEqDEAJ+Dewqzmf7z2VKfM7AG/gZbdcyW4Cll+YiTMmIvq/AtXu5EbzNz8I/45X
ECMzPyyR2flx2Q0YrRDX2puy0FQ29DGKwk3Ic0S5FCQsm8usw6jzHgCxJcXH7L7T
5TEb7MyL03aAFTYLiFgd
=0KRx
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
