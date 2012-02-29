From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T
	kernel_noload
Date: Wed, 29 Feb 2012 20:19:38 +0000
Message-ID: <20120229201938.GB16999@n2100.arm.linux.org.uk>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com> <20120229122942.GF3318@game.jcrosoft.org> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com> <20120229181430.GI3318@game.jcrosoft.org> <4F4E6F96.8080907@am.sony.com> <20120229191209.GN14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2122@HQMAIL01.nvidia.com> <20120229194409.GO14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2155@HQMAIL01.nvidia.com> <4F4E86A1.8010506@bluewatersys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F4E86A1.8010506-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Renaud <andre-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 01, 2012 at 09:12:17AM +1300, Andre Renaud wrote:
> On 01/03/12 08:59, Stephen Warren wrote:
> > Uwe Kleine-K=F6nig wrote at Wednesday, February 29, 2012 12:44 PM:
> > ...
> >> If you want to give incentive for U-Boot to improve, drop the targ=
et
> >> today. And note that at least people caring about boot time must n=
ot use
> >> the kernel's uImage target anyhow.
> >=20
> > If you enable the new config option in this patch, then the perform=
ance
> > issue is solved; U-Boot doesn't copy the kernel image any more, and=
 the
> > kernel decompressor can write directly to the appropriate location =
without
> > moving the image first (assuming your board boot script loads the u=
Image
> > to a non-conflicting address).
>=20
> I may have missed part of this, but isn't one of the points regarding
> this that the zImage decompressor always runs with data cache disable=
d,

Most certainly not.  We've had the data cache enabled for years and
years.  And I mean 10+ years.  We may have been lacking support on
some CPUs, but that was because of lack of contributions.

> resulting in a slow decompress, where as if the U-Boot decompressor i=
s
> used (ie, gzipping the Image, and telling U-Boot to decompress), then=
 it
> can run with caches enabled, improving boot speed?

That's pure FUD.
