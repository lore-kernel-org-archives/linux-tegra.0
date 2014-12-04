From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL v3 2/4] ARM: tegra: Device tree changes for v3.19
Date: Thu, 4 Dec 2014 17:37:15 +0100
Message-ID: <20141204163714.GB16914@ulmo.nvidia.com>
References: <1417707950-7633-1-git-send-email-thierry.reding@gmail.com>
 <1417707950-7633-2-git-send-email-thierry.reding@gmail.com>
 <25932693.6J1SFYEMJN@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <25932693.6J1SFYEMJN@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 05:24:14PM +0100, Arnd Bergmann wrote:
> On Thursday 04 December 2014 16:45:50 Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 8918465163171322c77a19d5258a95f56d89=
d2e4:
> >=20
> >   memory: Add NVIDIA Tegra memory controller support (2014-12-04 16:11:=
47 +0100)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-3.19-dt
> >=20
> > for you to fetch changes up to 5b605d4426e1dc38b6572bd42c151ad247359e3a:
> >=20
> >   ARM: tegra: Enable IOMMU for display controllers on Tegra124 (2014-12=
-04 16:16:15 +0100)
> >=20
> > Note that this pulls in the for-3.19/iommu branch (tegra-for-3.19-iommu
> > tag) to resolve the dependency between the IOMMU driver addition and the
> > DT changes that include dt-bindings/memory/tegra*-mc.h headers.
> >=20
>=20
> Pulled into next/dt2 to resolve the dependencies. This won't be part of
> the initial set of pull requests for the merge window but will be slightly
> delayed until all other dependencies are upstream and should still be
> there in time for -rc1.

Sounds good.

Thanks,
Thierry

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUgI26AAoJEN0jrNd/PrOhr2YP/jUDwMHCKG5ZY15GQGArpk3I
mpx/B/46URshf0Iw4yrQ/Wk1lLB4gNv4XdaTuUPf9SchrF/CCfIv4or2HJXISg/x
6d9CGruu6Ge6uADL0GHXCaJNNHCXVfFl+wJ/eAeeKcMbUoG3z9NYrCpzV2PSktVZ
z1k2wmRo5cughJCheC2PYHbclNwEUtPoynmavuyJkwhdBI7f4X3YgGHdPv2QZl4m
sjAl+6xVpmdlIO+D1sew5KI1ujMeJZH78OWeoMGE7w/5JPWl8hIKUePgoTji9cdg
O8M/tUHPvW7gN2YJlg9gyP0MO0YVBi/ovU3rWQWW1jHXe2UIoFjPscYx8nsDyIks
lYf48iXmcZ4L/cKzMPZFHoBCzhcg+UDmwWXvfu4mv2CRNKsHUL09UkwRfA8GYvnN
5pfRUtv4udFc6LFdgtRiAYPiKSl8BB7x/4bp3ysSvbsCukOzac997r1t/E6WV+kG
OW9pj3EkKqApb4jCvI3EBT2AenTEROyZJ6hdnUbU1HA6GEOo6Gwtmd2I2uG1ZF9H
UwfvXFCCLw42quC9bGBsCG/c7ckdWlzZ310RaKxDWPVaupECDoDkyc01Dy+P0Ph/
gNGdsDKy0DCY45G25MZ36Dmu1ZkvUNjR1nEI+1lyHqCuOHVI2wMk9AQTM8FRBPDA
2brkyo+woeAgcehcQg52
=Nf+y
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
