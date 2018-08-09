From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Ignore clients initialization failure
Date: Thu, 9 Aug 2018 15:10:35 +0200
Message-ID: <20180809131035.GZ21639@ulmo>
References: <20180801150807.15926-1-digetx@gmail.com>
 <4457259.6qKMIOUXSS@dimapc>
 <20180809104541.GC21639@ulmo>
 <1672653.y032a1rHIh@dimapc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E9SPMlsjsjqOlA3h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1672653.y032a1rHIh@dimapc>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Kyle Evans <kvans32@gmail.com>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--E9SPMlsjsjqOlA3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 09, 2018 at 03:53:03PM +0300, Dmitry Osipenko wrote:
> On Thursday, 9 August 2018 13:45:41 MSK Thierry Reding wrote:
> > On Fri, Aug 03, 2018 at 02:30:47PM +0300, Dmitry Osipenko wrote:
> > > On Friday, 3 August 2018 13:50:55 MSK Thierry Reding wrote:
> > > > On Wed, Aug 01, 2018 at 06:08:07PM +0300, Dmitry Osipenko wrote:
> > > > > From time to time new bugs are popping up, causing some host1x cl=
ient
> > > > > to
> > > > > fail its initialization. Currently a single clients initialization
> > > > > failure
> > > > > causes whole host1x device registration to fail, as a result a si=
ngle
> > > > > DRM
> > > > > sub-device initialization failure makes whole DRM initialization =
to
> > > > > fail.
> > > > > Let's ignore clients initialization failure, as a result display =
panel
> > > > > lights up even if some DRM clients (say GR2D or VIC) fail to
> > > > > initialize.
> > > > >=20
> > > > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > ---
> > > > >=20
> > > > >  drivers/gpu/host1x/bus.c | 18 +++++++-----------
> > > > >  1 file changed, 7 insertions(+), 11 deletions(-)
> > > >=20
> > > > This is actually done on purpose. I can't think of a case where we =
would
> > > > actively like to keep a half-broken DRM device operational. The err=
ors
> > > > that you're talking about should only happen during development,
> > >=20
> > > [only in a perfect world]
> >=20
> > gr2d and VIC are fairly deterministic. What are the errors you are
> > seeing that cause initialization failure?
>=20
> Right now there are no specific errors. There is only a known trouble wit=
h the=20
> ARM_DMA_USE_IOMMU, but that causes to fail all of the clients.
>=20
> > Note that it is possible for
> > these devices to malfunction even if initialization succeeds. A failure
> > to initialize can only happen if there's something wrong in the device
> > tree, firmware is missing (in case of VIC) or a regression was
> > introduced in some subsystem that causes a failure (maybe deferred probe
> > or something similar).
>=20
> A missing firmware is an actual good example. Though can't VIC driver be=
=20
> changed to load firmware at the time of a its first use by userspace? It=
=20
> should be very annoying that kernel driver forces you to churn with initr=
amfs.

No, that's not really how firmware loading works. There's no technical
barrier to doing it, but it'd be strange. If a device needs firmware to
work, it'd be unusual to make it available before you know that it can
be used.

What if the firmware can't be loaded at the time of the first use? How
do you report that back to userspace? -ENOENT because the firmware file
can't be found? How is userspace to know that this is a problem with
firmware loading rather than some other error having to do with the VIC
command stream being broken, for example?

Modifying the initramfs is only necessary if you have the module built-
in or the module in the initramfs. If the module is in a root
filesystem, simply put the firmware there as well and you should be
good. This is all very standard Linux behaviour, nothing new or exotic
there.

> > > > and the
> > > > device not showing up is a pretty good indicator that something is =
wrong
> > > > as opposed to everything booting normally and then getting some cry=
ptic
> > > > error at runtime because one of the clients didn't initialize.
> > >=20
> > > If machine doesn't have a serial port and it doesn't have ssh server
> > > running or network doesn't come up, you'll end up with a completely
> > > dysfunctional piece of hardware. Hence there is no chance for you to =
even
> > > check what is wrong. The argument about a cryptic error doesn't make =
much
> > > sense, you have to improve your runtime as well (and you'll get a err=
or
> > > message in the kernels log).
> >=20
> > You make a good point here. I'm not aware of any devices we support in
> > the kernel that don't have a serial console, but that doesn't mean the
> > kernel could be used on an "unsupported" device  that doesn't have one.
>=20
> AFAIK, enabling serial on AC100 require soldering iron.
>=20
> > > > From my perspective, all clients should always be operational in
> > > > whatever baseline version you use. If it isn't that's a bug that sh=
ould
> > > > be fixed. Ideally those bugs should get fixed before making it into=
 a
> > > > baseline version (mainline, linux-next, ...), so that this never im=
pacts
> > > > even developers, unless they break it themselves, in which case ref=
using
> > > > to register the DRM device is a pretty good incentive to fix it.
> > >=20
> > > Sounds like you're assuming that only kernel developers are supposed =
to
> > > use
> > > Tegra, though at least (for now) for upstream it is kinda true. Of co=
urse
> > > that could be changed ;-)
> >=20
> > That's not at all what I'm saying. What I am saying is that we should
> > make it difficult for developers to break the kernel in a way that would
> > put users into a position that is difficult to get themselves out of. If
> > we refuse to register the complete DRM device in case some subdevice
> > fails to initialize we increase the chances of developers noticing and
> > fixing it.
> >=20
> > If all we do on failure is output an error message, it's very likely to
> > go unnoticed. Developers are likely to check specifically the
> > functionality that they're working on and ignore failures that they may
> > have caused in other parts of the code as a side-effect of their current
> > work.
>=20
> I can try to help with improving of your automated testing suite, if you'=
ll=20
> make it accessible to the public.

This has nothing to do with automated test suites. The problem with test
suites is that you can't force everyone to run them, so it's likely that
people would still miss it.

The whole point of failing the whole thing is to force people to do the
right thing irrespective of any test suite or log or whatever. So if I
work on display and accidentally break VIC initialization, I'm now
forced to fix VIC initialization if I want to be able to test display.

> > Perhaps a good middle ground would be to turn initialization failures
> > into WARN_ON() to increase the chances of them getting notified and then
> > continue on a best effort basis in the hopes of having enough
> > initialized to get a message to users.
>=20
> Good to me, I'll make v2.
>=20
> > Another alternative would be to
> > mark essential subdevices (such as the display controller) so that only
> > they will cause failure to register the whole DRM device.
>=20
> I don't think that making some subdevice more valuable than the others is=
 a=20
> feasible approach, how you are going to differentiate what of the two dis=
play=20
> controllers is more important than the other.

I wasn't talking about one display controller vs. another, but rather
about "optional" subdevices. For example, I'd consider gr2d, gr3d and
VIC as optional in that they aren't needed to get something on the
screen. Anything display related would be considered required to make
sure people get at least a working display, even if all optional sub-
devices fail.

Thierry

--E9SPMlsjsjqOlA3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltsPUgACgkQ3SOs138+
s6Fn2BAAoRI1sN1kGFyLEnAeSYTOHvbGQXpxWNV97IWwJa9oWwFuUKOqWcKN1iod
f64OElXcMBrb3gOyzRU4UlHQZYDqh2k5WE1rPoWcXU7if7lQwC31bbdcpQdxCod3
yCt6IS8fGD3V6dPU94Uh4b3s4zOvdhdT99cniOvsjgNl9t+T1O8ZOn5MLg8Lvq2K
UFBUJK+OpGP+H1Nr5T6Mg5EN33ENbYCSSvqsgu/LSVYuVKntg05Mdft92fjJuwhh
CCSF3ksLyWDh8fAyJ/rxHigx+lOXeKxyUTMcn16HE57iJs7nhNeDAokc9iOPpT31
RftzK3CcsB93vpR8d8ZyfGjwd7w0l2N0qbUtLucc4nxcrb+nI20deqQtzNImH984
RWkGU4MtAuAMefD6Q9hW18O/l9t+fm+vJuLEmLvlV5zmuO3TS0oWPoyIZYziKLJ1
JbIo03fWygqjUUIBn+lQjuqCu5avU3XWgiJo7pC9OF6OS+hUW70vDE9toxYZ8uML
1cTztLZlCx8zLzRfs6J0BSHsyez3G0dI/qjRr7iEf0nguyvN2BKUp3gokNItafgn
EfMKmhFta8F3qhrYabMCTFHkvaOS8EqbMMsVqhYBqNR9Uh2vYhhKTQn+D+KX56TS
8RH+MvhzaP6J2nf9It4th/qZuiTP9daMKszvznClB1S5fWUVwxg=
=fisY
-----END PGP SIGNATURE-----

--E9SPMlsjsjqOlA3h--
