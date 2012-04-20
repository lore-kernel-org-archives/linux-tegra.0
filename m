From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC] tegra_pcm DMA buffers allocation
Date: Fri, 20 Apr 2012 07:58:31 +0200
Message-ID: <20120420055831.GA15470@avionic-0098.adnet.avionic-design.de>
References: <1334851253.13681.49.camel@marvin>
 <4F90708F.8070504@wwwdotorg.org>
 <1334869632.13681.59.camel@marvin>
 <4F90858D.4010206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F90858D.4010206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andrey Smirnov <andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 04/19/2012 03:07 PM, Andrey Smirnov wrote:
> > On Thu, 2012-04-19 at 16:07 -0400, Stephen Warren wrote:
> ...
> >> BTW, did you try running the mainline code on your board. If it's
> >> derived from Harmony, it should be easy to get it going.
> >=20
> > Last time we did there was no support for Tegra's NAND and display
> > controllers
>=20
> What do you need the NAND controllers for? I'm not 100% certain, but I
> believe we plan on upstreaming NAND support into U-Boot, but not the
> kernel, since we didn't see a need for it there IIRC.

We use a device that is sort of a set-top box, which currently boots from an
SD card. However the SD card is eventually supposed to allow users to displ=
ay
custom media (slide show, ...). In that case it is very stupid to keep the =
OS
on the same card.

While U-Boot NAND support is enough to get a kernel booted, you still need
the root filesystem to be loaded from NAND by the kernel. Kernel support is
also pretty much a requirement for runtime updates.

> (Not that we'd stop anyone else doing it)

I've been trying to make the NAND controller work on Tegra 2. Unfortunately
there's not much of a reference to work off except the driver that Simon
Glass posted to the U-Boot mailing list and written by Jim Lin. There is al=
so
a driver in the NVIDIA downstream kernels but that's pretty much broken.

The U-Boot driver doesn't use interrupts obviously so I've resolved to use =
it
as a base and add interrupt support. Unfortunately I've hit a snag and
whenever I enable interrupts I see the CPU stormed by the NAND controller f=
or
unknown reasons (no bits in ISR, DMA control or decode status registers set=
).
I'll have to investigate further. Maybe the controller isn't properly
initialized yet.

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+Q+wcACgkQZ+BJyKLjJp/POgCgiRA5sLeNxIG1aiQUlAf7gJiA
DtAAn3Ub86xg+LIbS/yzNbD2kk2IgJSE
=sDgG
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
