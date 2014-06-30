From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 21:36:36 +0200
Message-ID: <20140630193635.GB32594@mithrandir>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53AEF81D.3080408@ti.com>
 <20140628204025.GA16415@ulmo>
 <7497427.LQy8pJts8f@wuerfel>
 <20140630090118.GA24128@ulmo>
 <20140630103649.GF28951@arm.com>
 <20140630104814.GA1495@ulmo>
 <20140630131628.GA31517@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140630131628.GA31517-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 02:16:34PM +0100, Lorenzo Pieralisi wrote:
> On Mon, Jun 30, 2014 at 11:48:15AM +0100, Thierry Reding wrote:
> > On Mon, Jun 30, 2014 at 11:36:49AM +0100, Catalin Marinas wrote:
> > > On Mon, Jun 30, 2014 at 10:01:19AM +0100, Thierry Reding wrote:
> > > > On Mon, Jun 30, 2014 at 09:20:30AM +0200, Arnd Bergmann wrote:
> > > > > On Saturday 28 June 2014 22:40:26 Thierry Reding wrote:
> > > > > > Also, the real win we get from moving code out into drivers/ is=
 if we
> > > > > > can provide a common framework for them. I don't see how we can=
 possibly
> > > > > > do that for this code since there simply isn't enough commonali=
ty
> > > > > > between SoCs. At the same time we now have a situation where bo=
th 32-bit
> > > > > > and 64-bit variants of some SoCs share some of the same hardwar=
e at the
> > > > > > very low level and since we don't have mach-* directories for 6=
4-bit ARM
> > > > > > and shouldn't be duplicating code either, we need to find a new=
 home for
> > > > > > this type of code. drivers/soc seemed to fit perfectly well.
> > > > >=20
> > > > > For the low-level stuff yes, but I agree with Santosh there needs=
 to be
> > > > > some more work trying to split out individual high-level drivers.
> > > > >=20
> > > > > There are two common patterns for the interface between the low-l=
evel
> > > > > register access and the more high-level stuff:  you can either use
> > > > > a "syscon" driver that just exports a struct regmap and that gets=
 referenced
> > > > > from other drivers using a phandle in their device nodes, or you =
have
> > > > > a driver in drivers/soc that exports a somewhat higher-level inte=
rface
> > > > > and comes with its own header file that gets included by other dr=
ivers.
> > > > > At the moment, the syscon/regmap variant can only be used once de=
vice
> > > > > drivers are loaded, but there is some broad agreement that it sho=
uld
> > > > > be changed to allow calling syscon_regmap_lookup_by_phandle() at
> > > > > early boot using just DT accessors.
> > > >=20
> > > > Note that we already have all these drivers and they do work for ea=
rlier
> > > > Tegra generations. My attempt to move these out of arch/arm/mach-te=
gra
> > > > is merely about being able to share them with upcoming 64-bit varia=
nts.
> > > > So it's not about adding new functionality but rather about keeping=
 the
> > > > existing level of functionality on 64-bit.
> > >=20
> > > Only that for arm64 we try to do things slightly differently and not
> > > because we just like to but because we want better standardisation
> > > across SoCs. One example is the booting protocol. Another example, you
> > > don't get some early initcalls for your SoC (no machine descriptor). =
The
> > > hardware should be configured by firmware in such a way that it boots=
 at
> > > least up to arch_initcall() level (ideally, we should move anything to
> > > device_initcall() but it's not always easy).
> >=20
> > Well, one of the problems on Tegra is that we need part of the PMC to
> > power up CPUs. There's no firmware that could do this for us. We need
> > also access to another block called flow controller. Both of those
> > drivers need to be available very early for things to work. At the same
> > time the driver exposes control over power domains. So while we possibly
> > can push CPU bringup/teardown to firmware for ARM64, we can't do the
> > same for the other parts of the PMC, so we end up with a weird kind of
> > driver.
> >=20
> > Parts of it can't register with the driver model because it isn't
> > available that early, and at the same time we need to register parts
> > only later because they require the driver model.
>=20
> That sounds familiar and that's exactly the problem, and that's a problem
> that won't disappear by just moving code around directories (hey, it is
> not that we have not tried =3D)), as you (and I) know very well:
>=20
> https://lkml.org/lkml/2013/8/16/399
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-August/190067.=
html
>=20
> Either a common way of dealing with this early CPU bring-up code is
> implemented (but it can't be platform specific otherwise we are back to
> square one)

I prototyped this based on an OF init table (much like IRQCHIP_DECLARE
or CLOCKSOURCE_OF_DECLARE) that's run early in the boot process (at the
very end of setup_arch()).

> or we decide that this code does not belong in the kernel and
> should be abstracted away.
>=20
> And I think that most of the early bring up issues are just related to
> powering-up/resetting a cpu for it to be booted, probably that's the
> abstraction we should be focusing on, because it should just require poki=
ng
> a bunch of registers to kickstart a CPU, no more than that, FW should be
> able to deal with that and that's yet another reason behind PSCI design.

Right, I agree that if we can push that into PSCI that would be great
(provided there's an open-source implementation of PSCI). But for 32-bit
ARM that's no longer a viable option, so we're pretty much stuck with
what we have.

> I am not convinced that the early device model would be useful for any
> other reason, that's why shoehorning kernel changes in the current driver
> model just to bring up secondaries is not something I consider useful
> and proper, in the first place, but I am happy to hear other possible
> concerns.

I agree, but we still want to support early and driver model code in the
same source file to avoid duplication. What I prototyped is a driver
that's initialized to a bare minimum very early on and then takes over
when the driver model is up (using regular driver .probe()). I hope to
get the patches cleaned up and send them out tomorrow. If you want I can
add you on Cc.

Thierry

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTsbxCAAoJEN0jrNd/PrOhbnUP/0ND/6/UEa7JVsjHJx08Dxic
lh7iRNRHR2rSzDc58W3UHixxXo5WJqs1SoqtzPgjkWJUplPgJmRqGGJkOb7DSOtv
nlNIdyoux8s+szg3JFibWgfxLLvsmy1M0kcRnhLyLHv1uqES7bkKHA90TpjWGyjD
pTnseFiNauY/meBNbmxpyLbYYg7n5IRT5/PPrD9jAB2YKkhvrq9NFp0XtRG3h6SM
GpEY+1O7yaou/ysch1HJej8pxeiSktq7A+k/x3Y09+68oQ6cSr6QeUesqTMst0Pm
SWetgJUACegH023mIplaUx1ABAhUIayJDcFedmv8MdQIqfMZI8fCI3MiD/6HtFD2
dK1DkOLolflEVB9X7HW2Oti/0GfmTB05Fcpda3aJh7Uo9OCaCW0m84y8jhJnTROO
BzxrXPWJlIhKK3gT78O9SruKB7OLaCokzWS+OCFlx/KvjFCe1ER8P4pkBO+HR+gH
JkOv8QUZKC+ZRiZvtt9l7fWsa6D/Xq4+YsVbhMk9ntbQX5DeXRpZA6XhBz0eIw/c
3jWI8vutrnxcGTqVbduswtznIu/evx6zopxNci72/O45BEusnznfoJ7u/Z9/j+lt
jDbuVUoBK3n/mSecwrohnWpiAluJB2xjuXu4KlIg2tYc7jBpMH+QwtTyOyfZ9xPx
8hOr2qA1V5a24Ma1ZeWz
=xdkc
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
