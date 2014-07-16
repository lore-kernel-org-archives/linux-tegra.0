From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Wed, 16 Jul 2014 21:47:42 +0200
Message-ID: <20140716194740.GA5212@mithrandir>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53AEF81D.3080408@ti.com>
 <20140628204025.GA16415@ulmo>
 <7497427.LQy8pJts8f@wuerfel>
 <CAOesGMjgNZ0hvWy0p1fh36gOMfBVd-uJSf=AWUsr9GdrrErtyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjgNZ0hvWy0p1fh36gOMfBVd-uJSf=AWUsr9GdrrErtyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 12:31:00PM -0700, Olof Johansson wrote:
> [ Gee, I had completely missed this thread because nobody bothered to
> cc me. Seems to be standard procedure on 64-bit these days. :( ]
>=20
>=20
> On Mon, Jun 30, 2014 at 12:20 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Saturday 28 June 2014 22:40:26 Thierry Reding wrote:
> >> > > pmc.c implements various routines to access the power management
> >> > > controller, some of which is needed by suspend/resume, some of it =
is
> >> > > needed by SMP. powergate.c implements a subset of the PMC that nee=
ds to
> >> > > be exported to drivers to enable power partitions on the SoC. I'm =
not
> >> > > aware of subsystems that deal with this kind of driver.
> >> > >
> >> > Please see above.
> >>
> >> Like I said, I don't see what business suspend/resume related code has
> >> in drivers/power. What we're talking about here really is functionality
> >> very specific to Tegra. Also some of that code needs to be run at very
> >> early points in the boot process, so we can't reasonably turn it into a
> >> proper driver anyway.
> >
> > I believe the powergate.c stuff can be changed into pm_domain code, but
> > we don't have a good subsystem with generic DT bindings yet, so that
> > may need some more groundwork first. drivers/power or a subdirectory
> > of that may end up being the right place though.
> >
> >> Also, the real win we get from moving code out into drivers/ is if we
> >> can provide a common framework for them. I don't see how we can possib=
ly
> >> do that for this code since there simply isn't enough commonality
> >> between SoCs. At the same time we now have a situation where both 32-b=
it
> >> and 64-bit variants of some SoCs share some of the same hardware at the
> >> very low level and since we don't have mach-* directories for 64-bit A=
RM
> >> and shouldn't be duplicating code either, we need to find a new home f=
or
> >> this type of code. drivers/soc seemed to fit perfectly well.
> >
> > For the low-level stuff yes, but I agree with Santosh there needs to be
> > some more work trying to split out individual high-level drivers.
> >
> > There are two common patterns for the interface between the low-level
> > register access and the more high-level stuff:  you can either use
> > a "syscon" driver that just exports a struct regmap and that gets refer=
enced
> > from other drivers using a phandle in their device nodes, or you have
> > a driver in drivers/soc that exports a somewhat higher-level interface
> > and comes with its own header file that gets included by other drivers.
> > At the moment, the syscon/regmap variant can only be used once device
> > drivers are loaded, but there is some broad agreement that it should
> > be changed to allow calling syscon_regmap_lookup_by_phandle() at
> > early boot using just DT accessors.
>=20
> I'd strongly prefer to NOT tie this into DT and keep it as in-kernel
> implementation until we know more what a common subsystem might look
> like, if any.
>=20
> If we keep it only in the kernel, then we're free to change it as
> needed. If we tie it into DT/syscon, then we get stick with
> stable-only ABIs from day one. That doesn't seem like a good idea.

There are two sides to keeping to an in-kernel API too: it may seem like
we're free to change this at will and aren't subject to a stable ABI.
However that's not entirely accurate.

Assume we don't put any information about a feature into DT but use an
in-kernel API only. Once we've come up with a good way to represent that
in DT and have a generic framework that we can use, we'll most likely
still need to keep around the old API in the kernel to make sure the
kernel still works with a DT that doesn't have nodes and/or properties
for the new binding.

So the question arises: at that point is it really worth using a DT
binding? Since we already have an API that works, why bother coming up
with a new one? Especially if we can't get rid of the one we already
have anyway?

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTxtbcAAoJEN0jrNd/PrOh2kgQAIT5GTcWG9yJYzqskBs5IRc+
YQv8AJc0A/dC/UZJ1vXmjw7DNr4XvwUZ/ygDdcn61oCkpLuH56OyuNAXfJh67fij
9NjHpxVZxJjkWpmRi1Sd08ES1e2vNpbNcq9Bui47CWv5AfdOfI3mEGjRxUWzkTgW
IFtMFq65D04PWKkVcNAH0Z2C4vd1ruam3aD9ydAvvDL+y2ZmneCO0+EmLT1uHjft
OUMem+bl+voF8ymgxZVmMAFPgBcCvI243QdfAELc1gQQoBHUDj9rpHv/XtyoglnB
l0F5wPM8GjQwztCnwC1eOLeY4W5/+t1IA0bMIn15D9fhZYBRux8BXmip8J2OYbk/
GcVcH21TwtyB/mNf9XlXrJyTp7ufw6VIm5eCSj+nPx7TL5Ihv2Q4b72wH9DyhAuK
VOeKa2aWCrolG1Y9jDfBAd3GNEA6bja2y76w3QIQ1mrVTO8N5jjAf+n7e8XNCyHK
jnPvG/ndnyBVhJVMzdM++4ZitYM6jdo/SqQepVV13Y9bLdM7RrDlG7O1RxfD4Qhl
j8ignDJX2ihFb8bznjAa4y7hDgxOMsSoFmJdE7lE31JS+eqWVFUZBb7wU0mm5f+0
hZojdJPlQE0CYrixuSP5PcRH2TtS+WTqfpP3+kTEiSHX5Gl/otofQ8L+svvd2IaT
1II7NgMb6+iudUCJzCTk
=w7sf
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
