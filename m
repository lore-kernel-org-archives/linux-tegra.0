From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Thu, 17 Jul 2014 13:06:53 +0200
Message-ID: <20140717110652.GA18383@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <20140716185715.GA4843@mithrandir>
 <CAOesGMi=UrLS3OuFb9SAaf9dPBojYrqp4VE0YhGiX1hkLvYanw@mail.gmail.com>
 <111661024.qGiugVUugr@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <111661024.qGiugVUugr@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 10:54:17AM +0200, Arnd Bergmann wrote:
> On Wednesday 16 July 2014 12:34:56 Olof Johansson wrote:
> > On Wed, Jul 16, 2014 at 11:57 AM, Thierry Reding
> > <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > On Wed, Jul 16, 2014 at 05:22:03PM +0200, Arnd Bergmann wrote:
> > >> On Wednesday 16 July 2014 17:14:29 Thierry Reding wrote:
> > >> > >
> > >> > > Ok, I'll have a look. I think when this becomes a separate drive=
r, it
> > >> > > should also have its own header file, so maybe you can in the me=
antime
> > >> > > make it a local header file in mach-tegra until we have found a =
good
> > >> > > place for it.
> > >> >
> > >> > Why do you think it should be a separate header? We already have a
> > >> > couple in include/linux and I'm not sure it's useful to add even m=
ore.
> > >> > If anything I would've thought it made sense to move the content o=
f the
> > >> > other headers into tegra-soc.h.
> > >>
> > >> I very much dislike the idea of having a per-vendor header file that
> > >> everything gets crammed into. We should try to have proper subsystems
> > >> and generic interfaces for these wherever possible.
> > >
> > > I completely agree. However spreading the SoC-specific functions acro=
ss
> > > multiple header files isn't going to help. If we keep all the per-ven=
dor
> > > APIs in one file it makes it easier to see what could still be moved =
off
> > > into a separate subsystem.
> > >
> > > Now for PMC specifically, we've investigated converting the powergate
> > > API to power domains. I don't think it will be possible to make that
> > > work. The issue is that there's a defined sequence that needs to be
> > > respected to make sure the device is powered up properly. That sequen=
ce
> > > involves the primary clock and reset of the device. It's been proposed
> > > to make these clocks available to the PMC driver so that it can contr=
ol
> > > them, but then we can't make sure that clocks are really off if they
> > > need to be, since we have two drivers accessing them. The only way I =
see
> > > to make that work reliably is by moving complete control of the
> > > powergate into drivers so that they can make sure clocks and resets a=
re
> > > in the correct states.
>=20
> I don't completely follow, but that's ok ;-)
>=20
> > > The PMC driver also provides access to I/O rails and specifically a d=
eep
> > > power down state. Some modules are in deep power down state by defaul=
t,
> > > so they need to be brought out of that state. I suppose this would be
> > > easier to turn into a generic framework because there aren't any cros=
s-
> > > dependencies like for powergates, but I'm not aware of any other SoC
> > > having a similar feature (or implementation thereof in the kernel). A=
nd
> > > adding a subsystem just for the sake of it if only one implementation=
 is
> > > available isn't a good idea in my opinion because it will be naturally
> > > designed to work best (and therefore maybe only) for the one instance.
> > >
> > > This issue is a fundamental one and there are bound to be other SoCs
> > > that have similarly unique blocks for which it's impractical to add a
> > > framework. I suspect the primary reason why we haven't run into it th=
is
> > > frequently is because a lot of it is still hidden in arch/arm/mach-*.
> > >
> > > I'm open to suggestions of course, but the best option I currently see
> > > is to collect these custom APIs in a central place so that we can eas=
ily
> > > compare various SoCs for commonalities as time goes by and factor them
> > > out into subsystems where appropriate.
> > >
> > > For the same reason I think it's valid to put this type of code into
> > > drivers/soc. That way we have one subdirectory to look through for
> > > potential unification rather than various ones sprinkled across arch
> > > directories. It makes little sense in my opinion to move this code to
> > > drivers/power if there's no common framework anyway.
> >=20
> > I agree. We can move them out and make them common them later if needed.
> >=20
> > We're sometimes trying too hard to find proper homes for various new
> > drivers, which means that we're proliferating the kernel with a lot of
> > new driver directories that have only one or two drivers in them.
> >=20
> > I'd rather collect stuff in drivers/soc, and move it out as needed
> > later. Especially since we merge drivers/soc through one merge path
> > (arm-soc) and can keep an eye on it, while the
> > scatter-drivers-everywhere approach merges through various
> > maintainers.
>=20
> Ok. I'm fine with having one driver in drivers/soc for the pmc (and
> a few associated bits if necessary) and a header file for that. If you
> end up with two separate drivers in drivers/soc, I'd also prefer two
> separate header files.
>=20
> It may be a good idea to put these headers somewhere other than
> include/linux/*.h, which is completely overloaded by random stuff.
> We could use include/linux/soc/*.h or include/soc/*.h for those.

We could go all the way and make it include/soc/tegra/*.h for better
namespacing. I guess either way would be fine, really, since the number
of files in those directories should be small by definition, so we
should be able to do without the extra SoC directory, too. I have a
slight preference for a separate SoC directory, do you have any
objections?

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTx65MAAoJEN0jrNd/PrOhGxMQAKs0ONcYF/UlPeT/Rxk5dx89
kLSk4LilaEnyeZ1JsZn5AE54NEOJRFnv2qh0dFr+mqZMvq2aErRdAgTgeMhl0qhL
3DKge/JH0YphsCh6iuC8gV9trM0yTqzglsiblyqwRDUcgr4vU7377h5unHuTKWlV
A2utA7fSB+hpr7xI1whJ6Mf9/7Nhd7yM8fb9W+Msfs8ZQXSwyzgGJ4P1M+I3oFyz
WIK1Z+uogDVXcQ/oaMVIOWVwr4u/zv8gkW+TVdL8MqmX7ampZhAqDdx4+XuP0GFs
7RWmb6sOw+dUhyRaPHWKoxbErEHyNYCqG29WVoiiTNHv9dBjLrH8KtHWIDgCFeM+
zlVWgXMegOHEPqv10+H5D/s+uw3CrhSl8S0xE0eqKHOS69+1kufp2vO2hK1JPwWk
1kQnt3wqWffGE08BA5UF3tS4eEdV/2L+71e52qGiapZ8UkBxZBDZYCrj71GoAmsX
jeslUP5u0B+IYiE3FUzi6Td22KE9z8QoHQDOc26IK978//vBAfugBwQor8EI/SzN
7RoQt2ga28mORoBjw7c8laCImjm9X924mwwF9BpQ2T6IqRIjeUWwtIWXO+vciB7O
DNvst9/eM0D9brPvoHNT3cIwYP1SOn8ovpBHTKr2prHS/YTRG+Ugost6A8edc2lA
cpVDApBL3NQa8OV0ziJX
=8CxD
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
