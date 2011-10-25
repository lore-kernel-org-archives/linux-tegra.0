From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: Add device-tree support for TrimSlice board
Date: Tue, 25 Oct 2011 07:52:39 +0200
Message-ID: <20111025055238.GA30358@avionic-0098.mockup.avionic-design.de>
References: <1319450467-11819-1-git-send-email-swarren@nvidia.com>
 <5320972.AGvAdFqRz5@ax5200p>
 <74CDBE0F657A3D45AFBB94109FB122FF173E1B4171@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173E1B4171-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Marc Dietrich wrote at Monday, October 24, 2011 3:28 PM:
> > On Monday 24 October 2011 12:01:07 Stephen Warren wrote:
> > > * Add device-tree file for TrimSlice
> > > * Add that to the list of .dts files to build
> > > * Update board-dt.c to recognize TrimSlice board name
> > >
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/tegra-trimslice.dts |   38
> > > +++++++++++++++++++++++++++++++++ arch/arm/mach-tegra/Makefile.boot  =
   |
> > >  1 +
> > >  arch/arm/mach-tegra/board-dt.c        |    3 ++
> > >  3 files changed, 42 insertions(+), 0 deletions(-)
> > >  create mode 100644 arch/arm/boot/dts/tegra-trimslice.dts
> >=20
> > doesn't this also require to add something like
> >=20
> > obj-${CONFIG_MACH_TEGRA_DT} +=3D board-trimslice-pinmux.o
> >=20
> > to the Makefile?
>=20
> Yes, definitely. I've fixed this up locally; I hope to repost soon.

Can it please be obj-$(CONFIG_MACH_TEGRA_DT) instead? I think both Russell
and Olof agreed[0] to use parens instead of braces, even though the current
practice is to copy what previous boards did.

Thierry

[0]: http://article.gmane.org/gmane.linux.ports.tegra/1670

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6mTqYACgkQZ+BJyKLjJp9fhACdHrnxllNh1kdTpE/K/oFuC9g3
Xg0AoJEoBosv44gFgL8sYSbEtWliOzGu
=jrkO
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
