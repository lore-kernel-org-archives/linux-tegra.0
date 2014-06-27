From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Sat, 28 Jun 2014 01:27:58 +0200
Message-ID: <20140627232757.GB26184@ulmo>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53ADAA1C.70407@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53ADAA1C.70407-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2014 at 01:30:04PM -0400, Santosh Shilimkar wrote:
> +Arnd, Greg, Catalin and Kumar,
>=20
> On Friday 27 June 2014 12:58 PM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > These drivers are closely coupled and need to be moved as a whole. One
> > reason for moving them out of arch/arm/mach-tegra is to allow them to be
> > shared with 64-bit ARM.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/mach-tegra/Makefile                       | 32 --------
> >  arch/arm/mach-tegra/common.h                       |  4 -
> >  arch/arm/mach-tegra/io.c                           | 27 +++++-
> >  arch/arm/mach-tegra/pmc.h                          | 62 --------------
> >  arch/arm/mach-tegra/tegra.c                        |  9 --
> >  drivers/soc/Makefile                               |  1 +
> >  drivers/soc/tegra/Makefile                         | 34 ++++++++
> >  .../soc/tegra}/cpuidle-tegra114.c                  |  0
> >  .../soc/tegra}/cpuidle-tegra20.c                   |  6 +-
> >  .../soc/tegra}/cpuidle-tegra30.c                   |  0
> >  .../arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.c |  0
> >  .../arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.h |  3 -
> >  .../mach-tegra =3D> drivers/soc/tegra}/flowctrl.c    |  0
> >  .../mach-tegra =3D> drivers/soc/tegra}/flowctrl.h    |  2 -
> >  .../arm/mach-tegra =3D> drivers/soc/tegra}/headsmp.S |  0
> >  .../arm/mach-tegra =3D> drivers/soc/tegra}/hotplug.c |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/iomap.h |  0
> >  .../arm/mach-tegra =3D> drivers/soc/tegra}/irammap.h |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/irq.c   |  1 -
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/irq.h   |  6 --
> >  .../arm/mach-tegra =3D> drivers/soc/tegra}/platsmp.c |  5 --
> >  .../mach-tegra =3D> drivers/soc/tegra}/pm-tegra20.c  |  0
> >  .../mach-tegra =3D> drivers/soc/tegra}/pm-tegra30.c  |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pm.c    |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pm.h    |  4 +-
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pmc.c   |  0
> >  drivers/soc/tegra/pmc.h                            | 35 ++++++++
> >  .../mach-tegra =3D> drivers/soc/tegra}/powergate.c   |  0
> >  .../soc/tegra}/reset-handler.S                     |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.c |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.h |  2 -
> >  .../soc/tegra}/sleep-tegra20.S                     |  0
> >  .../soc/tegra}/sleep-tegra30.S                     |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/sleep.S |  0
> >  {arch/arm/mach-tegra =3D> drivers/soc/tegra}/sleep.h |  2 -
> >  include/linux/tegra-soc.h                          | 95 ++++++++++++++=
++++++++
> >  36 files changed, 195 insertions(+), 135 deletions(-)
> >  delete mode 100644 arch/arm/mach-tegra/common.h
> >  delete mode 100644 arch/arm/mach-tegra/pmc.h
> >  create mode 100644 drivers/soc/tegra/Makefile
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra114.c=
 (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra20.c =
(100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra30.c =
(100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.h (91%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/flowctrl.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/flowctrl.h (98%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/headsmp.S (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/hotplug.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/iomap.h (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/irammap.h (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/irq.c (99%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/irq.h (83%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/platsmp.c (98%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pm-tegra20.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pm-tegra30.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pm.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pm.h (94%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/pmc.c (100%)
> >  create mode 100644 drivers/soc/tegra/pmc.h
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/powergate.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset-handler.S (1=
00%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.h (97%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/sleep-tegra20.S (1=
00%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/sleep-tegra30.S (1=
00%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/sleep.S (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/sleep.h (98%)
> >=20
> NAK for this patch.
>=20
> You are using drivers/soc/* as a dump yard for your SOC code which
> is not the intention we created drivers/soc/.

That was not my intention. What remains in arch/arm/mach-tegra at this
point doesn't actually have a corresponding subsystem (well, except
maybe the cpuidle code).

> Its really for subsystem drivers which doesn't have appropriate
> home in Linux kernel today. From your above patch ...
>=20
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra114.c=
 (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra20.c =
(100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra30.c =
(100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.h (91%)
> This should go into drivers/idle/*. if you have dependencies, please sort
> them out.

What exactly is the difference between drivers/idle and drivers/cpuidle?
There's an intel_idle driver in drivers/idle that includes cpuidle.h and
registers with that subsystem. But there's also an i7300_idle driver
that doesn't.

drivers/cpuidle seems like a better fit. I'll look into moving the code
there.

> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset-handler.S (1=
00%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.c (100%)
> >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.h (97%)
> subsystem: drivers/power/reset/

drivers/power/reset seems to be for drivers that register functions to
reset a board. The above code for Tegra doesn't do that. Rather it sets
up the reset handlers for secondary CPUs and for suspend/resume.

> For tegra/*pm*/, you can use drivers/power or drivers/base/power/

drivers/power seems to be exclusively battery charger drivers. The pm.c,
pm-*.c and sleep-*.S set up suspend/resume. That doesn't seem to belong
in drivers/base/power either.

pmc.c implements various routines to access the power management
controller, some of which is needed by suspend/resume, some of it is
needed by SMP. powergate.c implements a subset of the PMC that needs to
be exported to drivers to enable power partitions on the SoC. I'm not
aware of subsystems that deal with this kind of driver.

> For SMP boot, ARMv8 expecting to have either PSCI based implementation or
> device tree based boot scheme. you can move towards that model if possibl=
e.

But we also have the code for SMP on 32-bit ARM. Should that remain in
arch/arm/mach-tegra or can it move to drivers/soc/tegra?

So the only thing in the above that I think could be moved somewhere
else is the cpuidle drivers. Or do you have any other suggestions for
the remaining code?

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTrf39AAoJEN0jrNd/PrOhLzIP/iJpvfgA9QcApOv8NaQ1eRKr
dMOO15v55xcONkMjDo3FkM/Ea/iEtUL/nI3TCXFAswFPmBmJ2lFOrxp5axZA3pUs
UPGwFd4esRKApWTD+Ey8rGr2l3p5MTLVJBUgoWx1aOp6J8X8aPMSFLFDWX9sORAO
y3va2g1dsP2rB7GEG0nEyQrRDj/rzmx1KQPK7Tsu1HtR6gw9Qam1hgZ7oGeexFRd
91PsWgZ3BxlyVBkLvIUuGNSbI2sgVaTNIPoqDrfQOq7/xjRzQm2jw212+Gimsl8a
SXLIaITgVgjdeEY4E3oG3Vy1g5G1IpA/NCgWPGcwzJFyxGtQGAxUUZyQLz4l9k1/
37SEDi0/QNlf2b99gJkpp83G9o3voKkGlhAPGyQbsvJ/drSP1x/2HLPLsz4umtPd
QicKPTQSvAy81Q+ZWTyKvgCZEFmZku6T9w75C2di7pKyHBeD47+5alakDL6Pc+DH
CsSZJmUDFYXqitsmTIK2uKMTIXx9D9mPhSUnr5xnRSlDZev++yvSrBtABOmvU6Pt
w6uZako6RmdhQV0qElP5tqsr6uQwOga22x0G/bgQdfsi2iCquHeg+kg3gVd9JolO
Mvdrtqq9PxljK9mN43ijL/CBI+wAa1TFhcGtXy7vhy6JDReYpv9bTCsKn0b2j+2J
DPeUseR40/tUTGJ/Df+t
=F/BI
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
