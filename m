From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Sat, 24 Nov 2012 20:04:16 +0100
Message-ID: <20121124190416.GC26154@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com>
 <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de>
 <50B07084.40707@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50B07084.40707-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 24, 2012 at 09:00:20AM +0200, Terje Bergstr=C3=B6m wrote:
> On 24.11.2012 01:38, Thierry Reding wrote:
> > Okay, there's a huge amount of code here. From a quick look this seems
> > like the whole nvhost implementation as found in the L4T kernel. It'll
> > obviously take quite a bit of time to go through all of it.
>=20
> Thanks Thierry for your comments.
>=20
> It's actually about a third of of the downstream nvhost. I left out
> support for all client modules, ioctl APIs, hardware context, nvmap
> (obviously) and various other features.
>=20
> But yes, the amount of code is still significant and I feel the pain,
> too. I'm attempting to keep downstream and upstream nvhost as similar to
> each other as possible so that we can port changes easily between the
> two trees. In downstream kernel nvhost manages all its clients (except
> DC only partially), so it's kept as its own driver. I'm hoping we'd end
> up using tegradrm in downstream, and keeping nvhost as separate entity
> is playing a role there.

The usual way to do this is to adapt downstream kernels to upstream
changes, not the other way around.

> If it helps, I could write up an essay on the structure of nvhost and
> why it works that way. That should help in understanding some of the
> design decisions in code.

Some more documentation about host1x would certainly be very welcome. If
you write something up, maybe you can push to get it included in the TRM
as well. The host1x chapter in the TRM is a bit sketchy and something
more like a programming guide would be really useful.

Funny enough, the chapter about the 2D engine says that it is merely
there to document the registers and explicitly not as a programming
guide because it is expected that NVIDIA supplied drivers will always be
used. I had a good laugh when I read that. =3D)

Still I guess it's better than nothing.

> > I would really like this to be phased in in more manageable chunks. For
> > instance syncpoints could be added on top of the existing host1x
> > infrastructure (the display controllers can make use of it for VBLANK
> > reporting, right?), followed by channel support for command submission.
> >
> > While VBLANK reporting is already rudimentarily supported using the
> > display controllers' VBLANK interrupts, adding syncpt based support
> > should be easy to do.
>=20
> Yep, vblank is a sync point register.
>=20
> I attempted to tune the code down to only having syncpt support, but it
> pulled in still enough (interrupts, syncpts, power management) that the
> patch went down about 40% in size. I thought that as the staging didn't
> bring really small parts, I deleted that attempt.
>=20
> I could redo that if it helps. I guess removing dynamic power management
> would be the first step, and channels the second. In review process,
> they're anyway in separate files so I'm not sure about the benefits, thou=
gh.

The benefit is that smaller changes that add a single particular feature
are a lot easier to review and verify.

> I'm not convinced about moving the code to live inside tegradrm. There's
> really not that much host1x infrastructure in tegradrm's host1x.c that
> we could leverage except binding device and driver and enabling and
> disabling host1x clocks.

The reason there isn't more infrastructure is that I explicitly wanted
to start small. Just enough to get the display to work. I find that to
be a very good method because it allows the code to evolve in small and
incremental steps.

> Most of code in current host1x.c is dedicated to managing the drm sub-
> clients, which anyway logically belong to drm.c.

In fact the code in host1x.c is supposed to be managing host1x clients,
which is exactly what nvhost does. It isn't doing much else for sole
reason that it doesn't have to at this point.

> To implement sync points in tegradrm, we'd need to re-implement syncpt
> and interrupt support in tegradrm. That's a significant part of code,
> and we already have code for that, so I'd like to leverage it as far as
> possible.

I'm all for reusing your code. My concern is that the structure of this
is quite different from what can be found in the L4T downstream kernels
and therefore some rethinking may be required.

> > Last but not least, I'd really appreciate it if we could settle on one
> > name for this component. One place calls it graphics host, another one
> > refers to it as host1x and now we have an nvhost driver for it. The TRM
> > isn't very consistent either, unfortunately, but a number of chapters
> > refer to it as host1x and the clock that drives the block is also named
> > host1x. Those are pretty much the reasons why I chose to call the DT
> > node and the driver host1x and I would like to suggest we stay with it
> > to keep things less confusing.
>=20
> Graphics host and host1x are names for the hardware block. Graphics host
> is an older name, host1x is the proper name.
>=20
> nvhost is the driver for host1x and its client modules in downstream
> kernel. The naming gets confusing in upstream kernel because of shared
> responsibility of client modules. tegradrm's 2D driver is just glue
> between tegradrm and nvhost.

But that's precisely my point. If the hardware is called host1x, why not
call the driver host1x as well. We do the same for all other hardware
blocks. The I2C controller driver is named i2c-tegra just as the RTC
driver is named rtc-tegra. Why should the driver for host1x not be named
host1x?

> host1x as the name of the driver wouldn't cover the fact that it's also
> managing client modules.

That's like saying an I2C controller driver shouldn't be named I2C
because it addresses slaves. Furthermore, just naming it nvhost doesn't
change anything about that. How does nvhost make it any clearer that it
manages client modules compared to host1x?

> I'll still try to figure out a way to clear up the naming, and
> suggestions are welcome. :-)

host1x hardware and host1x clients are controlled by the "host1x"
driver. Can it be any clearer than that?

Thierry

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsRowAAoJEN0jrNd/PrOhO14P/0Fx1NBnbrAx+7Z9ZVThfoFm
CCr5xtSLyOjci2ru79nJebRrOb1GTYxKLOcNE4wEuVUptvJv15oby/fxpWS43td2
EH/bEW/WoaG7pK1QKT9K23LVso8p9+H73ypdqc639gmKJyopWJtIJ4pRg0RGi+Cf
msKOT7Fu73b3im79goG/7+221hZluamNuv7pEuvhyBhVis3xfDyc9mxLLIQAUnEG
N13ctG3Hqqyt97txSsvEIKwkyiSFXgdO0IjOSNcnjq+g+YXv05moC3UckRkuBjfy
PM+QMxWmChD0lEYQPcAj7bKO69fnOCf62kEAW1K0T8R8Ag4O6jr/6nNG+TfA48+L
0XhWjFLYUXl0KuR7rT83Asj6L68ukXo51ufexaOsjuGttOSg0cckiT9zC2INXRtk
aRgg+dQHiZis9OZfaKZHFKXhLEZa5wlA6SJq32khLLetpC9x7bCbcnr4gTO0hoSf
AQO6MsdRZabPIlZYzlzu+uyCwY7jsKoSnZO6uEmrlHvw2OLXTMWFg2Zgq64mC23H
GykHGu9xX2vF7b6Yjj4u3tNPKuHuRAI1qJVciuCrLAKUOl2/pSqplZJPydgA+wSt
BJgVWIMVnqdB8vcfys158t5YRP6g9jVLS+KmTxRSTsso8CfvkG8WrTWISBq6fVP0
9vXts2NGhXGtxsmr2b2y
=+FNp
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
