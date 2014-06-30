From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 12:48:15 +0200
Message-ID: <20140630104814.GA1495@ulmo>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53AEF81D.3080408@ti.com>
 <20140628204025.GA16415@ulmo>
 <7497427.LQy8pJts8f@wuerfel>
 <20140630090118.GA24128@ulmo>
 <20140630103649.GF28951@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140630103649.GF28951-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 11:36:49AM +0100, Catalin Marinas wrote:
> On Mon, Jun 30, 2014 at 10:01:19AM +0100, Thierry Reding wrote:
> > On Mon, Jun 30, 2014 at 09:20:30AM +0200, Arnd Bergmann wrote:
> > > On Saturday 28 June 2014 22:40:26 Thierry Reding wrote:
> > > > Also, the real win we get from moving code out into drivers/ is if =
we
> > > > can provide a common framework for them. I don't see how we can pos=
sibly
> > > > do that for this code since there simply isn't enough commonality
> > > > between SoCs. At the same time we now have a situation where both 3=
2-bit
> > > > and 64-bit variants of some SoCs share some of the same hardware at=
 the
> > > > very low level and since we don't have mach-* directories for 64-bi=
t ARM
> > > > and shouldn't be duplicating code either, we need to find a new hom=
e for
> > > > this type of code. drivers/soc seemed to fit perfectly well.
> > >=20
> > > For the low-level stuff yes, but I agree with Santosh there needs to =
be
> > > some more work trying to split out individual high-level drivers.
> > >=20
> > > There are two common patterns for the interface between the low-level
> > > register access and the more high-level stuff:  you can either use
> > > a "syscon" driver that just exports a struct regmap and that gets ref=
erenced
> > > from other drivers using a phandle in their device nodes, or you have
> > > a driver in drivers/soc that exports a somewhat higher-level interface
> > > and comes with its own header file that gets included by other driver=
s.
> > > At the moment, the syscon/regmap variant can only be used once device
> > > drivers are loaded, but there is some broad agreement that it should
> > > be changed to allow calling syscon_regmap_lookup_by_phandle() at
> > > early boot using just DT accessors.
> >=20
> > Note that we already have all these drivers and they do work for earlier
> > Tegra generations. My attempt to move these out of arch/arm/mach-tegra
> > is merely about being able to share them with upcoming 64-bit variants.
> > So it's not about adding new functionality but rather about keeping the
> > existing level of functionality on 64-bit.
>=20
> Only that for arm64 we try to do things slightly differently and not
> because we just like to but because we want better standardisation
> across SoCs. One example is the booting protocol. Another example, you
> don't get some early initcalls for your SoC (no machine descriptor). The
> hardware should be configured by firmware in such a way that it boots at
> least up to arch_initcall() level (ideally, we should move anything to
> device_initcall() but it's not always easy).

Well, one of the problems on Tegra is that we need part of the PMC to
power up CPUs. There's no firmware that could do this for us. We need
also access to another block called flow controller. Both of those
drivers need to be available very early for things to work. At the same
time the driver exposes control over power domains. So while we possibly
can push CPU bringup/teardown to firmware for ARM64, we can't do the
same for the other parts of the PMC, so we end up with a weird kind of
driver.

Parts of it can't register with the driver model because it isn't
available that early, and at the same time we need to register parts
only later because they require the driver model.

> > I'm not a fan of the syscon/regmap approach at all and the existing
> > drivers use a higher-level API already, so I think we're going to stick
> > with that.
>=20
> It's not about whether you are a fan of it or not but whether we can get
> more code sharing across several SoCs and not just between tegra arm32
> and arm64 versions.

syscon by definition cannot be shared between different SoCs.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTsUBuAAoJEN0jrNd/PrOhKiQQAKcgHCQ/o1S9MPXXVpNgc+LS
5n2aNkaqovvkJkXtG9WBAA8Ij2ZR+FR78frAteJ3ficcArQ0g/gATr40y28EYixX
wifB8kBLaLaPFg6dS+nwz0rnewZUb2ikgXgks1dsg1s45KBq7k2XE26lYw426HPK
ipNM515REXM8b1l+0oC6wJOQfJHzUEMbEYnmZwEGUMpP+g/TjTOjgpPYQr8WwXYL
WJe0xy1inUgR18dUsa0jc4vwrmFvp/nJbFEDtf4TDTYbo1UW0hkegz6LlG5tABIt
YOaeXffVpH7/O9f0f2Wy4hkZ5ppth/pbW/pXiENnXCQUYMPvJderR9BV6Yz40tr6
21DN2UzJOBBi8NlQF9cxP0oQNSZhW9o4HBp2Dzdo8NJsylt7lJayxXSabiWnbGWT
DD0mfJRQewNY/zycSZ76KdUpdGCEN7VOUqRp6XB+hE7Fb/IQVYNa4w9xjgSKmnRy
tTKTO1yWsEd3vfqh8/K327hPr9hDCUy+y3vHq/Dy5GMCp2igmtaxb4wj+bDuZwR0
9yL/feKJ1ySZhFMjeZlHEoUCbAEBJDIOiHvkSGAjFydJqR9PJn+ClnAfI+c624M5
MdjPUhbo75s70JgufUsL6w1BBV/eDAY/fXylOuFfz2tXftDnUwVoCjo2faH8ubpf
u6Xec3KE/WOer5/FsmZA
=GsXy
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
