From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Mon, 12 Mar 2012 18:42:59 +0100
Message-ID: <201203121843.00025.marek.vasut@gmail.com>
References: <4F4E6F96.8080907@am.sony.com> <20120229204527.GD16999@n2100.arm.linux.org.uk> <20120229205901.GR14173@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120229205901.GR14173-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andre Renaud <andre-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Dear Uwe Kleine-K=F6nig,

> On Wed, Feb 29, 2012 at 08:45:27PM +0000, Russell King - ARM Linux wr=
ote:
> > On Wed, Feb 29, 2012 at 09:39:58PM +0100, Uwe Kleine-K=F6nig wrote:
> > > I'd bet your platform has cache support in the decompressor witho=
ut
> > > knowing which platform you use. I suggest commenting out
> > >=20
> > > 	bl	cache_on
> > >=20
> > > in arch/arm/boot/compressed/head.S to see the difference.
> > >=20
> > > How do you build the uImage containing the zImage? If you use the
> > >=20
> > > in-kernel uImage target booting that usually means:
> > > 	- move the zImage to ZRELADDR
> > > 	- jump into zImage
> > > 	- decompress zImage to somewhere else
> > > 	- move decompressed image to ZRELADDR
> > > 	- jump to ZRELADDR
> > >=20
> > > That is you have two relocations because the first location for s=
ure
> > > conflicts with the decompressed image.
> >=20
> > Actually, we do this slightly differently nowadays.  Inside zImage:
> > 	- if zImage location conflicts, move the decompressed data
>=20
> s/de//
>=20
> > 	  and decompressor to another location
> > =09
> > 	- decompress zImage to ZRELADDR
> > 	- jump to ZRELADDR
> >=20
> > That reduces the size required for copying.  Of course, that copy c=
an
> > (as it's always been the case) be totally eliminated by ensuring th=
at
> > you load the zImage out of the way of the decompressed image.
> >=20
> > So, really, comparing a standard uImage produced by the standard ke=
rnel
> > with gzipped Image is far from a fair comparison.  And that's actua=
lly
> > another argument for getting rid of the uImage target... it may mak=
e
> > people think a bit about what they're doing rather than accepting
> > whatever default location someone else chose for their kernel.
>=20
> I'm all in favour to remove the uImage target because back in 2007 we
> already had a similar discussion[1]. (Back then I still thought that
> improving the uImage support would be a good idea.)
>=20
> That said I think *in general* having support for U-Boot in the kerne=
l
> is fine because I think U-Boot is the bootloader used most. But if yo=
u
> need some Kconfig settings or more than one Makefile target I think j=
ust
> building an Image or zImage and doing the U-Boot wrapping without the
> help of Linux' build system is preferable.

I believe eventually everyone will converge to having this option enabl=
ed.=20
Therefore this config option will just be always on and can be squashed=
 away.

>=20
> Best regards
> Uwe
>=20
> [1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/36547/focus=3D=
36588

Best regards,
Marek Vasut
