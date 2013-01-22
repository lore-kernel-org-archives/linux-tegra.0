From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 10:31:51 +0100
Message-ID: <20130122093150.GA22264@avionic-0098.adnet.avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
 <50FE4E4F.6080506@nvidia.com>
 <20130122085756.GA6315@avionic-0098.adnet.avionic-design.de>
 <1358846121.1540.6.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358846121.1540.6.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 10:15:21AM +0100, Lucas Stach wrote:
> Am Dienstag, den 22.01.2013, 09:57 +0100 schrieb Thierry Reding:
> > On Tue, Jan 22, 2013 at 10:31:11AM +0200, Terje Bergstr=C3=B6m wrote:
> > > Of course, this has the prerequisite of having support for syncpts,
> > > which I hoped we would get to 3.9. The review for host1x patches seem=
 to
> > > have stalled, so that's iffy.
> >=20
> > Yes, I haven't found as much time as I would have liked to look at the
> > latest patches. Perhaps there will be a time slot at the end of the
> > week. I thought there was also the remaining issue with the memory
> > allocator that Lucas (Cc'ed) was working on?
> >=20
> Yes, I haven't finished this work yet. I got side tracked by upstreaming
> the platform patches for the Colibri and some real life activities. I'll
> get back to this ASAP.
>=20
> But even if I get this out real soon, I'm not really comfortable with
> speeding things to 3.9. I would like to review the userspace side of
> thing a lot more thoroughly, before committing to the interface. But
> maybe this can also happen in the 3.9 RC timeframe.

Maybe it'd make sense to finish up the various userspace parts first, so
that we can test an accelerated DDX on top of the kernel patches before
merging the host1x and gr2d patches.

I'm not quite sure if I remember correctly, but I think David mentioned
something along the lines of requiring a working userspace that can be
used to test the DRM interfaces as a prerequisite to getting this kind
of code merged.

Thierry

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ/lyGAAoJEN0jrNd/PrOhRtAP/R0UnsrOjCuwcFgAMg7NqKlJ
pv/6bqcFoqj/WPZZ8iyIgcQk+ZsULxR9y2fvQljitGmOCJ8MyC1Db2nNFIID7HvT
2NC6ful7pav1MRlH5f9oq/nVk2YwXmKoXFdq8u/hMSobHLII7bLpdpI+KnkjdpFb
9aoGnDbsljbLJfyGsRht2Wtb7emr/MwZU0rc6/Eyj249Gv+KUIIBmXL7JhhhkgJv
eOFaP6k0e1yPOSUthD5rj9KGZghxfkQF45mztu3wfD+k4D9NHWaFctj7o6uPY3BN
nc8rag2lOIpXC0ktsuoAeEPrtdL7K/9bXEg/Abdnx7WQqTwnL6Y49cLeuQTcx/Yg
cA0ecj+T+mR0RZCf9AytHnDYFo/Q/vMvwaYHZWgHFwCHLcGHYxlOBjcfis9r8g1G
U4xofSVKXSWiSCW0ywmJrwP2aRxiP4I7WPYL7XMtVBOBgqxuK2KWw6DEnEltaNY+
uk5cr578WAnvxayS0tGYcip8VypF8moke0/UkBJjTWEx+gRO9oXcPbG+UZl+vqGZ
164DAqieEfgwvN/G4g5hpHmux3lHXOBL1B4H5HZ+ZKhp0QvEflReQ/ztyFKYI3pe
6oJo3HOpHx9MN0KCGwUIFPvVAwJNuT8tfRYfKlRL6VAvvkHz1b+B6NCzV6nedAaL
xzNTyDC05X5U5V/XpqOw
=98JF
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
